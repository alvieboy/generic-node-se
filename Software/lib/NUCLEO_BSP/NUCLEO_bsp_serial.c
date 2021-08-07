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
 * @file NUCLEO_bsp_serial.c
 *
 * @copyright Copyright (c) 2021 The Things Industries B.V., (c) 2021 MAIS Project
 *
 */

#include "NUCLEO_bsp_serial.h"

UART_HandleTypeDef NUCLEO_BSP_debug_usart;
I2C_HandleTypeDef NUCLEO_BSP_ext_sensor_i2c3;
DMA_HandleTypeDef NUCLEO_BSP_hdma_tx;


/**
 * @brief Init the UART interface for debugging.
 *
 * @return NUCLEO_BSP status
 */
int32_t NUCLEO_BSP_USART_Init(void)
{
  NUCLEO_BSP_debug_usart.Instance = DEBUG_USART;
  NUCLEO_BSP_debug_usart.Init.BaudRate = DEBUG_USART_BAUDRATE;
  NUCLEO_BSP_debug_usart.Init.WordLength = UART_WORDLENGTH_8B;
  NUCLEO_BSP_debug_usart.Init.StopBits = UART_STOPBITS_1;
  NUCLEO_BSP_debug_usart.Init.Parity = UART_PARITY_NONE;
  NUCLEO_BSP_debug_usart.Init.Mode = UART_MODE_TX_RX;
  NUCLEO_BSP_debug_usart.Init.HwFlowCtl = UART_HWCONTROL_NONE;
  NUCLEO_BSP_debug_usart.Init.OverSampling = UART_OVERSAMPLING_16;
  NUCLEO_BSP_debug_usart.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
  NUCLEO_BSP_debug_usart.Init.ClockPrescaler = UART_PRESCALER_DIV1;
  NUCLEO_BSP_debug_usart.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;

  if (HAL_UART_Init(&NUCLEO_BSP_debug_usart) != HAL_OK)
  {
    return NUCLEO_BSP_ERROR_NO_INIT;
  }

  if (HAL_UARTEx_SetTxFifoThreshold(&NUCLEO_BSP_debug_usart, UART_TXFIFO_THRESHOLD_1_8) != HAL_OK)
  {
    return NUCLEO_BSP_ERROR_NO_INIT;
  }
  if (HAL_UARTEx_SetRxFifoThreshold(&NUCLEO_BSP_debug_usart, UART_RXFIFO_THRESHOLD_1_8) != HAL_OK)
  {
    return NUCLEO_BSP_ERROR_NO_INIT;
  }
  if (HAL_UARTEx_EnableFifoMode(&NUCLEO_BSP_debug_usart) != HAL_OK)
  {
    return NUCLEO_BSP_ERROR_NO_INIT;
  }

  return NUCLEO_BSP_ERROR_NONE;
}

/**
 * @brief Enable DMA controller clock.
 *
 * @return NUCLEO_BSP status
 */
int32_t NUCLEO_BSP_UART_DMA_Init(void)
{
  /* DMA controller clock enable */
  DEBUG_USART_DMAMUX_CLK_ENABLE();
  DEBUG_USART_DMA_CLK_ENABLE();

  /* DMA interrupt init */
  /* DMA1_Channel5_IRQn interrupt configuration */
  HAL_NVIC_SetPriority(DMA1_Channel5_IRQn, DEBUG_USART_DMA_IT_PRIORITY, 0);
  HAL_NVIC_EnableIRQ(DMA1_Channel5_IRQn);

  return NUCLEO_BSP_ERROR_NONE;
}


/**
 * @brief Init the external sensors (qwiic) I2C3 bus.
 *
 * @return NUCLEO_BSP status
 */
int32_t NUCLEO_BSP_Ext_Sensor_I2C3_Init(void)
{
  NUCLEO_BSP_ext_sensor_i2c3.Instance = EXT_SENSOR_I2C3;
  NUCLEO_BSP_ext_sensor_i2c3.Init.Timing = EXT_SENSOR_I2C3_TIMING; // I2C3 bus frequency config
  NUCLEO_BSP_ext_sensor_i2c3.Init.OwnAddress1 = 0x00;
  NUCLEO_BSP_ext_sensor_i2c3.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  NUCLEO_BSP_ext_sensor_i2c3.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  NUCLEO_BSP_ext_sensor_i2c3.Init.OwnAddress2 = 0x00;
  NUCLEO_BSP_ext_sensor_i2c3.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  NUCLEO_BSP_ext_sensor_i2c3.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;

  if (HAL_I2C_Init(&NUCLEO_BSP_ext_sensor_i2c3) != HAL_OK)
  {
    return NUCLEO_BSP_ERROR_NO_INIT;
  }

  /* Enable the Analog I2C Filter */
  if (HAL_I2CEx_ConfigAnalogFilter(&NUCLEO_BSP_ext_sensor_i2c3, I2C_ANALOGFILTER_ENABLE) != HAL_OK)
  {
    return NUCLEO_BSP_ERROR_NO_INIT;
  }

  /** Configure Digital filter
  */
  if (HAL_I2CEx_ConfigDigitalFilter(&NUCLEO_BSP_ext_sensor_i2c3, 0) != HAL_OK)
  {
    return NUCLEO_BSP_ERROR_NO_INIT;
  }

  HAL_I2CEx_EnableFastModePlus(EXT_SENSOR_I2C3_FASTMODEPLUS);

  return NUCLEO_BSP_ERROR_NONE;
}

/**
 * @brief Deinit the external sensors I2C3 bus.
 *
 * @return NUCLEO_BSP status
 */
int32_t NUCLEO_BSP_Ext_Sensor_I2C3_DeInit(void)
{

  if (HAL_I2C_DeInit(&NUCLEO_BSP_ext_sensor_i2c3) != HAL_OK)
  {
    return NUCLEO_BSP_ERROR_NO_INIT;
  }

  HAL_I2CEx_DisableFastModePlus(EXT_SENSOR_I2C3_FASTMODEPLUS);

  return NUCLEO_BSP_ERROR_NONE;
}

