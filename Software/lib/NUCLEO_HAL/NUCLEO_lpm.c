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
 * @file NUCLEO_lpm.c
 *
 * @copyright Copyright (c) 2021 The Things Industries B.V., (c) 2021 MAIS Project
 *
 */

#include "NUCLEO_lpm.h"
#include "NUCLEO_bsp.h"
#include "NUCLEO_tracer.h"

/**
 * @brief Value used to represent the LPM state of Stop Mode
 */
static NUCLEO_LPM_bm_t StopModeDisable = NUCLEO_LPM_NO_BIT_SET;

/**
 * @brief Initialize the LPM resources
 * @note This function should be called only once at the start of the system as it will overwrite ALL GPIO config to reduce power consumption
 */
void NUCLEO_LPM_Init(NUCLEO_LPM_Mode_t init_mode)
{
  StopModeDisable = NUCLEO_LPM_NO_BIT_SET;
  NUCLEO_BSP_LP_GPIO_ConfigAnalog();

  switch (init_mode)
  {
  case NUCLEO_LPM_SLEEP_ONLY_MODE:
    NUCLEO_LPM_SetStopMode((1 << NUCLEO_LPM_LIB), NUCLEO_LPM_DISABLE);
    // Intentional fallthrough
  case NUCLEO_LPM_SLEEP_STOP_MODE:
    NUCLEO_LPM_Debugger_Disable();
    break;
  case NUCLEO_LPM_SLEEP_DEBUG_MODE:
    NUCLEO_LPM_SetStopMode((1 << NUCLEO_LPM_LIB), NUCLEO_LPM_DISABLE);
    // Intentional fallthrough
  case NUCLEO_LPM_SLEEP_STOP_DEBUG_MODE:
    NUCLEO_LPM_Debugger_Enable();
    break;
  default:
    // Should never reach here
    break;
  }
}

/**
 * @brief Deinit the LPM resources
 */
void NUCLEO_LPM_DeInit(void)
{
  // Left empty as LPM is expected to run all the time
}

/**
 * @brief Enable the debugger in low power modes
 * @note This API will not allow the system to reach the lowest current consumption level possible
 */
void NUCLEO_LPM_Debugger_Enable(void)
{
  // Debug power up request wakeup CBDGPWRUPREQ
  LL_EXTI_EnableIT_32_63(LL_EXTI_LINE_46);

  // Low power DBGmode: just needed for CORE_CM4
  HAL_DBGMCU_EnableDBGSleepMode();
  HAL_DBGMCU_EnableDBGStopMode();
  HAL_DBGMCU_EnableDBGStandbyMode();
}

/**
 * @brief Disable the debugger in low power modes to reduce current consumption
 * @note This API reduces the power consumption by configuring the debugger pins to analog and by disabling the debug module
 */
void NUCLEO_LPM_Debugger_Disable(void)
{
  //NUCLEO_BSP_LP_DBGIO_ConfigAnalog();
  HAL_DBGMCU_DisableDBGSleepMode();
  HAL_DBGMCU_DisableDBGStopMode();
  HAL_DBGMCU_DisableDBGStandbyMode();
}

/**
 * @brief Resume sensors I2C bus operations after Stop Mode
 * @note This API should be used after @ref NUCLEO_LPM_SensorBus_Off to recover the sensors bus
 */
void NUCLEO_LPM_SensorBus_Resume(void)
{
    //NUCLEO_BSP_LS_Init(LOAD_SWITCH_SENSORS);
    //NUCLEO_BSP_LS_On(LOAD_SWITCH_SENSORS);
    //HAL_Delay(LOAD_SWITCH_SENSORS_DELAY_MS);
    //NUCLEO_BSP_Sensor_I2C1_Init();
    NUCLEO_BSP_Ext_Sensor_I2C3_Init();
    HAL_I2C_MspInit(&NUCLEO_BSP_ext_sensor_i2c3);
}

/**
 * @brief Turn off sensors I2C bus before entering Stop Mode
 * @note This API reduces the power consumption by configuring the I2C and load switch pins to analog
 */
void NUCLEO_LPM_SensorBus_Off(void)
{
    GPIO_InitTypeDef GPIO_InitStruct = {0};

//  NUCLEO_BSP_LS_Off(LOAD_SWITCH_SENSORS);

//  GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
//  GPIO_InitStruct.Pull = GPIO_NOPULL;
//  GPIO_InitStruct.Pin = LOAD_SWITCH1_PIN;
//  HAL_GPIO_Init(LOAD_SWITCH1_GPIO_PORT, &GPIO_InitStruct);
    GPIO_InitStruct.Pin = EXT_SENSOR_I2C3_SCL_PIN | EXT_SENSOR_I2C3_SDA_PIN;
    HAL_GPIO_Init(EXT_SENSOR_I2C3_SCL_GPIO_PORT, &GPIO_InitStruct);
}

/**
 * @brief This function will be called before entering Sleep Mode
 * @note This API can be used to do an application task before entering Sleep Mode
 */
__WEAK void NUCLEO_LPM_PreSleepModeHook(void)
{
  // Left empty on purpose, a WEAK implementation that can be overridden by the application layer
}

/**
 * @brief This function will be called after waking up from Sleep Mode
 * @note This API can be used to do an application task after waking up from Sleep Mode
 */
__WEAK void NUCLEO_LPM_PostSleepModeHook(void)
{
  // Left empty on purpose, a WEAK implementation that can be overridden by the application layer
}

/**
 * @brief This function will be called before entering Stop Mode
 * @note This API can be used to do an application task before entering Stop Mode
 */
__WEAK void NUCLEO_LPM_PreStopModeHook(void)
{
  // Left empty on purpose, a WEAK implementation that can be overridden by the application layer
}

/**
 * @brief This function will be called after waking up from Stop2 Mode
 * @note Enables the pll at 32MHz, and the application layer needs to initialize the peripherals that are not retained in Stop2 Mode
 */
__WEAK void NUCLEO_LPM_PostStopModeHook(void)
{
  /**
   * The app needs to resume the peripherals that are not retained in STOP2 mode
   * Such as ADC, DAC USARTx, TIMx, i2Cx, SPIx, SRAM ctrls, DMAx, DMAMux, AES, RNG, HSEM
   */

  // Resuming UART Tx Tracer
  NUCLEO_TRACER_RESUME();
}

/**
 * @brief  This API notifies the low power manager if the specified resources allows the Stop mode or not
 *         The default mode selection for all resources is Stop Mode enabled
 * @param  lpm_id_bm: identifier of the resource ( 1 bit per resource )
 * @param  state: Specify whether StopMode is allowed or not by this resource
 */
void NUCLEO_LPM_SetStopMode(NUCLEO_LPM_bm_t lpm_id_bm, NUCLEO_LPM_State_t state)
{
  NUCLEO_LPM_ENTER_CRITICAL_SECTION();

  switch (state)
  {
  case NUCLEO_LPM_DISABLE:
  {
    StopModeDisable |= lpm_id_bm;
    break;
  }
  case NUCLEO_LPM_ENABLE:
  {
    StopModeDisable &= (~lpm_id_bm);
    break;
  }
  default:
  {
    break;
  }
  }

  NUCLEO_LPM_EXIT_CRITICAL_SECTION();
}

/**
 * @brief  This API returns the Stop Mode state bit mask
 * @return The Stop Mode state variable @ref NUCLEO_LPM_bm_t
 */
NUCLEO_LPM_bm_t NUCLEO_LPM_GetStopMode(void)
{
  NUCLEO_LPM_bm_t stop_mode_state;
  NUCLEO_LPM_ENTER_CRITICAL_SECTION();

  stop_mode_state = StopModeDisable;

  NUCLEO_LPM_EXIT_CRITICAL_SECTION();
  return stop_mode_state;
}

/**
 * @brief  This API is called by the low power manager in a critical section (PRIMASK bit set) to allow the
 *         application to implement dedicated code before entering Low Power Mode
 */
void NUCLEO_LPM_EnterLowPower(void)
{
  NUCLEO_LPM_ENTER_CRITICAL_SECTION();

  if (StopModeDisable != NUCLEO_LPM_NO_BIT_SET)
  {
    /**
     * At least one resource disallows Stop Mode
     * SLEEP mode is required
     */
    NUCLEO_LPM_PreSleepModeHook();
    HAL_SuspendTick();
    HAL_PWR_EnterSLEEPMode(PWR_MAINREGULATOR_ON, PWR_SLEEPENTRY_WFI);
    HAL_ResumeTick();
    NUCLEO_LPM_PostSleepModeHook();
  }
  else
  {
    NUCLEO_LPM_PreStopModeHook();
    /* Suspend sysTick : work around for debugger problem in dual core (tickets 71085,  72038, 71087 ) */
    HAL_SuspendTick();
    /* Clear Status Flag before entering STOP2 Mode */
    LL_PWR_ClearFlag_C1STOP_C1STB();
    HAL_PWREx_EnterSTOP2Mode(PWR_STOPENTRY_WFI);
    /* Resume sysTick : work around for debugger problem in dual core */
    HAL_ResumeTick();
    NUCLEO_LPM_PostStopModeHook();
  }

  NUCLEO_LPM_EXIT_CRITICAL_SECTION();
}
