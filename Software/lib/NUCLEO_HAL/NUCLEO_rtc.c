/** Copyright © 2021 The Things Industries B.V.
 *  Copyright © 2021 MAIS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file NUCLEO_rtc.c
 *
 * @copyright Copyright (c) 2021 The Things Industries B.V., (c) 2021 MAIS Project
 *
 */

#include <math.h>
#include "NUCLEO_bsp.h"
#include "NUCLEO_rtc.h"
#include "stm32wlxx_ll_rtc.h"

#define RtcHandle NUCLEO_BSP_rtc

/**
  * @brief Minimum timeout delay of Alarm in ticks
  */
#define MIN_ALARM_DELAY               3

/**
  * @brief Backup seconds register
  */
#define RTC_BKP_SECONDS    RTC_BKP_DR0

/**
  * @brief Backup subseconds register
  */
#define RTC_BKP_SUBSECONDS RTC_BKP_DR1

/**
  * @brief Backup msbticks register
  */
#define RTC_BKP_MSBTICKS   RTC_BKP_DR2

/* #define RTIF_DEBUG */

#ifdef RTIF_DEBUG
#include "NUCLEO_tracer.h"
/**
  * @brief Post the RTC log string format to the circular queue for printing in using the polling mode
  */
#define NUCLEO_RTC_DBG_PRINTF(...) LIB_PRINTF(...)
#else
/**
  * @brief not used
  */
#define NUCLEO_RTC_DBG_PRINTF(...)
#endif /* RTIF_DEBUG */

/*!
 * @brief Indicates if the RTC is already Initialized or not
 */
static bool RTC_Initialized = false;

/*!
 * @brief RtcTimerContext
 */
static uint32_t RtcTimerContext = 0;

/* Private function prototypes -----------------------------------------------*/
/*!
 * @brief Get rtc timer Value in rtc tick
 * @return val the rtc timer value (upcounting)
 */
static inline uint32_t GetTimerTicks(void);

/*!
 * @brief Writes MSBticks to backup register
 * Absolute RTC time in tick is (MSBticks)<<32 + (32bits binary counter)
 * @note MSBticks incremented every time the 32bits RTC timer wraps around (~44days)
 * @param [in] MSBticks
 * @return None
 */
static void NUCLEO_RTC_BkUp_Write_MSBticks(uint32_t MSBticks);

/*!
 * @brief Reads MSBticks from backup register
 * Absolute RTC time in tick is (MSBticks)<<32 + (32bits binary counter)
 * @note MSBticks incremented every time the 32bits RTC timer wraps around (~44days)
 * @return MSBticks
 */
static uint32_t NUCLEO_RTC_BkUp_Read_MSBticks(void);

/**
  * @brief Timer driver callbacks handler
  */
const UTIL_TIMER_Driver_s UTIL_TimerDriver =
{
  NUCLEO_RTC_Init,
  NULL,

  NUCLEO_RTC_StartTimer,
  NUCLEO_RTC_StopTimer,

  NUCLEO_RTC_SetTimerContext,
  NUCLEO_RTC_GetTimerContext,

  NUCLEO_RTC_GetTimerElapsedTime,
  NUCLEO_RTC_GetTimerValue,
  NUCLEO_RTC_GetMinimumTimeout,

  NUCLEO_RTC_Convert_ms2Tick,
  NUCLEO_RTC_Convert_Tick2ms,
};

/*System Time driver*/
const UTIL_SYSTIM_Driver_s UTIL_SYSTIMDriver =
{
  NUCLEO_RTC_BkUp_Write_Seconds,
  NUCLEO_RTC_BkUp_Read_Seconds,
  NUCLEO_RTC_BkUp_Write_SubSeconds,
  NUCLEO_RTC_BkUp_Read_SubSeconds,
  NUCLEO_RTC_GetTime,
};

/**
  * @brief Init RTC hardware
  * @return Status based on @ref UTIL_TIMER_Status_t
  */
UTIL_TIMER_Status_t NUCLEO_RTC_Init(void)
{
  if (RTC_Initialized == false)
  {
    NUCLEO_BSP_rtc.IsEnabled.RtcFeatures = UINT32_MAX;

    /*Init RTC*/
    NUCLEO_BSP_RTC_Init();
    /** Stop Timer */
    NUCLEO_RTC_StopTimer();
    /** DeActivate the Alarm A enabled by MX during NUCLEO_BSP_RTC_Init() */
    HAL_RTC_DeactivateAlarm(&NUCLEO_BSP_rtc, RTC_ALARM_A);
    /*Overload RTC feature enable*/
    NUCLEO_BSP_rtc.IsEnabled.RtcFeatures = UINT32_MAX;

    /*Enable Direct Read of the calendar registers (not through Shadow) */
    HAL_RTCEx_EnableBypassShadow(&NUCLEO_BSP_rtc);
    /*initialise MSB ticks*/
    NUCLEO_RTC_BkUp_Write_MSBticks(0);

    NUCLEO_RTC_SetTimerContext();

    RTC_Initialized = true;
    LLD('R');
  }
  return UTIL_TIMER_OK;
}

/**
  * @brief Set the alarm
  * @note The alarm is set at timeout from timer Reference (TimerContext)
  * @param timeout Duration of the Timer in ticks
  * @return Status based on @ref UTIL_TIMER_Status_t
  */
UTIL_TIMER_Status_t NUCLEO_RTC_StartTimer(uint32_t timeout)
{
  RTC_AlarmTypeDef sAlarm = {0};
  /*Stop timer if one is already started*/
  NUCLEO_RTC_StopTimer();
  timeout += RtcTimerContext;

  NUCLEO_RTC_DBG_PRINTF("Start timer: time=%d, alarm=%d\n\r",  GetTimerTicks(), timeout);
  /* starts timer*/
  sAlarm.BinaryAutoClr = RTC_ALARMSUBSECONDBIN_AUTOCLR_NO;
  sAlarm.AlarmTime.SubSeconds = UINT32_MAX - timeout;
  sAlarm.AlarmMask = RTC_ALARMMASK_NONE;
  sAlarm.AlarmSubSecondMask = RTC_ALARMSUBSECONDBINMASK_NONE;
  sAlarm.Alarm = RTC_ALARM_A;
  if (HAL_RTC_SetAlarm_IT(&NUCLEO_BSP_rtc, &sAlarm, RTC_FORMAT_BCD) != HAL_OK)
  {
    return UTIL_TIMER_HW_ERROR;
  }
  return UTIL_TIMER_OK;
}

/**
  * @brief Stop the Alarm
  * @return Status based on @ref UTIL_TIMER_Status_t
  */
UTIL_TIMER_Status_t NUCLEO_RTC_StopTimer(void)
{
  /* Clear RTC Alarm Flag */
  __HAL_RTC_ALARM_CLEAR_FLAG(&NUCLEO_BSP_rtc, RTC_FLAG_ALRAF);
  /* Disable the Alarm A interrupt */
  HAL_RTC_DeactivateAlarm(&NUCLEO_BSP_rtc, RTC_ALARM_A);
  /*overload RTC feature enable*/
  NUCLEO_BSP_rtc.IsEnabled.RtcFeatures = UINT32_MAX;
  return UTIL_TIMER_OK;
}

/**
  * @brief set timer Reference (TimerContext)
  * @return  Timer Reference Value in Ticks
  */
uint32_t NUCLEO_RTC_SetTimerContext(void)
{
  /*store time context*/
  RtcTimerContext = GetTimerTicks();
  NUCLEO_RTC_DBG_PRINTF("NUCLEO_RTC_SetTimerContext=%d\n\r", RtcTimerContext);
  /*return time context*/
  return RtcTimerContext;
}

/**
  * @brief Get the RTC timer Reference
  * @return Timer Value in  Ticks
  */
uint32_t NUCLEO_RTC_GetTimerContext(void)
{
  NUCLEO_RTC_DBG_PRINTF("NUCLEO_RTC_GetTimerContext=%d\n\r", RtcTimerContext);
  /*return time context*/
  return RtcTimerContext;
}

/**
  * @brief Get the timer elapsed time since timer Reference (TimerContext) was set
  * @return RTC Elapsed time in ticks
  */
uint32_t NUCLEO_RTC_GetTimerElapsedTime(void)
{
  return ((uint32_t)(GetTimerTicks() - RtcTimerContext));
}

/**
  * @brief Get the timer value
  * @return RTC Timer value in ticks
  */
uint32_t NUCLEO_RTC_GetTimerValue(void)
{
  if (RTC_Initialized == true)
  {
    return GetTimerTicks();
  }
  else
  {
    return 0;
  }
}

/**
  * @brief Return the minimum timeout in ticks the RTC is able to handle
  * @return minimum value for a timeout in ticks
  */
uint32_t NUCLEO_RTC_GetMinimumTimeout(void)
{
  return (MIN_ALARM_DELAY);
}

/**
  * @brief converts time in ms to time in ticks
  * @param[in] timeMilliSec time in milliseconds
  * @return time in timer ticks
  */
uint32_t NUCLEO_RTC_Convert_ms2Tick(uint32_t timeMilliSec)
{
  return ((uint32_t)((((uint64_t) timeMilliSec) << RTC_N_PREDIV_S) / 1000));
}

/**
  * @brief converts time in ticks to time in ms
  * @param[in] tick time in timer ticks
  * @return time in timer milliseconds
  */
uint32_t NUCLEO_RTC_Convert_Tick2ms(uint32_t tick)
{
  return ((uint32_t)((((uint64_t)(tick)) * 1000) >> RTC_N_PREDIV_S));
}

/**
  * @brief a delay of delay ms by polling RTC
  * @param delay in ms
  */
void NUCLEO_RTC_DelayMs(uint32_t delay)
{
  uint32_t delayTicks = NUCLEO_RTC_Convert_ms2Tick(delay);
  uint32_t timeout = GetTimerTicks();

  /* Wait delay ms */
  while (((GetTimerTicks() - timeout)) < delayTicks)
  {
    __NOP();
  }
}

/**
  * @brief  Alarm A callback.
  * @param  RtcHandle: RTC handle
  * @return None
  */
void HAL_RTC_AlarmAEventCallback(RTC_HandleTypeDef *RtcHandle)
{
  UTIL_TIMER_IRQ_Handler();
}

/**
  * @brief SSRU subsecond register underflow callback. Indicates that the SSRU reaches 0 and wraps around
  * @note this happens every ~44 days when 1024ticks per seconds
  * @param  RtcHandle: RTC handle
  * @return None
  */
void HAL_RTCEx_SSRUEventCallback(RTC_HandleTypeDef *hrtc)
{
  /*called every 48 days with 1024 ticks per seconds*/
  NUCLEO_RTC_DBG_PRINTF(">>Handler SSRUnderflow at %d\n\r", GetTimerTicks());
  /*Increment MSBticks*/
  uint32_t MSB_ticks = NUCLEO_RTC_BkUp_Read_MSBticks();
  NUCLEO_RTC_BkUp_Write_MSBticks(MSB_ticks + 1);
}

/**
  * @brief Get rtc time
  * @param[out] subSeconds in ticks
  * @return time seconds
  */
uint32_t NUCLEO_RTC_GetTime(uint16_t *mSeconds)
{
  uint64_t ticks;
  uint32_t timerValueLsb = GetTimerTicks();
  uint32_t timerValueMSB = NUCLEO_RTC_BkUp_Read_MSBticks();

  ticks = (((uint64_t) timerValueMSB) << 32) + timerValueLsb;

  uint32_t seconds = (uint32_t)(ticks >> RTC_N_PREDIV_S);

  ticks = (uint32_t) ticks & RTC_PREDIV_S;

  *mSeconds = NUCLEO_RTC_Convert_Tick2ms(ticks);

  return seconds;
}

/**
  * @brief write seconds in backUp register
  * @note Used to store seconds difference between RTC time and Unix time
  * @param[in] Seconds time in seconds
  */
void NUCLEO_RTC_BkUp_Write_Seconds(uint32_t Seconds)
{
  HAL_RTCEx_BKUPWrite(&NUCLEO_BSP_rtc, RTC_BKP_SECONDS, Seconds);
}

/**
  * @brief writes SubSeconds in backUp register
  * @note Used to store SubSeconds difference between RTC time and Unix time
  * @param[in] SubSeconds time in SubSeconds
  */
void NUCLEO_RTC_BkUp_Write_SubSeconds(uint32_t SubSeconds)
{
  HAL_RTCEx_BKUPWrite(&NUCLEO_BSP_rtc, RTC_BKP_SUBSECONDS, SubSeconds);
}

/**
  * @brief reads seconds from backUp register
  * @note Used to store seconds difference between RTC time and Unix time
  * @return Time in seconds
  */
uint32_t NUCLEO_RTC_BkUp_Read_Seconds(void)
{
  return HAL_RTCEx_BKUPRead(&NUCLEO_BSP_rtc, RTC_BKP_SECONDS);
}

/**
  * @brief reads SubSeconds from backUp register
  * @note Used to store SubSeconds difference between RTC time and Unix time
  * @return Time in SubSeconds
  */
uint32_t NUCLEO_RTC_BkUp_Read_SubSeconds(void)
{
  return HAL_RTCEx_BKUPRead(&NUCLEO_BSP_rtc, RTC_BKP_SUBSECONDS);
}

static void NUCLEO_RTC_BkUp_Write_MSBticks(uint32_t MSBticks)
{
  HAL_RTCEx_BKUPWrite(&NUCLEO_BSP_rtc, RTC_BKP_MSBTICKS, MSBticks);
}

static uint32_t NUCLEO_RTC_BkUp_Read_MSBticks(void)
{
  uint32_t MSBticks;
  MSBticks = HAL_RTCEx_BKUPRead(&NUCLEO_BSP_rtc, RTC_BKP_MSBTICKS);
  return MSBticks;
}

static inline uint32_t GetTimerTicks(void)
{
  return (UINT32_MAX - LL_RTC_TIME_GetSubSecond(RTC));
}
