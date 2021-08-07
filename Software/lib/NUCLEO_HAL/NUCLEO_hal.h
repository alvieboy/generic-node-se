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
 * @file NUCLEO_hal.h
 *
 * @copyright Copyright (c) 2021 The Things Industries B.V., (c) 2021 MAIS Project
 *
 */

#ifndef NUCLEO_HAL_H
#define NUCLEO_HAL_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdbool.h>

/**
 * HW aliases for the initialisation function
 */
typedef struct NUCLEO_HAL_Ctx_s
{
    bool leds_init;
    bool external_sensors_init;
} NUCLEO_HAL_Ctx_t;

void NUCLEO_HAL_Init(NUCLEO_HAL_Ctx_t gnse_inits);
void NUCLEO_HAL_DeInit(NUCLEO_HAL_Ctx_t gnse_deinits);

#ifdef __cplusplus
}
#endif

#endif /*NUCLEO_HAL_H*/
