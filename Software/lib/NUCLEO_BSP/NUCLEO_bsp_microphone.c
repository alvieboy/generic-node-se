/** Copyright © 2021 MAIS Project
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
 * @file NUCLEO_bsp_microphone.c
 *
 * @copyright Copyright (c) 2021 MAIS Project
 *
 */

#include "NUCLEO_bsp.h"
#include "NUCLEO_tracer.h"

DMA_HandleTypeDef NUCLEO_BSP_microphone_hdma_rx;

#ifdef MICROPHONE_USE_I2S
I2S_HandleTypeDef NUCLEO_BSP_microphone_i2s = {0};
#else
SPI_HandleTypeDef NUCLEO_BSP_microphone_spi = {0};
#endif

#define MICROPHONE_MIN_FREQUENCY 20 /* 20Hz */
#define MICROPHONE_BIT_SAMPLING_SPEED 2000000 /* 2MHz */

// TBD: round this
#define MICROPHONE_CAPTURE_BITS ((MICROPHONE_BIT_SAMPLING_SPEED)/MICROPHONE_MIN_FREQUENCY)
#define MICROPHONE_CAPTURE_BYTES (MICROPHONE_CAPTURE_BITS/8)

#define MICROPHONE_BUFFER_BYTES (MICROPHONE_CAPTURE_BYTES/2)

#define MICROPHONE_DECIMATION 64

#define MICROPHONE_SAMPLE_SIZE (MICROPHONE_CAPTURE_BITS/MICROPHONE_DECIMATION)

static uint8_t microphone_spi_buffer[MICROPHONE_BUFFER_BYTES];
static uint16_t microphone_data[MICROPHONE_SAMPLE_SIZE];


int32_t NUCLEO_BSP_MICROPHONE_Init(void)
{

    MICROPHONE_SPI_CLK_ENABLE();
    MICROPHONE_SPI_GPIO_CLK_ENABLE();

#ifdef MICROPHONE_USE_I2S

    NUCLEO_BSP_microphone_i2s.Instance = MICROPHONE_SPI;
    NUCLEO_BSP_microphone_i2s.Init.Mode = I2S_MODE_MASTER_RX;
    NUCLEO_BSP_microphone_i2s.Init.Standard = I2S_STANDARD_MSB;
    NUCLEO_BSP_microphone_i2s.Init.DataFormat = I2S_DATAFORMAT_16B;
    NUCLEO_BSP_microphone_i2s.Init.MCLKOutput = I2S_MCLKOUTPUT_DISABLE;
    NUCLEO_BSP_microphone_i2s.Init.AudioFreq = 64000;
    NUCLEO_BSP_microphone_i2s.Init.CPOL = I2S_CPOL_LOW;
    if (HAL_I2S_Init(&NUCLEO_BSP_microphone_i2s) != HAL_OK)
    {
        return NUCLEO_BSP_ERROR_PERIPH_FAILURE;
    }

    return NUCLEO_BSP_ERROR_NONE;
#else
    memset(&NUCLEO_BSP_microphone_spi,0,sizeof(NUCLEO_BSP_microphone_spi));

    NUCLEO_BSP_microphone_spi.Instance = MICROPHONE_SPI;
    NUCLEO_BSP_microphone_spi.Init.Mode = SPI_MODE_MASTER;

    NUCLEO_BSP_microphone_spi.Init.Direction = SPI_DIRECTION_1LINE;
    NUCLEO_BSP_microphone_spi.Init.DataSize = SPI_DATASIZE_8BIT;
    NUCLEO_BSP_microphone_spi.Init.CLKPolarity = SPI_POLARITY_LOW;
    NUCLEO_BSP_microphone_spi.Init.CLKPhase = SPI_PHASE_1EDGE;
    NUCLEO_BSP_microphone_spi.Init.NSS = SPI_NSS_SOFT;

    NUCLEO_BSP_microphone_spi.Init.BaudRatePrescaler = MICROPHONE_SPI_BAUDRATE;
    NUCLEO_BSP_microphone_spi.Init.FirstBit = SPI_FIRSTBIT_MSB;
    NUCLEO_BSP_microphone_spi.Init.TIMode = SPI_TIMODE_DISABLE;
    NUCLEO_BSP_microphone_spi.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
    NUCLEO_BSP_microphone_spi.Init.CRCPolynomial = 7;
    NUCLEO_BSP_microphone_spi.Init.CRCLength = SPI_CRC_LENGTH_DATASIZE;
    NUCLEO_BSP_microphone_spi.Init.NSSPMode = SPI_NSS_PULSE_DISABLE;

    if (HAL_SPI_Init(&NUCLEO_BSP_microphone_spi) != HAL_OK)
    {
        return NUCLEO_BSP_ERROR_PERIPH_FAILURE;
    }

    return NUCLEO_BSP_ERROR_NONE;
#endif

}

void __attribute__((weak)) NUCLEO_BSP_MICROPHONE_RxCpltCallback(void)
{
}

void __attribute__((weak)) NUCLEO_BSP_MICROPHONE_RxHalfCpltCallback(void)
{
}

int32_t NUCLEO_BSP_MICROPHONE_Start()
{
#ifdef MICROPHONE_USE_I2S
    if (HAL_I2S_Receive(&NUCLEO_BSP_microphone_i2s,
                        (uint16_t*)&microphone_spi_buffer[0],
                        sizeof(microphone_spi_buffer)/2, 2000)!=HAL_OK)
        return NUCLEO_BSP_ERROR_PERIPH_FAILURE;

#else

    if (HAL_SPI_Receive_DMA(&NUCLEO_BSP_microphone_spi,
                           &microphone_spi_buffer[0],
                           sizeof(microphone_spi_buffer))!=HAL_OK)
        return NUCLEO_BSP_ERROR_PERIPH_FAILURE;
#endif
    return NUCLEO_BSP_ERROR_NONE;

}
