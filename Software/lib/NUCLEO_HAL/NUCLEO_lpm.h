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
 * @file NUCLEO_lpm.h
 *
 * @copyright Copyright (c) 2021 The Things Industries B.V., (c) 2021 MAIS Project
 *
 */

#ifndef NUCLEO_LPM_H
#define NUCLEO_LPM_H

#ifdef __cplusplus
extern "C" {
#endif

#include "stdint.h"

/**
 * @brief macro used to enter the critical section
 */
#define NUCLEO_LPM_ENTER_CRITICAL_SECTION( )    uint32_t primask_bit= __get_PRIMASK();\
  __disable_irq()

/**
 * @brief macro used to exit the critical section
 */
#define NUCLEO_LPM_EXIT_CRITICAL_SECTION( )     __set_PRIMASK(primask_bit)

/**
 * @brief value used to reset the LPM mode
 */
#define NUCLEO_LPM_NO_BIT_SET   (0UL)

/**
 * @brief type definition to represent the bit mask of an LPM mode
 */
typedef uint32_t NUCLEO_LPM_bm_t;

/**
 * Supported requester to the NUCLEO Low Power Manager - can be increased up to 32
 * It lists a bit mapping of all user of the Low Power Manager
 */
typedef enum
{
  NUCLEO_LPM_UART_TRACER,
  NUCLEO_LPM_I2C_SENSORS,
  NUCLEO_LPM_TIM_BUZZER,
  NUCLEO_LPM_ADC_BM,
  NUCLEO_LPM_LIB,
  NUCLEO_LPM_APP,
} NUCLEO_LPM_Id_t;

/**
 * @brief type definition to represent value of an LPM mode
 */
typedef enum
{
  NUCLEO_LPM_DISABLE=0,
  NUCLEO_LPM_ENABLE,
} NUCLEO_LPM_State_t;

/**
 * @brief type definition to represent the different type of LPM mode
 */

typedef enum
{
  NUCLEO_LPM_SLEEP_ONLY_MODE,
  NUCLEO_LPM_SLEEP_DEBUG_MODE,
  NUCLEO_LPM_SLEEP_STOP_MODE,
  NUCLEO_LPM_SLEEP_STOP_DEBUG_MODE,
} NUCLEO_LPM_Mode_t;

void NUCLEO_LPM_Init(NUCLEO_LPM_Mode_t init_mode);
void NUCLEO_LPM_DeInit(void);

void NUCLEO_LPM_Debugger_Enable(void);
void NUCLEO_LPM_Debugger_Disable(void);

void NUCLEO_LPM_SensorBus_Resume(void);
void NUCLEO_LPM_SensorBus_Off(void);

void NUCLEO_LPM_PreStopModeHook(void);
void NUCLEO_LPM_PostStopModeHook(void);
void NUCLEO_LPM_PreSleepModeHook(void);
void NUCLEO_LPM_PostSleepModeHook(void);

void NUCLEO_LPM_SetStopMode(NUCLEO_LPM_bm_t lpm_id_bm, NUCLEO_LPM_State_t state);
NUCLEO_LPM_bm_t NUCLEO_LPM_GetStopMode(void);

void NUCLEO_LPM_EnterLowPower(void);

#ifdef __cplusplus
}
#endif

#endif /*NUCLEO_LPM_H*/
