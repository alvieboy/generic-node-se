EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title "Power Supply & Load Switches"
Date "2020-04-07"
Rev "0.1"
Comp "The Things Industries"
Comment1 "https://www.thethingsindustries.com/"
Comment2 "Drawn by: Orkhan Amiraslanov (azerimaker)"
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 600  5550 0    59   ~ 0
Example: Energizer Lithium Batteries L91\nVoltage: 1.5 V\nCapacity: >3000 mAh\nSize (mm): AA 50.5mm x 14.5mm \nOperating Temp: -40 °C to +60 °C
$Comp
L Device:Q_PMOS_GSD Q1
U 1 1 5E90F467
P 1575 3675
F 0 "Q1" V 1917 3675 50  0000 C CNN
F 1 "SI2323DS" V 1826 3675 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 1775 3775 50  0001 C CNN
F 3 "~" H 1575 3675 50  0001 C CNN
F 4 "SI2323DS-T1-E3" V 1575 3675 50  0001 C CNN "MPN"
	1    1575 3675
	0    -1   -1   0   
$EndComp
$Comp
L power:+BATT #PWR04
U 1 1 5E916D44
P 2475 3450
F 0 "#PWR04" H 2475 3300 50  0001 C CNN
F 1 "+BATT" H 2490 3623 50  0000 C CNN
F 2 "" H 2475 3450 50  0001 C CNN
F 3 "" H 2475 3450 50  0001 C CNN
	1    2475 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1775 3575 1975 3575
Wire Wire Line
	2475 3575 2475 3450
Wire Wire Line
	1975 3825 1975 3575
$Comp
L power:+BATT #PWR05
U 1 1 5E91BC54
P 3175 875
F 0 "#PWR05" H 3175 725 50  0001 C CNN
F 1 "+BATT" H 3190 1048 50  0000 C CNN
F 2 "" H 3175 875 50  0001 C CNN
F 3 "" H 3175 875 50  0001 C CNN
	1    3175 875 
	1    0    0    -1  
$EndComp
$Comp
L Device:Polyfuse F1
U 1 1 5E92FEC6
P 2250 3575
F 0 "F1" V 2150 3575 50  0000 C CNN
F 1 "1A" V 2350 3575 50  0000 C CNN
F 2 "Fuse:Fuse_0603_1608Metric" H 2300 3375 50  0001 L CNN
F 3 "~" H 2250 3575 50  0001 C CNN
	1    2250 3575
	0    1    1    0   
$EndComp
Wire Wire Line
	1125 3575 1375 3575
Wire Wire Line
	1975 4125 1975 4375
$Comp
L power:GND #PWR03
U 1 1 5E917F23
P 1975 4375
F 0 "#PWR03" H 1975 4125 50  0001 C CNN
F 1 "GND" H 1980 4202 50  0000 C CNN
F 2 "" H 1975 4375 50  0001 C CNN
F 3 "" H 1975 4375 50  0001 C CNN
	1    1975 4375
	1    0    0    -1  
$EndComp
Wire Wire Line
	1575 3875 1575 4375
$Comp
L power:GND #PWR02
U 1 1 5E914B45
P 1575 4375
F 0 "#PWR02" H 1575 4125 50  0001 C CNN
F 1 "GND" H 1580 4202 50  0000 C CNN
F 2 "" H 1575 4375 50  0001 C CNN
F 3 "" H 1575 4375 50  0001 C CNN
	1    1575 4375
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5E9146B2
P 1125 4375
F 0 "#PWR01" H 1125 4125 50  0001 C CNN
F 1 "GND" H 1130 4202 50  0000 C CNN
F 2 "" H 1125 4375 50  0001 C CNN
F 3 "" H 1125 4375 50  0001 C CNN
	1    1125 4375
	1    0    0    -1  
$EndComp
Wire Wire Line
	1125 3575 1125 3675
Wire Wire Line
	1125 4325 1125 4375
Text Notes 850  3550 0    59   ~ 12
1.8 V-3.6V
$Comp
L Power_Management:TPS22917DBV U1
U 1 1 5E94B9D4
P 4150 3900
F 0 "U1" H 3900 4175 50  0000 C CNN
F 1 "TPS22917DBV" H 4250 4175 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 4150 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps22917.pdf" H 4200 3200 50  0001 C CNN
	1    4150 3900
	1    0    0    -1  
$EndComp
Text Notes 3200 4900 0    98   Italic 20
Load Switch 1 - Sensors
Text Notes 6225 4900 0    98   Italic 20
Load Switch 2 - Flash
Text Notes 875  7200 0    118  Italic 24
Mechanical parts and Fiducials
Text Notes 725  4925 0    102  Italic 20
Battery & Protection
Wire Wire Line
	1125 3975 1125 4025
$Comp
L Device:C C9
U 1 1 5E9710F2
P 7050 2325
F 0 "C9" H 7150 2375 50  0000 L CNN
F 1 "100nF" H 7150 2225 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 7088 2175 50  0001 C CNN
F 3 "~" H 7050 2325 50  0001 C CNN
	1    7050 2325
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5E971839
P 7050 2525
F 0 "#PWR017" H 7050 2275 50  0001 C CNN
F 1 "GND" H 7055 2352 50  0000 C CNN
F 2 "" H 7050 2525 50  0001 C CNN
F 3 "" H 7050 2525 50  0001 C CNN
	1    7050 2525
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 2475 7050 2525
$Comp
L Device:C C5
U 1 1 5E9FD0EE
P 3575 1175
F 0 "C5" H 3690 1221 50  0000 L CNN
F 1 "4.7uF" H 3690 1130 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3613 1025 50  0001 C CNN
F 3 "~" H 3575 1175 50  0001 C CNN
	1    3575 1175
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5E9FD462
P 3175 1175
F 0 "C2" H 3061 1129 50  0000 R CNN
F 1 "10uF" H 3061 1220 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3213 1025 50  0001 C CNN
F 3 "~" H 3175 1175 50  0001 C CNN
F 4 "GRM155R60J106M" H 3175 1175 50  0001 C CNN "MPN"
	1    3175 1175
	-1   0    0    1   
$EndComp
Wire Wire Line
	3175 1025 3175 975 
$Comp
L power:GND #PWR06
U 1 1 5EA0ABE8
P 3175 1425
F 0 "#PWR06" H 3175 1175 50  0001 C CNN
F 1 "GND" H 3180 1252 50  0000 C CNN
F 2 "" H 3175 1425 50  0001 C CNN
F 3 "" H 3175 1425 50  0001 C CNN
	1    3175 1425
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5EA0ADFB
P 3575 1425
F 0 "#PWR09" H 3575 1175 50  0001 C CNN
F 1 "GND" H 3580 1252 50  0000 C CNN
F 2 "" H 3575 1425 50  0001 C CNN
F 3 "" H 3575 1425 50  0001 C CNN
	1    3575 1425
	1    0    0    -1  
$EndComp
Wire Wire Line
	3575 1325 3575 1425
Wire Wire Line
	3175 1325 3175 1425
Wire Wire Line
	3175 875  3175 975 
Connection ~ 3175 975 
Wire Wire Line
	2100 3575 1975 3575
Connection ~ 1975 3575
Wire Wire Line
	2400 3575 2475 3575
Text Notes 8600 4900 0    98   Italic 20
Load Switch 3 - Secure Element
$Comp
L Device:C C6
U 1 1 5EAEC19F
P 4000 1175
F 0 "C6" H 4115 1221 50  0000 L CNN
F 1 "100nF" H 4115 1130 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 4038 1025 50  0001 C CNN
F 3 "~" H 4000 1175 50  0001 C CNN
F 4 "GRM155R61A104K" H 4000 1175 50  0001 C CNN "MPN"
	1    4000 1175
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5EAEC1A9
P 4000 1425
F 0 "#PWR010" H 4000 1175 50  0001 C CNN
F 1 "GND" H 4005 1252 50  0000 C CNN
F 2 "" H 4000 1425 50  0001 C CNN
F 3 "" H 4000 1425 50  0001 C CNN
	1    4000 1425
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 1325 4000 1425
Wire Wire Line
	4000 1025 4000 975 
Wire Wire Line
	3175 975  3575 975 
Wire Wire Line
	3575 1025 3575 975 
Connection ~ 3575 975 
Wire Wire Line
	3575 975  4000 975 
$Comp
L Connector:TestPoint_Probe TP2
U 1 1 5EB036D1
P 4875 875
F 0 "TP2" V 5050 950 50  0000 C CNN
F 1 "VBAT" V 4875 1075 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 5075 875 50  0001 C CNN
F 3 "~" H 5075 875 50  0001 C CNN
	1    4875 875 
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C11
U 1 1 5EB19FA1
P 8225 1825
F 0 "C11" H 8111 1779 50  0000 R CNN
F 1 "22uF" H 8111 1870 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8263 1675 50  0001 C CNN
F 3 "~" H 8225 1825 50  0001 C CNN
F 4 "JMK107BBJ226MA" H 8225 1825 50  0001 C CNN "MPN"
	1    8225 1825
	-1   0    0    1   
$EndComp
Wire Wire Line
	8225 1675 8225 1625
$Comp
L power:GND #PWR018
U 1 1 5EB2218C
P 8225 2125
F 0 "#PWR018" H 8225 1875 50  0001 C CNN
F 1 "GND" H 8230 1952 50  0000 C CNN
F 2 "" H 8225 2125 50  0001 C CNN
F 3 "" H 8225 2125 50  0001 C CNN
	1    8225 2125
	1    0    0    -1  
$EndComp
Wire Wire Line
	8225 1975 8225 2050
$Comp
L Connector:TestPoint_Probe TP4
U 1 1 5EB52341
P 7750 1550
F 0 "TP4" V 7925 1625 50  0000 C CNN
F 1 "VDD" V 7750 1700 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 7950 1550 50  0001 C CNN
F 3 "~" H 7950 1550 50  0001 C CNN
	1    7750 1550
	0    1    -1   0   
$EndComp
Text HLabel 4225 2125 0    50   Input ~ 0
VBAT_READ
Text HLabel 7225 2125 2    50   Output ~ 0
VBAT_ADC
Wire Notes Line
	525  3075 525  5000
Wire Notes Line
	525  5000 2625 5000
Wire Notes Line
	2625 5000 2625 3075
Wire Notes Line
	2625 3075 525  3075
Wire Notes Line width 20 style solid
	475  3050 11200 3050
Wire Notes Line
	2675 5000 5675 5000
Wire Notes Line
	5675 5000 5675 3075
Wire Notes Line
	5675 3075 2675 3075
Wire Notes Line
	2675 3075 2675 5000
$Comp
L Device:R R3
U 1 1 5EB4B0AA
P 4800 3900
F 0 "R3" V 4875 3825 50  0000 L CNN
F 1 "1K" V 4800 3850 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 4730 3900 50  0001 C CNN
F 3 "~" H 4800 3900 50  0001 C CNN
	1    4800 3900
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5EB4B77F
P 3900 4275
F 0 "R1" V 3975 4200 50  0000 L CNN
F 1 "100K" V 3900 4175 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 3830 4275 50  0001 C CNN
F 3 "~" H 3900 4275 50  0001 C CNN
	1    3900 4275
	0    1    1    0   
$EndComp
$Comp
L Device:C C3
U 1 1 5EB4BF94
P 3250 4000
F 0 "C3" H 3350 4075 50  0000 L CNN
F 1 "1uF" H 3300 3900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3288 3850 50  0001 C CNN
F 3 "~" H 3250 4000 50  0001 C CNN
	1    3250 4000
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5EB4C798
P 3525 4000
F 0 "C4" H 3600 4075 50  0000 L CNN
F 1 "DNM" H 3575 3900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 3563 3850 50  0001 C CNN
F 3 "~" H 3525 4000 50  0001 C CNN
	1    3525 4000
	-1   0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 5EB4DAE4
P 4150 3400
F 0 "JP1" H 4150 3500 50  0000 C CNN
F 1 "Sensor_VCC" H 4150 3300 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 4150 3400 50  0001 C CNN
F 3 "~" H 4150 3400 50  0001 C CNN
	1    4150 3400
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR07
U 1 1 5EB4DD72
P 3250 3475
F 0 "#PWR07" H 3250 3325 50  0001 C CNN
F 1 "VDD" H 3267 3648 50  0000 C CNN
F 2 "" H 3250 3475 50  0001 C CNN
F 3 "" H 3250 3475 50  0001 C CNN
	1    3250 3475
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 3475 3250 3800
Wire Wire Line
	3750 3800 3525 3800
Connection ~ 3250 3800
Wire Wire Line
	3250 3800 3250 3850
Wire Wire Line
	3525 3850 3525 3800
Connection ~ 3525 3800
Wire Wire Line
	3525 3800 3250 3800
Wire Wire Line
	3675 3900 3675 4150
Wire Wire Line
	3675 4150 3525 4150
Wire Wire Line
	3675 3900 3750 3900
Wire Wire Line
	3750 4000 3725 4000
$Comp
L power:GND #PWR08
U 1 1 5EB674F9
P 3250 4175
F 0 "#PWR08" H 3250 3925 50  0001 C CNN
F 1 "GND" H 3255 4002 50  0000 C CNN
F 2 "" H 3250 4175 50  0001 C CNN
F 3 "" H 3250 4175 50  0001 C CNN
	1    3250 4175
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 4150 3250 4175
Wire Wire Line
	4550 3800 5000 3800
Wire Wire Line
	5000 3800 5000 3900
Wire Wire Line
	5000 3900 4950 3900
Connection ~ 5000 3800
Wire Wire Line
	5000 3800 5075 3800
Wire Wire Line
	4650 3900 4550 3900
Text HLabel 5075 3800 2    50   Output ~ 0
VCC_SENSORS
$Comp
L power:GND #PWR011
U 1 1 5EB844CF
P 4150 4350
F 0 "#PWR011" H 4150 4100 50  0001 C CNN
F 1 "GND" H 4155 4177 50  0000 C CNN
F 2 "" H 4150 4350 50  0001 C CNN
F 3 "" H 4150 4350 50  0001 C CNN
	1    4150 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4200 4150 4275
Wire Wire Line
	4050 4275 4150 4275
Connection ~ 4150 4275
Wire Wire Line
	4150 4275 4150 4350
Wire Wire Line
	3725 4275 3750 4275
Wire Wire Line
	3725 4000 3725 4275
Wire Wire Line
	3725 4275 3725 4450
Wire Wire Line
	3725 4450 3625 4450
Connection ~ 3725 4275
Text HLabel 3625 4450 0    50   Input ~ 0
VCC_SENSOR_EN
Wire Wire Line
	4000 3400 3525 3400
Wire Wire Line
	3525 3400 3525 3800
Wire Wire Line
	4300 3400 5000 3400
Wire Wire Line
	5000 3400 5000 3800
$Comp
L Power_Management:TPS22917DBV U3
U 1 1 5EBA57C3
P 6975 3875
F 0 "U3" H 6725 4150 50  0000 C CNN
F 1 "TPS22917DBV" H 7075 4150 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 6975 4375 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps22917.pdf" H 7025 3175 50  0001 C CNN
	1    6975 3875
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5EBA57CD
P 7625 3875
F 0 "R5" V 7700 3800 50  0000 L CNN
F 1 "1K" V 7625 3825 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 7555 3875 50  0001 C CNN
F 3 "~" H 7625 3875 50  0001 C CNN
	1    7625 3875
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5EBA57D7
P 6725 4250
F 0 "R4" V 6800 4175 50  0000 L CNN
F 1 "100K" V 6725 4150 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 6655 4250 50  0001 C CNN
F 3 "~" H 6725 4250 50  0001 C CNN
	1    6725 4250
	0    1    1    0   
$EndComp
$Comp
L Device:C C7
U 1 1 5EBA57E1
P 6075 3975
F 0 "C7" H 6175 4050 50  0000 L CNN
F 1 "1uF" H 6125 3875 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 6113 3825 50  0001 C CNN
F 3 "~" H 6075 3975 50  0001 C CNN
	1    6075 3975
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 5EBA57EB
P 6350 3975
F 0 "C8" H 6425 4050 50  0000 L CNN
F 1 "DNM" H 6400 3875 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 6388 3825 50  0001 C CNN
F 3 "~" H 6350 3975 50  0001 C CNN
	1    6350 3975
	-1   0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 5EBA57F5
P 6975 3375
F 0 "JP2" H 6975 3475 50  0000 C CNN
F 1 "Flash_VCC" H 6975 3275 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 6975 3375 50  0001 C CNN
F 3 "~" H 6975 3375 50  0001 C CNN
	1    6975 3375
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR014
U 1 1 5EBA57FF
P 6075 3450
F 0 "#PWR014" H 6075 3300 50  0001 C CNN
F 1 "VDD" H 6092 3623 50  0000 C CNN
F 2 "" H 6075 3450 50  0001 C CNN
F 3 "" H 6075 3450 50  0001 C CNN
	1    6075 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6075 3450 6075 3775
Wire Wire Line
	6575 3775 6350 3775
Connection ~ 6075 3775
Wire Wire Line
	6075 3775 6075 3825
Wire Wire Line
	6350 3825 6350 3775
Connection ~ 6350 3775
Wire Wire Line
	6350 3775 6075 3775
Wire Wire Line
	6500 3875 6500 4125
Wire Wire Line
	6500 4125 6350 4125
Wire Wire Line
	6500 3875 6575 3875
Wire Wire Line
	6575 3975 6550 3975
$Comp
L power:GND #PWR015
U 1 1 5EBA5814
P 6075 4150
F 0 "#PWR015" H 6075 3900 50  0001 C CNN
F 1 "GND" H 6080 3977 50  0000 C CNN
F 2 "" H 6075 4150 50  0001 C CNN
F 3 "" H 6075 4150 50  0001 C CNN
	1    6075 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6075 4125 6075 4150
Wire Wire Line
	7375 3775 7825 3775
Wire Wire Line
	7825 3775 7825 3875
Wire Wire Line
	7825 3875 7775 3875
Connection ~ 7825 3775
Wire Wire Line
	7825 3775 7900 3775
Wire Wire Line
	7475 3875 7375 3875
Text HLabel 7900 3775 2    50   Output ~ 0
VCC_FLASH
$Comp
L power:GND #PWR016
U 1 1 5EBA5826
P 6975 4325
F 0 "#PWR016" H 6975 4075 50  0001 C CNN
F 1 "GND" H 6980 4152 50  0000 C CNN
F 2 "" H 6975 4325 50  0001 C CNN
F 3 "" H 6975 4325 50  0001 C CNN
	1    6975 4325
	1    0    0    -1  
$EndComp
Wire Wire Line
	6975 4175 6975 4250
Wire Wire Line
	6875 4250 6975 4250
Connection ~ 6975 4250
Wire Wire Line
	6975 4250 6975 4325
Wire Wire Line
	6550 4250 6575 4250
Wire Wire Line
	6550 3975 6550 4250
Wire Wire Line
	6550 4250 6550 4425
Wire Wire Line
	6550 4425 6450 4425
Connection ~ 6550 4250
Text HLabel 6450 4425 0    50   Input ~ 0
VCC_FLASH_EN
Wire Wire Line
	6825 3375 6350 3375
Wire Wire Line
	6350 3375 6350 3775
Wire Wire Line
	7125 3375 7825 3375
Wire Wire Line
	7825 3375 7825 3775
$Comp
L Power_Management:TPS22917DBV U4
U 1 1 5EBAE16F
P 9700 3900
F 0 "U4" H 9450 4175 50  0000 C CNN
F 1 "TPS22917DBV" H 9800 4175 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 9700 4400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps22917.pdf" H 9750 3200 50  0001 C CNN
	1    9700 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 5EBAE179
P 10350 3900
F 0 "R8" V 10425 3825 50  0000 L CNN
F 1 "1K" V 10350 3850 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 10280 3900 50  0001 C CNN
F 3 "~" H 10350 3900 50  0001 C CNN
	1    10350 3900
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5EBAE183
P 9450 4275
F 0 "R7" V 9525 4200 50  0000 L CNN
F 1 "100K" V 9450 4175 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 9380 4275 50  0001 C CNN
F 3 "~" H 9450 4275 50  0001 C CNN
	1    9450 4275
	0    1    1    0   
$EndComp
$Comp
L Device:C C12
U 1 1 5EBAE18D
P 8800 4000
F 0 "C12" H 8900 4075 50  0000 L CNN
F 1 "1uF" H 8850 3900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 8838 3850 50  0001 C CNN
F 3 "~" H 8800 4000 50  0001 C CNN
	1    8800 4000
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 5EBAE197
P 9075 4000
F 0 "C13" H 9150 4075 50  0000 L CNN
F 1 "DNM" H 9125 3900 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric" H 9113 3850 50  0001 C CNN
F 3 "~" H 9075 4000 50  0001 C CNN
	1    9075 4000
	-1   0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP3
U 1 1 5EBAE1A1
P 9700 3400
F 0 "JP3" H 9700 3500 50  0000 C CNN
F 1 "Secure_Element_VCC" H 9700 3300 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 9700 3400 50  0001 C CNN
F 3 "~" H 9700 3400 50  0001 C CNN
	1    9700 3400
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR019
U 1 1 5EBAE1AB
P 8800 3475
F 0 "#PWR019" H 8800 3325 50  0001 C CNN
F 1 "VDD" H 8817 3648 50  0000 C CNN
F 2 "" H 8800 3475 50  0001 C CNN
F 3 "" H 8800 3475 50  0001 C CNN
	1    8800 3475
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 3475 8800 3800
Wire Wire Line
	9300 3800 9075 3800
Connection ~ 8800 3800
Wire Wire Line
	8800 3800 8800 3850
Wire Wire Line
	9075 3850 9075 3800
Connection ~ 9075 3800
Wire Wire Line
	9075 3800 8800 3800
Wire Wire Line
	9225 3900 9225 4150
Wire Wire Line
	9225 4150 9075 4150
Wire Wire Line
	9225 3900 9300 3900
Wire Wire Line
	9300 4000 9275 4000
$Comp
L power:GND #PWR020
U 1 1 5EBAE1C0
P 8800 4175
F 0 "#PWR020" H 8800 3925 50  0001 C CNN
F 1 "GND" H 8805 4002 50  0000 C CNN
F 2 "" H 8800 4175 50  0001 C CNN
F 3 "" H 8800 4175 50  0001 C CNN
	1    8800 4175
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 4150 8800 4175
Wire Wire Line
	10100 3800 10550 3800
Wire Wire Line
	10550 3800 10550 3900
Wire Wire Line
	10550 3900 10500 3900
Connection ~ 10550 3800
Wire Wire Line
	10550 3800 10600 3800
Wire Wire Line
	10200 3900 10100 3900
Text HLabel 10600 3800 2    50   Output ~ 0
VCC_SEC_ELM
$Comp
L power:GND #PWR022
U 1 1 5EBAE1D2
P 9700 4350
F 0 "#PWR022" H 9700 4100 50  0001 C CNN
F 1 "GND" H 9705 4177 50  0000 C CNN
F 2 "" H 9700 4350 50  0001 C CNN
F 3 "" H 9700 4350 50  0001 C CNN
	1    9700 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 4200 9700 4275
Wire Wire Line
	9600 4275 9700 4275
Connection ~ 9700 4275
Wire Wire Line
	9700 4275 9700 4350
Wire Wire Line
	9275 4275 9300 4275
Wire Wire Line
	9275 4000 9275 4275
Wire Wire Line
	9275 4275 9275 4450
Wire Wire Line
	9275 4450 9250 4450
Connection ~ 9275 4275
Text HLabel 9250 4450 0    50   Input ~ 0
VCC_SEC_ELM_EN
Wire Wire Line
	9550 3400 9075 3400
Wire Wire Line
	9075 3400 9075 3800
Wire Wire Line
	9850 3400 10550 3400
Wire Wire Line
	10550 3400 10550 3800
Wire Notes Line
	5725 3075 5725 5000
Wire Notes Line
	5725 5000 8475 5000
Wire Notes Line
	8475 5000 8475 3075
Wire Notes Line
	8475 3075 5725 3075
Wire Notes Line
	8525 3075 8525 5000
Wire Notes Line
	8525 5000 11175 5000
Wire Notes Line
	11175 5000 11175 3075
Wire Notes Line
	11175 3075 8525 3075
$Comp
L Mechanical:MountingHole H1
U 1 1 5EB2DBB3
P 1000 7500
F 0 "H1" H 975 7625 50  0000 L CNN
F 1 "MountingHole" H 1100 7455 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.5mm" H 1000 7500 50  0001 C CNN
F 3 "~" H 1000 7500 50  0001 C CNN
	1    1000 7500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5EB2E360
P 1200 7500
F 0 "H2" H 1175 7625 50  0000 L CNN
F 1 "MountingHole" H 1300 7455 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.5mm" H 1200 7500 50  0001 C CNN
F 3 "~" H 1200 7500 50  0001 C CNN
	1    1200 7500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Housing N1
U 1 1 5EB2F160
P 2150 7450
F 0 "N1" H 2303 7484 50  0000 L CNN
F 1 "NewAge_3inch_round" H 2303 7393 50  0000 L CNN
F 2 "node-lib-v1:NewAge_3inch_round" H 2200 7500 50  0001 C CNN
F 3 "~" H 2200 7500 50  0001 C CNN
	1    2150 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8825 1500 8825 1625
$Comp
L power:VDD #PWR021
U 1 1 5EA60189
P 8825 1500
F 0 "#PWR021" H 8825 1350 50  0001 C CNN
F 1 "VDD" H 8842 1673 50  0000 C CNN
F 2 "" H 8825 1500 50  0001 C CNN
F 3 "" H 8825 1500 50  0001 C CNN
	1    8825 1500
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint_Probe TP3
U 1 1 5EC4668F
P 7050 2025
F 0 "TP3" V 7225 2100 50  0000 C CNN
F 1 "VBAT_ADC" V 7075 2300 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 7250 2025 50  0001 C CNN
F 3 "~" H 7250 2025 50  0001 C CNN
	1    7050 2025
	0    1    -1   0   
$EndComp
Wire Notes Line width 20 style solid
	5700 3050 5700 5025
Wire Notes Line width 20 style solid
	8500 5025 8500 3050
Wire Notes Line width 20 style solid
	475  5025 11225 5025
Text Notes 4850 2925 0    102  Italic 20
Buck-Boost Converter
$Comp
L Connector:TestPoint_Probe TP1
U 1 1 5EC3E236
P 4475 2000
F 0 "TP1" V 4650 2075 50  0000 C CNN
F 1 "VBAT_READ" V 4475 2300 50  0000 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.0mm" H 4675 2000 50  0001 C CNN
F 3 "~" H 4675 2000 50  0001 C CNN
	1    4475 2000
	0    -1   -1   0   
$EndComp
$Comp
L node-lib-v1:RP605Zx U2
U 1 1 5ECE59C1
P 5200 975
F 0 "U2" H 5750 1255 50  0000 C CNN
F 1 "RP605Z283B" H 5750 1157 59  0000 C CNB
F 2 "node-lib-v1:WLCSP-20-P3_1.994x1.609mm_Layout5x4_P0.4mm" H 5200 575 50  0001 L BNN
F 3 "Texas Instruments" H 5200 475 50  0001 L BNN
F 4 "RP605Z283B-E2-F" H 5200 975 50  0001 C CNN "MPN"
	1    5200 975 
	1    0    0    -1  
$EndComp
Text Notes 2700 2575 0    59   ~ 12
~Buck-Boost Specs:\n- Vin: 1.8 - 5.5V\n- Vout: 1.6 - 5.2V\n- Iout:  300 mA\n- Iq: 300 nA\n- Output V: ±1.5%\n- w/ auto-discharge
Wire Wire Line
	6500 1625 6675 1625
Wire Wire Line
	6500 1725 6675 1725
Wire Wire Line
	6675 1725 6675 1625
Connection ~ 6675 1625
$Comp
L Device:R R2
U 1 1 5ED1B349
P 4475 2325
F 0 "R2" H 4550 2350 50  0000 L CNN
F 1 "100K" H 4550 2425 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 4405 2325 50  0001 C CNN
F 3 "~" H 4475 2325 50  0001 C CNN
	1    4475 2325
	-1   0    0    1   
$EndComp
Wire Wire Line
	5000 975  4875 975 
Connection ~ 4000 975 
Wire Wire Line
	5000 1075 4875 1075
Wire Wire Line
	4875 1075 4875 975 
Connection ~ 4875 975 
Wire Wire Line
	5000 1175 4875 1175
Wire Wire Line
	4875 1175 4875 1075
Connection ~ 4875 1075
Wire Wire Line
	5000 1275 4875 1275
Wire Wire Line
	4875 1275 4875 1175
Connection ~ 4875 1175
Wire Wire Line
	5000 1425 4875 1425
Wire Wire Line
	4875 1425 4875 1275
Connection ~ 4875 1275
$Comp
L power:GND #PWR013
U 1 1 5ED387A0
P 4875 1900
F 0 "#PWR013" H 4875 1650 50  0001 C CNN
F 1 "GND" H 4880 1727 50  0000 C CNN
F 2 "" H 4875 1900 50  0001 C CNN
F 3 "" H 4875 1900 50  0001 C CNN
	1    4875 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 1875 4875 1875
Wire Wire Line
	5000 1575 4875 1575
Wire Wire Line
	4875 1575 4875 1675
Wire Wire Line
	5000 1675 4875 1675
Connection ~ 4875 1675
Wire Wire Line
	4875 1675 4875 1775
Wire Wire Line
	5000 1775 4875 1775
Connection ~ 4875 1775
Wire Wire Line
	4875 1775 4875 1875
$Comp
L power:GND #PWR012
U 1 1 5ED56357
P 4475 2525
F 0 "#PWR012" H 4475 2275 50  0001 C CNN
F 1 "GND" H 4480 2352 50  0000 C CNN
F 2 "" H 4475 2525 50  0001 C CNN
F 3 "" H 4475 2525 50  0001 C CNN
	1    4475 2525
	1    0    0    -1  
$EndComp
Wire Wire Line
	4475 2175 4475 2125
Connection ~ 4475 2125
Wire Wire Line
	4475 2475 4475 2525
Wire Wire Line
	4875 875  4875 975 
Wire Wire Line
	7750 1550 7750 1625
Wire Wire Line
	4000 975  4875 975 
Wire Wire Line
	7750 1625 8225 1625
Wire Wire Line
	6500 1875 6675 1875
Wire Wire Line
	6675 1875 6675 1725
Connection ~ 6675 1725
Wire Wire Line
	7050 2025 7050 2125
Connection ~ 7050 2125
Wire Wire Line
	7050 2125 7225 2125
Wire Wire Line
	7050 2175 7050 2125
Wire Wire Line
	4475 2000 4475 2125
Wire Wire Line
	6675 1625 7750 1625
Connection ~ 7750 1625
$Comp
L Device:L L1
U 1 1 5EDD39C4
P 7075 1225
F 0 "L1" H 7128 1271 50  0000 L CNN
F 1 "2.2 uH" H 7128 1180 50  0000 L CNN
F 2 "Inductor_SMD:L_1008_2520Metric" H 7075 1225 50  0001 C CNN
F 3 "~" H 7075 1225 50  0001 C CNN
F 4 "MLP2520H2R2ST0S1" H 7075 1225 50  0001 C CNN "MPN"
	1    7075 1225
	1    0    0    -1  
$EndComp
Wire Wire Line
	7075 975  7075 1075
Wire Wire Line
	7075 1475 7075 1375
Wire Wire Line
	6675 1275 6675 1375
Connection ~ 6675 1375
Wire Wire Line
	6675 1375 6675 1475
Wire Wire Line
	6675 1175 6675 1075
Connection ~ 6675 1075
Wire Wire Line
	6675 1075 6675 975 
Connection ~ 6675 1475
Wire Wire Line
	6675 1475 7075 1475
Wire Wire Line
	6500 1475 6675 1475
Connection ~ 6675 975 
Wire Wire Line
	6675 975  7075 975 
Wire Wire Line
	6500 975  6675 975 
Wire Wire Line
	6500 1075 6675 1075
Wire Wire Line
	6500 1175 6675 1175
Wire Wire Line
	6500 1275 6675 1275
Wire Wire Line
	6500 1375 6675 1375
Text Notes 5200 2625 0    59   ~ 0
Battery Monitor (BM)\nBM Output:  Vin/3 (division ratio)\nBM Supply Current: 100nA
$Comp
L Device:C C10
U 1 1 5EE37070
P 7750 1825
F 0 "C10" H 7636 1779 50  0000 R CNN
F 1 "DNM" H 7636 1870 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7788 1675 50  0001 C CNN
F 3 "~" H 7750 1825 50  0001 C CNN
F 4 "GRM155R60J106M" H 7750 1825 50  0001 C CNN "MPN"
	1    7750 1825
	-1   0    0    1   
$EndComp
Wire Wire Line
	7750 1675 7750 1625
Wire Wire Line
	7750 1975 7750 2050
Wire Wire Line
	7750 2050 8225 2050
Connection ~ 8225 2050
Wire Wire Line
	8225 2050 8225 2125
$Comp
L Device:C C1
U 1 1 5EE549FB
P 1975 3975
F 0 "C1" H 1861 3929 50  0000 R CNN
F 1 "10uF" H 1861 4020 50  0000 R CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 2013 3825 50  0001 C CNN
F 3 "~" H 1975 3975 50  0001 C CNN
F 4 "GRM155R60J106M" H 1975 3975 50  0001 C CNN "MPN"
	1    1975 3975
	-1   0    0    1   
$EndComp
Wire Wire Line
	4875 1900 4875 1875
Connection ~ 4875 1875
Wire Wire Line
	4225 2125 4475 2125
Wire Wire Line
	7050 2125 6500 2125
Wire Wire Line
	4475 2125 5000 2125
Wire Notes Line
	525  525  11175 525 
Wire Notes Line
	525  525  525  3025
Wire Notes Line
	11175 525  11175 3025
Wire Notes Line
	525  3025 11175 3025
Wire Notes Line width 20 style solid
	2650 3050 2650 5025
$Comp
L Device:R R6
U 1 1 5ECFC043
P 8550 1625
F 0 "R6" V 8625 1575 50  0000 L CNN
F 1 "0R" V 8550 1575 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" V 8480 1625 50  0001 C CNN
F 3 "~" H 8550 1625 50  0001 C CNN
	1    8550 1625
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8700 1625 8825 1625
Wire Wire Line
	8400 1625 8225 1625
Connection ~ 8225 1625
$Comp
L node-lib-v1:Battery_Cell+ BH1
U 1 1 5EE164C1
P 1125 3875
F 0 "BH1" H 1225 4000 50  0000 L CNN
F 1 "Battery_Cell+" H 600 4025 50  0000 L CNN
F 2 "node-lib-v1:BAT_BK-92" V 1125 3935 50  0001 C CNN
F 3 "~" V 1125 3935 50  0001 C CNN
F 4 "BK-92" H 1125 3875 50  0001 C CNN "MPN"
	1    1125 3875
	1    0    0    -1  
$EndComp
$Comp
L node-lib-v1:Battery_Cell- BH2
U 1 1 5EE16EB9
P 1125 3875
F 0 "BH2" H 1225 3875 50  0000 L CNN
F 1 "Battery_Cell-" H 600 3800 50  0000 L CNN
F 2 "node-lib-v1:BAT_BK-92" V 1125 3935 50  0001 C CNN
F 3 "~" V 1125 3935 50  0001 C CNN
F 4 "BK-92" H 1125 3875 50  0001 C CNN "MPN"
	1    1125 3875
	1    0    0    -1  
$EndComp
$Comp
L node-lib-v1:Battery_Cell+ BH3
U 1 1 5EE261D2
P 1125 4225
F 0 "BH3" H 1225 4350 50  0000 L CNN
F 1 "Battery_Cell+" H 600 4375 50  0000 L CNN
F 2 "node-lib-v1:BAT_BK-92" V 1125 4285 50  0001 C CNN
F 3 "~" V 1125 4285 50  0001 C CNN
F 4 "BK-92" H 1125 4225 50  0001 C CNN "MPN"
	1    1125 4225
	1    0    0    -1  
$EndComp
$Comp
L node-lib-v1:Battery_Cell- BH4
U 1 1 5EE264AD
P 1125 4225
F 0 "BH4" H 1225 4225 50  0000 L CNN
F 1 "Battery_Cell-" H 600 4150 50  0000 L CNN
F 2 "node-lib-v1:BAT_BK-92" V 1125 4285 50  0001 C CNN
F 3 "~" V 1125 4285 50  0001 C CNN
F 4 "BK-92" H 1125 4225 50  0001 C CNN "MPN"
	1    1125 4225
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5EE56760
P 1425 7500
F 0 "H3" H 1400 7625 50  0000 L CNN
F 1 "MountingHole" H 1525 7455 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.5mm" H 1425 7500 50  0001 C CNN
F 3 "~" H 1425 7500 50  0001 C CNN
	1    1425 7500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5EE5699B
P 1650 7500
F 0 "H4" H 1625 7625 50  0000 L CNN
F 1 "MountingHole" H 1750 7455 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.5mm" H 1650 7500 50  0001 C CNN
F 3 "~" H 1650 7500 50  0001 C CNN
	1    1650 7500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Fiducial FID1
U 1 1 5EE55870
P 3275 7425
F 0 "FID1" H 3360 7471 50  0000 L CNN
F 1 "Fiducial" H 3360 7380 50  0000 L CNN
F 2 "Fiducial:Fiducial_0.5mm_Mask1.5mm" H 3275 7425 50  0001 C CNN
F 3 "~" H 3275 7425 50  0001 C CNN
	1    3275 7425
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5F01C425
P 875 1275
F 0 "#PWR0101" H 875 1025 50  0001 C CNN
F 1 "GND" H 880 1102 50  0000 C CNN
F 2 "" H 875 1275 50  0001 C CNN
F 3 "" H 875 1275 50  0001 C CNN
	1    875  1275
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5F01C740
P 1025 975
F 0 "#FLG0101" H 1025 1050 50  0001 C CNN
F 1 "PWR_FLAG" H 1025 1148 50  0000 C CNN
F 2 "" H 1025 975 50  0001 C CNN
F 3 "~" H 1025 975 50  0001 C CNN
	1    1025 975 
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0102
U 1 1 5F01CCBE
P 675 975
F 0 "#PWR0102" H 675 825 50  0001 C CNN
F 1 "+BATT" H 690 1148 50  0000 C CNN
F 2 "" H 675 975 50  0001 C CNN
F 3 "" H 675 975 50  0001 C CNN
	1    675  975 
	1    0    0    -1  
$EndComp
Wire Wire Line
	675  975  675  1025
Wire Wire Line
	675  1025 1025 1025
Wire Wire Line
	1025 1025 1025 975 
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 5F023D29
P 875 1250
F 0 "#FLG0103" H 875 1325 50  0001 C CNN
F 1 "PWR_FLAG" H 875 1423 50  0000 C CNN
F 2 "" H 875 1250 50  0001 C CNN
F 3 "~" H 875 1250 50  0001 C CNN
	1    875  1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	875  1250 875  1275
$Comp
L power:VDD #PWR0103
U 1 1 5F03306D
P 1400 975
F 0 "#PWR0103" H 1400 825 50  0001 C CNN
F 1 "VDD" H 1417 1148 50  0000 C CNN
F 2 "" H 1400 975 50  0001 C CNN
F 3 "" H 1400 975 50  0001 C CNN
	1    1400 975 
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0104
U 1 1 5F033A93
P 1800 975
F 0 "#FLG0104" H 1800 1050 50  0001 C CNN
F 1 "PWR_FLAG" H 1800 1148 50  0000 C CNN
F 2 "" H 1800 975 50  0001 C CNN
F 3 "~" H 1800 975 50  0001 C CNN
	1    1800 975 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 975  1400 1025
Wire Wire Line
	1400 1025 1800 1025
Wire Wire Line
	1800 1025 1800 975 
$EndSCHEMATC
