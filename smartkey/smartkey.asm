//Deviec:MS82Fxx02
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
		LJUMP 	1E9H 			//0009 	39E9
		LJUMP 	2BBH 			//000A 	3ABB
		LDWI 	7H 			//000B 	2A07
		ORG		000CH
		STR 	19H 			//000C 	0199

		//;smartkey.C: 226: unsigned char reAlertOn=0;
		CLRR 	78H 			//000D 	0178
		CLRWDT	 			//000E 	0001

		//;smartkey.C: 231: sys_init();
		LCALL 	2F5H 			//000F 	32F5

		//;smartkey.C: 232: gpio_init();
		LCALL 	2D9H 			//0010 	32D9

		//;smartkey.C: 234: timer_init();
		LCALL 	2CAH 			//0011 	32CA

		//;smartkey.C: 235: int_init();
		LCALL 	25DH 			//0012 	325D

		//;smartkey.C: 239: _delay((unsigned long)((100)*(4000000/4000.0)));
		LDWI 	82H 			//0013 	2A82
		ORG		0014H
		BCR 	STATUS,5 		//0014 	1283
		STR 	2CH 			//0015 	01AC
		LDWI 	DDH 			//0016 	2ADD
		STR 	2BH 			//0017 	01AB
		DECRSZ 	2BH,1 		//0018 	0EAB
		LJUMP 	18H 			//0019 	3818
		DECRSZ 	2CH,1 		//001A 	0EAC
		LJUMP 	18H 			//001B 	3818
		ORG		001CH
		LJUMP 	1DH 			//001C 	381D
		LDWI 	82H 			//001D 	2A82

		//;smartkey.C: 241: RA7 =1;
		BCR 	STATUS,5 		//001E 	1283
		BCR 	STATUS,6 		//001F 	1303
		BSR 	5H,7 			//0020 	1B85

		//;smartkey.C: 242: _delay((unsigned long)((100)*(4000000/4000.0)));
		STR 	2CH 			//0021 	01AC
		LDWI 	DDH 			//0022 	2ADD
		STR 	2BH 			//0023 	01AB
		ORG		0024H
		DECRSZ 	2BH,1 		//0024 	0EAB
		LJUMP 	24H 			//0025 	3824
		DECRSZ 	2CH,1 		//0026 	0EAC
		LJUMP 	24H 			//0027 	3824
		LJUMP 	29H 			//0028 	3829
		LDWI 	0H 			//0029 	2A00

		//;smartkey.C: 244: PAIE = 1;
		BSR 	INTCON,3 		//002A 	198B

		//;smartkey.C: 246: RegStatus = 0;
		BCR 	STATUS,5 		//002B 	1283
		ORG		002CH
		BCR 	STATUS,6 		//002C 	1303
		CLRR 	24H 			//002D 	0124
		CLRR 	72H 			//002E 	0172
		CLRR 	73H 			//002F 	0173
		LCALL 	2E8H 			//0030 	32E8

		//;smartkey.C: 256: WRITE_EEPROM(0x7F,0xAA);
		LDWI 	AAH 			//0031 	2AAA
		STR 	72H 			//0032 	01F2
		LDWI 	7FH 			//0033 	2A7F
		ORG		0034H
		LCALL 	278H 			//0034 	3278

		//;smartkey.C: 257: WRITE_EEPROM(0x7F,0xAA);
		LDWI 	AAH 			//0035 	2AAA
		STR 	72H 			//0036 	01F2
		LDWI 	7FH 			//0037 	2A7F
		LCALL 	278H 			//0038 	3278

		//;smartkey.C: 260: delay_x10ms(1);
		CLRR 	72H 			//0039 	0172
		INCR	72H,1 			//003A 	09F2
		CLRR 	73H 			//003B 	0173
		ORG		003CH
		LCALL 	2A8H 			//003C 	32A8

		//;smartkey.C: 262: if(READ_EEPROM(0x08)==0xff) {WRITE_EEPROM(0x08,0);_delay((unsigned lon
		//+                          g)((2)*(4000000/4000.0)));}
		LDWI 	8H 			//003D 	2A08
		LCALL 	2FFH 			//003E 	32FF
		XORWI 	FFH 			//003F 	26FF
		LDWI 	8H 			//0040 	2A08
		BTSS 	STATUS,2 		//0041 	1D03
		LJUMP 	50H 			//0042 	3850
		CLRR 	72H 			//0043 	0172
		ORG		0044H
		LCALL 	278H 			//0044 	3278
		LDWI 	3H 			//0045 	2A03
		BCR 	STATUS,5 		//0046 	1283
		STR 	2CH 			//0047 	01AC
		LDWI 	97H 			//0048 	2A97
		STR 	2BH 			//0049 	01AB
		DECRSZ 	2BH,1 		//004A 	0EAB
		LJUMP 	4AH 			//004B 	384A
		ORG		004CH
		DECRSZ 	2CH,1 		//004C 	0EAC
		LJUMP 	4AH 			//004D 	384A
		LJUMP 	4FH 			//004E 	384F

		//;smartkey.C: 264: if(READ_EEPROM(0x08)==0xcc){
		LDWI 	8H 			//004F 	2A08
		LCALL 	2FFH 			//0050 	32FF
		XORWI 	CCH 			//0051 	26CC
		BTSS 	STATUS,2 		//0052 	1D03
		LJUMP 	6BH 			//0053 	386B
		ORG		0054H
		LDWI 	8H 			//0054 	2A08

		//;smartkey.C: 265: RegStatus &=~(0x20);
		BCR 	STATUS,5 		//0055 	1283
		BCR 	24H,5 			//0056 	12A4

		//;smartkey.C: 266: setState(3,1800);
		STR 	72H 			//0057 	01F2
		LDWI 	7H 			//0058 	2A07
		STR 	73H 			//0059 	01F3
		LDWI 	3H 			//005A 	2A03
		LCALL 	2E8H 			//005B 	32E8
		ORG		005CH

		//;smartkey.C: 267: mtOldState = 1;
		CLRR 	29H 			//005C 	0129
		INCR	29H,1 			//005D 	09A9

		//;smartkey.C: 268: cntTmp = timeTick+50;
		LDR 	7AH,0 			//005E 	087A
		STR 	21H 			//005F 	01A1
		LDR 	79H,0 			//0060 	0879
		STR 	20H 			//0061 	01A0
		LDWI 	32H 			//0062 	2A32
		ADDWR 	20H,1 			//0063 	0BA0
		ORG		0064H
		BTSC 	STATUS,0 		//0064 	1403
		INCR	21H,1 			//0065 	09A1

		//;smartkey.C: 269: PR2 =12;
		LDWI 	CH 			//0066 	2A0C
		BSR 	STATUS,5 		//0067 	1A83
		STR 	12H 			//0068 	0192

		//;smartkey.C: 270: beepOn();
		LCALL 	30DH 			//0069 	330D

		//;smartkey.C: 271: } else {
		LJUMP 	72H 			//006A 	3872

		//;smartkey.C: 272: setState(2,400);
		LDWI 	90H 			//006B 	2A90
		ORG		006CH
		STR 	72H 			//006C 	01F2
		LDWI 	1H 			//006D 	2A01
		STR 	73H 			//006E 	01F3
		LDWI 	2H 			//006F 	2A02
		LCALL 	2E8H 			//0070 	32E8

		//;smartkey.C: 274: mtOldState = 0;
		CLRR 	29H 			//0071 	0129

		//;smartkey.C: 318: RA0 =RA6;
		BCR 	STATUS,5 		//0072 	1283
		BTSS 	5H,6 			//0073 	1F05
		ORG		0074H
		LJUMP 	79H 			//0074 	3879
		BCR 	STATUS,5 		//0075 	1283
		BCR 	STATUS,6 		//0076 	1303
		BSR 	5H,0 			//0077 	1805
		LJUMP 	7CH 			//0078 	387C
		BCR 	STATUS,5 		//0079 	1283
		BCR 	STATUS,6 		//007A 	1303
		BCR 	5H,0 			//007B 	1005
		ORG		007CH

		//;smartkey.C: 321: if(mode_chek == 0)
		LDR 	28H,1 			//007C 	08A8
		BTSC 	STATUS,2 		//007D 	1503

		//;smartkey.C: 322: {
		//;smartkey.C: 324: if(RegStatus & 0x80)
		BTSS 	24H,7 			//007E 	1FA4
		LJUMP 	12FH 			//007F 	392F

		//;smartkey.C: 325: {
		//;smartkey.C: 326: PAIE = 0;
		BCR 	INTCON,3 		//0080 	118B

		//;smartkey.C: 329: RegStatus &= (~0x80);
		BCR 	24H,7 			//0081 	13A4

		//;smartkey.C: 341: {
		//;smartkey.C: 343: if ((RegStatus & 0x40) !=0){
		BTSC 	24H,6 			//0082 	1724
		LJUMP 	DFH 			//0083 	38DF
		ORG		0084H
		LJUMP 	126H 			//0084 	3926
		LJUMP 	10FH 			//0085 	390F

		//;smartkey.C: 358: break;
		//;smartkey.C: 357: timeTick =0;
		//;smartkey.C: 356: lostDetect =0;
		//;smartkey.C: 361: if(timeTick >30){
		LDWI 	0H 			//0086 	2A00
		SUBWR 	7AH,0 			//0087 	0C7A
		LDWI 	1FH 			//0088 	2A1F
		BTSC 	STATUS,2 		//0089 	1503
		SUBWR 	79H,0 			//008A 	0C79
		BTSS 	STATUS,0 		//008B 	1C03
		ORG		008CH
		LJUMP 	12EH 			//008C 	392E
		LDWI 	8H 			//008D 	2A08

		//;smartkey.C: 362: timeTick =0;
		CLRR 	79H 			//008E 	0179
		CLRR 	7AH 			//008F 	017A

		//;smartkey.C: 364: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LCALL 	2FFH 			//0090 	32FF
		XORWI 	CCH 			//0091 	26CC
		BTSS 	STATUS,2 		//0092 	1D03
		LJUMP 	97H 			//0093 	3897
		ORG		0094H
		LDWI 	8H 			//0094 	2A08
		CLRR 	72H 			//0095 	0172
		LCALL 	278H 			//0096 	3278

		//;smartkey.C: 366: if((mtOldState == 3)){
		BCR 	STATUS,5 		//0097 	1283
		LDR 	29H,0 			//0098 	0829
		XORWI 	3H 			//0099 	2603
		BTSS 	STATUS,2 		//009A 	1D03
		LJUMP 	A8H 			//009B 	38A8
		ORG		009CH

		//;smartkey.C: 367: beepOn();TMR2ON = 0; beep(10,1);
		LCALL 	30DH 			//009C 	330D
		LDWI 	AH 			//009D 	2A0A
		BCR 	STATUS,5 		//009E 	1283
		BCR 	12H,2 			//009F 	1112
		CLRR 	76H 			//00A0 	0176
		INCR	76H,1 			//00A1 	09F6
		LCALL 	292H 			//00A2 	3292

		//;smartkey.C: 368: if(reAlertOn)reAlertOn =0;
		LDR 	78H,0 			//00A3 	0878
		ORG		00A4H
		BTSC 	STATUS,2 		//00A4 	1503
		LJUMP 	12EH 			//00A5 	392E
		CLRR 	78H 			//00A6 	0178
		LJUMP 	12EH 			//00A7 	392E

		//;smartkey.C: 370: else if((mtOldState == 0)||(mtOldState == 4)){
		LDR 	29H,0 			//00A8 	0829
		BTSC 	STATUS,2 		//00A9 	1503
		LJUMP 	AFH 			//00AA 	38AF
		LDR 	29H,0 			//00AB 	0829
		ORG		00ACH
		XORWI 	4H 			//00AC 	2604
		BTSS 	STATUS,2 		//00AD 	1D03
		LJUMP 	BBH 			//00AE 	38BB
		LDWI 	ACH 			//00AF 	2AAC

		//;smartkey.C: 371: RegStatus |=(0x20);
		BSR 	24H,5 			//00B0 	1AA4

		//;smartkey.C: 372: setState(1,3500);
		STR 	72H 			//00B1 	01F2
		LDWI 	DH 			//00B2 	2A0D
		STR 	73H 			//00B3 	01F3
		ORG		00B4H
		LDWI 	1H 			//00B4 	2A01
		LCALL 	2E8H 			//00B5 	32E8
		LDWI 	AH 			//00B6 	2A0A

		//;smartkey.C: 373: beep(10,1);
		CLRR 	76H 			//00B7 	0176
		INCR	76H,1 			//00B8 	09F6
		LCALL 	292H 			//00B9 	3292

		//;smartkey.C: 374: }
		LJUMP 	12EH 			//00BA 	392E

		//;smartkey.C: 375: else if((mtOldState == 1)){
		DECRSZ 	29H,0 		//00BB 	0E29
		ORG		00BCH
		LJUMP 	12EH 			//00BC 	392E
		LJUMP 	A3H 			//00BD 	38A3

		//;smartkey.C: 378: }
		//;smartkey.C: 379: }
		//;smartkey.C: 380: break;
		//;smartkey.C: 377: if(reAlertOn)reAlertOn =0;
		//;smartkey.C: 383: if(timeTick > 200)
		LDWI 	0H 			//00BE 	2A00
		SUBWR 	7AH,0 			//00BF 	0C7A
		LDWI 	C9H 			//00C0 	2AC9
		BTSC 	STATUS,2 		//00C1 	1503
		SUBWR 	79H,0 			//00C2 	0C79
		BTSS 	STATUS,0 		//00C3 	1C03
		ORG		00C4H
		LJUMP 	12EH 			//00C4 	392E

		//;smartkey.C: 384: {
		//;smartkey.C: 385: beepOff();
		LCALL 	312H 			//00C5 	3312

		//;smartkey.C: 386: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LDWI 	8H 			//00C6 	2A08
		LCALL 	2FFH 			//00C7 	32FF
		XORWI 	CCH 			//00C8 	26CC
		BTSS 	STATUS,2 		//00C9 	1D03
		LJUMP 	CEH 			//00CA 	38CE
		LDWI 	8H 			//00CB 	2A08
		ORG		00CCH
		CLRR 	72H 			//00CC 	0172
		LCALL 	278H 			//00CD 	3278
		LDWI 	ACH 			//00CE 	2AAC

		//;smartkey.C: 387: RegStatus |=(0x20);
		BCR 	STATUS,5 		//00CF 	1283
		BSR 	24H,5 			//00D0 	1AA4

		//;smartkey.C: 388: setState(1,3500);
		STR 	72H 			//00D1 	01F2
		LDWI 	DH 			//00D2 	2A0D
		STR 	73H 			//00D3 	01F3
		ORG		00D4H
		LDWI 	1H 			//00D4 	2A01
		LCALL 	2E8H 			//00D5 	32E8
		LJUMP 	12EH 			//00D6 	392E

		//;smartkey.C: 394: beepOff();
		LCALL 	312H 			//00D7 	3312

		//;smartkey.C: 395: setState(2,300);
		LDWI 	2CH 			//00D8 	2A2C
		STR 	72H 			//00D9 	01F2
		LDWI 	1H 			//00DA 	2A01
		STR 	73H 			//00DB 	01F3
		ORG		00DCH
		LDWI 	2H 			//00DC 	2A02
		LCALL 	2E8H 			//00DD 	32E8

		//;smartkey.C: 396: break;
		LJUMP 	12EH 			//00DE 	392E
		LDR 	2AH,0 			//00DF 	082A
		STR 	FSR 			//00E0 	0184
		LDWI 	5H 			//00E1 	2A05
		SUBWR 	FSR,0 			//00E2 	0C04
		BTSC 	STATUS,0 		//00E3 	1403
		ORG		00E4H
		LJUMP 	12EH 			//00E4 	392E
		LDWI 	3H 			//00E5 	2A03
		STR 	PCLATH 			//00E6 	018A
		LDWI 	8H 			//00E7 	2A08
		ADDWR 	FSR,0 			//00E8 	0B04
		STR 	PCL 			//00E9 	0182

		//;smartkey.C: 420: {
		//;smartkey.C: 422: if(lostDetect==1 && timeTick< 1500)
		DECRSZ 	27H,0 		//00EA 	0E27
		LJUMP 	111H 			//00EB 	3911
		ORG		00ECH
		LDWI 	5H 			//00EC 	2A05
		SUBWR 	7AH,0 			//00ED 	0C7A
		LDWI 	DCH 			//00EE 	2ADC
		BTSC 	STATUS,2 		//00EF 	1503
		SUBWR 	79H,0 			//00F0 	0C79
		BTSC 	STATUS,0 		//00F1 	1403
		LJUMP 	111H 			//00F2 	3911

		//;smartkey.C: 423: {
		//;smartkey.C: 424: if(READ_EEPROM(0x08)==0x00) WRITE_EEPROM(0x08,0xcc);
		LDWI 	8H 			//00F3 	2A08
		ORG		00F4H
		LCALL 	2FFH 			//00F4 	32FF
		IORWI 	0H 			//00F5 	2500
		BTSS 	STATUS,2 		//00F6 	1D03
		LJUMP 	FCH 			//00F7 	38FC
		LDWI 	CCH 			//00F8 	2ACC
		STR 	72H 			//00F9 	01F2
		LDWI 	8H 			//00FA 	2A08
		LCALL 	278H 			//00FB 	3278
		ORG		00FCH

		//;smartkey.C: 426: setState(3,1800);
		LDWI 	8H 			//00FC 	2A08
		STR 	72H 			//00FD 	01F2
		LDWI 	7H 			//00FE 	2A07
		STR 	73H 			//00FF 	01F3
		LDWI 	3H 			//0100 	2A03
		LCALL 	2E8H 			//0101 	32E8

		//;smartkey.C: 427: cntTmp = timeTick+40;
		LDR 	7AH,0 			//0102 	087A
		STR 	21H 			//0103 	01A1
		ORG		0104H
		LDR 	79H,0 			//0104 	0879
		STR 	20H 			//0105 	01A0
		LDWI 	28H 			//0106 	2A28
		ADDWR 	20H,1 			//0107 	0BA0
		BTSC 	STATUS,0 		//0108 	1403
		INCR	21H,1 			//0109 	09A1

		//;smartkey.C: 428: PR2 =11;
		LDWI 	BH 			//010A 	2A0B
		BSR 	STATUS,5 		//010B 	1A83
		ORG		010CH
		STR 	12H 			//010C 	0192

		//;smartkey.C: 429: beepOn();
		LCALL 	30DH 			//010D 	330D

		//;smartkey.C: 430: lostDetect =0;
		BCR 	STATUS,5 		//010E 	1283
		CLRR 	27H 			//010F 	0127

		//;smartkey.C: 431: }
		LJUMP 	113H 			//0110 	3913

		//;smartkey.C: 432: else {
		//;smartkey.C: 433: lostDetect =1;
		CLRR 	27H 			//0111 	0127
		INCR	27H,1 			//0112 	09A7

		//;smartkey.C: 436: }
		//;smartkey.C: 437: timeTick =0;
		CLRR 	79H 			//0113 	0179
		ORG		0114H
		CLRR 	7AH 			//0114 	017A

		//;smartkey.C: 438: }
		//;smartkey.C: 439: break;
		LJUMP 	12EH 			//0115 	392E

		//;smartkey.C: 442: {
		//;smartkey.C: 443: timeTick =0;
		CLRR 	79H 			//0116 	0179
		CLRR 	7AH 			//0117 	017A

		//;smartkey.C: 444: beepOn();TMR2ON = 0;
		LCALL 	30DH 			//0118 	330D
		LDWI 	2H 			//0119 	2A02
		BCR 	STATUS,5 		//011A 	1283
		BCR 	12H,2 			//011B 	1112
		ORG		011CH

		//;smartkey.C: 445: beep(10,2);
		STR 	76H 			//011C 	01F6
		LDWI 	AH 			//011D 	2A0A
		LCALL 	292H 			//011E 	3292

		//;smartkey.C: 446: if(mtOldState == 3){reAlertOn =1;}
		LDR 	29H,0 			//011F 	0829
		XORWI 	3H 			//0120 	2603
		BTSS 	STATUS,2 		//0121 	1D03
		LJUMP 	12EH 			//0122 	392E
		CLRR 	78H 			//0123 	0178
		ORG		0124H
		INCR	78H,1 			//0124 	09F8
		LJUMP 	12EH 			//0125 	392E
		LDR 	2AH,0 			//0126 	082A
		XORWI 	1H 			//0127 	2601
		BTSC 	STATUS,2 		//0128 	1503
		LJUMP 	EAH 			//0129 	38EA
		XORWI 	3H 			//012A 	2603
		BTSC 	STATUS,2 		//012B 	1503
		ORG		012CH
		LJUMP 	116H 			//012C 	3916
		LJUMP 	12EH 			//012D 	392E

		//;smartkey.C: 450: }
		//;smartkey.C: 452: }
		//;smartkey.C: 454: PAIE = 1;
		BSR 	INTCON,3 		//012E 	198B

		//;smartkey.C: 455: }
		//;smartkey.C: 457: }
		//;smartkey.C: 461: {
		//;smartkey.C: 462: if((timeOut!=0)&&( timeTick >timeOut)){
		LDR 	23H,0 			//012F 	0823
		IORWR 	22H,0 			//0130 	0322
		BTSC 	STATUS,2 		//0131 	1503
		LJUMP 	1A1H 			//0132 	39A1
		LDR 	7AH,0 			//0133 	087A
		ORG		0134H
		SUBWR 	23H,0 			//0134 	0C23
		BTSS 	STATUS,2 		//0135 	1D03
		LJUMP 	139H 			//0136 	3939
		LDR 	79H,0 			//0137 	0879
		SUBWR 	22H,0 			//0138 	0C22
		BTSS 	STATUS,0 		//0139 	1C03
		LJUMP 	193H 			//013A 	3993
		LJUMP 	1A1H 			//013B 	39A1
		ORG		013CH

		//;smartkey.C: 473: beepOff();
		LCALL 	312H 			//013C 	3312
		LDWI 	2CH 			//013D 	2A2C

		//;smartkey.C: 474: RegStatus &=(~0x20);
		BCR 	STATUS,5 		//013E 	1283
		BCR 	24H,5 			//013F 	12A4

		//;smartkey.C: 475: setState(2,300);
		STR 	72H 			//0140 	01F2
		LDWI 	1H 			//0141 	2A01
		STR 	73H 			//0142 	01F3
		LDWI 	2H 			//0143 	2A02
		ORG		0144H
		LCALL 	2E8H 			//0144 	32E8

		//;smartkey.C: 476: break;
		LJUMP 	1A1H 			//0145 	39A1

		//;smartkey.C: 478: beepOff();
		LCALL 	312H 			//0146 	3312

		//;smartkey.C: 479: delay_x10ms(20);
		LDWI 	14H 			//0147 	2A14
		STR 	72H 			//0148 	01F2
		CLRR 	73H 			//0149 	0173
		LCALL 	2A8H 			//014A 	32A8

		//;smartkey.C: 480: beepOn();TMR2ON = 0;reAlertOn =0;
		LCALL 	30DH 			//014B 	330D
		ORG		014CH
		LDWI 	1EH 			//014C 	2A1E
		BCR 	STATUS,5 		//014D 	1283
		BCR 	12H,2 			//014E 	1112
		CLRR 	78H 			//014F 	0178
		CLRR 	76H 			//0150 	0176
		INCR	76H,1 			//0151 	09F6
		LCALL 	292H 			//0152 	3292
		LDWI 	0H 			//0153 	2A00
		ORG		0154H

		//;smartkey.C: 482: setState(0,0);
		CLRR 	72H 			//0154 	0172
		CLRR 	73H 			//0155 	0173
		LCALL 	2E8H 			//0156 	32E8

		//;smartkey.C: 483: break;
		LJUMP 	1A1H 			//0157 	39A1

		//;smartkey.C: 486: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
		LDWI 	8H 			//0158 	2A08
		LCALL 	2FFH 			//0159 	32FF
		XORWI 	CCH 			//015A 	26CC
		BTSS 	STATUS,2 		//015B 	1D03
		ORG		015CH
		LJUMP 	160H 			//015C 	3960
		LDWI 	8H 			//015D 	2A08
		CLRR 	72H 			//015E 	0172
		LCALL 	278H 			//015F 	3278

		//;smartkey.C: 488: if(reAlertOn){
		LDR 	78H,0 			//0160 	0878
		BTSC 	STATUS,2 		//0161 	1503
		LJUMP 	176H 			//0162 	3976

		//;smartkey.C: 489: setState(4,6000);
		LDWI 	70H 			//0163 	2A70
		ORG		0164H
		STR 	72H 			//0164 	01F2
		LDWI 	17H 			//0165 	2A17
		STR 	73H 			//0166 	01F3
		LDWI 	4H 			//0167 	2A04
		LCALL 	2E8H 			//0168 	32E8

		//;smartkey.C: 490: cntTmp = timeTick+40;
		LDR 	7AH,0 			//0169 	087A
		STR 	21H 			//016A 	01A1
		LDR 	79H,0 			//016B 	0879
		ORG		016CH
		STR 	20H 			//016C 	01A0
		LDWI 	28H 			//016D 	2A28
		ADDWR 	20H,1 			//016E 	0BA0
		BTSC 	STATUS,0 		//016F 	1403
		INCR	21H,1 			//0170 	09A1

		//;smartkey.C: 491: PR2 =11;
		LDWI 	BH 			//0171 	2A0B
		BSR 	STATUS,5 		//0172 	1A83
		STR 	12H 			//0173 	0192
		ORG		0174H

		//;smartkey.C: 492: beepOn();
		LCALL 	30DH 			//0174 	330D

		//;smartkey.C: 494: }else if(mtOldState == 0){
		LJUMP 	1A1H 			//0175 	39A1
		BCR 	STATUS,5 		//0176 	1283
		LDR 	29H,1 			//0177 	08A9
		BTSS 	STATUS,2 		//0178 	1D03
		LJUMP 	186H 			//0179 	3986

		//;smartkey.C: 496: beep(10,5);
		LDWI 	5H 			//017A 	2A05
		STR 	76H 			//017B 	01F6
		ORG		017CH
		LDWI 	AH 			//017C 	2A0A
		LCALL 	292H 			//017D 	3292
		LDWI 	ACH 			//017E 	2AAC

		//;smartkey.C: 497: RegStatus |=(0x20);
		BSR 	24H,5 			//017F 	1AA4

		//;smartkey.C: 499: setState(1,3500);
		STR 	72H 			//0180 	01F2
		LDWI 	DH 			//0181 	2A0D
		STR 	73H 			//0182 	01F3
		LDWI 	1H 			//0183 	2A01
		ORG		0184H
		LCALL 	2E8H 			//0184 	32E8

		//;smartkey.C: 501: }else{
		LJUMP 	1A1H 			//0185 	39A1

		//;smartkey.C: 502: beepOn();TMR2ON = 0;
		LCALL 	30DH 			//0186 	330D
		LDWI 	1EH 			//0187 	2A1E
		BCR 	STATUS,5 		//0188 	1283
		BCR 	12H,2 			//0189 	1112

		//;smartkey.C: 503: reAlertOn =0;
		CLRR 	78H 			//018A 	0178
		CLRR 	76H 			//018B 	0176
		ORG		018CH
		INCR	76H,1 			//018C 	09F6
		LCALL 	292H 			//018D 	3292
		LDWI 	0H 			//018E 	2A00

		//;smartkey.C: 505: setState(0,0);
		CLRR 	72H 			//018F 	0172
		CLRR 	73H 			//0190 	0173
		LCALL 	2E8H 			//0191 	32E8
		LJUMP 	1A1H 			//0192 	39A1
		LDR 	2AH,0 			//0193 	082A
		ORG		0194H
		XORWI 	1H 			//0194 	2601
		BTSC 	STATUS,2 		//0195 	1503
		LJUMP 	1A1H 			//0196 	39A1
		XORWI 	3H 			//0197 	2603
		BTSC 	STATUS,2 		//0198 	1503
		LJUMP 	158H 			//0199 	3958
		XORWI 	1H 			//019A 	2601
		BTSC 	STATUS,2 		//019B 	1503
		ORG		019CH
		LJUMP 	13CH 			//019C 	393C
		XORWI 	7H 			//019D 	2607
		BTSC 	STATUS,2 		//019E 	1503
		LJUMP 	146H 			//019F 	3946
		LJUMP 	1A1H 			//01A0 	39A1

		//;smartkey.C: 509: }
		//;smartkey.C: 511: }
		//;smartkey.C: 513: if((RC1 ) && (mtState == 1)){
		BCR 	STATUS,5 		//01A1 	1283
		BTSS 	7H,1 			//01A2 	1C87
		LJUMP 	1E1H 			//01A3 	39E1
		ORG		01A4H
		DECRSZ 	2AH,0 		//01A4 	0E2A
		LJUMP 	1E1H 			//01A5 	39E1

		//;smartkey.C: 514: timeTick =0;
		CLRR 	79H 			//01A6 	0179
		CLRR 	7AH 			//01A7 	017A

		//;smartkey.C: 515: while(timeTick <700);
		LDWI 	2H 			//01A8 	2A02
		SUBWR 	7AH,0 			//01A9 	0C7A
		LDWI 	BCH 			//01AA 	2ABC
		BTSC 	STATUS,2 		//01AB 	1503
		ORG		01ACH
		SUBWR 	79H,0 			//01AC 	0C79
		BTSS 	STATUS,0 		//01AD 	1C03
		LJUMP 	1A8H 			//01AE 	39A8

		//;smartkey.C: 517: cntTmp=0;
		CLRR 	20H 			//01AF 	0120
		CLRR 	21H 			//01B0 	0121

		//;smartkey.C: 518: while((RC1) &&( cntTmp<9)){
		LJUMP 	1D0H 			//01B1 	39D0
		LDWI 	0H 			//01B2 	2A00
		SUBWR 	21H,0 			//01B3 	0C21
		ORG		01B4H
		LDWI 	9H 			//01B4 	2A09
		BTSC 	STATUS,2 		//01B5 	1503
		SUBWR 	20H,0 			//01B6 	0C20
		BTSC 	STATUS,0 		//01B7 	1403
		LJUMP 	1D4H 			//01B8 	39D4

		//;smartkey.C: 519: beepOn();TMR2ON = 0; beep(10,1);
		LCALL 	30DH 			//01B9 	330D
		LDWI 	AH 			//01BA 	2A0A
		BCR 	STATUS,5 		//01BB 	1283
		ORG		01BCH
		BCR 	12H,2 			//01BC 	1112
		CLRR 	76H 			//01BD 	0176
		INCR	76H,1 			//01BE 	09F6
		LCALL 	292H 			//01BF 	3292

		//;smartkey.C: 520: cntTmp++;
		INCR	20H,1 			//01C0 	09A0
		BTSC 	STATUS,2 		//01C1 	1503
		INCR	21H,1 			//01C2 	09A1

		//;smartkey.C: 521: _delay((unsigned long)((1000)*(4000000/4000.0)));
		LDWI 	6H 			//01C3 	2A06
		ORG		01C4H
		STR 	2DH 			//01C4 	01AD
		LDWI 	13H 			//01C5 	2A13
		STR 	2CH 			//01C6 	01AC
		LDWI 	B1H 			//01C7 	2AB1
		STR 	2BH 			//01C8 	01AB
		DECRSZ 	2BH,1 		//01C9 	0EAB
		LJUMP 	1C9H 			//01CA 	39C9
		DECRSZ 	2CH,1 		//01CB 	0EAC
		ORG		01CCH
		LJUMP 	1C9H 			//01CC 	39C9
		DECRSZ 	2DH,1 		//01CD 	0EAD
		LJUMP 	1C9H 			//01CE 	39C9
		LJUMP 	1D0H 			//01CF 	39D0
		BCR 	STATUS,5 		//01D0 	1283
		BCR 	STATUS,6 		//01D1 	1303
		BTSC 	7H,1 			//01D2 	1487
		LJUMP 	1B2H 			//01D3 	39B2
		ORG		01D4H

		//;smartkey.C: 522: }
		//;smartkey.C: 523: cntTmp =0;
		CLRR 	20H 			//01D4 	0120
		CLRR 	21H 			//01D5 	0121

		//;smartkey.C: 524: if(RC1){
		BTSS 	7H,1 			//01D6 	1C87
		LJUMP 	1DFH 			//01D7 	39DF
		LDWI 	2CH 			//01D8 	2A2C

		//;smartkey.C: 526: RegStatus &=(~0x20);
		BCR 	24H,5 			//01D9 	12A4

		//;smartkey.C: 527: setState(2,300);
		STR 	72H 			//01DA 	01F2
		LDWI 	1H 			//01DB 	2A01
		ORG		01DCH
		STR 	73H 			//01DC 	01F3
		LDWI 	2H 			//01DD 	2A02
		LCALL 	2E8H 			//01DE 	32E8

		//;smartkey.C: 528: }
		//;smartkey.C: 530: timeTick =0;
		CLRR 	79H 			//01DF 	0179
		CLRR 	7AH 			//01E0 	017A

		//;smartkey.C: 531: }
		//;smartkey.C: 534: if(RegStatus & 0x20) {RC4 =1;RC2 =1;}
		BTSS 	24H,5 			//01E1 	1EA4
		LJUMP 	1E6H 			//01E2 	39E6
		BSR 	7H,4 			//01E3 	1A07
		ORG		01E4H
		BSR 	7H,2 			//01E4 	1907
		LJUMP 	72H 			//01E5 	3872

		//;smartkey.C: 535: else {RC4 =0;RC2 =0;}
		BCR 	7H,4 			//01E6 	1207
		BCR 	7H,2 			//01E7 	1107
		LJUMP 	72H 			//01E8 	3872

		//;smartkey.C: 49: if(PAIE&&PAIF){
		BTSC 	INTCON,3 		//01E9 	158B
		BTSS 	INTCON,0 		//01EA 	1C0B
		LJUMP 	1FBH 			//01EB 	39FB
		ORG		01ECH

		//;smartkey.C: 52: tmp = PORTA;
		BCR 	STATUS,5 		//01EC 	1283
		BCR 	STATUS,6 		//01ED 	1303
		LDR 	5H,0 			//01EE 	0805

		//;smartkey.C: 53: PAIF = 0;
		BCR 	INTCON,0 		//01EF 	100B

		//;smartkey.C: 55: if(RA6){
		BTSS 	5H,6 			//01F0 	1F05
		LJUMP 	1FAH 			//01F1 	39FA

		//;smartkey.C: 57: if(mode_chek == 0){
		LDR 	28H,1 			//01F2 	08A8
		BTSS 	STATUS,2 		//01F3 	1D03
		ORG		01F4H
		LJUMP 	1FBH 			//01F4 	39FB

		//;smartkey.C: 58: cntCyc = 0;
		CLRR 	25H 			//01F5 	0125

		//;smartkey.C: 59: cntOff = 0;
		CLRR 	26H 			//01F6 	0126

		//;smartkey.C: 61: mode_chek = 1;
		CLRR 	28H 			//01F7 	0128
		INCR	28H,1 			//01F8 	09A8
		LJUMP 	1FBH 			//01F9 	39FB

		//;smartkey.C: 66: else{
		//;smartkey.C: 67: cntOff = 0;
		CLRR 	26H 			//01FA 	0126

		//;smartkey.C: 70: }
		//;smartkey.C: 72: }
		//;smartkey.C: 78: if(TMR1IE&&TMR1IF){
		BSR 	STATUS,5 		//01FB 	1A83
		ORG		01FCH
		BCR 	STATUS,6 		//01FC 	1303
		BTSS 	CH,0 			//01FD 	1C0C
		LJUMP 	24DH 			//01FE 	3A4D
		BCR 	STATUS,5 		//01FF 	1283
		BTSS 	CH,0 			//0200 	1C0C
		LJUMP 	24DH 			//0201 	3A4D
		LDWI 	ECH 			//0202 	2AEC

		//;smartkey.C: 80: TMR1IF = 0;
		BCR 	CH,0 			//0203 	100C
		ORG		0204H

		//;smartkey.C: 82: TMR1H = -5000>>8;
		STR 	FH 			//0204 	018F

		//;smartkey.C: 83: TMR1L = -5000;
		LDWI 	78H 			//0205 	2A78
		STR 	EH 			//0206 	018E

		//;smartkey.C: 89: if( mode_chek == 1){
		DECRSZ 	28H,0 		//0207 	0E28
		LJUMP 	221H 			//0208 	3A21

		//;smartkey.C: 91: cntCyc++;
		INCR	25H,1 			//0209 	09A5

		//;smartkey.C: 93: if(RA6==0){
		BTSC 	5H,6 			//020A 	1705
		LJUMP 	221H 			//020B 	3A21
		ORG		020CH
		LDWI 	10H 			//020C 	2A10

		//;smartkey.C: 95: cntOff++;
		INCR	26H,1 			//020D 	09A6

		//;smartkey.C: 98: if(cntOff > 15){
		SUBWR 	26H,0 			//020E 	0C26
		BTSS 	STATUS,0 		//020F 	1C03
		LJUMP 	221H 			//0210 	3A21
		LDWI 	10H 			//0211 	2A10

		//;smartkey.C: 100: mode_chek = 0;
		CLRR 	28H 			//0212 	0128

		//;smartkey.C: 102: if((cntCyc>15) &&(cntCyc<50)) {
		SUBWR 	25H,0 			//0213 	0C25
		ORG		0214H
		LDWI 	32H 			//0214 	2A32
		BTSS 	STATUS,0 		//0215 	1C03
		LJUMP 	21DH 			//0216 	3A1D
		SUBWR 	25H,0 			//0217 	0C25
		BTSC 	STATUS,0 		//0218 	1403
		LJUMP 	21CH 			//0219 	3A1C

		//;smartkey.C: 103: RegStatus |= (0x40);
		BSR 	24H,6 			//021A 	1B24

		//;smartkey.C: 104: } else if (cntCyc>=50){
		LJUMP 	220H 			//021B 	3A20
		ORG		021CH
		LDWI 	32H 			//021C 	2A32
		SUBWR 	25H,0 			//021D 	0C25
		BTSC 	STATUS,0 		//021E 	1403

		//;smartkey.C: 105: RegStatus &= ~(0x40);
		BCR 	24H,6 			//021F 	1324

		//;smartkey.C: 106: }
		//;smartkey.C: 109: RegStatus |= 0x80;
		BSR 	24H,7 			//0220 	1BA4

		//;smartkey.C: 110: }
		//;smartkey.C: 112: }
		//;smartkey.C: 122: }
		//;smartkey.C: 125: timeTick++;
		INCR	79H,1 			//0221 	09F9
		BTSC 	STATUS,2 		//0222 	1503
		INCR	7AH,1 			//0223 	09FA
		ORG		0224H

		//;smartkey.C: 127: if((mtState == 4)||(mtState == 3)){
		LDR 	2AH,0 			//0224 	082A
		XORWI 	4H 			//0225 	2604
		BTSC 	STATUS,2 		//0226 	1503
		LJUMP 	22CH 			//0227 	3A2C
		LDR 	2AH,0 			//0228 	082A
		XORWI 	3H 			//0229 	2603
		BTSS 	STATUS,2 		//022A 	1D03
		LJUMP 	24DH 			//022B 	3A4D
		ORG		022CH

		//;smartkey.C: 129: if(timeTick > cntTmp){
		LDR 	7AH,0 			//022C 	087A
		SUBWR 	21H,0 			//022D 	0C21
		BTSS 	STATUS,2 		//022E 	1D03
		LJUMP 	232H 			//022F 	3A32
		LDR 	79H,0 			//0230 	0879
		SUBWR 	20H,0 			//0231 	0C20
		BTSC 	STATUS,0 		//0232 	1403
		LJUMP 	24DH 			//0233 	3A4D
		ORG		0234H

		//;smartkey.C: 130: cntTmp = timeTick+40;
		LDR 	7AH,0 			//0234 	087A
		STR 	21H 			//0235 	01A1
		LDR 	79H,0 			//0236 	0879
		STR 	20H 			//0237 	01A0
		LDWI 	28H 			//0238 	2A28
		ADDWR 	20H,1 			//0239 	0BA0
		BTSC 	STATUS,0 		//023A 	1403
		INCR	21H,1 			//023B 	09A1
		ORG		023CH

		//;smartkey.C: 131: if(cntTmp<=timeOut)
		LDR 	21H,0 			//023C 	0821
		SUBWR 	23H,0 			//023D 	0C23
		BTSS 	STATUS,2 		//023E 	1D03
		LJUMP 	242H 			//023F 	3A42
		LDR 	20H,0 			//0240 	0820
		SUBWR 	22H,0 			//0241 	0C22

		//;smartkey.C: 132: {
		//;smartkey.C: 133: if(PR2 == 11)
		BSR 	STATUS,5 		//0242 	1A83
		BTSS 	STATUS,0 		//0243 	1C03
		ORG		0244H
		LJUMP 	24EH 			//0244 	3A4E
		LDR 	12H,0 			//0245 	0812
		XORWI 	BH 			//0246 	260B
		BTSS 	STATUS,2 		//0247 	1D03
		LJUMP 	24BH 			//0248 	3A4B

		//;smartkey.C: 134: PR2 = 30;
		LDWI 	1EH 			//0249 	2A1E
		LJUMP 	24CH 			//024A 	3A4C

		//;smartkey.C: 135: else
		//;smartkey.C: 136: PR2 = 11;
		LDWI 	BH 			//024B 	2A0B
		ORG		024CH
		STR 	12H 			//024C 	0192

		//;smartkey.C: 137: }
		//;smartkey.C: 138: }
		//;smartkey.C: 139: }
		//;smartkey.C: 142: }
		//;smartkey.C: 145: if(TMR2IE&&TMR2IF)
		BSR 	STATUS,5 		//024D 	1A83
		BTSS 	CH,1 			//024E 	1C8C
		LJUMP 	256H 			//024F 	3A56
		BCR 	STATUS,5 		//0250 	1283
		BTSS 	CH,1 			//0251 	1C8C
		LJUMP 	256H 			//0252 	3A56
		LDWI 	10H 			//0253 	2A10
		ORG		0254H

		//;smartkey.C: 146: {
		//;smartkey.C: 147: TMR2IF = 0;
		BCR 	CH,1 			//0254 	108C

		//;smartkey.C: 148: RA4 =~ RA4;
		XORWR 	5H,1 			//0255 	0485
		LDR 	71H,0 			//0256 	0871
		STR 	PCLATH 			//0257 	018A
		SWAPR 	70H,0 			//0258 	0770
		STR 	STATUS 			//0259 	0183
		SWAPR 	7EH,1 			//025A 	07FE
		SWAPR 	7EH,0 			//025B 	077E
		ORG		025CH
		RETI		 			//025C 	0009

		//;sysinit.c: 72: INTCON = 0B00000000;
		CLRR 	INTCON 			//025D 	010B

		//;sysinit.c: 73: PIE1 = 0B00000000;
		BSR 	STATUS,5 		//025E 	1A83
		CLRR 	CH 			//025F 	010C

		//;sysinit.c: 74: PIR1 = 0B00000000;
		BCR 	STATUS,5 		//0260 	1283
		CLRR 	CH 			//0261 	010C

		//;sysinit.c: 76: IOCA6 = 1;
		BSR 	STATUS,5 		//0262 	1A83
		BSR 	16H,6 			//0263 	1B16
		ORG		0264H

		//;sysinit.c: 77: tmp = PORTA;
		BCR 	STATUS,5 		//0264 	1283
		LDR 	5H,0 			//0265 	0805

		//;sysinit.c: 78: PAIF = 0;
		BCR 	INTCON,0 		//0266 	100B

		//;sysinit.c: 79: PAIE = 0;
		BCR 	INTCON,3 		//0267 	118B

		//;sysinit.c: 82: INTEDG = 0;
		BSR 	STATUS,5 		//0268 	1A83
		BCR 	1H,6 			//0269 	1301

		//;sysinit.c: 83: INTF = 0;
		BCR 	INTCON,1 		//026A 	108B

		//;sysinit.c: 84: INTE = 0;
		BCR 	INTCON,4 		//026B 	120B
		ORG		026CH

		//;sysinit.c: 86: TMR2IF = 0;
		BCR 	STATUS,5 		//026C 	1283
		BCR 	CH,1 			//026D 	108C

		//;sysinit.c: 87: TMR2IE = 1;
		BSR 	STATUS,5 		//026E 	1A83
		BSR 	CH,1 			//026F 	188C

		//;sysinit.c: 88: TMR2ON = 0;
		BCR 	STATUS,5 		//0270 	1283
		BCR 	12H,2 			//0271 	1112

		//;sysinit.c: 90: TMR1IF = 0;
		BCR 	CH,0 			//0272 	100C

		//;sysinit.c: 91: TMR1IE = 1;
		BSR 	STATUS,5 		//0273 	1A83
		ORG		0274H
		BSR 	CH,0 			//0274 	180C

		//;sysinit.c: 94: PEIE = 1;
		BSR 	INTCON,6 		//0275 	1B0B

		//;sysinit.c: 96: GIE = 1;
		BSR 	INTCON,7 		//0276 	1B8B
		RET		 					//0277 	0004
		STR 	73H 			//0278 	01F3

		//;smartkey.C: 197: GIE = 0;
		BCR 	INTCON,7 		//0279 	138B

		//;smartkey.C: 198: while(GIE) asm("clrwdt");
		BTSS 	INTCON,7 		//027A 	1F8B
		LJUMP 	27EH 			//027B 	3A7E
		ORG		027CH
		CLRWDT	 			//027C 	0001
		LJUMP 	27AH 			//027D 	3A7A

		//;smartkey.C: 199: EEADR = EEAddr;
		LDR 	73H,0 			//027E 	0873
		BSR 	STATUS,5 		//027F 	1A83
		BCR 	STATUS,6 		//0280 	1303
		STR 	1BH 			//0281 	019B

		//;smartkey.C: 200: EEDAT = EEData;
		LDR 	72H,0 			//0282 	0872
		STR 	1AH 			//0283 	019A
		ORG		0284H
		LDWI 	34H 			//0284 	2A34

		//;smartkey.C: 201: EEIF = 0;
		BCR 	STATUS,5 		//0285 	1283
		BCR 	CH,7 			//0286 	138C

		//;smartkey.C: 202: EECON1 = 0x34;
		BSR 	STATUS,5 		//0287 	1A83
		STR 	1CH 			//0288 	019C

		//;smartkey.C: 203: WR = 1;
		BSR 	1DH,0 			//0289 	181D

		//;smartkey.C: 204: while(WR) asm("clrwdt");
		BSR 	STATUS,5 		//028A 	1A83
		BCR 	STATUS,6 		//028B 	1303
		ORG		028CH
		BTSS 	1DH,0 			//028C 	1C1D
		LJUMP 	290H 			//028D 	3A90
		CLRWDT	 			//028E 	0001
		LJUMP 	28AH 			//028F 	3A8A

		//;smartkey.C: 206: GIE = 1;
		BSR 	INTCON,7 		//0290 	1B8B
		RET		 					//0291 	0004
		STR 	77H 			//0292 	01F7

		//;smartkey.C: 169: {
		//;smartkey.C: 171: while(rep--){
		DECR 	76H,1 			//0293 	0DF6
		ORG		0294H
		LDR 	76H,0 			//0294 	0876
		XORWI 	FFH 			//0295 	26FF
		BTSC 	STATUS,2 		//0296 	1503
		RET		 					//0297 	0004
		LDWI 	CH 			//0298 	2A0C

		//;smartkey.C: 172: TMR2ON = 1;
		BSR 	12H,2 			//0299 	1912

		//;smartkey.C: 173: PR2 = 12;
		BSR 	STATUS,5 		//029A 	1A83
		STR 	12H 			//029B 	0192
		ORG		029CH

		//;smartkey.C: 174: delay_x10ms(delay);
		LDR 	77H,0 			//029C 	0877
		STR 	72H 			//029D 	01F2
		CLRR 	73H 			//029E 	0173
		LCALL 	2A8H 			//029F 	32A8
		LDWI 	14H 			//02A0 	2A14

		//;smartkey.C: 175: TMR2ON = 0;RA4 =0;
		BCR 	STATUS,5 		//02A1 	1283
		BCR 	12H,2 			//02A2 	1112
		BCR 	5H,4 			//02A3 	1205
		ORG		02A4H

		//;smartkey.C: 176: delay_x10ms(20);
		STR 	72H 			//02A4 	01F2
		CLRR 	73H 			//02A5 	0173
		LCALL 	2A8H 			//02A6 	32A8
		LJUMP 	293H 			//02A7 	3A93

		//;smartkey.C: 155: unsigned int set = t + timeTick;
		LDR 	73H,0 			//02A8 	0873
		STR 	75H 			//02A9 	01F5
		LDR 	72H,0 			//02AA 	0872
		STR 	74H 			//02AB 	01F4
		ORG		02ACH
		LDR 	79H,0 			//02AC 	0879
		ADDWR 	74H,1 			//02AD 	0BF4
		BTSC 	STATUS,0 		//02AE 	1403
		INCR	75H,1 			//02AF 	09F5
		LDR 	7AH,0 			//02B0 	087A
		ADDWR 	75H,1 			//02B1 	0BF5

		//;smartkey.C: 156: while(timeTick < set);
		LDR 	75H,0 			//02B2 	0875
		SUBWR 	7AH,0 			//02B3 	0C7A
		ORG		02B4H
		BTSS 	STATUS,2 		//02B4 	1D03
		LJUMP 	2B8H 			//02B5 	3AB8
		LDR 	74H,0 			//02B6 	0874
		SUBWR 	79H,0 			//02B7 	0C79
		BTSC 	STATUS,0 		//02B8 	1403
		RET		 					//02B9 	0004
		LJUMP 	2B2H 			//02BA 	3AB2
		CLRR 	79H 			//02BB 	0179
		ORG		02BCH
		CLRR 	7AH 			//02BC 	017A
		CLRR 	20H 			//02BD 	0120
		CLRR 	21H 			//02BE 	0121
		CLRR 	22H 			//02BF 	0122
		CLRR 	23H 			//02C0 	0123
		CLRR 	24H 			//02C1 	0124
		CLRR 	25H 			//02C2 	0125
		CLRR 	26H 			//02C3 	0126
		ORG		02C4H
		CLRR 	27H 			//02C4 	0127
		CLRR 	28H 			//02C5 	0128
		CLRR 	29H 			//02C6 	0129
		CLRR 	2AH 			//02C7 	012A
		CLRR 	STATUS 			//02C8 	0103
		LJUMP 	0BH 			//02C9 	380B

		//;sysinit.c: 55: TMR2 = 0;
		BCR 	STATUS,5 		//02CA 	1283
		CLRR 	11H 			//02CB 	0111
		ORG		02CCH

		//;sysinit.c: 56: PR2 = 0;
		BSR 	STATUS,5 		//02CC 	1A83
		CLRR 	12H 			//02CD 	0112

		//;sysinit.c: 57: T2CON = 0B00101001;
		LDWI 	29H 			//02CE 	2A29
		BCR 	STATUS,5 		//02CF 	1283
		STR 	12H 			//02D0 	0192

		//;sysinit.c: 60: TMR1H = -5000>>8;
		LDWI 	ECH 			//02D1 	2AEC
		STR 	FH 			//02D2 	018F

		//;sysinit.c: 61: TMR1L = -5000;
		LDWI 	78H 			//02D3 	2A78
		ORG		02D4H
		STR 	EH 			//02D4 	018E

		//;sysinit.c: 62: T1CON = 0B00100001;
		LDWI 	21H 			//02D5 	2A21
		STR 	10H 			//02D6 	0190

		//;sysinit.c: 63: TMR1ON = 1;
		BSR 	10H,0 			//02D7 	1810
		RET		 					//02D8 	0004

		//;sysinit.c: 34: PORTA = 0B00000000;
		BCR 	STATUS,5 		//02D9 	1283
		CLRR 	5H 			//02DA 	0105

		//;sysinit.c: 35: TRISA = 0B01101110;
		LDWI 	6EH 			//02DB 	2A6E
		ORG		02DCH
		BSR 	STATUS,5 		//02DC 	1A83
		STR 	5H 			//02DD 	0185

		//;sysinit.c: 36: WPUA = 0B10010000;
		LDWI 	90H 			//02DE 	2A90
		STR 	15H 			//02DF 	0195

		//;sysinit.c: 38: PORTC = 0B00000000;
		BCR 	STATUS,5 		//02E0 	1283
		CLRR 	7H 			//02E1 	0107

		//;sysinit.c: 39: TRISC = 0B11101011;
		LDWI 	EBH 			//02E2 	2AEB
		BSR 	STATUS,5 		//02E3 	1A83
		ORG		02E4H
		STR 	7H 			//02E4 	0187

		//;sysinit.c: 40: WPUC = 0B00010000;
		LDWI 	10H 			//02E5 	2A10
		STR 	8H 			//02E6 	0188
		RET		 					//02E7 	0004
		STR 	74H 			//02E8 	01F4

		//;smartkey.C: 212: mtOldState = mtState;
		BCR 	STATUS,5 		//02E9 	1283
		LDR 	2AH,0 			//02EA 	082A
		STR 	29H 			//02EB 	01A9
		ORG		02ECH

		//;smartkey.C: 213: mtState = stt;
		LDR 	74H,0 			//02EC 	0874
		STR 	2AH 			//02ED 	01AA

		//;smartkey.C: 214: timeTick =0;
		CLRR 	79H 			//02EE 	0179
		CLRR 	7AH 			//02EF 	017A

		//;smartkey.C: 215: timeOut = _tOut;
		LDR 	73H,0 			//02F0 	0873
		STR 	23H 			//02F1 	01A3
		LDR 	72H,0 			//02F2 	0872
		STR 	22H 			//02F3 	01A2
		ORG		02F4H
		RET		 					//02F4 	0004

		//;sysinit.c: 21: OSCCON = 0B01010001;
		LDWI 	51H 			//02F5 	2A51
		BSR 	STATUS,5 		//02F6 	1A83
		BCR 	STATUS,6 		//02F7 	1303
		STR 	FH 			//02F8 	018F

		//;sysinit.c: 22: _nop();
		NOP		 					//02F9 	0000

		//;sysinit.c: 28: while(HTS==0);
		BSR 	STATUS,5 		//02FA 	1A83
		BCR 	STATUS,6 		//02FB 	1303
		ORG		02FCH
		BTSC 	FH,2 			//02FC 	150F
		RET		 					//02FD 	0004
		LJUMP 	2FAH 			//02FE 	3AFA
		STR 	72H 			//02FF 	01F2

		//;smartkey.C: 186: unsigned char ReEepromData;
		//;smartkey.C: 188: EEADR = EEAddr;
		BSR 	STATUS,5 		//0300 	1A83
		BCR 	STATUS,6 		//0301 	1303
		STR 	1BH 			//0302 	019B

		//;smartkey.C: 189: RD = 1;
		BSR 	1CH,0 			//0303 	181C
		ORG		0304H

		//;smartkey.C: 190: ReEepromData = EEDAT;
		LDR 	1AH,0 			//0304 	081A
		STR 	73H 			//0305 	01F3

		//;smartkey.C: 191: RD = 0;
		BCR 	1CH,0 			//0306 	101C

		//;smartkey.C: 192: return ReEepromData;
		RET		 					//0307 	0004
		LJUMP 	12EH 			//0308 	392E
		LJUMP 	85H 			//0309 	3885
		LJUMP 	86H 			//030A 	3886
		LJUMP 	BEH 			//030B 	38BE
		ORG		030CH
		LJUMP 	D7H 			//030C 	38D7

		//;smartkey.C: 163: TMR2ON = 1;
		BCR 	STATUS,5 		//030D 	1283
		BSR 	12H,2 			//030E 	1912

		//;smartkey.C: 164: TRISA &= 0xef;
		BSR 	STATUS,5 		//030F 	1A83
		BCR 	5H,4 			//0310 	1205
		RET		 					//0311 	0004

		//;smartkey.C: 160: TMR2ON = 0;RA4 =0;TRISA |= 0x10;
		BCR 	12H,2 			//0312 	1112
		BCR 	5H,4 			//0313 	1205
		ORG		0314H
		BSR 	STATUS,5 		//0314 	1A83
		BSR 	5H,4 			//0315 	1A05
		RET		 					//0316 	0004
			END
