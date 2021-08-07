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
 * @file main.c
 *
 * @copyright Copyright (c) 2021 The Things Industries B.V., (c) 2021 MAIS Project
 *
 */

#include "app.h"
#include "NUCLEO_hal.h"
#include "NUCLEO_lpm.h"
#include "NUCLEO_tracer.h"
#include "SHTC3.h"
#include "stm32_timer.h"

static void SystemClock_Config(void);
void Error_Handler(void);

static UTIL_TIMER_Object_t WakeupTimer;

typedef enum {
    STATE_SLEEP,
    STATE_LED_ON,
    STATE_LED_OFF
} system_state_t;

static system_state_t state;

void NUCLEO_LPM_PostStopModeHook(void)
{
    // Just enable LED GPIO
    NUCLEO_BSP_LED_Init(LED_RED);
}

static void set_state(system_state_t newstate)
{
    state = newstate;

    /* Apply changes to new state */

    switch (newstate) {
    case STATE_LED_ON:
        NUCLEO_BSP_LED_On(LED_RED);
        break;
    case STATE_LED_OFF:
        NUCLEO_BSP_LED_Off(LED_RED);
        break;
    }

    /* Set timer for state change */

    switch(newstate) {
    case STATE_SLEEP:
        UTIL_TIMER_SetPeriod(&WakeupTimer, 2000);
        UTIL_TIMER_Start(&WakeupTimer);
        break;
    case STATE_LED_ON: /* Fall-through */
    case STATE_LED_OFF:
        UTIL_TIMER_SetPeriod(&WakeupTimer, 10);
        UTIL_TIMER_Start(&WakeupTimer);
        break;
    }
}

static void start()
{
    set_state(STATE_SLEEP);
}


static void OnWakeupEvent()
{
}

int main(void)
{
  HAL_Init();
  SystemClock_Config();

  /* Ensure that MSI is wake-up system clock */
  __HAL_RCC_WAKEUPSTOP_CLK_CONFIG(RCC_STOP_WAKEUPCLOCK_MSI);

  struct NUCLEO_HAL_Ctx_s initctx = {
      .leds_init = true,
      .external_sensors_init = true
  };

  NUCLEO_HAL_Init(initctx);

  DEBUG_USART_CLK_ENABLE();
  NUCLEO_TRACER_INIT();
  APP_PRINTF("Starting application\r\n");

  /*Initialises timer and RTC*/
  UTIL_TIMER_Init();

  NUCLEO_BSP_Ext_Sensor_I2C3_Init();

#if 0
  if (NUCLEO_BSP_MICROPHONE_Init()!=0) {
      APP_PRINTF("Cannot init microphone\r\n");
      Error_Handler();
  }
#endif
  APP_PRINTF("App: HCLK clock %u\r\n", HAL_RCC_GetHCLKFreq());

  int16_t r = SHTC3_probe();
  if (r==0) {
      APP_PRINTF("STHC3 found\r\n");
  } else {
      APP_PRINTF("STHC3 NOT found!!\r\n");
  }

  UTIL_TIMER_Create(&WakeupTimer, 0xFFFFFFFFU, UTIL_TIMER_PERIODIC, OnWakeupEvent, NULL);

  start();

  while (1) {
      NUCLEO_LPM_EnterLowPower();

      switch (state) {
      case STATE_SLEEP:
          set_state(STATE_LED_ON);
        break;
      case STATE_LED_ON:
          set_state(STATE_LED_OFF);
          break;
      case STATE_LED_OFF:
          set_state(STATE_SLEEP);
          break;
      }

  }


  unsigned iter = 0;
  while (1)
  {
      APP_PRINTF("Performing loop %d\r\n", iter);
      if (iter==4) {
          int r = NUCLEO_BSP_MICROPHONE_Start();
          if (r!=0) {
              APP_PRINTF("Micro: %d SR:%08x State: %d code=%d\r\n", r, SPI2->SR,
                         NUCLEO_BSP_microphone_spi.State,
                         NUCLEO_BSP_microphone_spi.ErrorCode);
              APP_PRINTF("CR1: %08x CR2: %08x\r\n", SPI2->CR1, SPI2->CR2);
          }
      }
      if (iter==1) {
          SHTC3_measure();
      }


      if (iter==8) {
          int32_t temperature;
          int32_t humidity;
          SHTC3_read(&temperature, &humidity);
          APP_PRINTF("Temp: %d Hum: %d\n", temperature, humidity);
      }

      NUCLEO_BSP_LED_Toggle(LED_BLUE);
      HAL_Delay(500);
      NUCLEO_BSP_LED_Toggle(LED_RED);
      HAL_Delay(500);
      NUCLEO_BSP_LED_Toggle(LED_GREEN);
      HAL_Delay(500);

      iter++;
  }
  return 0;
}

void NUCLEO_BSP_MICROPHONE_RxCpltCallback(void)
{
    APP_PRINTF("Rx\r\n");
}

void NUCLEO_BSP_MICROPHONE_RxHalfCpltCallback(void)
{
    APP_PRINTF("HRx\r\n");
}


/**
  * @brief System Clock Configuration
  * @return None
  */
static void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);
  /** Initializes the CPU, AHB and APB busses clocks
   */

  // For SPI we need to enable HSI. TBD!. Alvie

  


  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_LSE | RCC_OSCILLATORTYPE_MSI | RCC_OSCILLATORTYPE_HSI;

  RCC_OscInitStruct.LSEState = RCC_LSE_ON; // For RTC
  RCC_OscInitStruct.MSIState = RCC_MSI_ON;
  RCC_OscInitStruct.HSIState = RCC_HSI_OFF;

  HAL_PWR_EnableBkUpAccess();
  LL_RCC_LSE_SetDriveCapability(RCC_LSEDRIVE_LOW);
  HAL_PWR_DisableBkUpAccess();
  
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.MSICalibrationValue = RCC_MSICALIBRATION_DEFAULT;

  RCC_OscInitStruct.MSIClockRange = RCC_MSIRANGE_9;  // 24Mhz
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;

  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }
  /** Configure the SYSCLKSource, HCLK, PCLK1 and PCLK2 clocks dividers
   */

  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK3|RCC_CLOCKTYPE_HCLK2
                              |RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_MSI;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;
  RCC_ClkInitStruct.AHBCLK2Divider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.AHBCLK3Divider = RCC_SYSCLK_DIV1;

    if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_2) != HAL_OK)
  {
    Error_Handler();
  }
#if 0
  /* Wait till HSI is ready */
  while(LL_RCC_HSI_IsReady() != 1)
  {
  }
#endif

}

/**
  * @brief  This function is executed in case of error occurrence.
  * @return None
  */
void Error_Handler(void)
{
  while (1)
  {
  }
}

void LLD(const char c)
{
    HAL_UART_Transmit(&NUCLEO_BSP_debug_usart, (uint8_t *)&c, 1, HAL_MAX_DELAY);
}

void LLS(const char *c)
{
    APP_PRINTF("LLS: %s\n",c);
}
