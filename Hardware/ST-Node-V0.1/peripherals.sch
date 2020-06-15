EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
Title "Sensors & Peripherals"
Date "2020-04-07"
Rev "0.1"
Comp "The Things Industries"
Comment1 "https://www.thethingsindustries.com/"
Comment2 "Drawn by: Orkhan Amiraslanov (azerimaker)"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L node-lib-v1:LIS2DH12 U6
U 1 1 5EB8F52D
P 1950 4125
F 0 "U6" H 1700 4575 50  0000 C CNN
F 1 "LIS2DH12" H 2275 4600 59  0000 C CNB
F 2 "Package_LGA:LGA-12_2x2mm_P0.5mm" H 2100 4675 50  0001 L CNN
F 3 "https://www.st.com/resource/en/datasheet/lis2dh12.pdf" H 1600 4125 50  0001 C CNN
F 4 "LIS2DH12TR" H 1950 4125 50  0001 C CNN "MPN"
	1    1950 4125
	1    0    0    -1  
$EndComp
Text HLabel 1725 3300 0    50   Input ~ 10
VCC_SENSORS
Text HLabel 4850 1100 0    50   Input ~ 10
VCC_SEC_ELM
Text HLabel 2500 1025 0    50   Input ~ 10
VCC_FLASH
Text HLabel 4950 3550 0    50   Input ~ 10
VCC_SENSORS
$Comp
L node-lib-v1:MX25R1635 U5
U 1 1 5EBC3EE6
P 1775 1425
F 0 "U5" H 2112 1687 59  0000 C CNN
F 1 "MX25R1635" H 2112 1582 59  0000 C CNB
F 2 "Package_CSP:LFCSP-8-1EP_3x2mm_P0.5mm_EP1.6x1.65mm" H 1775 1425 59  0001 C CNN
F 3 "" H 1775 1425 59  0001 C CNN
F 4 "MX25R1635FZUIL0" H 1775 1425 50  0001 C CNN "MPN"
	1    1775 1425
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR024
U 1 1 5EBAD54D
P 2050 4800
F 0 "#PWR024" H 2050 4550 50  0001 C CNN
F 1 "GND" H 2055 4627 50  0000 C CNN
F 2 "" H 2050 4800 50  0001 C CNN
F 3 "" H 2050 4800 50  0001 C CNN
	1    2050 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 4625 1850 4725
Wire Wire Line
	1850 4725 1950 4725
Wire Wire Line
	2050 4725 2050 4800
Connection ~ 1950 4725
Wire Wire Line
	1950 4725 2050 4725
Wire Wire Line
	1950 4625 1950 4725
Wire Wire Line
	2050 4625 2050 4725
Connection ~ 2050 4725
Wire Wire Line
	2450 4425 2525 4425
Wire Wire Line
	2525 4425 2525 4725
Wire Wire Line
	2525 4725 2050 4725
$Comp
L Device:C C14
U 1 1 5EBAE4AA
P 2475 3300
F 0 "C14" V 2325 3300 50  0000 C CNN
F 1 "10uF" V 2650 3300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2513 3150 50  0001 C CNN
F 3 "~" H 2475 3300 50  0001 C CNN
	1    2475 3300
	0    1    1    0   
$EndComp
$Comp
L Device:C C15
U 1 1 5EBAF067
P 2750 3425
F 0 "C15" V 2575 3425 50  0000 C CNN
F 1 "100nF" V 2900 3425 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2788 3275 50  0001 C CNN
F 3 "~" H 2750 3425 50  0001 C CNN
	1    2750 3425
	0    1    1    0   
$EndComp
$Comp
L Device:C C17
U 1 1 5EBAF2BF
P 3000 3525
F 0 "C17" V 2850 3525 50  0000 C CNN
F 1 "100nF" V 3150 3525 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3038 3375 50  0001 C CNN
F 3 "~" H 3000 3525 50  0001 C CNN
	1    3000 3525
	0    1    1    0   
$EndComp
Wire Wire Line
	1725 3300 1950 3300
Wire Wire Line
	2325 3300 1950 3300
Connection ~ 1950 3300
Wire Wire Line
	1950 3300 1950 3425
Wire Wire Line
	2600 3425 1950 3425
Connection ~ 1950 3425
Wire Wire Line
	1950 3425 1950 3525
Wire Wire Line
	2850 3525 2050 3525
Connection ~ 1950 3525
Wire Wire Line
	1950 3525 1950 3625
Wire Wire Line
	2050 3625 2050 3525
Connection ~ 2050 3525
Wire Wire Line
	2050 3525 1950 3525
$Comp
L power:GND #PWR026
U 1 1 5EBB0ECA
P 3225 3625
F 0 "#PWR026" H 3225 3375 50  0001 C CNN
F 1 "GND" H 3230 3452 50  0000 C CNN
F 2 "" H 3225 3625 50  0001 C CNN
F 3 "" H 3225 3625 50  0001 C CNN
	1    3225 3625
	1    0    0    -1  
$EndComp
Wire Wire Line
	2625 3300 3225 3300
Wire Wire Line
	3225 3300 3225 3425
Wire Wire Line
	2900 3425 3225 3425
Connection ~ 3225 3425
Wire Wire Line
	3225 3425 3225 3525
Wire Wire Line
	3150 3525 3225 3525
Connection ~ 3225 3525
Wire Wire Line
	3225 3525 3225 3625
Wire Wire Line
	1550 3925 1475 3925
Wire Wire Line
	1475 3925 1475 3525
Wire Wire Line
	1475 3525 1950 3525
Wire Wire Line
	1550 4225 1275 4225
Wire Wire Line
	1550 4025 1275 4025
Wire Wire Line
	2450 4025 2725 4025
Wire Wire Line
	2450 4125 2725 4125
Text Notes 1325 5225 0    59   Italic 0
I2C address:\nSAO/SDO 1 = 0x19 (0011001b)*\nSAO/SDO 0 = 0x18 (0011000b)
Wire Wire Line
	1550 4125 1475 4125
Wire Wire Line
	1475 4125 1475 3925
Connection ~ 1475 3925
Wire Notes Line
	550  3100 550  5450
Wire Notes Line
	550  5450 3550 5450
Wire Notes Line
	3550 5450 3550 3100
Wire Notes Line
	3550 3100 550  3100
Text Notes 1650 5400 0    79   ~ 16
Accelerometer
Text HLabel 2725 4025 2    50   Output ~ 10
ACCEL_INT1
Text HLabel 2725 4125 2    50   Output ~ 10
ACCEL_INT2
Text HLabel 1275 4025 0    50   BiDi ~ 10
SDA
Text HLabel 1275 4225 0    50   Input ~ 10
SCL
$Comp
L Device:C C16
U 1 1 5EBD7FB6
P 2925 1625
F 0 "C16" H 2750 1625 50  0000 C CNN
F 1 "100nF" H 2725 1725 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 2963 1475 50  0001 C CNN
F 3 "~" H 2925 1625 50  0001 C CNN
	1    2925 1625
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR025
U 1 1 5EBD88E0
P 2925 1800
F 0 "#PWR025" H 2925 1550 50  0001 C CNN
F 1 "GND" H 2930 1627 50  0000 C CNN
F 2 "" H 2925 1800 50  0001 C CNN
F 3 "" H 2925 1800 50  0001 C CNN
	1    2925 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2925 1775 2925 1800
$Comp
L power:GND #PWR023
U 1 1 5EBD93CD
P 1500 2375
F 0 "#PWR023" H 1500 2125 50  0001 C CNN
F 1 "GND" H 1505 2202 50  0000 C CNN
F 2 "" H 1500 2375 50  0001 C CNN
F 3 "" H 1500 2375 50  0001 C CNN
	1    1500 2375
	1    0    0    -1  
$EndComp
Wire Wire Line
	2925 1025 2925 1425
Connection ~ 2925 1425
Wire Wire Line
	2925 1425 2925 1475
Wire Wire Line
	1575 2225 1500 2225
Wire Wire Line
	1500 2225 1500 2375
Wire Wire Line
	1575 1425 1500 1425
Wire Wire Line
	1575 1575 1500 1575
$Comp
L Device:R R11
U 1 1 5EBDE849
P 1025 1500
F 0 "R11" V 1075 1625 50  0000 L CNN
F 1 "10K" V 1025 1425 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 955 1500 50  0001 C CNN
F 3 "~" H 1025 1500 50  0001 C CNN
	1    1025 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5EBDF77C
P 900 1500
F 0 "R10" V 950 1625 50  0000 L CNN
F 1 "DNM" V 900 1425 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 830 1500 50  0001 C CNN
F 3 "~" H 900 1500 50  0001 C CNN
	1    900  1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5EBE04D3
P 775 1500
F 0 "R9" V 825 1625 50  0000 L CNN
F 1 "DNM" V 775 1425 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 705 1500 50  0001 C CNN
F 3 "~" H 775 1500 50  0001 C CNN
	1    775  1500
	1    0    0    -1  
$EndComp
Text HLabel 1100 1200 2    50   Input ~ 10
VCC_FLASH
Wire Wire Line
	1100 1200 1025 1200
Wire Wire Line
	775  1200 775  1350
Wire Wire Line
	900  1350 900  1200
Connection ~ 900  1200
Wire Wire Line
	900  1200 775  1200
Wire Wire Line
	1025 1350 1025 1200
Connection ~ 1025 1200
Wire Wire Line
	1025 1200 900  1200
Wire Wire Line
	1025 1675 1025 1650
Wire Wire Line
	1025 1675 1200 1675
Wire Wire Line
	900  1775 900  1650
Wire Wire Line
	900  1775 1575 1775
Wire Wire Line
	775  1875 775  1650
Wire Wire Line
	775  1875 1575 1875
Text HLabel 1500 1425 0    50   Input ~ 10
MOSI
Text HLabel 1500 1575 0    50   Input ~ 10
SCLK
Wire Notes Line
	550  3050 3550 3050
Wire Notes Line
	3550 3050 3550 550 
Wire Notes Line
	3550 550  550  550 
Wire Notes Line
	550  550  550  3050
Text Notes 1650 3000 0    79   ~ 16
Flash Memory
Wire Wire Line
	2675 1425 2925 1425
Text HLabel 3050 2025 2    50   Output ~ 10
MISO
Wire Wire Line
	2675 2025 3050 2025
Wire Wire Line
	1575 2125 1500 2125
Wire Wire Line
	1500 2125 1500 2225
Connection ~ 1500 2225
Wire Wire Line
	2500 1025 2925 1025
Text HLabel 4425 1800 0    50   Input ~ 10
SEC_ELM_SCL
$Comp
L Device:C C18
U 1 1 5EBFFE41
P 5300 1325
F 0 "C18" V 5125 1325 50  0000 C CNN
F 1 "100nF" V 5250 1500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 5338 1175 50  0001 C CNN
F 3 "~" H 5300 1325 50  0001 C CNN
	1    5300 1325
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR030
U 1 1 5EC0005E
P 5075 2125
F 0 "#PWR030" H 5075 1875 50  0001 C CNN
F 1 "GND" H 5080 1952 50  0000 C CNN
F 2 "" H 5075 2125 50  0001 C CNN
F 3 "" H 5075 2125 50  0001 C CNN
	1    5075 2125
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR031
U 1 1 5EC00E7F
P 5525 1425
F 0 "#PWR031" H 5525 1175 50  0001 C CNN
F 1 "GND" H 5530 1252 50  0000 C CNN
F 2 "" H 5525 1425 50  0001 C CNN
F 3 "" H 5525 1425 50  0001 C CNN
	1    5525 1425
	1    0    0    -1  
$EndComp
Wire Wire Line
	5075 2000 5075 2075
Wire Wire Line
	4975 2000 4975 2075
Wire Wire Line
	4975 2075 5075 2075
Connection ~ 5075 2075
Wire Wire Line
	5075 2075 5075 2125
Wire Wire Line
	5450 1325 5525 1325
Wire Wire Line
	5525 1325 5525 1425
Wire Wire Line
	4975 1100 4975 1325
Wire Wire Line
	5150 1325 4975 1325
Connection ~ 4975 1325
Wire Wire Line
	4975 1325 4975 1400
Text HLabel 4425 1600 0    50   BiDi ~ 10
SEC_ELM_SDA
$Comp
L Security:ATECC608A-MAHDA U8
U 1 1 5EBEE734
P 4975 1700
F 0 "U8" H 4745 1746 50  0000 R CNN
F 1 "ATECC608A-TNGLORAU" H 4745 1655 50  0000 R CNB
F 2 "Package_DFN_QFN:DFN-8-1EP_3x2mm_P0.5mm_EP1.3x1.5mm" H 4975 1700 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATECC608A-CryptoAuthentication-Device-Summary-Data-Sheet-DS40001977B.pdf" H 5125 1950 50  0001 C CNN
F 4 "ATECC608A-TNGLORAU-G" H 4975 1700 50  0001 C CNN "MPN"
	1    4975 1700
	-1   0    0    -1  
$EndComp
Wire Notes Line
	3600 550  3600 3050
Wire Notes Line
	3600 3050 6350 3050
Wire Notes Line
	6350 3050 6350 550 
Wire Notes Line
	6350 550  3600 550 
Text Notes 3800 3000 0    79   ~ 16
Crypto Authentication (Secure Element)
Text Notes 9350 3000 0    79   ~ 16
RGB LED & Button
Text Notes 7250 3000 0    79   ~ 16
Buzzer
$Comp
L Device:Speaker_Crystal PZ1
U 1 1 5EBD6662
P 7700 1575
F 0 "PZ1" H 7875 1500 50  0000 L CNN
F 1 "AST0927 2.73kHz 85dB" H 7525 1825 50  0000 L CNN
F 2 "Buzzer_Beeper:MagneticBuzzer_CUI_CST-931RP-A" H 7665 1525 50  0001 C CNN
F 3 "~" H 7665 1525 50  0001 C CNN
F 4 "AST0927MW-3.6TRQ" H 7700 1575 50  0001 C CNN "MPN"
	1    7700 1575
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N4148WS D1
U 1 1 5EBD6DC8
P 7225 1625
F 0 "D1" V 7200 1825 50  0000 R CNN
F 1 "1N4148WS" V 7300 2100 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-323" H 7225 1450 50  0001 C CNN
F 3 "https://www.vishay.com/docs/85751/1n4148ws.pdf" H 7225 1625 50  0001 C CNN
F 4 "1N4148WS-7-F" V 7225 1625 50  0001 C CNN "MPN"
	1    7225 1625
	0    -1   1    0   
$EndComp
Wire Wire Line
	7500 1025 7500 1475
$Comp
L Transistor_BJT:2SC4213 Q2
U 1 1 5EBE2311
P 7400 2225
F 0 "Q2" H 7590 2271 50  0000 L CNN
F 1 "2SC4213" H 7590 2180 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-323_SC-70" H 7600 2150 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=19305&prodName=2SC4213" H 7400 2225 50  0001 L CNN
F 4 "2SC4213BTE85LF" H 7400 2225 50  0001 C CNN "MPN"
	1    7400 2225
	1    0    0    -1  
$EndComp
Wire Wire Line
	7225 1475 7500 1475
Connection ~ 7500 1475
Wire Wire Line
	7500 1475 7500 1575
Wire Wire Line
	7225 1775 7500 1775
Wire Wire Line
	7500 1675 7500 1775
Connection ~ 7500 1775
Wire Wire Line
	7500 1775 7500 2025
$Comp
L power:GND #PWR034
U 1 1 5EBED5DC
P 7500 2500
F 0 "#PWR034" H 7500 2250 50  0001 C CNN
F 1 "GND" H 7505 2327 50  0000 C CNN
F 2 "" H 7500 2500 50  0001 C CNN
F 3 "" H 7500 2500 50  0001 C CNN
	1    7500 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 2425 7500 2500
$Comp
L Device:R R16
U 1 1 5EBEF83C
P 7025 2225
F 0 "R16" V 6950 2275 50  0000 R CNN
F 1 "1K" V 7125 2300 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 6955 2225 50  0001 C CNN
F 3 "~" H 7025 2225 50  0001 C CNN
	1    7025 2225
	0    -1   1    0   
$EndComp
Wire Wire Line
	7175 2225 7200 2225
Wire Wire Line
	6875 2225 6850 2225
Text HLabel 6850 2225 0    50   Input ~ 10
BUZZER
Wire Notes Line
	6400 550  6400 3050
Wire Notes Line
	6400 3050 8500 3050
Wire Notes Line
	8500 3050 8500 550 
Wire Notes Line
	8500 550  6400 550 
$Comp
L Device:LED_RGBA D2
U 1 1 5EC09B6C
P 9850 1075
F 0 "D2" V 9896 745 50  0000 R CNN
F 1 "EAST1616RGBB2" V 10025 975 50  0000 R CNN
F 2 "LED_SMD:LED_RGB_1210" H 9850 1025 50  0001 C CNN
F 3 "~" H 9850 1025 50  0001 C CNN
F 4 "EAST1616RGBB2" V 9850 1075 50  0001 C CNN "MPN"
	1    9850 1075
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R17
U 1 1 5EC15319
P 9650 1475
F 0 "R17" H 9800 1325 50  0000 R CNN
F 1 "330R" V 9650 1575 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 9580 1475 50  0001 C CNN
F 3 "~" H 9650 1475 50  0001 C CNN
	1    9650 1475
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 5EC15EE4
P 10050 1475
F 0 "R19" H 10200 1325 50  0000 R CNN
F 1 "100R" V 10050 1575 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 9980 1475 50  0001 C CNN
F 3 "~" H 10050 1475 50  0001 C CNN
	1    10050 1475
	-1   0    0    -1  
$EndComp
Text HLabel 9650 1700 3    50   Input ~ 10
LED_R
Text HLabel 10050 1700 3    50   Input ~ 10
LED_B
Wire Wire Line
	9650 1625 9650 1700
Wire Wire Line
	10050 1625 10050 1700
Wire Wire Line
	9650 1275 9650 1325
Wire Wire Line
	10050 1275 10050 1325
Wire Notes Line
	8550 550  8550 3050
Wire Notes Line
	8550 3050 11150 3050
Wire Notes Line
	11150 3050 11150 550 
Wire Notes Line
	11150 550  8550 550 
$Comp
L Switch:SW_Push SW1
U 1 1 5EC2E13E
P 9850 2350
F 0 "SW1" V 9900 2650 50  0000 R CNN
F 1 "SW_Push" V 9700 2750 50  0000 R CNN
F 2 "Button_Switch_SMD:SW_SPST_B3S-1000" H 9850 2550 50  0001 C CNN
F 3 "~" H 9850 2550 50  0001 C CNN
F 4 "KMR211GLFS" H 9850 2350 50  0001 C CNN "MPN"
	1    9850 2350
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C20
U 1 1 5EC2F067
P 10050 2350
F 0 "C20" H 9875 2350 50  0000 C CNN
F 1 "DNM" H 9875 2450 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 10088 2200 50  0001 C CNN
F 3 "~" H 10050 2350 50  0001 C CNN
	1    10050 2350
	-1   0    0    1   
$EndComp
Text HLabel 9500 2100 0    50   Output ~ 10
USR_BTN
Wire Wire Line
	9500 2100 9850 2100
Wire Wire Line
	9850 2100 9850 2150
Wire Wire Line
	10050 2200 10050 2100
Wire Wire Line
	10050 2100 9850 2100
Connection ~ 9850 2100
$Comp
L power:GND #PWR036
U 1 1 5EC35BBF
P 9850 2650
F 0 "#PWR036" H 9850 2400 50  0001 C CNN
F 1 "GND" H 9855 2477 50  0000 C CNN
F 2 "" H 9850 2650 50  0001 C CNN
F 3 "" H 9850 2650 50  0001 C CNN
	1    9850 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 2550 9850 2600
Wire Wire Line
	10050 2500 10050 2600
Wire Wire Line
	10050 2600 9850 2600
Connection ~ 9850 2600
Wire Wire Line
	9850 2600 9850 2650
$Comp
L power:VDD #PWR035
U 1 1 5EC4DAD2
P 9850 825
F 0 "#PWR035" H 9850 675 50  0001 C CNN
F 1 "VDD" H 9867 998 50  0000 C CNN
F 2 "" H 9850 825 50  0001 C CNN
F 3 "" H 9850 825 50  0001 C CNN
	1    9850 825 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 825  9850 875 
$Comp
L power:VDD #PWR033
U 1 1 5EC50DC7
P 7500 1025
F 0 "#PWR033" H 7500 875 50  0001 C CNN
F 1 "VDD" H 7517 1198 50  0000 C CNN
F 2 "" H 7500 1025 50  0001 C CNN
F 3 "" H 7500 1025 50  0001 C CNN
	1    7500 1025
	1    0    0    -1  
$EndComp
Text Notes 4550 2475 0    59   Italic 0
I2C address: 0x59
$Comp
L Sensor_Humidity:SHTC3 U7
U 1 1 5ECCB71D
P 4950 4200
F 0 "U7" H 5194 4246 50  0000 L CNN
F 1 "SHTC3" H 5194 4155 50  0000 L CNN
F 2 "Sensor_Humidity:Sensirion_DFN-4-1EP_2x2mm_P1mm_EP0.7x1.6mm" H 5150 3850 50  0001 C CNN
F 3 "https://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/0_Datasheets/Humidity/Sensirion_Humidity_Sensors_SHTC3_Datasheet.pdf" H 4650 4650 50  0001 C CNN
	1    4950 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C19
U 1 1 5ECCC5E5
P 5300 3750
F 0 "C19" V 5125 3750 50  0000 C CNN
F 1 "100nF" V 5250 3925 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 5338 3600 50  0001 C CNN
F 3 "~" H 5300 3750 50  0001 C CNN
	1    5300 3750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR032
U 1 1 5ECCD01B
P 5550 3825
F 0 "#PWR032" H 5550 3575 50  0001 C CNN
F 1 "GND" H 5555 3652 50  0000 C CNN
F 2 "" H 5550 3825 50  0001 C CNN
F 3 "" H 5550 3825 50  0001 C CNN
	1    5550 3825
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 3750 5550 3750
Wire Wire Line
	5550 3750 5550 3825
Wire Wire Line
	4950 3550 5050 3550
Wire Wire Line
	5050 3550 5050 3750
Wire Wire Line
	5150 3750 5050 3750
Connection ~ 5050 3750
Wire Wire Line
	5050 3750 5050 3900
Text HLabel 4500 4300 0    50   BiDi ~ 10
SDA
Text HLabel 4500 4100 0    50   Input ~ 10
SCL
Wire Wire Line
	4650 4100 4500 4100
Wire Wire Line
	4500 4300 4650 4300
$Comp
L power:GND #PWR029
U 1 1 5ECDC1EA
P 5050 4600
F 0 "#PWR029" H 5050 4350 50  0001 C CNN
F 1 "GND" H 5055 4427 50  0000 C CNN
F 2 "" H 5050 4600 50  0001 C CNN
F 3 "" H 5050 4600 50  0001 C CNN
	1    5050 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 4500 5050 4600
Text Notes 4225 5300 0    79   ~ 16
Temperature & Humidity
Text Notes 4575 5050 0    59   Italic 0
I2C address: 0x70
Wire Notes Line
	3600 5450 6350 5450
Wire Notes Line
	6350 5450 6350 3100
Wire Notes Line
	6350 3100 3600 3100
Wire Notes Line
	3600 3100 3600 5450
Wire Wire Line
	4425 1800 4675 1800
Wire Wire Line
	4850 1100 4975 1100
Wire Wire Line
	4425 1600 4675 1600
Wire Notes Line
	550  5500 3550 5500
Wire Notes Line
	550  6800 3550 6800
Wire Notes Line
	3550 6800 3550 5500
Wire Wire Line
	2750 6400 2825 6400
Wire Wire Line
	2750 6250 2750 6400
Wire Wire Line
	2600 6400 2525 6400
Wire Wire Line
	2600 6250 2600 6400
Connection ~ 2675 5850
Wire Wire Line
	2750 5850 2675 5850
Wire Wire Line
	2750 5950 2750 5850
Wire Wire Line
	2600 5850 2600 5950
Wire Wire Line
	2675 5850 2600 5850
Wire Wire Line
	2675 5750 2675 5850
Wire Wire Line
	2650 5750 2675 5750
Text HLabel 2650 5750 0    50   Input ~ 10
VCC_SEC_ELM
Text HLabel 2825 6400 2    50   BiDi ~ 10
SEC_ELM_SDA
Text HLabel 2525 6400 0    50   Input ~ 10
SEC_ELM_SCL
$Comp
L Device:R R15
U 1 1 5ECFAECA
P 2750 6100
F 0 "R15" H 2820 6146 50  0000 L CNN
F 1 "4K7" H 2820 6055 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 2680 6100 50  0001 C CNN
F 3 "~" H 2750 6100 50  0001 C CNN
	1    2750 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 5ECFAC88
P 2600 6100
F 0 "R14" H 2531 6054 50  0000 R CNN
F 1 "4K7" H 2531 6145 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 2530 6100 50  0001 C CNN
F 3 "~" H 2600 6100 50  0001 C CNN
	1    2600 6100
	1    0    0    1   
$EndComp
Wire Wire Line
	1425 6400 1500 6400
Wire Wire Line
	1425 6300 1425 6400
Wire Wire Line
	1100 6400 1050 6400
Wire Wire Line
	1100 6300 1100 6400
Connection ~ 1250 5875
Wire Wire Line
	1100 5875 1100 6000
Wire Wire Line
	1250 5875 1100 5875
Wire Wire Line
	1425 5875 1425 6000
Wire Wire Line
	1250 5875 1425 5875
Wire Wire Line
	1250 5750 1250 5875
Wire Wire Line
	1225 5750 1250 5750
Text Notes 1625 6750 0    79   ~ 16
I2C pull-ups
Wire Notes Line
	550  5500 550  6800
Text HLabel 1500 6400 2    50   Input ~ 10
SCL
Text HLabel 1050 6400 0    50   BiDi ~ 10
SDA
Text HLabel 1225 5750 0    50   Input ~ 10
VCC_SENSORS
$Comp
L Device:R R13
U 1 1 5ECD5D3E
P 1425 6150
F 0 "R13" H 1495 6196 50  0000 L CNN
F 1 "4K7" H 1495 6105 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 1355 6150 50  0001 C CNN
F 3 "~" H 1425 6150 50  0001 C CNN
	1    1425 6150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5ECD57E9
P 1100 6150
F 0 "R12" H 1031 6104 50  0000 R CNN
F 1 "4K7" H 1031 6195 50  0000 R CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 1030 6150 50  0001 C CNN
F 3 "~" H 1100 6150 50  0001 C CNN
	1    1100 6150
	1    0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_02x07_Odd_Even J1
U 1 1 5EEF146C
P 4875 6050
F 0 "J1" H 4925 6475 50  0000 C CNN
F 1 "Debug" H 4925 5650 59  0000 C CNB
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x07_P1.27mm_Vertical_SMD" H 4875 6050 50  0001 C CNN
F 3 "~" H 4875 6050 50  0001 C CNN
	1    4875 6050
	1    0    0    -1  
$EndComp
Text Notes 3625 6600 0    59   Italic 0
MIPI10 can also be \npopulated in the middle
NoConn ~ 4675 6150
$Comp
L power:GND #PWR028
U 1 1 5EF03A9C
P 4150 5950
F 0 "#PWR028" H 4150 5700 50  0001 C CNN
F 1 "GND" V 4150 5750 50  0000 C CNN
F 2 "" H 4150 5950 50  0001 C CNN
F 3 "" H 4150 5950 50  0001 C CNN
	1    4150 5950
	0    1    1    0   
$EndComp
Wire Wire Line
	4150 5950 4575 5950
Wire Wire Line
	4675 6050 4575 6050
Wire Wire Line
	4575 6050 4575 5950
Connection ~ 4575 5950
Wire Wire Line
	4575 5950 4675 5950
$Comp
L power:VDD #PWR027
U 1 1 5EF20A71
P 4150 5850
F 0 "#PWR027" H 4150 5700 50  0001 C CNN
F 1 "VDD" V 4150 6050 50  0000 C CNN
F 2 "" H 4150 5850 50  0001 C CNN
F 3 "" H 4150 5850 50  0001 C CNN
	1    4150 5850
	0    -1   -1   0   
$EndComp
Text HLabel 4625 6350 0    59   Output ~ 0
VCP_Rx
Wire Wire Line
	4625 6350 4675 6350
Text HLabel 5300 6350 2    59   Input ~ 0
VCP_Tx
Wire Wire Line
	5300 6350 5175 6350
Text HLabel 5300 6250 2    59   Input ~ 0
NRST
Wire Wire Line
	5300 6250 5175 6250
Text HLabel 5300 6150 2    59   Input ~ 0
JTDI
Text HLabel 5300 6050 2    59   Output ~ 0
SWO
Text HLabel 5300 5950 2    59   Output ~ 0
SWCLK
Text HLabel 5300 5850 2    59   BiDi ~ 0
SWDIO
Wire Wire Line
	5300 5950 5175 5950
Wire Wire Line
	5300 5850 5175 5850
Wire Wire Line
	5300 6050 5175 6050
Wire Wire Line
	5300 6150 5175 6150
Wire Wire Line
	4675 6250 4575 6250
Wire Wire Line
	4575 6250 4575 6050
Connection ~ 4575 6050
Wire Notes Line
	3600 5500 3600 6800
Wire Notes Line
	3600 6800 6350 6800
Wire Notes Line
	6350 6800 6350 5500
Wire Notes Line
	6350 5500 3600 5500
Text Notes 4300 6750 0    79   ~ 16
Debug Port STDC14
Text HLabel 4375 5750 0    50   BiDi ~ 10
SDA
Wire Wire Line
	4150 5850 4675 5850
$Comp
L Jumper:SolderJumper_2_Open JP4
U 1 1 5EFF1990
P 4525 5750
F 0 "JP4" H 4525 5955 50  0000 C CNN
F 1 "SDA" H 4525 5864 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 4525 5750 50  0001 C CNN
F 3 "~" H 4525 5750 50  0001 C CNN
	1    4525 5750
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP5
U 1 1 5EFF272E
P 5325 5750
F 0 "JP5" H 5325 5955 50  0000 C CNN
F 1 "SCL" H 5325 5864 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_RoundedPad1.0x1.5mm" H 5325 5750 50  0001 C CNN
F 3 "~" H 5325 5750 50  0001 C CNN
	1    5325 5750
	1    0    0    -1  
$EndComp
Text HLabel 5475 5750 2    50   Input ~ 10
SCL
Text HLabel 1025 2050 0    50   Input ~ 10
FlashCS
Wire Wire Line
	1025 2050 1200 2050
Wire Wire Line
	1200 2050 1200 1675
Connection ~ 1200 1675
Wire Wire Line
	1200 1675 1575 1675
NoConn ~ 9850 1275
$EndSCHEMATC
