opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F685
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_sys_init
	FNCALL	_main,_gpio_init
	FNCALL	_main,_timer_init
	FNCALL	_main,_int_init
	FNCALL	_main,_setState
	FNCALL	_main,_WRITE_EEPROM
	FNCALL	_main,_delay_x10ms
	FNCALL	_main,_READ_EEPROM
	FNCALL	_main,_beepOn
	FNCALL	_main,_beep
	FNCALL	_main,_beepOff
	FNCALL	_beep,_delay_x10ms
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_cntTmp
	global	_timeOut
	global	_RegStatus
	global	_cntCyc
	global	_cntOff
	global	_lostDetect
	global	_mode_chek
	global	_mtOldState
	global	_mtState
	global	_timeTick
	global	_ANSEL
psect	text456,local,class=CODE,delta=2
global __ptext456
__ptext456:
_ANSEL	set	286
	DABS	1,286,1	;_ANSEL

	global	_ANSELH
_ANSELH	set	287
	DABS	1,287,1	;_ANSELH

	global	_CM1CON0
_CM1CON0	set	281
	DABS	1,281,1	;_CM1CON0

	global	_CM2CON0
_CM2CON0	set	282
	DABS	1,282,1	;_CM2CON0

	global	_CM2CON1
_CM2CON1	set	283
	DABS	1,283,1	;_CM2CON1

	global	_EEADRH
_EEADRH	set	271
	DABS	1,271,1	;_EEADRH

	global	_EEDATH
_EEDATH	set	270
	DABS	1,270,1	;_EEDATH

	global	_IOCB
_IOCB	set	278
	DABS	1,278,1	;_IOCB

	global	_PSTRCON
_PSTRCON	set	413
	DABS	1,413,1	;_PSTRCON

	global	_SRCON
_SRCON	set	414
	DABS	1,414,1	;_SRCON

	global	_VRCON
_VRCON	set	280
	DABS	1,280,1	;_VRCON

	global	_WPUB
_WPUB	set	277
	DABS	1,277,1	;_WPUB

	global	_ANS0
_ANS0	set	2288
	DABS	1,286,1	;_ANS0

	global	_ANS1
_ANS1	set	2289
	DABS	1,286,1	;_ANS1

	global	_ANS10
_ANS10	set	2298
	DABS	1,287,1	;_ANS10

	global	_ANS11
_ANS11	set	2299
	DABS	1,287,1	;_ANS11

	global	_ANS2
_ANS2	set	2290
	DABS	1,286,1	;_ANS2

	global	_ANS3
_ANS3	set	2291
	DABS	1,286,1	;_ANS3

	global	_ANS4
_ANS4	set	2292
	DABS	1,286,1	;_ANS4

	global	_ANS5
_ANS5	set	2293
	DABS	1,286,1	;_ANS5

	global	_ANS6
_ANS6	set	2294
	DABS	1,286,1	;_ANS6

	global	_ANS7
_ANS7	set	2295
	DABS	1,286,1	;_ANS7

	global	_ANS8
_ANS8	set	2296
	DABS	1,287,1	;_ANS8

	global	_ANS9
_ANS9	set	2297
	DABS	1,287,1	;_ANS9

	global	_C1CH0
_C1CH0	set	2248
	DABS	1,281,1	;_C1CH0

	global	_C1CH1
_C1CH1	set	2249
	DABS	1,281,1	;_C1CH1

	global	_C1OE
_C1OE	set	2253
	DABS	1,281,1	;_C1OE

	global	_C1ON
_C1ON	set	2255
	DABS	1,281,1	;_C1ON

	global	_C1OUT
_C1OUT	set	2254
	DABS	1,281,1	;_C1OUT

	global	_C1POL
_C1POL	set	2252
	DABS	1,281,1	;_C1POL

	global	_C1R
_C1R	set	2250
	DABS	1,281,1	;_C1R

	global	_C1SEN
_C1SEN	set	3317
	DABS	1,414,1	;_C1SEN

	global	_C1VREN
_C1VREN	set	2247
	DABS	1,280,1	;_C1VREN

	global	_C2CH0
_C2CH0	set	2256
	DABS	1,282,1	;_C2CH0

	global	_C2CH1
_C2CH1	set	2257
	DABS	1,282,1	;_C2CH1

	global	_C2OE
_C2OE	set	2261
	DABS	1,282,1	;_C2OE

	global	_C2ON
_C2ON	set	2263
	DABS	1,282,1	;_C2ON

	global	_C2OUT
_C2OUT	set	2262
	DABS	1,282,1	;_C2OUT

	global	_C2POL
_C2POL	set	2260
	DABS	1,282,1	;_C2POL

	global	_C2R
_C2R	set	2258
	DABS	1,282,1	;_C2R

	global	_C2REN
_C2REN	set	3316
	DABS	1,414,1	;_C2REN

	global	_C2SYNC
_C2SYNC	set	2264
	DABS	1,283,1	;_C2SYNC

	global	_C2VREN
_C2VREN	set	2246
	DABS	1,280,1	;_C2VREN

	global	_EEPGD
_EEPGD	set	3175
	DABS	1,396,1	;_EEPGD

	global	_IOCB4
_IOCB4	set	2228
	DABS	1,278,1	;_IOCB4

	global	_IOCB5
_IOCB5	set	2229
	DABS	1,278,1	;_IOCB5

	global	_IOCB6
_IOCB6	set	2230
	DABS	1,278,1	;_IOCB6

	global	_IOCB7
_IOCB7	set	2231
	DABS	1,278,1	;_IOCB7

	global	_MC1OUT
_MC1OUT	set	2271
	DABS	1,283,1	;_MC1OUT

	global	_MC2OUT
_MC2OUT	set	2270
	DABS	1,283,1	;_MC2OUT

	global	_PULSR
_PULSR	set	3314
	DABS	1,414,1	;_PULSR

	global	_PULSS
_PULSS	set	3315
	DABS	1,414,1	;_PULSS

	global	_SR0
_SR0	set	3318
	DABS	1,414,1	;_SR0

	global	_SR1
_SR1	set	3319
	DABS	1,414,1	;_SR1

	global	_STRA
_STRA	set	3304
	DABS	1,413,1	;_STRA

	global	_STRB
_STRB	set	3305
	DABS	1,413,1	;_STRB

	global	_STRC
_STRC	set	3306
	DABS	1,413,1	;_STRC

	global	_STRD
_STRD	set	3307
	DABS	1,413,1	;_STRD

	global	_STRSYNC
_STRSYNC	set	3308
	DABS	1,413,1	;_STRSYNC

	global	_T1GSS
_T1GSS	set	2265
	DABS	1,283,1	;_T1GSS

	global	_VP6EN
_VP6EN	set	2244
	DABS	1,280,1	;_VP6EN

	global	_VR0
_VR0	set	2240
	DABS	1,280,1	;_VR0

	global	_VR1
_VR1	set	2241
	DABS	1,280,1	;_VR1

	global	_VR2
_VR2	set	2242
	DABS	1,280,1	;_VR2

	global	_VR3
_VR3	set	2243
	DABS	1,280,1	;_VR3

	global	_VRR
_VRR	set	2245
	DABS	1,280,1	;_VRR

	global	_WPUB4
_WPUB4	set	2220
	DABS	1,277,1	;_WPUB4

	global	_WPUB5
_WPUB5	set	2221
	DABS	1,277,1	;_WPUB5

	global	_WPUB6
_WPUB6	set	2222
	DABS	1,277,1	;_WPUB6

	global	_WPUB7
_WPUB7	set	2223
	DABS	1,277,1	;_WPUB7

	global	_WREN
_WREN	set	3170
	DABS	1,396,1	;_WREN

	global	_INTCON
_INTCON	set	11
	global	_MSCON
_MSCON	set	27
	global	_PIR1
_PIR1	set	12
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_T0CON0
_T0CON0	set	31
	global	_T2CON0
_T2CON0	set	18
	global	_TMR0
_TMR0	set	1
	global	_TMR2H
_TMR2H	set	19
	global	_TMR2L
_TMR2L	set	17
	global	_EEIF
_EEIF	set	103
	global	_GIE
_GIE	set	95
	global	_INTE
_INTE	set	92
	global	_INTF
_INTF	set	89
	global	_PAIE
_PAIE	set	91
	global	_PAIF
_PAIF	set	88
	global	_PEIE
_PEIE	set	94
	global	_RA0
_RA0	set	40
	global	_RA5
_RA5	set	45
	global	_RA6
_RA6	set	46
	global	_RA7
_RA7	set	47
	global	_RC1
_RC1	set	57
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_T0ON
_T0ON	set	251
	global	_TMR2IF
_TMR2IF	set	97
	global	_TMR2ON
_TMR2ON	set	146
	global	_EEADR
_EEADR	set	155
	global	_EECON1
_EECON1	set	156
	global	_EEDAT
_EEDAT	set	154
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_PIE1
_PIE1	set	140
	global	_PR2H
_PR2H	set	146
	global	_PR2L
_PR2L	set	145
	global	_PSINKA
_PSINKA	set	151
	global	_PSINKC
_PSINKC	set	159
	global	_PSRCA
_PSRCA	set	136
	global	_PSRCC
_PSRCC	set	148
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WPUA
_WPUA	set	149
	global	_WPUC
_WPUC	set	147
	global	_HTS
_HTS	set	1146
	global	_INTEDG
_INTEDG	set	1038
	global	_IOCA6
_IOCA6	set	1206
	global	_RD
_RD	set	1248
	global	_TMR2IE
_TMR2IE	set	1121
	global	_WR
_WR	set	1256
	file	"smartkey.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_timeTick:
       ds      2

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_cntTmp:
       ds      2

_timeOut:
       ds      2

_RegStatus:
       ds      1

_cntCyc:
       ds      1

_cntOff:
       ds      1

_lostDetect:
       ds      1

_mode_chek:
       ds      1

_mtOldState:
       ds      1

_mtState:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
	clrf	((__pbssBANK0)+8)&07Fh
	clrf	((__pbssBANK0)+9)&07Fh
	clrf	((__pbssBANK0)+10)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_sys_init
?_sys_init:	; 0 bytes @ 0x0
	global	?_gpio_init
?_gpio_init:	; 0 bytes @ 0x0
	global	?_timer_init
?_timer_init:	; 0 bytes @ 0x0
	global	?_int_init
?_int_init:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_beepOff
?_beepOff:	; 0 bytes @ 0x0
	global	?_beepOn
?_beepOn:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_READ_EEPROM
?_READ_EEPROM:	; 1 bytes @ 0x0
	ds	2
	global	??_sys_init
??_sys_init:	; 0 bytes @ 0x2
	global	??_gpio_init
??_gpio_init:	; 0 bytes @ 0x2
	global	??_timer_init
??_timer_init:	; 0 bytes @ 0x2
	global	??_int_init
??_int_init:	; 0 bytes @ 0x2
	global	?_delay_x10ms
?_delay_x10ms:	; 0 bytes @ 0x2
	global	??_beepOff
??_beepOff:	; 0 bytes @ 0x2
	global	??_beepOn
??_beepOn:	; 0 bytes @ 0x2
	global	??_READ_EEPROM
??_READ_EEPROM:	; 0 bytes @ 0x2
	global	?_WRITE_EEPROM
?_WRITE_EEPROM:	; 0 bytes @ 0x2
	global	?_setState
?_setState:	; 0 bytes @ 0x2
	global	READ_EEPROM@EEAddr
READ_EEPROM@EEAddr:	; 1 bytes @ 0x2
	global	WRITE_EEPROM@EEData
WRITE_EEPROM@EEData:	; 1 bytes @ 0x2
	global	delay_x10ms@t
delay_x10ms@t:	; 2 bytes @ 0x2
	global	setState@_tOut
setState@_tOut:	; 2 bytes @ 0x2
	ds	1
	global	??_WRITE_EEPROM
??_WRITE_EEPROM:	; 0 bytes @ 0x3
	global	READ_EEPROM@ReEepromData
READ_EEPROM@ReEepromData:	; 1 bytes @ 0x3
	global	WRITE_EEPROM@EEAddr
WRITE_EEPROM@EEAddr:	; 1 bytes @ 0x3
	ds	1
	global	??_delay_x10ms
??_delay_x10ms:	; 0 bytes @ 0x4
	global	??_setState
??_setState:	; 0 bytes @ 0x4
	global	setState@stt
setState@stt:	; 1 bytes @ 0x4
	global	delay_x10ms@set
delay_x10ms@set:	; 2 bytes @ 0x4
	ds	2
	global	?_beep
?_beep:	; 0 bytes @ 0x6
	global	beep@rep
beep@rep:	; 1 bytes @ 0x6
	ds	1
	global	??_beep
??_beep:	; 0 bytes @ 0x7
	global	beep@delay
beep@delay:	; 1 bytes @ 0x7
	ds	1
	global	main@reAlertOn
main@reAlertOn:	; 1 bytes @ 0x8
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	3
;;Data sizes: Strings 0, constant 0, data 0, bss 13, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9      11
;; BANK0           80      3      14
;; BANK1           32      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_beep
;;   _beep->_delay_x10ms
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 4     4      0     380
;;                                              8 COMMON     1     1      0
;;                                              0 BANK0      3     3      0
;;                           _sys_init
;;                          _gpio_init
;;                         _timer_init
;;                           _int_init
;;                           _setState
;;                       _WRITE_EEPROM
;;                        _delay_x10ms
;;                        _READ_EEPROM
;;                             _beepOn
;;                               _beep
;;                            _beepOff
;; ---------------------------------------------------------------------------------
;; (1) _sys_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _beep                                                 2     1      1      90
;;                                              6 COMMON     2     1      1
;;                        _delay_x10ms
;; ---------------------------------------------------------------------------------
;; (1) _int_init                                             1     1      0       0
;; ---------------------------------------------------------------------------------
;; (1) _timer_init                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _gpio_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _setState                                             3     1      2      44
;;                                              2 COMMON     3     1      2
;; ---------------------------------------------------------------------------------
;; (1) _WRITE_EEPROM                                         2     1      1      44
;;                                              2 COMMON     2     1      1
;; ---------------------------------------------------------------------------------
;; (1) _READ_EEPROM                                          2     2      0      45
;;                                              2 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _beepOn                                               0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _beepOff                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _delay_x10ms                                          4     2      2      46
;;                                              2 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _ISR                                                  3     3      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _sys_init
;;   _gpio_init
;;   _timer_init
;;   _int_init
;;   _setState
;;   _WRITE_EEPROM
;;   _delay_x10ms
;;   _READ_EEPROM
;;   _beepOn
;;   _beep
;;     _delay_x10ms
;;   _beepOff
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      9       B       1       78.6%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;BITBANK0            50      0       0       3        0.0%
;;BANK0               50      3       E       4       17.5%
;;BANK1               20      0       0       5        0.0%
;;ABS                  0      0      19       6        0.0%
;;BITBANK1            20      0       0       7        0.0%
;;DATA                 0      0      1B       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 216 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  reAlertOn       1    8[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 20/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         1       0       0
;;      Temps:          0       3       0
;;      Totals:         1       3       0
;;Total ram usage:        4 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_sys_init
;;		_gpio_init
;;		_timer_init
;;		_int_init
;;		_setState
;;		_WRITE_EEPROM
;;		_delay_x10ms
;;		_READ_EEPROM
;;		_beepOn
;;		_beep
;;		_beepOff
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"smartkey.C"
	line	216
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	219
	
l4490:	
;smartkey.C: 219: unsigned char reAlertOn=0;
	clrf	(main@reAlertOn)
	line	222
	
l4492:	
# 222 "smartkey.C"
clrwdt ;#
psect	maintext
	line	224
	
l4494:	
;smartkey.C: 224: sys_init();
	fcall	_sys_init
	line	225
	
l4496:	
;smartkey.C: 225: gpio_init();
	fcall	_gpio_init
	line	227
	
l4498:	
;smartkey.C: 227: timer_init();
	fcall	_timer_init
	line	228
	
l4500:	
;smartkey.C: 228: int_init();
	fcall	_int_init
	line	232
	
l4502:	
;smartkey.C: 232: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u1487:
	decfsz	((??_main+0)+0),f
	goto	u1487
	decfsz	((??_main+0)+0+1),f
	goto	u1487
	nop2
opt asmopt_on

	line	234
	
l4504:	
;smartkey.C: 234: RA7 =1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(47/8),(47)&7
	line	235
	
l4506:	
;smartkey.C: 235: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
movwf	((??_main+0)+0+1),f
	movlw	221
movwf	((??_main+0)+0),f
u1497:
	decfsz	((??_main+0)+0),f
	goto	u1497
	decfsz	((??_main+0)+0+1),f
	goto	u1497
	nop2
opt asmopt_on

	line	237
	
l4508:	
;smartkey.C: 237: PAIE = 1;
	bsf	(91/8),(91)&7
	line	239
;smartkey.C: 239: RegStatus = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_RegStatus)
	line	241
	
l4510:	
;smartkey.C: 241: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	247
	
l4512:	
;smartkey.C: 247: WRITE_EEPROM(0xFF,0xAA);
	movlw	(0AAh)
	movwf	(?_WRITE_EEPROM)
	movlw	(0FFh)
	fcall	_WRITE_EEPROM
	line	248
	
l4514:	
;smartkey.C: 248: WRITE_EEPROM(0xFF,0xAA);
	movlw	(0AAh)
	movwf	(?_WRITE_EEPROM)
	movlw	(0FFh)
	fcall	_WRITE_EEPROM
	line	251
	
l4516:	
;smartkey.C: 251: delay_x10ms(1);
	clrf	(?_delay_x10ms)
	incf	(?_delay_x10ms),f
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	253
	
l4518:	
;smartkey.C: 253: if(READ_EEPROM(0x08)==0xff) {WRITE_EEPROM(0x08,0);_delay((unsigned long)((2)*(4000000/4000.0)));}
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0FFh
	skipz
	goto	u1151
	goto	u1150
u1151:
	goto	l4524
u1150:
	
l4520:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	
l4522:	
	opt asmopt_off
movlw	3
	bcf	status, 5	;RP0=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	151
movwf	((??_main+0)+0),f
u1507:
	decfsz	((??_main+0)+0),f
	goto	u1507
	decfsz	((??_main+0)+0+1),f
	goto	u1507
	nop2
opt asmopt_on

	line	255
	
l4524:	
;smartkey.C: 255: if(READ_EEPROM(0x08)==0xcc){
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u1161
	goto	u1160
u1161:
	goto	l4538
u1160:
	line	256
	
l4526:	
;smartkey.C: 256: RegStatus &=~(0x20);
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_RegStatus)+(5/8),(5)&7
	line	257
	
l4528:	
;smartkey.C: 257: setState(3,1800);
	movlw	low(0708h)
	movwf	(?_setState)
	movlw	high(0708h)
	movwf	((?_setState))+1
	movlw	(03h)
	fcall	_setState
	line	258
	
l4530:	
;smartkey.C: 258: mtOldState = 1;
	clrf	(_mtOldState)
	incf	(_mtOldState),f
	line	259
	
l4532:	
;smartkey.C: 259: cntTmp = timeTick+50;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l4534:	
	movlw	032h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	260
	
l4536:	
;smartkey.C: 260: PR2L =12;
	movlw	(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	261
;smartkey.C: 261: beepOn();
	fcall	_beepOn
	line	262
;smartkey.C: 262: } else {
	goto	l4542
	line	263
	
l4538:	
;smartkey.C: 263: setState(2,400);
	movlw	low(0190h)
	movwf	(?_setState)
	movlw	high(0190h)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	265
	
l4540:	
;smartkey.C: 265: mtOldState = 0;
	clrf	(_mtOldState)
	line	309
	
l4542:	
;smartkey.C: 309: RA0 =RA6;
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(46/8),(46)&7
	goto	u1171
	goto	u1170
	
u1171:
	bcf	status, 5	;RP0=0, select bank0
	bsf	(40/8),(40)&7
	goto	u1184
u1170:
	bcf	status, 5	;RP0=0, select bank0
	bcf	(40/8),(40)&7
u1184:
	line	312
	
l4544:	
;smartkey.C: 312: if(mode_chek == 0)
	movf	(_mode_chek),f
	skipz
	goto	u1191
	goto	u1190
u1191:
	goto	l4636
u1190:
	line	315
	
l4546:	
;smartkey.C: 313: {
;smartkey.C: 315: if(RegStatus & 0x80)
	btfss	(_RegStatus),(7)&7
	goto	u1201
	goto	u1200
u1201:
	goto	l4636
u1200:
	line	317
	
l4548:	
;smartkey.C: 316: {
;smartkey.C: 317: PAIE = 0;
	bcf	(91/8),(91)&7
	line	320
;smartkey.C: 320: RegStatus &= (~0x80);
	bcf	(_RegStatus)+(7/8),(7)&7
	line	334
;smartkey.C: 332: {
;smartkey.C: 334: if ((RegStatus & 0x40) !=0){
	btfss	(_RegStatus),(6)&7
	goto	u1211
	goto	u1210
u1211:
	goto	l4634
u1210:
	goto	l4600
	line	347
	
l4552:	
;smartkey.C: 347: lostDetect =0;
	clrf	(_lostDetect)
	line	348
;smartkey.C: 348: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	349
;smartkey.C: 349: break;
	goto	l897
	line	352
	
l4554:	
;smartkey.C: 352: if(timeTick >30){
	movlw	high(01Fh)
	subwf	(_timeTick+1),w
	movlw	low(01Fh)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u1221
	goto	u1220
u1221:
	goto	l897
u1220:
	line	353
	
l4556:	
;smartkey.C: 353: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	355
	
l4558:	
;smartkey.C: 355: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u1231
	goto	u1230
u1231:
	goto	l4562
u1230:
	
l4560:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	357
	
l4562:	
;smartkey.C: 357: if((mtOldState == 3)){
	bcf	status, 5	;RP0=0, select bank0
	movf	(_mtOldState),w
	xorlw	03h
	skipz
	goto	u1241
	goto	u1240
u1241:
	goto	l4572
u1240:
	line	358
	
l4564:	
;smartkey.C: 358: beepOn();TMR2ON = 0; beep(10,1);
	fcall	_beepOn
	
l4566:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l4568:	
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	359
;smartkey.C: 359: if(reAlertOn)reAlertOn =0;
	movf	(main@reAlertOn),w
	skipz
	goto	u1250
	goto	l897
u1250:
	
l4570:	
	clrf	(main@reAlertOn)
	goto	l897
	line	361
	
l4572:	
;smartkey.C: 361: else if((mtOldState == 0)||(mtOldState == 4)){
	movf	(_mtOldState),w
	skipz
	goto	u1260
	goto	l888
u1260:
	
l4574:	
	movf	(_mtOldState),w
	xorlw	04h
	skipz
	goto	u1271
	goto	u1270
u1271:
	goto	l4578
u1270:
	
l888:	
	line	362
;smartkey.C: 362: RegStatus |=(0x20);
	bsf	(_RegStatus)+(5/8),(5)&7
	line	363
	
l4576:	
;smartkey.C: 363: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	364
;smartkey.C: 364: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	365
;smartkey.C: 365: }
	goto	l897
	line	366
	
l4578:	
;smartkey.C: 366: else if((mtOldState == 1)){
	decf	(_mtOldState),w
	skipz
	goto	u1281
	goto	u1280
u1281:
	goto	l897
u1280:
	line	368
	
l4580:	
;smartkey.C: 368: if(reAlertOn)reAlertOn =0;
	movf	(main@reAlertOn),w
	skipz
	goto	u1290
	goto	l881
u1290:
	goto	l4570
	line	370
	
l881:	
	line	371
;smartkey.C: 369: }
;smartkey.C: 370: }
;smartkey.C: 371: break;
	goto	l897
	line	374
	
l4584:	
;smartkey.C: 374: if(timeTick > 200)
	movlw	high(0C9h)
	subwf	(_timeTick+1),w
	movlw	low(0C9h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u1301
	goto	u1300
u1301:
	goto	l897
u1300:
	line	376
	
l4586:	
;smartkey.C: 375: {
;smartkey.C: 376: beepOff();
	fcall	_beepOff
	line	377
	
l4588:	
;smartkey.C: 377: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u1311
	goto	u1310
u1311:
	goto	l4592
u1310:
	
l4590:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	378
	
l4592:	
;smartkey.C: 378: RegStatus |=(0x20);
	bcf	status, 5	;RP0=0, select bank0
	bsf	(_RegStatus)+(5/8),(5)&7
	line	379
;smartkey.C: 379: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	goto	l897
	line	385
	
l4594:	
;smartkey.C: 385: beepOff();
	fcall	_beepOff
	line	386
	
l4596:	
;smartkey.C: 386: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	387
;smartkey.C: 387: break;
	goto	l897
	line	337
	
l4600:	
	movf	(_mtState),w
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           11     6 (fixed)
; simple_byte           16     9 (average)
; jumptable            260     6 (fixed)
; rangetable             9     6 (fixed)
; spacedrange           16     9 (fixed)
; locatedrange           5     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	5
	subwf	fsr,w
skipnc
goto l897
movlw high(S4768)
movwf pclath
	movlw low(S4768)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S4768:
	ljmp	l897
	ljmp	l4552
	ljmp	l4554
	ljmp	l4584
	ljmp	l4594
psect	maintext

	line	413
	
l4602:	
;smartkey.C: 411: {
;smartkey.C: 413: if(lostDetect==1 && timeTick< 1500)
	decf	(_lostDetect),w
	skipz
	goto	u1321
	goto	u1320
u1321:
	goto	l900
u1320:
	
l4604:	
	movlw	high(05DCh)
	subwf	(_timeTick+1),w
	movlw	low(05DCh)
	skipnz
	subwf	(_timeTick),w
	skipnc
	goto	u1331
	goto	u1330
u1331:
	goto	l900
u1330:
	line	415
	
l4606:	
;smartkey.C: 414: {
;smartkey.C: 415: if(READ_EEPROM(0x08)==0x00) WRITE_EEPROM(0x08,0xcc);
	movlw	(08h)
	fcall	_READ_EEPROM
	iorlw	0
	skipz
	goto	u1341
	goto	u1340
u1341:
	goto	l901
u1340:
	
l4608:	
	movlw	(0CCh)
	movwf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	
l901:	
	line	417
;smartkey.C: 417: setState(3,1800);
	movlw	low(0708h)
	movwf	(?_setState)
	movlw	high(0708h)
	movwf	((?_setState))+1
	movlw	(03h)
	fcall	_setState
	line	418
	
l4610:	
;smartkey.C: 418: cntTmp = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l4612:	
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	419
	
l4614:	
;smartkey.C: 419: PR2L =11;
	movlw	(0Bh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	420
;smartkey.C: 420: beepOn();
	fcall	_beepOn
	line	421
	
l4616:	
;smartkey.C: 421: lostDetect =0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_lostDetect)
	line	422
;smartkey.C: 422: }
	goto	l4618
	line	423
	
l900:	
	line	424
;smartkey.C: 423: else {
;smartkey.C: 424: lostDetect =1;
	clrf	(_lostDetect)
	incf	(_lostDetect),f
	line	428
	
l4618:	
;smartkey.C: 427: }
;smartkey.C: 428: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	430
;smartkey.C: 429: }
;smartkey.C: 430: break;
	goto	l897
	line	434
	
l4620:	
;smartkey.C: 433: {
;smartkey.C: 434: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	435
	
l4622:	
;smartkey.C: 435: beepOn();TMR2ON = 0;
	fcall	_beepOn
	
l4624:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	436
	
l4626:	
;smartkey.C: 436: beep(10,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	437
	
l4628:	
;smartkey.C: 437: if(mtOldState == 3){reAlertOn =1;}
	movf	(_mtOldState),w
	xorlw	03h
	skipz
	goto	u1351
	goto	u1350
u1351:
	goto	l897
u1350:
	
l4630:	
	clrf	(main@reAlertOn)
	incf	(main@reAlertOn),f
	goto	l897
	line	398
	
l4634:	
	movf	(_mtState),w
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 1 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; direct_byte           11     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l4602
	xorlw	2^1	; case 2
	skipnz
	goto	l4620
	goto	l897
	opt asmopt_on

	line	441
	
l897:	
	line	445
;smartkey.C: 441: }
;smartkey.C: 443: }
;smartkey.C: 445: PAIE = 1;
	bsf	(91/8),(91)&7
	line	453
	
l4636:	
;smartkey.C: 446: }
;smartkey.C: 448: }
;smartkey.C: 452: {
;smartkey.C: 453: if((timeOut!=0)&&( timeTick >timeOut)){
	movf	(_timeOut+1),w
	iorwf	(_timeOut),w
	skipnz
	goto	u1361
	goto	u1360
u1361:
	goto	l906
u1360:
	
l4638:	
	movf	(_timeTick+1),w
	subwf	(_timeOut+1),w
	skipz
	goto	u1375
	movf	(_timeTick),w
	subwf	(_timeOut),w
u1375:
	skipnc
	goto	u1371
	goto	u1370
u1371:
	goto	l906
u1370:
	goto	l4694
	line	464
	
l4642:	
;smartkey.C: 464: beepOff();
	fcall	_beepOff
	line	465
	
l4644:	
;smartkey.C: 465: RegStatus &=(~0x20);
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_RegStatus)+(5/8),(5)&7
	line	466
	
l4646:	
;smartkey.C: 466: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	467
;smartkey.C: 467: break;
	goto	l906
	line	469
	
l4648:	
;smartkey.C: 469: beepOff();
	fcall	_beepOff
	line	470
	
l4650:	
;smartkey.C: 470: delay_x10ms(20);
	movlw	014h
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	471
	
l4652:	
;smartkey.C: 471: beepOn();TMR2ON = 0;reAlertOn =0;
	fcall	_beepOn
	
l4654:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l4656:	
	clrf	(main@reAlertOn)
	line	472
	
l4658:	
;smartkey.C: 472: beep(30,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(01Eh)
	fcall	_beep
	line	473
	
l4660:	
;smartkey.C: 473: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	474
;smartkey.C: 474: break;
	goto	l906
	line	477
	
l4662:	
;smartkey.C: 477: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u1381
	goto	u1380
u1381:
	goto	l4666
u1380:
	
l4664:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	479
	
l4666:	
;smartkey.C: 479: if(reAlertOn){
	movf	(main@reAlertOn),w
	skipz
	goto	u1390
	goto	l4676
u1390:
	line	480
	
l4668:	
;smartkey.C: 480: setState(4,6000);
	movlw	low(01770h)
	movwf	(?_setState)
	movlw	high(01770h)
	movwf	((?_setState))+1
	movlw	(04h)
	fcall	_setState
	line	481
	
l4670:	
;smartkey.C: 481: cntTmp = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l4672:	
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	482
	
l4674:	
;smartkey.C: 482: PR2L =11;
	movlw	(0Bh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	483
;smartkey.C: 483: beepOn();
	fcall	_beepOn
	line	485
;smartkey.C: 485: }else if(mtOldState == 0){
	goto	l906
	
l4676:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_mtOldState),f
	skipz
	goto	u1401
	goto	u1400
u1401:
	goto	l4682
u1400:
	line	487
	
l4678:	
;smartkey.C: 487: beep(10,5);
	movlw	(05h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	488
	
l4680:	
;smartkey.C: 488: RegStatus |=(0x20);
	bsf	(_RegStatus)+(5/8),(5)&7
	line	490
;smartkey.C: 490: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	492
;smartkey.C: 492: }else{
	goto	l906
	line	493
	
l4682:	
;smartkey.C: 493: beepOn();TMR2ON = 0;
	fcall	_beepOn
	
l4684:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	494
	
l4686:	
;smartkey.C: 494: reAlertOn =0;
	clrf	(main@reAlertOn)
	line	495
	
l4688:	
;smartkey.C: 495: beep(30,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(01Eh)
	fcall	_beep
	line	496
	
l4690:	
;smartkey.C: 496: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	goto	l906
	line	455
	
l4694:	
	movf	(_mtState),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 1 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           13     9 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	1^0	; case 1
	skipnz
	goto	l906
	xorlw	2^1	; case 2
	skipnz
	goto	l4662
	xorlw	3^2	; case 3
	skipnz
	goto	l4642
	xorlw	4^3	; case 4
	skipnz
	goto	l4648
	goto	l906
	opt asmopt_on

	line	500
	
l906:	
	line	504
;smartkey.C: 500: }
;smartkey.C: 502: }
;smartkey.C: 504: if((RC1 ) && (mtState == 1)){
	bcf	status, 5	;RP0=0, select bank0
	btfss	(57/8),(57)&7
	goto	u1411
	goto	u1410
u1411:
	goto	l4728
u1410:
	
l4696:	
	decf	(_mtState),w
	skipz
	goto	u1421
	goto	u1420
u1421:
	goto	l4728
u1420:
	line	505
	
l4698:	
;smartkey.C: 505: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	506
;smartkey.C: 506: while(timeTick <700);
	
l4700:	
	movlw	high(02BCh)
	subwf	(_timeTick+1),w
	movlw	low(02BCh)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u1431
	goto	u1430
u1431:
	goto	l4700
u1430:
	line	508
	
l4702:	
;smartkey.C: 508: cntTmp=0;
	clrf	(_cntTmp)
	clrf	(_cntTmp+1)
	line	509
;smartkey.C: 509: while((RC1) &&( cntTmp<9)){
	goto	l4714
	line	510
	
l4704:	
;smartkey.C: 510: beepOn();TMR2ON = 0; beep(10,1);
	fcall	_beepOn
	
l4706:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l4708:	
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	511
	
l4710:	
;smartkey.C: 511: cntTmp++;
	incf	(_cntTmp),f
	skipnz
	incf	(_cntTmp+1),f
	line	512
	
l4712:	
;smartkey.C: 512: _delay((unsigned long)((1000)*(4000000/4000.0)));
	opt asmopt_off
movlw  6
movwf	((??_main+0)+0+2),f
movlw	19
movwf	((??_main+0)+0+1),f
	movlw	177
movwf	((??_main+0)+0),f
u1517:
	decfsz	((??_main+0)+0),f
	goto	u1517
	decfsz	((??_main+0)+0+1),f
	goto	u1517
	decfsz	((??_main+0)+0+2),f
	goto	u1517
	nop2
opt asmopt_on

	line	509
	
l4714:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(57/8),(57)&7
	goto	u1441
	goto	u1440
u1441:
	goto	l4718
u1440:
	
l4716:	
	movlw	high(09h)
	subwf	(_cntTmp+1),w
	movlw	low(09h)
	skipnz
	subwf	(_cntTmp),w
	skipc
	goto	u1451
	goto	u1450
u1451:
	goto	l4704
u1450:
	line	514
	
l4718:	
;smartkey.C: 513: }
;smartkey.C: 514: cntTmp =0;
	clrf	(_cntTmp)
	clrf	(_cntTmp+1)
	line	515
	
l4720:	
;smartkey.C: 515: if(RC1){
	btfss	(57/8),(57)&7
	goto	u1461
	goto	u1460
u1461:
	goto	l4726
u1460:
	line	517
	
l4722:	
;smartkey.C: 517: RegStatus &=(~0x20);
	bcf	(_RegStatus)+(5/8),(5)&7
	line	518
	
l4724:	
;smartkey.C: 518: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	521
	
l4726:	
;smartkey.C: 519: }
;smartkey.C: 521: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	525
	
l4728:	
;smartkey.C: 522: }
;smartkey.C: 525: if(RegStatus & 0x20) {RC4 =1;RC5 =1;}
	btfss	(_RegStatus),(5)&7
	goto	u1471
	goto	u1470
u1471:
	goto	l928
u1470:
	
l4730:	
	bsf	(60/8),(60)&7
	bsf	(61/8),(61)&7
	goto	l4542
	line	526
	
l928:	
;smartkey.C: 526: else {RC4 =0;RC5 =0;}
	bcf	(60/8),(60)&7
	bcf	(61/8),(61)&7
	goto	l4542
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	531
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_sys_init
psect	text457,local,class=CODE,delta=2
global __ptext457
__ptext457:

;; *************** function _sys_init *****************
;; Defined at:
;;		line 3 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 20/20
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text457
	file	"sysinit.c"
	line	3
	global	__size_of_sys_init
	__size_of_sys_init	equ	__end_of_sys_init-_sys_init
	
_sys_init:	
	opt	stack 6
; Regs used in _sys_init: [wreg]
	line	21
	
l4208:	
;sysinit.c: 21: OSCCON = 0B01010001;
	movlw	(051h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	22
	
l4210:	
;sysinit.c: 22: _nop();
	nop
	line	28
;sysinit.c: 28: while(HTS==0);
	
l1719:	
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1146/8)^080h,(1146)&7
	goto	u811
	goto	u810
u811:
	goto	l1719
u810:
	line	30
	
l1722:	
	return
	opt stack 0
GLOBAL	__end_of_sys_init
	__end_of_sys_init:
;; =============== function _sys_init ends ============

	signat	_sys_init,88
	global	_beep
psect	text458,local,class=CODE,delta=2
global __ptext458
__ptext458:

;; *************** function _beep *****************
;; Defined at:
;;		line 163 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  delay           1    wreg     unsigned char 
;;  rep             1    6[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  delay           1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay_x10ms
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text458
	file	"smartkey.C"
	line	163
	global	__size_of_beep
	__size_of_beep	equ	__end_of_beep-_beep
	
_beep:	
	opt	stack 5
; Regs used in _beep: [wreg+status,2+status,0+pclath+cstack]
;beep@delay stored from wreg
	movwf	(beep@delay)
	line	168
	
l4194:	
;smartkey.C: 166: {
;smartkey.C: 168: while(rep--){
	goto	l4206
	
l850:	
	line	169
;smartkey.C: 169: TMR2ON = 1;
	bsf	(146/8),(146)&7
	line	170
	
l4196:	
;smartkey.C: 170: PR2L = 12;
	movlw	(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(145)^080h	;volatile
	line	171
	
l4198:	
;smartkey.C: 171: delay_x10ms(delay);
	movf	(beep@delay),w
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	172
	
l4200:	
;smartkey.C: 172: TMR2ON = 0;RA5 =0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l4202:	
	bcf	(45/8),(45)&7
	line	173
	
l4204:	
;smartkey.C: 173: delay_x10ms(20);
	movlw	014h
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	168
	
l4206:	
	decf	(beep@rep),f
	movf	((beep@rep)),w
	xorlw	0FFh
	skipz
	goto	u801
	goto	u800
u801:
	goto	l850
u800:
	line	177
	
l852:	
	return
	opt stack 0
GLOBAL	__end_of_beep
	__end_of_beep:
;; =============== function _beep ends ============

	signat	_beep,8312
	global	_int_init
psect	text459,local,class=CODE,delta=2
global __ptext459
__ptext459:

;; *************** function _int_init *****************
;; Defined at:
;;		line 79 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tmp             1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text459
	file	"sysinit.c"
	line	79
	global	__size_of_int_init
	__size_of_int_init	equ	__end_of_int_init-_int_init
	
_int_init:	
	opt	stack 6
; Regs used in _int_init: [wreg+status,2]
	line	84
	
l4162:	
;sysinit.c: 84: INTCON = 0B00000000;
	clrf	(11)	;volatile
	line	85
;sysinit.c: 85: PIE1 = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(140)^080h	;volatile
	line	86
;sysinit.c: 86: PIR1 = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(12)	;volatile
	line	88
	
l4164:	
;sysinit.c: 88: IOCA6 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1206/8)^080h,(1206)&7
	line	89
	
l4166:	
;sysinit.c: 89: tmp = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	90
	
l4168:	
;sysinit.c: 90: PAIF = 0;
	bcf	(88/8),(88)&7
	line	91
	
l4170:	
;sysinit.c: 91: PAIE = 0;
	bcf	(91/8),(91)&7
	line	94
	
l4172:	
;sysinit.c: 94: INTEDG = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1038/8)^080h,(1038)&7
	line	95
	
l4174:	
;sysinit.c: 95: INTF = 0;
	bcf	(89/8),(89)&7
	line	96
	
l4176:	
;sysinit.c: 96: INTE = 0;
	bcf	(92/8),(92)&7
	line	98
	
l4178:	
;sysinit.c: 98: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(97/8),(97)&7
	line	99
	
l4180:	
;sysinit.c: 99: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	100
	
l4182:	
;sysinit.c: 100: TMR2ON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	106
	
l4184:	
;sysinit.c: 106: T0IF = 0;
	bcf	(90/8),(90)&7
	line	107
	
l4186:	
;sysinit.c: 107: T0IE = 1;
	bsf	(93/8),(93)&7
	line	108
	
l4188:	
;sysinit.c: 108: T0ON = 1;
	bsf	(251/8),(251)&7
	line	110
	
l4190:	
;sysinit.c: 110: PEIE = 1;
	bsf	(94/8),(94)&7
	line	112
	
l4192:	
;sysinit.c: 112: GIE = 1;
	bsf	(95/8),(95)&7
	line	113
	
l1731:	
	return
	opt stack 0
GLOBAL	__end_of_int_init
	__end_of_int_init:
;; =============== function _int_init ends ============

	signat	_int_init,88
	global	_timer_init
psect	text460,local,class=CODE,delta=2
global __ptext460
__ptext460:

;; *************** function _timer_init *****************
;; Defined at:
;;		line 51 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text460
	file	"sysinit.c"
	line	51
	global	__size_of_timer_init
	__size_of_timer_init	equ	__end_of_timer_init-_timer_init
	
_timer_init:	
	opt	stack 6
; Regs used in _timer_init: [wreg+status,2]
	line	59
	
l4154:	
;sysinit.c: 59: T0CON0 = 0B00000000;
	clrf	(31)	;volatile
	line	60
	
l4156:	
;sysinit.c: 60: OPTION = 0B00000111;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(129)^080h	;volatile
	line	61
	
l4158:	
;sysinit.c: 61: TMR0 = 179;
	movlw	(0B3h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	63
;sysinit.c: 63: TMR2H = 0;
	clrf	(19)	;volatile
	line	64
;sysinit.c: 64: TMR2L = 0;
	clrf	(17)	;volatile
	line	65
;sysinit.c: 65: PR2H = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(146)^080h	;volatile
	line	66
;sysinit.c: 66: PR2L =0;
	clrf	(145)^080h	;volatile
	line	67
	
l4160:	
;sysinit.c: 67: T2CON0 = 0B00101001;
	movlw	(029h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	76
	
l1728:	
	return
	opt stack 0
GLOBAL	__end_of_timer_init
	__end_of_timer_init:
;; =============== function _timer_init ends ============

	signat	_timer_init,88
	global	_gpio_init
psect	text461,local,class=CODE,delta=2
global __ptext461
__ptext461:

;; *************** function _gpio_init *****************
;; Defined at:
;;		line 32 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 20/20
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text461
	file	"sysinit.c"
	line	32
	global	__size_of_gpio_init
	__size_of_gpio_init	equ	__end_of_gpio_init-_gpio_init
	
_gpio_init:	
	opt	stack 6
; Regs used in _gpio_init: [wreg+status,2]
	line	34
	
l4134:	
;sysinit.c: 34: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	35
	
l4136:	
;sysinit.c: 35: TRISA = 0B01011110;
	movlw	(05Eh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	36
	
l4138:	
;sysinit.c: 36: WPUA = 0B10100000;
	movlw	(0A0h)
	movwf	(149)^080h	;volatile
	line	38
;sysinit.c: 38: PORTC = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	39
	
l4140:	
;sysinit.c: 39: TRISC = 0B11001111;
	movlw	(0CFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	40
	
l4142:	
;sysinit.c: 40: WPUC = 0B00110000;
	movlw	(030h)
	movwf	(147)^080h	;volatile
	line	42
	
l4144:	
;sysinit.c: 42: PSRCA = 0B11111111;
	movlw	(0FFh)
	movwf	(136)^080h	;volatile
	line	43
	
l4146:	
;sysinit.c: 43: PSRCC = 0B11111111;
	movlw	(0FFh)
	movwf	(148)^080h	;volatile
	line	44
	
l4148:	
;sysinit.c: 44: PSINKA = 0B11111111;
	movlw	(0FFh)
	movwf	(151)^080h	;volatile
	line	45
	
l4150:	
;sysinit.c: 45: PSINKC = 0B11111111;
	movlw	(0FFh)
	movwf	(159)^080h	;volatile
	line	47
	
l4152:	
;sysinit.c: 47: MSCON = 0B00110000;
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(27)	;volatile
	line	48
	
l1725:	
	return
	opt stack 0
GLOBAL	__end_of_gpio_init
	__end_of_gpio_init:
;; =============== function _gpio_init ends ============

	signat	_gpio_init,88
	global	_setState
psect	text462,local,class=CODE,delta=2
global __ptext462
__ptext462:

;; *************** function _setState *****************
;; Defined at:
;;		line 208 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  stt             1    wreg     unsigned char 
;;  _tOut           2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  stt             1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text462
	file	"smartkey.C"
	line	208
	global	__size_of_setState
	__size_of_setState	equ	__end_of_setState-_setState
	
_setState:	
	opt	stack 6
; Regs used in _setState: [wreg+status,2]
;setState@stt stored from wreg
	movwf	(setState@stt)
	line	209
	
l4128:	
;smartkey.C: 209: mtOldState = mtState;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_mtState),w
	movwf	(_mtOldState)
	line	210
;smartkey.C: 210: mtState = stt;
	movf	(setState@stt),w
	movwf	(_mtState)
	line	211
	
l4130:	
;smartkey.C: 211: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	212
	
l4132:	
;smartkey.C: 212: timeOut = _tOut;
	movf	(setState@_tOut+1),w
	movwf	(_timeOut+1)
	movf	(setState@_tOut),w
	movwf	(_timeOut)
	line	213
	
l867:	
	return
	opt stack 0
GLOBAL	__end_of_setState
	__end_of_setState:
;; =============== function _setState ends ============

	signat	_setState,8312
	global	_WRITE_EEPROM
psect	text463,local,class=CODE,delta=2
global __ptext463
__ptext463:

;; *************** function _WRITE_EEPROM *****************
;; Defined at:
;;		line 193 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  EEAddr          1    wreg     unsigned char 
;;  EEData          1    2[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  EEAddr          1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 20/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         1       0       0
;;      Locals:         1       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text463
	file	"smartkey.C"
	line	193
	global	__size_of_WRITE_EEPROM
	__size_of_WRITE_EEPROM	equ	__end_of_WRITE_EEPROM-_WRITE_EEPROM
	
_WRITE_EEPROM:	
	opt	stack 6
; Regs used in _WRITE_EEPROM: [wreg]
;WRITE_EEPROM@EEAddr stored from wreg
	movwf	(WRITE_EEPROM@EEAddr)
	line	194
	
l4120:	
;smartkey.C: 194: GIE = 0;
	bcf	(95/8),(95)&7
	line	195
;smartkey.C: 195: while(GIE) asm("clrwdt");
	goto	l858
	
l859:	
# 195 "smartkey.C"
clrwdt ;#
psect	text463
	
l858:	
	btfsc	(95/8),(95)&7
	goto	u781
	goto	u780
u781:
	goto	l859
u780:
	line	196
	
l4122:	
;smartkey.C: 196: EEADR = EEAddr;
	movf	(WRITE_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	197
;smartkey.C: 197: EEDAT = EEData;
	movf	(WRITE_EEPROM@EEData),w
	movwf	(154)^080h	;volatile
	line	198
	
l4124:	
;smartkey.C: 198: EEIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(103/8),(103)&7
	line	199
;smartkey.C: 199: EECON1 = 0x34;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(156)^080h	;volatile
	line	200
	
l4126:	
;smartkey.C: 200: WR = 1;
	bsf	(1256/8)^080h,(1256)&7
	line	201
;smartkey.C: 201: while(WR) asm("clrwdt");
	goto	l861
	
l862:	
# 201 "smartkey.C"
clrwdt ;#
psect	text463
	
l861:	
	bsf	status, 5	;RP0=1, select bank1
	btfsc	(1256/8)^080h,(1256)&7
	goto	u791
	goto	u790
u791:
	goto	l862
u790:
	
l863:	
	line	203
;smartkey.C: 203: GIE = 1;
	bsf	(95/8),(95)&7
	line	204
	
l864:	
	return
	opt stack 0
GLOBAL	__end_of_WRITE_EEPROM
	__end_of_WRITE_EEPROM:
;; =============== function _WRITE_EEPROM ends ============

	signat	_WRITE_EEPROM,8312
	global	_READ_EEPROM
psect	text464,local,class=CODE,delta=2
global __ptext464
__ptext464:

;; *************** function _READ_EEPROM *****************
;; Defined at:
;;		line 182 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  EEAddr          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  EEAddr          1    2[COMMON] unsigned char 
;;  ReEepromData    1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 20/20
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text464
	file	"smartkey.C"
	line	182
	global	__size_of_READ_EEPROM
	__size_of_READ_EEPROM	equ	__end_of_READ_EEPROM-_READ_EEPROM
	
_READ_EEPROM:	
	opt	stack 6
; Regs used in _READ_EEPROM: [wreg]
;READ_EEPROM@EEAddr stored from wreg
	line	185
	movwf	(READ_EEPROM@EEAddr)
	
l4112:	
;smartkey.C: 183: unsigned char ReEepromData;
;smartkey.C: 185: EEADR = EEAddr;
	movf	(READ_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(155)^080h	;volatile
	line	186
	
l4114:	
;smartkey.C: 186: RD = 1;
	bsf	(1248/8)^080h,(1248)&7
	line	187
;smartkey.C: 187: ReEepromData = EEDAT;
	movf	(154)^080h,w	;volatile
	movwf	(READ_EEPROM@ReEepromData)
	line	188
	
l4116:	
;smartkey.C: 188: RD = 0;
	bcf	(1248/8)^080h,(1248)&7
	line	189
;smartkey.C: 189: return ReEepromData;
	movf	(READ_EEPROM@ReEepromData),w
	line	190
	
l855:	
	return
	opt stack 0
GLOBAL	__end_of_READ_EEPROM
	__end_of_READ_EEPROM:
;; =============== function _READ_EEPROM ends ============

	signat	_READ_EEPROM,4217
	global	_beepOn
psect	text465,local,class=CODE,delta=2
global __ptext465
__ptext465:

;; *************** function _beepOn *****************
;; Defined at:
;;		line 159 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 20/20
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text465
	file	"smartkey.C"
	line	159
	global	__size_of_beepOn
	__size_of_beepOn	equ	__end_of_beepOn-_beepOn
	
_beepOn:	
	opt	stack 6
; Regs used in _beepOn: []
	line	160
	
l4110:	
;smartkey.C: 160: TMR2ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(146/8),(146)&7
	line	161
;smartkey.C: 161: TRISA &= 0xdf;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(5/8),(5)&7	;volatile
	line	162
	
l846:	
	return
	opt stack 0
GLOBAL	__end_of_beepOn
	__end_of_beepOn:
;; =============== function _beepOn ends ============

	signat	_beepOn,88
	global	_beepOff
psect	text466,local,class=CODE,delta=2
global __ptext466
__ptext466:

;; *************** function _beepOff *****************
;; Defined at:
;;		line 156 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/20
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          0       0       0
;;      Totals:         0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text466
	file	"smartkey.C"
	line	156
	global	__size_of_beepOff
	__size_of_beepOff	equ	__end_of_beepOff-_beepOff
	
_beepOff:	
	opt	stack 6
; Regs used in _beepOff: []
	line	157
	
l4108:	
;smartkey.C: 157: TMR2ON = 0;RA5 =0;TRISA |= 0x20;
	bcf	(146/8),(146)&7
	bcf	(45/8),(45)&7
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(5/8),(5)&7	;volatile
	line	158
	
l843:	
	return
	opt stack 0
GLOBAL	__end_of_beepOff
	__end_of_beepOff:
;; =============== function _beepOff ends ============

	signat	_beepOff,88
	global	_delay_x10ms
psect	text467,local,class=CODE,delta=2
global __ptext467
__ptext467:

;; *************** function _delay_x10ms *****************
;; Defined at:
;;		line 151 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  t               2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  set             2    4[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 0/20
;;		Unchanged: FFFFF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         2       0       0
;;      Locals:         2       0       0
;;      Temps:          0       0       0
;;      Totals:         4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_beep
;;		_main
;; This function uses a non-reentrant model
;;
psect	text467
	file	"smartkey.C"
	line	151
	global	__size_of_delay_x10ms
	__size_of_delay_x10ms	equ	__end_of_delay_x10ms-_delay_x10ms
	
_delay_x10ms:	
	opt	stack 5
; Regs used in _delay_x10ms: [wreg]
	line	152
	
l4104:	
;smartkey.C: 152: unsigned int set = t + timeTick;
	movf	(delay_x10ms@t+1),w
	movwf	(delay_x10ms@set+1)
	movf	(delay_x10ms@t),w
	movwf	(delay_x10ms@set)
	movf	(_timeTick),w
	addwf	(delay_x10ms@set),f
	skipnc
	incf	(delay_x10ms@set+1),f
	movf	(_timeTick+1),w
	addwf	(delay_x10ms@set+1),f
	line	153
;smartkey.C: 153: while(timeTick < set);
	
l4106:	
	movf	(delay_x10ms@set+1),w
	subwf	(_timeTick+1),w
	skipz
	goto	u775
	movf	(delay_x10ms@set),w
	subwf	(_timeTick),w
u775:
	skipc
	goto	u771
	goto	u770
u771:
	goto	l4106
u770:
	line	154
	
l840:	
	return
	opt stack 0
GLOBAL	__end_of_delay_x10ms
	__end_of_delay_x10ms:
;; =============== function _delay_x10ms ends ============

	signat	_delay_x10ms,4216
	global	_ISR
psect	text468,local,class=CODE,delta=2
global __ptext468
__ptext468:

;; *************** function _ISR *****************
;; Defined at:
;;		line 45 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tmp             1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0   BANK1
;;      Params:         0       0       0
;;      Locals:         0       0       0
;;      Temps:          2       0       0
;;      Totals:         2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text468
	file	"smartkey.C"
	line	45
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 5
; Regs used in _ISR: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text468
	line	49
	
i1l4034:	
;smartkey.C: 49: if(PAIE&&PAIF){
	btfss	(91/8),(91)&7
	goto	u58_21
	goto	u58_20
u58_21:
	goto	i1l4052
u58_20:
	
i1l4036:	
	btfss	(88/8),(88)&7
	goto	u59_21
	goto	u59_20
u59_21:
	goto	i1l4052
u59_20:
	line	52
	
i1l4038:	
;smartkey.C: 52: tmp = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	53
	
i1l4040:	
;smartkey.C: 53: PAIF = 0;
	bcf	(88/8),(88)&7
	line	55
	
i1l4042:	
;smartkey.C: 55: if(RA6){
	btfss	(46/8),(46)&7
	goto	u60_21
	goto	u60_20
u60_21:
	goto	i1l4050
u60_20:
	line	57
	
i1l4044:	
;smartkey.C: 57: if(mode_chek == 0){
	movf	(_mode_chek),f
	skipz
	goto	u61_21
	goto	u61_20
u61_21:
	goto	i1l4052
u61_20:
	line	58
	
i1l4046:	
;smartkey.C: 58: cntCyc = 0;
	clrf	(_cntCyc)
	line	59
;smartkey.C: 59: cntOff = 0;
	clrf	(_cntOff)
	line	61
	
i1l4048:	
;smartkey.C: 61: mode_chek = 1;
	clrf	(_mode_chek)
	incf	(_mode_chek),f
	goto	i1l4052
	line	67
	
i1l4050:	
;smartkey.C: 66: else{
;smartkey.C: 67: cntOff = 0;
	clrf	(_cntOff)
	line	78
	
i1l4052:	
;smartkey.C: 70: }
;smartkey.C: 72: }
;smartkey.C: 78: if(T0IE&&T0IF){
	btfss	(93/8),(93)&7
	goto	u62_21
	goto	u62_20
u62_21:
	goto	i1l4096
u62_20:
	
i1l4054:	
	btfss	(90/8),(90)&7
	goto	u63_21
	goto	u63_20
u63_21:
	goto	i1l4096
u63_20:
	line	79
	
i1l4056:	
;smartkey.C: 79: T0IF = 0;
	bcf	(90/8),(90)&7
	line	80
	
i1l4058:	
;smartkey.C: 80: TMR0 = 179;
	movlw	(0B3h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	86
;smartkey.C: 86: if( mode_chek == 1){
	decf	(_mode_chek),w
	skipz
	goto	u64_21
	goto	u64_20
u64_21:
	goto	i1l4080
u64_20:
	line	88
	
i1l4060:	
;smartkey.C: 88: cntCyc++;
	incf	(_cntCyc),f
	line	90
	
i1l4062:	
;smartkey.C: 90: if(RA6==0){
	btfsc	(46/8),(46)&7
	goto	u65_21
	goto	u65_20
u65_21:
	goto	i1l4080
u65_20:
	line	92
	
i1l4064:	
;smartkey.C: 92: cntOff++;
	incf	(_cntOff),f
	line	95
	
i1l4066:	
;smartkey.C: 95: if(cntOff > 15){
	movlw	(010h)
	subwf	(_cntOff),w
	skipc
	goto	u66_21
	goto	u66_20
u66_21:
	goto	i1l4080
u66_20:
	line	97
	
i1l4068:	
;smartkey.C: 97: mode_chek = 0;
	clrf	(_mode_chek)
	line	99
	
i1l4070:	
;smartkey.C: 99: if((cntCyc>15) &&(cntCyc<50)) {
	movlw	(010h)
	subwf	(_cntCyc),w
	skipc
	goto	u67_21
	goto	u67_20
u67_21:
	goto	i1l4076
u67_20:
	
i1l4072:	
	movlw	(032h)
	subwf	(_cntCyc),w
	skipnc
	goto	u68_21
	goto	u68_20
u68_21:
	goto	i1l4076
u68_20:
	line	100
	
i1l4074:	
;smartkey.C: 100: RegStatus |= (0x40);
	bsf	(_RegStatus)+(6/8),(6)&7
	line	101
;smartkey.C: 101: } else if (cntCyc>=50){
	goto	i1l824
	
i1l4076:	
	movlw	(032h)
	subwf	(_cntCyc),w
	skipc
	goto	u69_21
	goto	u69_20
u69_21:
	goto	i1l824
u69_20:
	line	102
	
i1l4078:	
;smartkey.C: 102: RegStatus &= ~(0x40);
	bcf	(_RegStatus)+(6/8),(6)&7
	line	106
	
i1l824:	
;smartkey.C: 103: }
;smartkey.C: 106: RegStatus |= 0x80;
	bsf	(_RegStatus)+(7/8),(7)&7
	line	122
	
i1l4080:	
;smartkey.C: 107: }
;smartkey.C: 109: }
;smartkey.C: 119: }
;smartkey.C: 122: timeTick++;
	incf	(_timeTick),f
	skipnz
	incf	(_timeTick+1),f
	line	124
	
i1l4082:	
;smartkey.C: 124: if((mtState == 4)||(mtState == 3)){
	movf	(_mtState),w
	xorlw	04h
	skipnz
	goto	u70_21
	goto	u70_20
u70_21:
	goto	i1l4086
u70_20:
	
i1l4084:	
	movf	(_mtState),w
	xorlw	03h
	skipz
	goto	u71_21
	goto	u71_20
u71_21:
	goto	i1l4096
u71_20:
	line	126
	
i1l4086:	
;smartkey.C: 126: if(timeTick > cntTmp){
	movf	(_timeTick+1),w
	subwf	(_cntTmp+1),w
	skipz
	goto	u72_25
	movf	(_timeTick),w
	subwf	(_cntTmp),w
u72_25:
	skipnc
	goto	u72_21
	goto	u72_20
u72_21:
	goto	i1l4096
u72_20:
	line	127
	
i1l4088:	
;smartkey.C: 127: cntTmp = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	128
;smartkey.C: 128: if(cntTmp<=timeOut)
	movf	(_cntTmp+1),w
	subwf	(_timeOut+1),w
	skipz
	goto	u73_25
	movf	(_cntTmp),w
	subwf	(_timeOut),w
u73_25:
	skipc
	goto	u73_21
	goto	u73_20
u73_21:
	goto	i1l4096
u73_20:
	line	130
	
i1l4090:	
;smartkey.C: 129: {
;smartkey.C: 130: if(PR2L == 11)
	bsf	status, 5	;RP0=1, select bank1
	movf	(145)^080h,w	;volatile
	xorlw	0Bh
	skipz
	goto	u74_21
	goto	u74_20
u74_21:
	goto	i1l4094
u74_20:
	line	131
	
i1l4092:	
;smartkey.C: 131: PR2L = 30;
	movlw	(01Eh)
	movwf	(145)^080h	;volatile
	goto	i1l4096
	line	133
	
i1l4094:	
;smartkey.C: 132: else
;smartkey.C: 133: PR2L = 11;
	movlw	(0Bh)
	movwf	(145)^080h	;volatile
	line	142
	
i1l4096:	
;smartkey.C: 134: }
;smartkey.C: 135: }
;smartkey.C: 136: }
;smartkey.C: 139: }
;smartkey.C: 142: if(TMR2IE&&TMR2IF)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1121/8)^080h,(1121)&7
	goto	u75_21
	goto	u75_20
u75_21:
	goto	i1l834
u75_20:
	
i1l4098:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u76_21
	goto	u76_20
u76_21:
	goto	i1l834
u76_20:
	line	144
	
i1l4100:	
;smartkey.C: 143: {
;smartkey.C: 144: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	145
	
i1l4102:	
;smartkey.C: 145: RA5 =~ RA5;
	movlw	1<<((45)&7)
	xorwf	((45)/8),f
	line	148
	
i1l834:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text469,local,class=CODE,delta=2
global __ptext469
__ptext469:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
