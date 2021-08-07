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
 * @file NUCLEO_bsp.h
 *
 * @copyright Copyright (c) 2021 The Things Industries B.V., (c) 2021 MAIS Project
 *
 */

#ifndef NUCLEO_BSP_H
#define NUCLEO_BSP_H

#include "NUCLEO_bsp_conf.h"
#include "stm32wlxx_hal.h"
#include "NUCLEO_bsp_radio.h"
#include "NUCLEO_bsp_gpio.h"
#include "NUCLEO_bsp_serial.h"
#include "NUCLEO_bsp_clk_timer.h"
#include "NUCLEO_bsp_microphone.h"

// Used for very low level debug.
extern void LLD(const char c);

#endif /* NUCLEO_BSP_H */
