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
 * @file NUCLEO_bsp_gpio.h
 *
 * @copyright Copyright (c) 2021 The Things Industries B.V., (c) 2021 MAIS Project
 *
 */

#ifndef NUCLEO_BSP_GPIO_H
#define NUCLEO_BSP_GPIO_H

#include "stm32wlxx_hal.h"
#include "NUCLEO_bsp_error.h"
#include "NUCLEO_bsp_conf.h"

#ifdef __cplusplus
 extern "C" {
#endif

/**
 * HW aliases for the board components
 */
typedef enum
{
  LED1 = 0,
  LED2 = 1,
  LED3 = 2,
  /* Color LED aliases */
  LED_RED = LED3,
  LED_GREEN = LED2,
  LED_BLUE = LED1
} Led_TypeDef;

typedef enum
{
    BUTTON_SW1 = 0,
    BUTTON_SW2 = 1
} Button_TypeDef;

typedef enum
{
  BUTTON_MODE_GPIO = 0,
  BUTTON_MODE_EXTI = 1
} ButtonMode_TypeDef;

/**
 * HAL defines
 * Configure below for any pin change
 */

#define LEDn 3

#define LED1_PIN GPIO_PIN_15
#define LED1_GPIO_PORT GPIOB
#define LED1_GPIO_CLK_ENABLE() __HAL_RCC_GPIOB_CLK_ENABLE()
#define LED1_GPIO_CLK_DISABLE() __HAL_RCC_GPIOB_CLK_DISABLE()

#define LED2_PIN GPIO_PIN_9
#define LED2_GPIO_PORT GPIOB
#define LED2_GPIO_CLK_ENABLE() __HAL_RCC_GPIOB_CLK_ENABLE()
#define LED2_GPIO_CLK_DISABLE() __HAL_RCC_GPIOB_CLK_DISABLE()

#define LED3_PIN GPIO_PIN_11
#define LED3_GPIO_PORT GPIOB
#define LED3_GPIO_CLK_ENABLE() __HAL_RCC_GPIOB_CLK_ENABLE()
#define LED3_GPIO_CLK_DISABLE() __HAL_RCC_GPIOB_CLK_DISABLE()

#define LEDx_GPIO_CLK_ENABLE(__INDEX__) \
  do                                    \
  {                                     \
    if ((__INDEX__) == LED1)            \
      LED1_GPIO_CLK_ENABLE();           \
    else if ((__INDEX__) == LED2)       \
      LED2_GPIO_CLK_ENABLE();           \
    else if ((__INDEX__) == LED3)       \
      LED3_GPIO_CLK_ENABLE();           \
  } while (0)

#define LEDx_GPIO_CLK_DISABLE(__INDEX__) \
  do                                     \
  {                                      \
    if ((__INDEX__) == LED1)             \
      LED1_GPIO_CLK_DISABLE();           \
    else if ((__INDEX__) == LED2)        \
      LED2_GPIO_CLK_DISABLE();           \
    else if ((__INDEX__) == LED3)        \
      LED3_GPIO_CLK_DISABLE();           \
  } while (0)

#define BUTTONn 2

#define BUTTON_SW1_PIN GPIO_PIN_6
#define BUTTON_SW1_GPIO_PORT GPIOC
#define BUTTON_SW1_GPIO_CLK_ENABLE() __HAL_RCC_GPIOC_CLK_ENABLE()
#define BUTTON_SW1_GPIO_CLK_DISABLE() __HAL_RCC_GPIOC_CLK_DISABLE()
#define BUTTON_SW1_EXTI_LINE EXTI_LINE_6
#ifdef CORE_CM0PLUS
#define BUTTON_SW1_EXTI_IRQn EXTI4_0_IRQn
#else
#define BUTTON_SW1_EXTI_IRQn EXTI4_IRQn
#endif

#define BUTTON_SW2_PIN GPIO_PIN_1
#define BUTTON_SW2_GPIO_PORT GPIOA
#define BUTTON_SW2_GPIO_CLK_ENABLE() __HAL_RCC_GPIOA_CLK_ENABLE()
#define BUTTON_SW2_GPIO_CLK_DISABLE() __HAL_RCC_GPIOA_CLK_DISABLE()
#define BUTTON_SW2_EXTI_LINE EXTI_LINE_1
#ifdef CORE_CM0PLUS
#define BUTTON_SW2_EXTI_IRQn EXTI1_0_IRQn
#else
#define BUTTON_SW2_EXTI_IRQn EXTI1_IRQn
#endif



#define BUTTONx_GPIO_CLK_ENABLE(__INDEX__) \
    do { \
    if ((__INDEX__)==BUTTON_SW1) { \
       BUTTON_SW1_GPIO_CLK_ENABLE();\
    } else if ((__INDEX__)==BUTTON_SW2) { \
       BUTTON_SW2_GPIO_CLK_ENABLE();\
    }; } while (0)

/**
 * BSP GPIO APIs
 */

int32_t NUCLEO_BSP_LED_Init(Led_TypeDef Led);
int32_t NUCLEO_BSP_LED_DeInit(Led_TypeDef Led);
int32_t NUCLEO_BSP_LED_On(Led_TypeDef Led);
int32_t NUCLEO_BSP_LED_Off(Led_TypeDef Led);
int32_t NUCLEO_BSP_LED_Toggle(Led_TypeDef Led);
int32_t NUCLEO_BSP_LED_GetState(Led_TypeDef Led);

int32_t NUCLEO_BSP_PB_Init(Button_TypeDef Button, ButtonMode_TypeDef ButtonMode);
int32_t NUCLEO_BSP_PB_DeInit(Button_TypeDef Button);
int32_t NUCLEO_BSP_PB_GetState(Button_TypeDef Button);
void NUCLEO_BSP_PB_Callback(Button_TypeDef Button);
void NUCLEO_BSP_PB_IRQHandler(Button_TypeDef Button);

#ifdef __cplusplus
}
#endif

#endif
