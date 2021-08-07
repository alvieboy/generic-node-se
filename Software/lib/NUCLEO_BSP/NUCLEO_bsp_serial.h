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
 * @file NUCLEO_bsp_serial.h
 *
 * @copyright Copyright (c) 2021 The Things Industries B.V., (c) 2021 MAIS Project
 *
 */


#ifndef NUCLEO_BSP_SERIAL_H
#define NUCLEO_BSP_SERIAL_H

#include "stm32wlxx_hal.h"
#include "NUCLEO_bsp_error.h"
#include "NUCLEO_bsp_conf.h"

extern UART_HandleTypeDef NUCLEO_BSP_debug_usart;
extern I2C_HandleTypeDef NUCLEO_BSP_ext_sensor_i2c3;
extern SPI_HandleTypeDef NUCLEO_BSP_flash_spi;
extern DMA_HandleTypeDef NUCLEO_BSP_hdma_tx;

/**
 * HAL defines
 * Configure below for any pin change
 */

#define DEBUG_USART USART2
#define DEBUG_USART_BAUDRATE 115200
#define DEBUG_USART_PERIPH_CLK RCC_PERIPHCLK_USART2
#define DEBUG_USART_SOURCE_CLK RCC_USART2CLKSOURCE_SYSCLK //If adjusted, Update Usart2ClockSelection in NUCLEO_msp.c

#define DEBUG_USART_CLK_ENABLE()        __HAL_RCC_USART2_CLK_ENABLE()
#define DEBUG_USART_CLK_DISABLE()       __HAL_RCC_USART2_CLK_DISABLE()

#define DEBUG_USART_TX_PIN GPIO_PIN_2
#define DEBUG_USART_TX_GPIO_PORT GPIOA
#define DEBUG_USART_RX_PIN GPIO_PIN_3
#define DEBUG_USART_RX_GPIO_PORT GPIOA

#define DEBUG_USART_RX_GPIO_CLK_ENABLE()      __HAL_RCC_GPIOA_CLK_ENABLE()
#define DEBUG_USART_TX_GPIO_CLK_ENABLE()      __HAL_RCC_GPIOA_CLK_ENABLE()

#define DEBUG_USART_TX_AF                     GPIO_AF7_USART2
#define DEBUG_USART_RX_AF                     GPIO_AF7_USART2

#define DEBUG_USART_EXTI_WAKEUP               LL_EXTI_LINE_27

#define DEBUG_USART_DMA_CLK_ENABLE()                __HAL_RCC_DMA1_CLK_ENABLE()
#define DEBUG_USART_DMAMUX_CLK_ENABLE()              __HAL_RCC_DMAMUX1_CLK_ENABLE()

#define DEBUG_USART_TX_DMA_REQUEST             DMA_REQUEST_USART2_TX
#define DEBUG_USART_TX_DMA_CHANNEL             DMA1_Channel5

#define DEBUG_USART_DMA_TX_IRQn                DMA1_Channel5_IRQn
#define DEBUG_USART_DMA_TX_IRQHandler          DMA1_Channel5_IRQHandler

#define DEBUG_USART_IRQn                      USART2_IRQn

#define EXT_SENSOR_I2C3                  I2C3
/* EXT_SENSOR_I2C3_TIMING is set at 100 kHz
 * This setting is altered by both the clock speed and I2C setting
 * Clock speed is set in SystemClock_Config, default is 48 MHz
 * I2C setting is set in NUCLEO_BSP_Sensor_I2C1_Init, default is Fast mode plus
 * Changing any of these variables without reconfiguring this define could break the I2C communication
 */
#define EXT_SENSOR_I2C3_TIMING           0x20003D5EU
#define EXT_SENSOR_I2C3_TIMEOUT          100U //Read and write operations timeout in ms
#define EXT_SENSOR_I2C3_PERIPH_CLK      RCC_PERIPHCLK_I2C3
#define EXT_SENSOR_I2C3_SOURCE_CLK      RCC_I2C3CLKSOURCE_SYSCLK
#define EXT_SENSOR_I2C3_FASTMODEPLUS    I2C_FASTMODEPLUS_I2C3

#define EXT_SENSOR_I2C3_CLK_ENABLE()    __HAL_RCC_I2C3_CLK_ENABLE()
#define EXT_SENSOR_I2C3_CLK_DISABLE()   __HAL_RCC_I2C3_CLK_DISABLE()

#define EXT_SENSOR_I2C3_SDA_GPIO_CLK_ENABLE()      __HAL_RCC_GPIOC_CLK_ENABLE()
#define EXT_SENSOR_I2C3_SCL_GPIO_CLK_ENABLE()      __HAL_RCC_GPIOC_CLK_ENABLE()

#define EXT_SENSOR_I2C3_FORCE_RESET()              __HAL_RCC_I2C3_FORCE_RESET()
#define EXT_SENSOR_I2C3_RELEASE_RESET()            __HAL_RCC_I2C3_RELEASE_RESET()

#define EXT_SENSOR_I2C3_SCL_PIN                    GPIO_PIN_0
#define EXT_SENSOR_I2C3_SCL_GPIO_PORT              GPIOC
#define EXT_SENSOR_I2C3_SDA_PIN                    GPIO_PIN_1
#define EXT_SENSOR_I2C3_SDA_GPIO_PORT              GPIOC
#define EXT_SENSOR_I2C3_SCL_SDA_AF                 GPIO_AF4_I2C3

/**
 * BSP Serial APIs
 */

int32_t NUCLEO_BSP_USART_Init(void);
int32_t NUCLEO_BSP_UART_DMA_Init(void);

int32_t NUCLEO_BSP_Ext_Sensor_I2C3_Init(void);
int32_t NUCLEO_BSP_Ext_Sensor_I2C3_DeInit(void);

#endif /* NUCLEO_BSP_SERIAL_H */
