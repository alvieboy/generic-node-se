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
 * @file NUCLEO_spi.c
 *
 * @copyright Copyright (c) 2021 MAIS Project
 *
 */

#include "NUCLEO_bsp.h"
#include "NUCLEO_bsp_microphone.h"
#include "NUCLEO_tracer.h"

void HAL_SPI_RxCpltCallback(SPI_HandleTypeDef *hspi)
{
    if (hspi==&NUCLEO_BSP_microphone_spi) {
        NUCLEO_BSP_MICROPHONE_RxCpltCallback();
    }
}

void HAL_SPI_RxHalfCpltCallback(SPI_HandleTypeDef *hspi)
{
    if (hspi==&NUCLEO_BSP_microphone_spi) {
        NUCLEO_BSP_MICROPHONE_RxHalfCpltCallback();
    }
}

void HAL_SPI_TxCpltCallback(SPI_HandleTypeDef *hspi)
{
    APP_PRINTF("%s err=%d\r\n", __FUNCTION__, hspi->ErrorCode);
}
void HAL_SPI_TxRxCpltCallback(SPI_HandleTypeDef *hspi)
{
    APP_PRINTF("%s err=%d\r\n", __FUNCTION__, hspi->ErrorCode);
}
void HAL_SPI_TxHalfCpltCallback(SPI_HandleTypeDef *hspi)
{
    APP_PRINTF("%s err=%d\r\n", __FUNCTION__, hspi->ErrorCode);
}
void HAL_SPI_TxRxHalfCpltCallback(SPI_HandleTypeDef *hspi)
{
    APP_PRINTF("%s err=%d\r\n", __FUNCTION__, hspi->ErrorCode);
}
void HAL_SPI_ErrorCallback(SPI_HandleTypeDef *hspi)
{
    APP_PRINTF("%s err=%d\r\n", __FUNCTION__, hspi->ErrorCode);
}
void HAL_SPI_AbortCpltCallback(SPI_HandleTypeDef *hspi)
{
    APP_PRINTF("%s err=%d\r\n", __FUNCTION__, hspi->ErrorCode);
}
