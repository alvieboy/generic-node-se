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
 * @file NUCLEO_hal.c
 *
 * @copyright Copyright (c) 2021 The Things Industries B.V., (c) 2021 MAIS Project
 *
 */

#include "NUCLEO_hal.h"
#include "NUCLEO_bsp_serial.h"
#include "NUCLEO_bsp_gpio.h"

/**
  * @brief Initialises all common NUCLEO hardware
  * @param NUCLEO_HAL_Ctx_t gnse_inits: Interfaces to configure
  * @return none
  */
void NUCLEO_HAL_Init(NUCLEO_HAL_Ctx_t gnse_inits)
{
    if (gnse_inits.external_sensors_init)
    {
        NUCLEO_BSP_Ext_Sensor_I2C3_Init();
    }

    if (gnse_inits.leds_init)
    {
        NUCLEO_BSP_LED_Init(LED_BLUE);
        NUCLEO_BSP_LED_Init(LED_RED);
        NUCLEO_BSP_LED_Init(LED_GREEN);
    }
}

/**
  * @brief Deinitialises all common NUCLEO hardware
  * @param NUCLEO_HAL_Ctx_t gnse_deinits: Interfaces to deconfigure
  * @return none
  */
void NUCLEO_HAL_DeInit(NUCLEO_HAL_Ctx_t gnse_deinits)
{
    if (gnse_deinits.external_sensors_init)
    {
        NUCLEO_BSP_Ext_Sensor_I2C3_DeInit();
    }
    if (gnse_deinits.leds_init)
    {
        NUCLEO_BSP_LED_DeInit(LED_BLUE);
        NUCLEO_BSP_LED_DeInit(LED_RED);
        NUCLEO_BSP_LED_DeInit(LED_GREEN);
    }
}
