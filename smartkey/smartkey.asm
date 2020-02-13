//Deviec:MS86Fxx02
//-----------------------Variable---------------------------------
		_mode_chek		EQU		28H
		_timeOut		EQU		22H
		_timeTick		EQU		79H
		_cntTmp		EQU		20H
		_cntCyc		EQU		25H
		_cntOff		EQU		26H
		_lostDetect		EQU		27H
		_mtState		EQU		2AH
		_mtOldState		EQU		29H
		_RegStatus		EQU		24H
//-----------------------Variable END---------------------------------
		ORG		0000H
		LJUMP 	0AH 			//0000 	380A
		ORG		0004H
		STR 	7EH 			//0004 	01FE
		SWAPR 	STATUS,0 		//0005 	0703
		STR 	70H 			//0006 	01F0
		LDR 	PCLATH,0 		//0007 	080A
		STR 	71H 			//0008 	01F1
		LJUMP 	1E1H 			//0009 	39E1
		LJUMP 	2D2H 			//000A 	3AD2

		//;smartkey.C: 219: unsigned char reAlertOn=0;
		CLRR 	78H 			//000B 	0178
		ORG		000CH
		CLRWDT	 			//000C 	0001

		//;smartkey.C: 224: sys_init();
		LCALL 	2EEH 			//000D 	32EE

		//;smartkey.C: 225: gpio_init();
		LCALL 	282H 			//000E 	3282

		//;smartkey.C: 227: timer_init();
		LCALL 	2C2H 			//000F 	32C2

		//;smartkey.C: 228: int_init();
		LCALL 	24FH 			//0010 	324F

		//;smartkey.C: 232: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//0011 	2A82
		STR 	2CH 			//0012 	01AC
		LDWI 	DDH 			//0013 	2ADD
		ORG		0014H
		STR 	2BH 			//0014 	01AB
		DECRSZ 	2BH,1 		//0015 	0EAB
		LJUMP 	15H 			//0016 	3815
		DECRSZ 	2CH,1 		//0017 	0EAC
		LJUMP 	15H 			//0018 	3815
		LJUMP 	1AH 			//0019 	381A
		LDWI 	82H 			//001A 	2A82

		//;smartkey.C: 234: RA7 =1;
		BCR 	STATUS,5 		//001B 	1283
		ORG		001CH
		BSR 	5H,7 			//001C 	1B85

		//;smartkey.C: 235: _delay((unsigned long)((100)*(4000000/4000.0)));
		STR 	2CH 			//001D 	01AC
		LDWI 	DDH 			//001E 	2ADD
		STR 	2BH 			//001F 	01AB
		DECRSZ 	2BH,1 		//0020 	0EAB
		LJUMP 	20H 			//0021 	3820
		DECRSZ 	2CH,1 		//0022 	0EAC
		LJUMP 	20H 			//0023 	3820
		ORG		0024H
		LJUMP 	25H 			//0024 	3825
		LDWI 	0H 			//0025 	2A00

		//;smartkey.C: 237: PAIE = 1;
		BSR 	INTCON,3 		//0026 	198B

		//;smartkey.C: 239: RegStatus = 0;
		BCR 	STATUS,5 		//0027 	1283
		CLRR 	24H 			//0028 	0124
		CLRR 	72H 			//0029 	0172
		CLRR 	73H 			//002A 	0173
		LCALL 	2E1H 			//002B 	32E1
		ORG		002CH

		//;smartkey.C: 247: WRITE_EEPROM(0xFF,0xAA);
		LDWI 	AAH 			//002C 	2AAA
		STR 	72H 			//002D 	01F2
		LDWI 	FFH 			//002E 	2AFF
		LCALL 	26AH 			//002F 	326A

		//;smartkey.C: 248: WRITE_EEPROM(0xFF,0xAA);
		LDWI 	AAH 			//0030 	2AAA
		STR 	72H 			//0031 	01F2
		LDWI 	FFH 			//0032 	2AFF
		LCALL 	26AH 			//0033 	326A
		ORG		0034H

		//;smartkey.C: 251: delay_x10ms(1);
		CLRR 	72H 			//0034 	0172
		INCR	72H,1 			//0035 	09F2
		CLRR 	73H 			//0036 	0173
		LCALL 	2AFH 			//0037 	32AF

		//;smartkey.C: 253: if(READ_EEPROM(0x08)==0xff) {WRITE_EEPROM(0x08,0);_delay((unsigned lon
		//+                          g)((2)*(4000000/4000.0)));}
		LDWI 	8H 			//0038 	2A08
		LCALL 	2F6H 			//0039 	32F6
		XORWI 	FFH 			//003A 	26FF
		LDWI 	8H 			//003B 	2A08
		ORG		003CH
		BTSS 	STATUS,2 		//003C 	1D03
		LJUMP 	4BH 			//003D 	384B
		CLRR 	72H 			//003E 	0172
		LCALL 	26AH 			//003F 	326A
		LDWI 	3H 			//0040 	2A03
		BCR 	STATUS,5 		//0041 	1283
		STR 	2CH 			//0042 	01AC
		LDWI 	97H 			//0043 	2A97
		ORG		0044H
		STR 	2BH 			//0044 	01AB
		DECRSZ 	2BH,1 		//0045 	0EAB
		LJUMP 	45H 			//0046 	3845
		DECRSZ 	2CH,1 		//0047 	0EAC
		LJUMP 	45H 			//0048 	3845
		LJUMP 	4AH 			//0049 	384A

		//;smartkey.C: 255: if(READ_EEPROM(0x08)==0xcc){
		LDWI 	8H 			//004A 	2A08
		LCALL 	2F6H 			//004B 	32F6
		ORG		004CH
		XORWI 	CCH 			//004C 	26CC
		BTSS 	STATUS,2 		//004D 	1D03
		LJUMP 	66H 			//004E 	3866
		LDWI 	8H 			//004F 	2A08

		//;smartkey.C: 256: RegStatus &=~(0x20);
		BCR 	STATUS,5 		//0050 	1283
		BCR 	24H,5 			//0051 	12A4

		//;smartkey.C: 257: setState(3,1800);
		STR 	72H 			//0052 	01F2
		LDWI 	7H 			//0053 	2A07
		ORG		0054H
		STR 	73H 			//0054 	01F3
		LDWI 	3H 			//0055 	2A03
		LCALL 	2E1H 			//0056 	32E1

		//;smartkey.C: 258: mtOldState = 1;
		CLRR 	29H 			//0057 	0129
		INCR	29H,1 			//0058 	09A9

		//;smartkey.C: 259: cntTmp = timeTick+50;
		LDR 	7AH,0 			//0059 	087A
		STR 	21H 			//005A 	01A1
		LDR 	79H,0 			//005B 	0879
		ORG		005CH
		STR 	20H 			//005C 	01A0
		LDWI 	32H 			//005D 	2A32
		ADDWR 	20H,1 			//005E 	0BA0
		BTSC 	STATUS,0 		//005F 	1403
		INCR	21H,1 			//0060 	09A1

		//;smartkey.C: 260: PR2L =12;
		LDWI 	CH 			//0061 	2A0C
		BSR 	STATUS,5 		//0062 	1A83
		STR 	11H 			//0063 	0191
		ORG		0064H

		//;smartkey.C: 261: beepOn();
		LCALL 	305H 			//0064 	3305

		//;smartkey.C: 262: } else {
		LJUMP 	6DH 			//0065 	386D

		//;smartkey.C: 263: setState(2,400);
		LDWI 	90H 			//0066 	2A90
		STR 	72H 			//0067 	01F2
		LDWI 	1H 			//0068 	2A01
		STR 	73H 			//0069 	01F3
		LDWI 	2H 			//006A 	2A02
		LCALL 	2E1H 			//006B 	32E1
		ORG		006CH

		//;smartkey.C: 265: mtOldState = 0;
		CLRR 	29H 			//006C 	0129

		//;smartkey.C: 309: RA0 =RA6;
		BCR 	STATUS,5 		//006D 	1283
		BTSS 	5H,6 			//006E 	1F05
		LJUMP 	73H 			//006F 	3873
		BCR 	STATUS,5 		//0070 	1283
		BSR 	5H,0 			//0071 	1805
		LJUMP 	75H 			//0072 	3875
		BCR 	STATUS,5 		//0073 	1283
		ORG		0074H
		BCR 	5H,0 			//0074 	1005

		//;smartkey.C: 312: if(mode_chek == 0)
		LDR 	28H,1 			//0075 	08A8
		BTSC 	STATUS,2 		//0076 	1503

		//;smartkey.C: 313: {
		//;smartkey.C: 315: if(RegStatus & 0x80)
		BTSS 	24H,7 			//0077 	1FA4
		LJUMP 	128H 			//0078 	3928

		//;smartkey.C: 316: {
		//;smartkey.C: 317: PAIE = 0;
		BCR 	INTCON,3 		//0079 	118B

		//;smartkey.C: 320: RegStatus &= (~0x80);
		BCR 	24H,7 			//007A 	13A4

		//;smartkey.C: 332: {
		//;smartkey.C: 334: if ((RegStatus & 0x40) !=0){
		BTSC 	24H,6 			//007B 	1724
		ORG		007CH
		LJUMP 	D8H 			//007C 	38D8
		LJUMP 	11FH 			//007D 	391F
		LJUMP 	108H 			//007E 	3908

		//;smartkey.C: 349: break;
		//;smartkey.C: 348: timeTick =0;
		//;smartkey.C: 347: lostDetect =0;
		//;smartkey.C: 352: if(timeTick >30){
		LDWI 	0H 			//007F 	2A00
		SUBWR 	7AH,0 			//0080 	0C7A
		LDWI 	1FH 			//0081 	2A1F
		BTSC 	STATUS,2 		//0082 	1503
		SUBWR 	79H,0 			//0083 	0C79
		ORG		0084H
		BTSS 	STATUS,0 		//0084 	1C03
		LJUMP 	127H 			//0085 	3927
		LDWI 	8H 			//0086 	2A08

		//;smartkey.C: 353: timeTick =0;
		CLRR 	79H 			//0087 	0179
		CLRR 	7AH 			//0088 	017A

		//;smartkey.C: 355: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LCALL 	2F6H 			//0089 	32F6
		XORWI 	CCH 			//008A 	26CC
		BTSS 	STATUS,2 		//008B 	1D03
		ORG		008CH
		LJUMP 	90H 			//008C 	3890
		LDWI 	8H 			//008D 	2A08
		CLRR 	72H 			//008E 	0172
		LCALL 	26AH 			//008F 	326A

		//;smartkey.C: 357: if((mtOldState == 3)){
		BCR 	STATUS,5 		//0090 	1283
		LDR 	29H,0 			//0091 	0829
		XORWI 	3H 			//0092 	2603
		BTSS 	STATUS,2 		//0093 	1D03
		ORG		0094H
		LJUMP 	A1H 			//0094 	38A1

		//;smartkey.C: 358: beepOn();TMR2ON = 0; beep(10,1);
		LCALL 	305H 			//0095 	3305
		LDWI 	AH 			//0096 	2A0A
		BCR 	STATUS,5 		//0097 	1283
		BCR 	12H,2 			//0098 	1112
		CLRR 	76H 			//0099 	0176
		INCR	76H,1 			//009A 	09F6
		LCALL 	299H 			//009B 	3299
		ORG		009CH

		//;smartkey.C: 359: if(reAlertOn)reAlertOn =0;
		LDR 	78H,0 			//009C 	0878
		BTSC 	STATUS,2 		//009D 	1503
		LJUMP 	127H 			//009E 	3927
		CLRR 	78H 			//009F 	0178
		LJUMP 	127H 			//00A0 	3927

		//;smartkey.C: 361: else if((mtOldState == 0)||(mtOldState == 4)){
		LDR 	29H,0 			//00A1 	0829
		BTSC 	STATUS,2 		//00A2 	1503
		LJUMP 	A8H 			//00A3 	38A8
		ORG		00A4H
		LDR 	29H,0 			//00A4 	0829
		XORWI 	4H 			//00A5 	2604
		BTSS 	STATUS,2 		//00A6 	1D03
		LJUMP 	B4H 			//00A7 	38B4
		LDWI 	ACH 			//00A8 	2AAC

		//;smartkey.C: 362: RegStatus |=(0x20);
		BSR 	24H,5 			//00A9 	1AA4

		//;smartkey.C: 363: setState(1,3500);
		STR 	72H 			//00AA 	01F2
		LDWI 	DH 			//00AB 	2A0D
		ORG		00ACH
		STR 	73H 			//00AC 	01F3
		LDWI 	1H 			//00AD 	2A01
		LCALL 	2E1H 			//00AE 	32E1
		LDWI 	AH 			//00AF 	2A0A

		//;smartkey.C: 364: beep(10,1);
		CLRR 	76H 			//00B0 	0176
		INCR	76H,1 			//00B1 	09F6
		LCALL 	299H 			//00B2 	3299

		//;smartkey.C: 365: }
		LJUMP 	127H 			//00B3 	3927
		ORG		00B4H

		//;smartkey.C: 366: else if((mtOldState == 1)){
		DECRSZ 	29H,0 		//00B4 	0E29
		LJUMP 	127H 			//00B5 	3927
		LJUMP 	9CH 			//00B6 	389C

		//;smartkey.C: 369: }
		//;smartkey.C: 370: }
		//;smartkey.C: 371: break;
		//;smartkey.C: 368: if(reAlertOn)reAlertOn =0;
		//;smartkey.C: 374: if(timeTick > 200)
		LDWI 	0H 			//00B7 	2A00
		SUBWR 	7AH,0 			//00B8 	0C7A
		LDWI 	C9H 			//00B9 	2AC9
		BTSC 	STATUS,2 		//00BA 	1503
		SUBWR 	79H,0 			//00BB 	0C79
		ORG		00BCH
		BTSS 	STATUS,0 		//00BC 	1C03
		LJUMP 	127H 			//00BD 	3927

		//;smartkey.C: 375: {
		//;smartkey.C: 376: beepOff();
		LCALL 	30AH 			//00BE 	330A

		//;smartkey.C: 377: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LDWI 	8H 			//00BF 	2A08
		LCALL 	2F6H 			//00C0 	32F6
		XORWI 	CCH 			//00C1 	26CC
		BTSS 	STATUS,2 		//00C2 	1D03
		LJUMP 	C7H 			//00C3 	38C7
		ORG		00C4H
		LDWI 	8H 			//00C4 	2A08
		CLRR 	72H 			//00C5 	0172
		LCALL 	26AH 			//00C6 	326A
		LDWI 	ACH 			//00C7 	2AAC

		//;smartkey.C: 378: RegStatus |=(0x20);
		BCR 	STATUS,5 		//00C8 	1283
		BSR 	24H,5 			//00C9 	1AA4

		//;smartkey.C: 379: setState(1,3500);
		STR 	72H 			//00CA 	01F2
		LDWI 	DH 			//00CB 	2A0D
		ORG		00CCH
		STR 	73H 			//00CC 	01F3
		LDWI 	1H 			//00CD 	2A01
		LCALL 	2E1H 			//00CE 	32E1
		LJUMP 	127H 			//00CF 	3927

		//;smartkey.C: 385: beepOff();
		LCALL 	30AH 			//00D0 	330A

		//;smartkey.C: 386: setState(2,300);
		LDWI 	2CH 			//00D1 	2A2C
		STR 	72H 			//00D2 	01F2
		LDWI 	1H 			//00D3 	2A01
		ORG		00D4H
		STR 	73H 			//00D4 	01F3
		LDWI 	2H 			//00D5 	2A02
		LCALL 	2E1H 			//00D6 	32E1

		//;smartkey.C: 387: break;
		LJUMP 	127H 			//00D7 	3927
		LDR 	2AH,0 			//00D8 	082A
		STR 	FSR 			//00D9 	0184
		LDWI 	5H 			//00DA 	2A05
		SUBWR 	FSR,0 			//00DB 	0C04
		ORG		00DCH
		BTSC 	STATUS,0 		//00DC 	1403
		LJUMP 	127H 			//00DD 	3927
		LDWI 	3H 			//00DE 	2A03
		STR 	PCLATH 			//00DF 	018A
		LDWI 	0H 			//00E0 	2A00
		ADDWR 	FSR,0 			//00E1 	0B04
		STR 	PCL 			//00E2 	0182

		//;smartkey.C: 411: {
		//;smartkey.C: 413: if(lostDetect==1 && timeTick< 1500)
		DECRSZ 	27H,0 		//00E3 	0E27
		ORG		00E4H
		LJUMP 	10AH 			//00E4 	390A
		LDWI 	5H 			//00E5 	2A05
		SUBWR 	7AH,0 			//00E6 	0C7A
		LDWI 	DCH 			//00E7 	2ADC
		BTSC 	STATUS,2 		//00E8 	1503
		SUBWR 	79H,0 			//00E9 	0C79
		BTSC 	STATUS,0 		//00EA 	1403
		LJUMP 	10AH 			//00EB 	390A
		ORG		00ECH

		//;smartkey.C: 414: {
		//;smartkey.C: 415: if(READ_EEPROM(0x08)==0x00) WRITE_EEPROM(0x08,0xcc);
		LDWI 	8H 			//00EC 	2A08
		LCALL 	2F6H 			//00ED 	32F6
		IORWI 	0H 			//00EE 	2500
		BTSS 	STATUS,2 		//00EF 	1D03
		LJUMP 	F5H 			//00F0 	38F5
		LDWI 	CCH 			//00F1 	2ACC
		STR 	72H 			//00F2 	01F2
		LDWI 	8H 			//00F3 	2A08
		ORG		00F4H
		LCALL 	26AH 			//00F4 	326A

		//;smartkey.C: 417: setState(3,1800);
		LDWI 	8H 			//00F5 	2A08
		STR 	72H 			//00F6 	01F2
		LDWI 	7H 			//00F7 	2A07
		STR 	73H 			//00F8 	01F3
		LDWI 	3H 			//00F9 	2A03
		LCALL 	2E1H 			//00FA 	32E1

		//;smartkey.C: 418: cntTmp = timeTick+40;
		LDR 	7AH,0 			//00FB 	087A
		ORG		00FCH
		STR 	21H 			//00FC 	01A1
		LDR 	79H,0 			//00FD 	0879
		STR 	20H 			//00FE 	01A0
		LDWI 	28H 			//00FF 	2A28
		ADDWR 	20H,1 			//0100 	0BA0
		BTSC 	STATUS,0 		//0101 	1403
		INCR	21H,1 			//0102 	09A1

		//;smartkey.C: 419: PR2L =11;
		LDWI 	BH 			//0103 	2A0B
		ORG		0104H
		BSR 	STATUS,5 		//0104 	1A83
		STR 	11H 			//0105 	0191

		//;smartkey.C: 420: beepOn();
		LCALL 	305H 			//0106 	3305

		//;smartkey.C: 421: lostDetect =0;
		BCR 	STATUS,5 		//0107 	1283
		CLRR 	27H 			//0108 	0127

		//;smartkey.C: 422: }
		LJUMP 	10CH 			//0109 	390C

		//;smartkey.C: 423: else {
		//;smartkey.C: 424: lostDetect =1;
		CLRR 	27H 			//010A 	0127
		INCR	27H,1 			//010B 	09A7
		ORG		010CH

		//;smartkey.C: 427: }
		//;smartkey.C: 428: timeTick =0;
		CLRR 	79H 			//010C 	0179
		CLRR 	7AH 			//010D 	017A

		//;smartkey.C: 429: }
		//;smartkey.C: 430: break;
		LJUMP 	127H 			//010E 	3927

		//;smartkey.C: 433: {
		//;smartkey.C: 434: timeTick =0;
		CLRR 	79H 			//010F 	0179
		CLRR 	7AH 			//0110 	017A

		//;smartkey.C: 435: beepOn();TMR2ON = 0;
		LCALL 	305H 			//0111 	3305
		LDWI 	2H 			//0112 	2A02
		BCR 	STATUS,5 		//0113 	1283
		ORG		0114H
		BCR 	12H,2 			//0114 	1112

		//;smartkey.C: 436: beep(10,2);
		STR 	76H 			//0115 	01F6
		LDWI 	AH 			//0116 	2A0A
		LCALL 	299H 			//0117 	3299

		//;smartkey.C: 437: if(mtOldState == 3){reAlertOn =1;}
		LDR 	29H,0 			//0118 	0829
		XORWI 	3H 			//0119 	2603
		BTSS 	STATUS,2 		//011A 	1D03
		LJUMP 	127H 			//011B 	3927
		ORG		011CH
		CLRR 	78H 			//011C 	0178
		INCR	78H,1 			//011D 	09F8
		LJUMP 	127H 			//011E 	3927
		LDR 	2AH,0 			//011F 	082A
		XORWI 	1H 			//0120 	2601
		BTSC 	STATUS,2 		//0121 	1503
		LJUMP 	E3H 			//0122 	38E3
		XORWI 	3H 			//0123 	2603
		ORG		0124H
		BTSC 	STATUS,2 		//0124 	1503
		LJUMP 	10FH 			//0125 	390F
		LJUMP 	127H 			//0126 	3927

		//;smartkey.C: 441: }
		//;smartkey.C: 443: }
		//;smartkey.C: 445: PAIE = 1;
		BSR 	INTCON,3 		//0127 	198B

		//;smartkey.C: 446: }
		//;smartkey.C: 448: }
		//;smartkey.C: 452: {
		//;smartkey.C: 453: if((timeOut!=0)&&( timeTick >timeOut)){
		LDR 	23H,0 			//0128 	0823
		IORWR 	22H,0 			//0129 	0322
		BTSC 	STATUS,2 		//012A 	1503
		LJUMP 	19AH 			//012B 	399A
		ORG		012CH
		LDR 	7AH,0 			//012C 	087A
		SUBWR 	23H,0 			//012D 	0C23
		BTSS 	STATUS,2 		//012E 	1D03
		LJUMP 	132H 			//012F 	3932
		LDR 	79H,0 			//0130 	0879
		SUBWR 	22H,0 			//0131 	0C22
		BTSS 	STATUS,0 		//0132 	1C03
		LJUMP 	18CH 			//0133 	398C
		ORG		0134H
		LJUMP 	19AH 			//0134 	399A

		//;smartkey.C: 464: beepOff();
		LCALL 	30AH 			//0135 	330A
		LDWI 	2CH 			//0136 	2A2C

		//;smartkey.C: 465: RegStatus &=(~0x20);
		BCR 	STATUS,5 		//0137 	1283
		BCR 	24H,5 			//0138 	12A4

		//;smartkey.C: 466: setState(2,300);
		STR 	72H 			//0139 	01F2
		LDWI 	1H 			//013A 	2A01
		STR 	73H 			//013B 	01F3
		ORG		013CH
		LDWI 	2H 			//013C 	2A02
		LCALL 	2E1H 			//013D 	32E1

		//;smartkey.C: 467: break;
		LJUMP 	19AH 			//013E 	399A

		//;smartkey.C: 469: beepOff();
		LCALL 	30AH 			//013F 	330A

		//;smartkey.C: 470: delay_x10ms(20);
		LDWI 	14H 			//0140 	2A14
		STR 	72H 			//0141 	01F2
		CLRR 	73H 			//0142 	0173
		LCALL 	2AFH 			//0143 	32AF
		ORG		0144H

		//;smartkey.C: 471: beepOn();TMR2ON = 0;reAlertOn =0;
		LCALL 	305H 			//0144 	3305
		LDWI 	1EH 			//0145 	2A1E
		BCR 	STATUS,5 		//0146 	1283
		BCR 	12H,2 			//0147 	1112
		CLRR 	78H 			//0148 	0178
		CLRR 	76H 			//0149 	0176
		INCR	76H,1 			//014A 	09F6
		LCALL 	299H 			//014B 	3299
		ORG		014CH
		LDWI 	0H 			//014C 	2A00

		//;smartkey.C: 473: setState(0,0);
		CLRR 	72H 			//014D 	0172
		CLRR 	73H 			//014E 	0173
		LCALL 	2E1H 			//014F 	32E1

		//;smartkey.C: 474: break;
		LJUMP 	19AH 			//0150 	399A

		//;smartkey.C: 477: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LDWI 	8H 			//0151 	2A08
		LCALL 	2F6H 			//0152 	32F6
		XORWI 	CCH 			//0153 	26CC
		ORG		0154H
		BTSS 	STATUS,2 		//0154 	1D03
		LJUMP 	159H 			//0155 	3959
		LDWI 	8H 			//0156 	2A08
		CLRR 	72H 			//0157 	0172
		LCALL 	26AH 			//0158 	326A

		//;smartkey.C: 479: if(reAlertOn){
		LDR 	78H,0 			//0159 	0878
		BTSC 	STATUS,2 		//015A 	1503
		LJUMP 	16FH 			//015B 	396F
		ORG		015CH

		//;smartkey.C: 480: setState(4,6000);
		LDWI 	70H 			//015C 	2A70
		STR 	72H 			//015D 	01F2
		LDWI 	17H 			//015E 	2A17
		STR 	73H 			//015F 	01F3
		LDWI 	4H 			//0160 	2A04
		LCALL 	2E1H 			//0161 	32E1

		//;smartkey.C: 481: cntTmp = timeTick+40;
		LDR 	7AH,0 			//0162 	087A
		STR 	21H 			//0163 	01A1
		ORG		0164H
		LDR 	79H,0 			//0164 	0879
		STR 	20H 			//0165 	01A0
		LDWI 	28H 			//0166 	2A28
		ADDWR 	20H,1 			//0167 	0BA0
		BTSC 	STATUS,0 		//0168 	1403
		INCR	21H,1 			//0169 	09A1

		//;smartkey.C: 482: PR2L =11;
		LDWI 	BH 			//016A 	2A0B
		BSR 	STATUS,5 		//016B 	1A83
		ORG		016CH
		STR 	11H 			//016C 	0191

		//;smartkey.C: 483: beepOn();
		LCALL 	305H 			//016D 	3305

		//;smartkey.C: 485: }else if(mtOldState == 0){
		LJUMP 	19AH 			//016E 	399A
		BCR 	STATUS,5 		//016F 	1283
		LDR 	29H,1 			//0170 	08A9
		BTSS 	STATUS,2 		//0171 	1D03
		LJUMP 	17FH 			//0172 	397F

		//;smartkey.C: 487: beep(10,5);
		LDWI 	5H 			//0173 	2A05
		ORG		0174H
		STR 	76H 			//0174 	01F6
		LDWI 	AH 			//0175 	2A0A
		LCALL 	299H 			//0176 	3299
		LDWI 	ACH 			//0177 	2AAC

		//;smartkey.C: 488: RegStatus |=(0x20);
		BSR 	24H,5 			//0178 	1AA4

		//;smartkey.C: 490: setState(1,3500);
		STR 	72H 			//0179 	01F2
		LDWI 	DH 			//017A 	2A0D
		STR 	73H 			//017B 	01F3
		ORG		017CH
		LDWI 	1H 			//017C 	2A01
		LCALL 	2E1H 			//017D 	32E1

		//;smartkey.C: 492: }else{
		LJUMP 	19AH 			//017E 	399A

		//;smartkey.C: 493: beepOn();TMR2ON = 0;
		LCALL 	305H 			//017F 	3305
		LDWI 	1EH 			//0180 	2A1E
		BCR 	STATUS,5 		//0181 	1283
		BCR 	12H,2 			//0182 	1112

		//;smartkey.C: 494: reAlertOn =0;
		CLRR 	78H 			//0183 	0178
		ORG		0184H
		CLRR 	76H 			//0184 	0176
		INCR	76H,1 			//0185 	09F6
		LCALL 	299H 			//0186 	3299
		LDWI 	0H 			//0187 	2A00

		//;smartkey.C: 496: setState(0,0);
		CLRR 	72H 			//0188 	0172
		CLRR 	73H 			//0189 	0173
		LCALL 	2E1H 			//018A 	32E1
		LJUMP 	19AH 			//018B 	399A
		ORG		018CH
		LDR 	2AH,0 			//018C 	082A
		XORWI 	1H 			//018D 	2601
		BTSC 	STATUS,2 		//018E 	1503
		LJUMP 	19AH 			//018F 	399A
		XORWI 	3H 			//0190 	2603
		BTSC 	STATUS,2 		//0191 	1503
		LJUMP 	151H 			//0192 	3951
		XORWI 	1H 			//0193 	2601
		ORG		0194H
		BTSC 	STATUS,2 		//0194 	1503
		LJUMP 	135H 			//0195 	3935
		XORWI 	7H 			//0196 	2607
		BTSC 	STATUS,2 		//0197 	1503
		LJUMP 	13FH 			//0198 	393F
		LJUMP 	19AH 			//0199 	399A

		//;smartkey.C: 500: }
		//;smartkey.C: 502: }
		//;smartkey.C: 504: if((RC1 ) && (mtState == 1)){
		BCR 	STATUS,5 		//019A 	1283
		BTSS 	7H,1 			//019B 	1C87
		ORG		019CH
		LJUMP 	1D9H 			//019C 	39D9
		DECRSZ 	2AH,0 		//019D 	0E2A
		LJUMP 	1D9H 			//019E 	39D9

		//;smartkey.C: 505: timeTick =0;
		CLRR 	79H 			//019F 	0179
		CLRR 	7AH 			//01A0 	017A

		//;smartkey.C: 506: while(timeTick <700);
		LDWI 	2H 			//01A1 	2A02
		SUBWR 	7AH,0 			//01A2 	0C7A
		LDWI 	BCH 			//01A3 	2ABC
		ORG		01A4H
		BTSC 	STATUS,2 		//01A4 	1503
		SUBWR 	79H,0 			//01A5 	0C79
		BTSS 	STATUS,0 		//01A6 	1C03
		LJUMP 	1A1H 			//01A7 	39A1

		//;smartkey.C: 508: cntTmp=0;
		CLRR 	20H 			//01A8 	0120
		CLRR 	21H 			//01A9 	0121

		//;smartkey.C: 509: while((RC1) &&( cntTmp<9)){
		LJUMP 	1C9H 			//01AA 	39C9
		LDWI 	0H 			//01AB 	2A00
		ORG		01ACH
		SUBWR 	21H,0 			//01AC 	0C21
		LDWI 	9H 			//01AD 	2A09
		BTSC 	STATUS,2 		//01AE 	1503
		SUBWR 	20H,0 			//01AF 	0C20
		BTSC 	STATUS,0 		//01B0 	1403
		LJUMP 	1CCH 			//01B1 	39CC

		//;smartkey.C: 510: beepOn();TMR2ON = 0; beep(10,1);
		LCALL 	305H 			//01B2 	3305
		LDWI 	AH 			//01B3 	2A0A
		ORG		01B4H
		BCR 	STATUS,5 		//01B4 	1283
		BCR 	12H,2 			//01B5 	1112
		CLRR 	76H 			//01B6 	0176
		INCR	76H,1 			//01B7 	09F6
		LCALL 	299H 			//01B8 	3299

		//;smartkey.C: 511: cntTmp++;
		INCR	20H,1 			//01B9 	09A0
		BTSC 	STATUS,2 		//01BA 	1503
		INCR	21H,1 			//01BB 	09A1
		ORG		01BCH

		//;smartkey.C: 512: _delay((unsigned long)((1000)*(4000000/4000.0)));
		LDWI 	6H 			//01BC 	2A06
		STR 	2DH 			//01BD 	01AD
		LDWI 	13H 			//01BE 	2A13
		STR 	2CH 			//01BF 	01AC
		LDWI 	B1H 			//01C0 	2AB1
		STR 	2BH 			//01C1 	01AB
		DECRSZ 	2BH,1 		//01C2 	0EAB
		LJUMP 	1C2H 			//01C3 	39C2
		ORG		01C4H
		DECRSZ 	2CH,1 		//01C4 	0EAC
		LJUMP 	1C2H 			//01C5 	39C2
		DECRSZ 	2DH,1 		//01C6 	0EAD
		LJUMP 	1C2H 			//01C7 	39C2
		LJUMP 	1C9H 			//01C8 	39C9
		BCR 	STATUS,5 		//01C9 	1283
		BTSC 	7H,1 			//01CA 	1487
		LJUMP 	1ABH 			//01CB 	39AB
		ORG		01CCH

		//;smartkey.C: 513: }
		//;smartkey.C: 514: cntTmp =0;
		CLRR 	20H 			//01CC 	0120
		CLRR 	21H 			//01CD 	0121

		//;smartkey.C: 515: if(RC1){
		BTSS 	7H,1 			//01CE 	1C87
		LJUMP 	1D7H 			//01CF 	39D7
		LDWI 	2CH 			//01D0 	2A2C

		//;smartkey.C: 517: RegStatus &=(~0x20);
		BCR 	24H,5 			//01D1 	12A4

		//;smartkey.C: 518: setState(2,300);
		STR 	72H 			//01D2 	01F2
		LDWI 	1H 			//01D3 	2A01
		ORG		01D4H
		STR 	73H 			//01D4 	01F3
		LDWI 	2H 			//01D5 	2A02
		LCALL 	2E1H 			//01D6 	32E1

		//;smartkey.C: 519: }
		//;smartkey.C: 521: timeTick =0;
		CLRR 	79H 			//01D7 	0179
		CLRR 	7AH 			//01D8 	017A

		//;smartkey.C: 522: }
		//;smartkey.C: 525: if(RegStatus & 0x20) {RC4 =1;RC5 =1;}
		BTSS 	24H,5 			//01D9 	1EA4
		LJUMP 	1DEH 			//01DA 	39DE
		BSR 	7H,4 			//01DB 	1A07
		ORG		01DCH
		BSR 	7H,5 			//01DC 	1A87
		LJUMP 	6DH 			//01DD 	386D

		//;smartkey.C: 526: else {RC4 =0;RC5 =0;}
		BCR 	7H,4 			//01DE 	1207
		BCR 	7H,5 			//01DF 	1287
		LJUMP 	6DH 			//01E0 	386D

		//;smartkey.C: 49: if(PAIE&&PAIF){
		BTSC 	INTCON,3 		//01E1 	158B
		BTSS 	INTCON,0 		//01E2 	1C0B
		LJUMP 	1F2H 			//01E3 	39F2
		ORG		01E4H

		//;smartkey.C: 52: tmp = PORTA;
		BCR 	STATUS,5 		//01E4 	1283
		LDR 	5H,0 			//01E5 	0805

		//;smartkey.C: 53: PAIF = 0;
		BCR 	INTCON,0 		//01E6 	100B

		//;smartkey.C: 55: if(RA6){
		BTSS 	5H,6 			//01E7 	1F05
		LJUMP 	1F1H 			//01E8 	39F1

		//;smartkey.C: 57: if(mode_chek == 0){
		LDR 	28H,1 			//01E9 	08A8
		BTSS 	STATUS,2 		//01EA 	1D03
		LJUMP 	1F2H 			//01EB 	39F2
		ORG		01ECH

		//;smartkey.C: 58: cntCyc = 0;
		CLRR 	25H 			//01EC 	0125

		//;smartkey.C: 59: cntOff = 0;
		CLRR 	26H 			//01ED 	0126

		//;smartkey.C: 61: mode_chek = 1;
		CLRR 	28H 			//01EE 	0128
		INCR	28H,1 			//01EF 	09A8
		LJUMP 	1F2H 			//01F0 	39F2

		//;smartkey.C: 66: else{
		//;smartkey.C: 67: cntOff = 0;
		CLRR 	26H 			//01F1 	0126

		//;smartkey.C: 70: }
		//;smartkey.C: 72: }
		//;smartkey.C: 78: if(T0IE&&T0IF){
		BTSC 	INTCON,5 		//01F2 	168B
		BTSS 	INTCON,2 		//01F3 	1D0B
		ORG		01F4H
		LJUMP 	23FH 			//01F4 	3A3F
		LDWI 	B3H 			//01F5 	2AB3

		//;smartkey.C: 79: T0IF = 0;
		BCR 	INTCON,2 		//01F6 	110B

		//;smartkey.C: 80: TMR0 = 179;
		BCR 	STATUS,5 		//01F7 	1283
		STR 	1H 			//01F8 	0181

		//;smartkey.C: 86: if( mode_chek == 1){
		DECRSZ 	28H,0 		//01F9 	0E28
		LJUMP 	213H 			//01FA 	3A13

		//;smartkey.C: 88: cntCyc++;
		INCR	25H,1 			//01FB 	09A5
		ORG		01FCH

		//;smartkey.C: 90: if(RA6==0){
		BTSC 	5H,6 			//01FC 	1705
		LJUMP 	213H 			//01FD 	3A13
		LDWI 	10H 			//01FE 	2A10

		//;smartkey.C: 92: cntOff++;
		INCR	26H,1 			//01FF 	09A6

		//;smartkey.C: 95: if(cntOff > 15){
		SUBWR 	26H,0 			//0200 	0C26
		BTSS 	STATUS,0 		//0201 	1C03
		LJUMP 	213H 			//0202 	3A13
		LDWI 	10H 			//0203 	2A10
		ORG		0204H

		//;smartkey.C: 97: mode_chek = 0;
		CLRR 	28H 			//0204 	0128

		//;smartkey.C: 99: if((cntCyc>15) &&(cntCyc<50)) {
		SUBWR 	25H,0 			//0205 	0C25
		LDWI 	32H 			//0206 	2A32
		BTSS 	STATUS,0 		//0207 	1C03
		LJUMP 	20FH 			//0208 	3A0F
		SUBWR 	25H,0 			//0209 	0C25
		BTSC 	STATUS,0 		//020A 	1403
		LJUMP 	20EH 			//020B 	3A0E
		ORG		020CH

		//;smartkey.C: 100: RegStatus |= (0x40);
		BSR 	24H,6 			//020C 	1B24

		//;smartkey.C: 101: } else if (cntCyc>=50){
		LJUMP 	212H 			//020D 	3A12
		LDWI 	32H 			//020E 	2A32
		SUBWR 	25H,0 			//020F 	0C25
		BTSC 	STATUS,0 		//0210 	1403

		//;smartkey.C: 102: RegStatus &= ~(0x40);
		BCR 	24H,6 			//0211 	1324

		//;smartkey.C: 103: }
		//;smartkey.C: 106: RegStatus |= 0x80;
		BSR 	24H,7 			//0212 	1BA4

		//;smartkey.C: 107: }
		//;smartkey.C: 109: }
		//;smartkey.C: 119: }
		//;smartkey.C: 122: timeTick++;
		INCR	79H,1 			//0213 	09F9
		ORG		0214H
		BTSC 	STATUS,2 		//0214 	1503
		INCR	7AH,1 			//0215 	09FA

		//;smartkey.C: 124: if((mtState == 4)||(mtState == 3)){
		LDR 	2AH,0 			//0216 	082A
		XORWI 	4H 			//0217 	2604
		BTSC 	STATUS,2 		//0218 	1503
		LJUMP 	21EH 			//0219 	3A1E
		LDR 	2AH,0 			//021A 	082A
		XORWI 	3H 			//021B 	2603
		ORG		021CH
		BTSS 	STATUS,2 		//021C 	1D03
		LJUMP 	23FH 			//021D 	3A3F

		//;smartkey.C: 126: if(timeTick > cntTmp){
		LDR 	7AH,0 			//021E 	087A
		SUBWR 	21H,0 			//021F 	0C21
		BTSS 	STATUS,2 		//0220 	1D03
		LJUMP 	224H 			//0221 	3A24
		LDR 	79H,0 			//0222 	0879
		SUBWR 	20H,0 			//0223 	0C20
		ORG		0224H
		BTSC 	STATUS,0 		//0224 	1403
		LJUMP 	23FH 			//0225 	3A3F

		//;smartkey.C: 127: cntTmp = timeTick+40;
		LDR 	7AH,0 			//0226 	087A
		STR 	21H 			//0227 	01A1
		LDR 	79H,0 			//0228 	0879
		STR 	20H 			//0229 	01A0
		LDWI 	28H 			//022A 	2A28
		ADDWR 	20H,1 			//022B 	0BA0
		ORG		022CH
		BTSC 	STATUS,0 		//022C 	1403
		INCR	21H,1 			//022D 	09A1

		//;smartkey.C: 128: if(cntTmp<=timeOut)
		LDR 	21H,0 			//022E 	0821
		SUBWR 	23H,0 			//022F 	0C23
		BTSS 	STATUS,2 		//0230 	1D03
		LJUMP 	234H 			//0231 	3A34
		LDR 	20H,0 			//0232 	0820
		SUBWR 	22H,0 			//0233 	0C22
		ORG		0234H

		//;smartkey.C: 129: {
		//;smartkey.C: 130: if(PR2L == 11)
		BSR 	STATUS,5 		//0234 	1A83
		BTSS 	STATUS,0 		//0235 	1C03
		LJUMP 	240H 			//0236 	3A40
		LDR 	11H,0 			//0237 	0811
		XORWI 	BH 			//0238 	260B
		BTSS 	STATUS,2 		//0239 	1D03
		LJUMP 	23DH 			//023A 	3A3D

		//;smartkey.C: 131: PR2L = 30;
		LDWI 	1EH 			//023B 	2A1E
		ORG		023CH
		LJUMP 	23EH 			//023C 	3A3E

		//;smartkey.C: 132: else
		//;smartkey.C: 133: PR2L = 11;
		LDWI 	BH 			//023D 	2A0B
		STR 	11H 			//023E 	0191

		//;smartkey.C: 134: }
		//;smartkey.C: 135: }
		//;smartkey.C: 136: }
		//;smartkey.C: 139: }
		//;smartkey.C: 142: if(TMR2IE&&TMR2IF)
		BSR 	STATUS,5 		//023F 	1A83
		BTSS 	CH,1 			//0240 	1C8C
		LJUMP 	248H 			//0241 	3A48
		BCR 	STATUS,5 		//0242 	1283
		BTSS 	CH,1 			//0243 	1C8C
		ORG		0244H
		LJUMP 	248H 			//0244 	3A48
		LDWI 	20H 			//0245 	2A20

		//;smartkey.C: 143: {
		//;smartkey.C: 144: TMR2IF = 0;
		BCR 	CH,1 			//0246 	108C

		//;smartkey.C: 145: RA5 =~ RA5;
		XORWR 	5H,1 			//0247 	0485
		LDR 	71H,0 			//0248 	0871
		STR 	PCLATH 			//0249 	018A
		SWAPR 	70H,0 			//024A 	0770
		STR 	STATUS 			//024B 	0183
		ORG		024CH
		SWAPR 	7EH,1 			//024C 	07FE
		SWAPR 	7EH,0 			//024D 	077E
		RETI		 			//024E 	0009

		//;sysinit.c: 84: INTCON = 0B00000000;
		CLRR 	INTCON 			//024F 	010B

		//;sysinit.c: 85: PIE1 = 0B00000000;
		BSR 	STATUS,5 		//0250 	1A83
		CLRR 	CH 			//0251 	010C

		//;sysinit.c: 86: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//0252 	1283
		CLRR 	CH 			//0253 	010C
		ORG		0254H

		//;sysinit.c: 88: IOCA6 = 1;
		BSR 	STATUS,5 		//0254 	1A83
		BSR 	16H,6 			//0255 	1B16

		//;sysinit.c: 89: tmp = PORTA;
		BCR 	STATUS,5 		//0256 	1283
		LDR 	5H,0 			//0257 	0805

		//;sysinit.c: 90: PAIF = 0;
		BCR 	INTCON,0 		//0258 	100B

		//;sysinit.c: 91: PAIE = 0;
		BCR 	INTCON,3 		//0259 	118B

		//;sysinit.c: 94: INTEDG = 0;
		BSR 	STATUS,5 		//025A 	1A83
		BCR 	1H,6 			//025B 	1301
		ORG		025CH

		//;sysinit.c: 95: INTF = 0;
		BCR 	INTCON,1 		//025C 	108B

		//;sysinit.c: 96: INTE = 0;
		BCR 	INTCON,4 		//025D 	120B

		//;sysinit.c: 98: TMR2IF = 0;
		BCR 	STATUS,5 		//025E 	1283
		BCR 	CH,1 			//025F 	108C

		//;sysinit.c: 99: TMR2IE = 1;
		BSR 	STATUS,5 		//0260 	1A83
		BSR 	CH,1 			//0261 	188C

		//;sysinit.c: 100: TMR2ON = 0;
		BCR 	STATUS,5 		//0262 	1283
		BCR 	12H,2 			//0263 	1112
		ORG		0264H

		//;sysinit.c: 106: T0IF = 0;
		BCR 	INTCON,2 		//0264 	110B

		//;sysinit.c: 107: T0IE = 1;
		BSR 	INTCON,5 		//0265 	1A8B

		//;sysinit.c: 108: T0ON = 1;
		BSR 	1FH,3 			//0266 	199F

		//;sysinit.c: 110: PEIE = 1;
		BSR 	INTCON,6 		//0267 	1B0B

		//;sysinit.c: 112: GIE = 1;
		BSR 	INTCON,7 		//0268 	1B8B
		RET		 					//0269 	0004
		STR 	73H 			//026A 	01F3

		//;smartkey.C: 194: GIE = 0;
		BCR 	INTCON,7 		//026B 	138B
		ORG		026CH

		//;smartkey.C: 195: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//026C 	1F8B
		LJUMP 	270H 			//026D 	3A70
		CLRWDT	 			//026E 	0001
		LJUMP 	26CH 			//026F 	3A6C

		//;smartkey.C: 196: EEADR = EEAddr;
		LDR 	73H,0 			//0270 	0873
		BSR 	STATUS,5 		//0271 	1A83
		STR 	1BH 			//0272 	019B

		//;smartkey.C: 197: EEDAT = EEData;
		LDR 	72H,0 			//0273 	0872
		ORG		0274H
		STR 	1AH 			//0274 	019A
		LDWI 	34H 			//0275 	2A34

		//;smartkey.C: 198: EEIF = 0;
		BCR 	STATUS,5 		//0276 	1283
		BCR 	CH,7 			//0277 	138C

		//;smartkey.C: 199: EECON1 = 0x34;
		BSR 	STATUS,5 		//0278 	1A83
		STR 	1CH 			//0279 	019C

		//;smartkey.C: 200: WR = 1;
		BSR 	1DH,0 			//027A 	181D

		//;smartkey.C: 201: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//027B 	1A83
		ORG		027CH
		BTSS 	1DH,0 			//027C 	1C1D
		LJUMP 	280H 			//027D 	3A80
		CLRWDT	 			//027E 	0001
		LJUMP 	27BH 			//027F 	3A7B

		//;smartkey.C: 203: GIE = 1;
		BSR 	INTCON,7 		//0280 	1B8B
		RET		 					//0281 	0004

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//0282 	1283
		CLRR 	5H 			//0283 	0105
		ORG		0284H

		//;sysinit.c: 35: TRISA = 0B01011110;
		LDWI 	5EH 			//0284 	2A5E
		BSR 	STATUS,5 		//0285 	1A83
		STR 	5H 			//0286 	0185

		//;sysinit.c: 36: WPUA = 0B10100000;
		LDWI 	A0H 			//0287 	2AA0
		STR 	15H 			//0288 	0195

		//;sysinit.c: 38: PORTC = 0B00000000;
		BCR 	STATUS,5 		//0289 	1283
		CLRR 	7H 			//028A 	0107

		//;sysinit.c: 39: TRISC = 0B11001111;
		LDWI 	CFH 			//028B 	2ACF
		ORG		028CH
		BSR 	STATUS,5 		//028C 	1A83
		STR 	7H 			//028D 	0187

		//;sysinit.c: 40: WPUC = 0B00110000;
		LDWI 	30H 			//028E 	2A30
		STR 	13H 			//028F 	0193

		//;sysinit.c: 42: PSRCA = 0B11111111;
		LDWI 	FFH 			//0290 	2AFF
		STR 	8H 			//0291 	0188

		//;sysinit.c: 43: PSRCC = 0B11111111;
		STR 	14H 			//0292 	0194

		//;sysinit.c: 44: PSINKA = 0B11111111;
		STR 	17H 			//0293 	0197
		ORG		0294H

		//;sysinit.c: 45: PSINKC = 0B11111111;
		STR 	1FH 			//0294 	019F

		//;sysinit.c: 47: MSCON = 0B00110000;
		LDWI 	30H 			//0295 	2A30
		BCR 	STATUS,5 		//0296 	1283
		STR 	1BH 			//0297 	019B
		RET		 					//0298 	0004
		STR 	77H 			//0299 	01F7

		//;smartkey.C: 166: {
		//;smartkey.C: 168: while(rep--){
		DECR 	76H,1 			//029A 	0DF6
		LDR 	76H,0 			//029B 	0876
		ORG		029CH
		XORWI 	FFH 			//029C 	26FF
		BTSC 	STATUS,2 		//029D 	1503
		RET		 					//029E 	0004
		LDWI 	CH 			//029F 	2A0C

		//;smartkey.C: 169: TMR2ON = 1;
		BSR 	12H,2 			//02A0 	1912

		//;smartkey.C: 170: PR2L = 12;
		BSR 	STATUS,5 		//02A1 	1A83
		STR 	11H 			//02A2 	0191

		//;smartkey.C: 171: delay_x10ms(delay);
		LDR 	77H,0 			//02A3 	0877
		ORG		02A4H
		STR 	72H 			//02A4 	01F2
		CLRR 	73H 			//02A5 	0173
		LCALL 	2AFH 			//02A6 	32AF
		LDWI 	14H 			//02A7 	2A14

		//;smartkey.C: 172: TMR2ON = 0;RA5 =0;
		BCR 	STATUS,5 		//02A8 	1283
		BCR 	12H,2 			//02A9 	1112
		BCR 	5H,5 			//02AA 	1285

		//;smartkey.C: 173: delay_x10ms(20);
		STR 	72H 			//02AB 	01F2
		ORG		02ACH
		CLRR 	73H 			//02AC 	0173
		LCALL 	2AFH 			//02AD 	32AF
		LJUMP 	29AH 			//02AE 	3A9A

		//;smartkey.C: 152: unsigned int set = t + timeTick;
		LDR 	73H,0 			//02AF 	0873
		STR 	75H 			//02B0 	01F5
		LDR 	72H,0 			//02B1 	0872
		STR 	74H 			//02B2 	01F4
		LDR 	79H,0 			//02B3 	0879
		ORG		02B4H
		ADDWR 	74H,1 			//02B4 	0BF4
		BTSC 	STATUS,0 		//02B5 	1403
		INCR	75H,1 			//02B6 	09F5
		LDR 	7AH,0 			//02B7 	087A
		ADDWR 	75H,1 			//02B8 	0BF5

		//;smartkey.C: 153: while(timeTick < set);
		LDR 	75H,0 			//02B9 	0875
		SUBWR 	7AH,0 			//02BA 	0C7A
		BTSS 	STATUS,2 		//02BB 	1D03
		ORG		02BCH
		LJUMP 	2BFH 			//02BC 	3ABF
		LDR 	74H,0 			//02BD 	0874
		SUBWR 	79H,0 			//02BE 	0C79
		BTSC 	STATUS,0 		//02BF 	1403
		RET		 					//02C0 	0004
		LJUMP 	2B9H 			//02C1 	3AB9

		//;sysinit.c: 59: T0CON0 = 0B00000000;
		CLRR 	1FH 			//02C2 	011F

		//;sysinit.c: 60: OPTION = 0B00000111;
		LDWI 	7H 			//02C3 	2A07
		ORG		02C4H
		BSR 	STATUS,5 		//02C4 	1A83
		STR 	1H 			//02C5 	0181

		//;sysinit.c: 61: TMR0 = 179;
		LDWI 	B3H 			//02C6 	2AB3
		BCR 	STATUS,5 		//02C7 	1283
		STR 	1H 			//02C8 	0181

		//;sysinit.c: 63: TMR2H = 0;
		CLRR 	13H 			//02C9 	0113

		//;sysinit.c: 64: TMR2L = 0;
		CLRR 	11H 			//02CA 	0111

		//;sysinit.c: 65: PR2H = 0;
		BSR 	STATUS,5 		//02CB 	1A83
		ORG		02CCH
		CLRR 	12H 			//02CC 	0112

		//;sysinit.c: 66: PR2L =0;
		CLRR 	11H 			//02CD 	0111

		//;sysinit.c: 67: T2CON0 = 0B00101001;
		LDWI 	29H 			//02CE 	2A29
		BCR 	STATUS,5 		//02CF 	1283
		STR 	12H 			//02D0 	0192
		RET		 					//02D1 	0004
		CLRR 	79H 			//02D2 	0179
		CLRR 	7AH 			//02D3 	017A
		ORG		02D4H
		CLRR 	20H 			//02D4 	0120
		CLRR 	21H 			//02D5 	0121
		CLRR 	22H 			//02D6 	0122
		CLRR 	23H 			//02D7 	0123
		CLRR 	24H 			//02D8 	0124
		CLRR 	25H 			//02D9 	0125
		CLRR 	26H 			//02DA 	0126
		CLRR 	27H 			//02DB 	0127
		ORG		02DCH
		CLRR 	28H 			//02DC 	0128
		CLRR 	29H 			//02DD 	0129
		CLRR 	2AH 			//02DE 	012A
		CLRR 	STATUS 			//02DF 	0103
		LJUMP 	0BH 			//02E0 	380B
		STR 	74H 			//02E1 	01F4

		//;smartkey.C: 209: mtOldState = mtState;
		BCR 	STATUS,5 		//02E2 	1283
		LDR 	2AH,0 			//02E3 	082A
		ORG		02E4H
		STR 	29H 			//02E4 	01A9

		//;smartkey.C: 210: mtState = stt;
		LDR 	74H,0 			//02E5 	0874
		STR 	2AH 			//02E6 	01AA

		//;smartkey.C: 211: timeTick =0;
		CLRR 	79H 			//02E7 	0179
		CLRR 	7AH 			//02E8 	017A

		//;smartkey.C: 212: timeOut = _tOut;
		LDR 	73H,0 			//02E9 	0873
		STR 	23H 			//02EA 	01A3
		LDR 	72H,0 			//02EB 	0872
		ORG		02ECH
		STR 	22H 			//02EC 	01A2
		RET		 					//02ED 	0004

		//;sysinit.c: 21: OSCCON = 0B01010001;
		LDWI 	51H 			//02EE 	2A51
		BSR 	STATUS,5 		//02EF 	1A83
		STR 	FH 			//02F0 	018F

		//;sysinit.c: 22: _nop();
		NOP		 					//02F1 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//02F2 	1A83
		BTSC 	FH,2 			//02F3 	150F
		ORG		02F4H
		RET		 					//02F4 	0004
		LJUMP 	2F2H 			//02F5 	3AF2
		STR 	72H 			//02F6 	01F2

		//;smartkey.C: 183: unsigned char ReEepromData;
		//;smartkey.C: 185: EEADR = EEAddr;
		BSR 	STATUS,5 		//02F7 	1A83
		STR 	1BH 			//02F8 	019B

		//;smartkey.C: 186: RD = 1;
		BSR 	1CH,0 			//02F9 	181C

		//;smartkey.C: 187: ReEepromData = EEDAT;
		LDR 	1AH,0 			//02FA 	081A
		STR 	73H 			//02FB 	01F3
		ORG		02FCH

		//;smartkey.C: 188: RD = 0;
		BCR 	1CH,0 			//02FC 	101C

		//;smartkey.C: 189: return ReEepromData;
		RET		 					//02FD 	0004
		ORG		0300H
		LJUMP 	127H 			//0300 	3927
		LJUMP 	7EH 			//0301 	387E
		LJUMP 	7FH 			//0302 	387F
		LJUMP 	B7H 			//0303 	38B7
		LJUMP 	D0H 			//0304 	38D0

		//;smartkey.C: 160: TMR2ON = 1;
		BCR 	STATUS,5 		//0305 	1283
		BSR 	12H,2 			//0306 	1912

		//;smartkey.C: 161: TRISA &= 0xdf;
		BSR 	STATUS,5 		//0307 	1A83
		ORG		0308H
		BCR 	5H,5 			//0308 	1285
		RET		 					//0309 	0004

		//;smartkey.C: 157: TMR2ON = 0;RA5 =0;TRISA |= 0x20;
		BCR 	12H,2 			//030A 	1112
		BCR 	5H,5 			//030B 	1285
		BSR 	STATUS,5 		//030C 	1A83
		BSR 	5H,5 			//030D 	1A85
		RET		 					//030E 	0004
			END
