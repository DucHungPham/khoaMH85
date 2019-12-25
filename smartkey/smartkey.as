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
	global	_PSTRCON
psect	text456,local,class=CODE,delta=2
global __ptext456
__ptext456:
_PSTRCON	set	413
	DABS	1,413,1	;_PSTRCON

	global	_SRCON
_SRCON	set	414
	DABS	1,414,1	;_SRCON

	global	_C1SEN
_C1SEN	set	3317
	DABS	1,414,1	;_C1SEN

	global	_C2REN
_C2REN	set	3316
	DABS	1,414,1	;_C2REN

	global	_EEPGD
_EEPGD	set	3175
	DABS	1,396,1	;_EEPGD

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

	global	_WREN
_WREN	set	3170
	DABS	1,396,1	;_WREN

	global	_INTCON
_INTCON	set	11
	global	_PIR1
_PIR1	set	12
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_T1CON
_T1CON	set	16
	global	_T2CON
_T2CON	set	18
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_TMR2
_TMR2	set	17
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
	global	_RA4
_RA4	set	44
	global	_RA6
_RA6	set	46
	global	_RA7
_RA7	set	47
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC4
_RC4	set	60
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR1ON
_TMR1ON	set	128
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
	global	_OSCCON
_OSCCON	set	143
	global	_PIE1
_PIE1	set	140
	global	_PR2
_PR2	set	146
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WPUA
_WPUA	set	149
	global	_WPUC
_WPUC	set	136
	global	_HTS
_HTS	set	1146
	global	_INTEDG
_INTEDG	set	1038
	global	_IOCA6
_IOCA6	set	1206
	global	_RD
_RD	set	1248
	global	_TMR1IE
_TMR1IE	set	1120
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
;;EEDATA              80      0       0       0        0.0%
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
;;BITBANK1            20      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BANK1               20      0       0       6        0.0%
;;ABS                  0      0      19       7        0.0%
;;DATA                 0      0      1B       8        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 219 in file "smartkey.C"
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
;;		On exit  : 60/0
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
	line	219
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	222
	
l4070:	
# 222 "smartkey.C"
 MOVLW 0x07 ;#
	line	223
# 223 "smartkey.C"
 MOVWF 0x19 ;#
psect	maintext
	line	226
	
l4072:	
;smartkey.C: 226: unsigned char reAlertOn=0;
	clrf	(main@reAlertOn)
	line	229
	
l4074:	
# 229 "smartkey.C"
clrwdt ;#
psect	maintext
	line	231
	
l4076:	
;smartkey.C: 231: sys_init();
	fcall	_sys_init
	line	232
	
l4078:	
;smartkey.C: 232: gpio_init();
	fcall	_gpio_init
	line	234
	
l4080:	
;smartkey.C: 234: timer_init();
	fcall	_timer_init
	line	235
	
l4082:	
;smartkey.C: 235: int_init();
	fcall	_int_init
	line	239
	
l4084:	
;smartkey.C: 239: _delay((unsigned long)((100)*(4000000/4000.0)));
	opt asmopt_off
movlw	130
	bcf	status, 5	;RP0=0, select bank0
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

	line	241
	
l4086:	
;smartkey.C: 241: RA7 =1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(47/8),(47)&7
	line	242
	
l4088:	
;smartkey.C: 242: _delay((unsigned long)((100)*(4000000/4000.0)));
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

	line	244
	
l4090:	
;smartkey.C: 244: PAIE = 1;
	bsf	(91/8),(91)&7
	line	246
;smartkey.C: 246: RegStatus = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_RegStatus)
	line	248
	
l4092:	
;smartkey.C: 248: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	256
	
l4094:	
;smartkey.C: 256: WRITE_EEPROM(0x7F,0xAA);
	movlw	(0AAh)
	movwf	(?_WRITE_EEPROM)
	movlw	(07Fh)
	fcall	_WRITE_EEPROM
	line	257
	
l4096:	
;smartkey.C: 257: WRITE_EEPROM(0x7F,0xAA);
	movlw	(0AAh)
	movwf	(?_WRITE_EEPROM)
	movlw	(07Fh)
	fcall	_WRITE_EEPROM
	line	260
	
l4098:	
;smartkey.C: 260: delay_x10ms(1);
	clrf	(?_delay_x10ms)
	incf	(?_delay_x10ms),f
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	262
	
l4100:	
;smartkey.C: 262: if(READ_EEPROM(0x08)==0xff) {WRITE_EEPROM(0x08,0);_delay((unsigned long)((2)*(4000000/4000.0)));}
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0FFh
	skipz
	goto	u1151
	goto	u1150
u1151:
	goto	l4106
u1150:
	
l4102:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	
l4104:	
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

	line	264
	
l4106:	
;smartkey.C: 264: if(READ_EEPROM(0x08)==0xcc){
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u1161
	goto	u1160
u1161:
	goto	l4120
u1160:
	line	265
	
l4108:	
;smartkey.C: 265: RegStatus &=~(0x20);
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_RegStatus)+(5/8),(5)&7
	line	266
	
l4110:	
;smartkey.C: 266: setState(3,1800);
	movlw	low(0708h)
	movwf	(?_setState)
	movlw	high(0708h)
	movwf	((?_setState))+1
	movlw	(03h)
	fcall	_setState
	line	267
	
l4112:	
;smartkey.C: 267: mtOldState = 1;
	clrf	(_mtOldState)
	incf	(_mtOldState),f
	line	268
	
l4114:	
;smartkey.C: 268: cntTmp = timeTick+50;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l4116:	
	movlw	032h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	269
	
l4118:	
;smartkey.C: 269: PR2 =12;
	movlw	(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	270
;smartkey.C: 270: beepOn();
	fcall	_beepOn
	line	271
;smartkey.C: 271: } else {
	goto	l4124
	line	272
	
l4120:	
;smartkey.C: 272: setState(2,400);
	movlw	low(0190h)
	movwf	(?_setState)
	movlw	high(0190h)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	274
	
l4122:	
;smartkey.C: 274: mtOldState = 0;
	clrf	(_mtOldState)
	line	318
	
l4124:	
;smartkey.C: 318: RA0 =RA6;
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(46/8),(46)&7
	goto	u1171
	goto	u1170
	
u1171:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(40/8),(40)&7
	goto	u1184
u1170:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(40/8),(40)&7
u1184:
	line	321
	
l4126:	
;smartkey.C: 321: if(mode_chek == 0)
	movf	(_mode_chek),f
	skipz
	goto	u1191
	goto	u1190
u1191:
	goto	l4218
u1190:
	line	324
	
l4128:	
;smartkey.C: 322: {
;smartkey.C: 324: if(RegStatus & 0x80)
	btfss	(_RegStatus),(7)&7
	goto	u1201
	goto	u1200
u1201:
	goto	l4218
u1200:
	line	326
	
l4130:	
;smartkey.C: 325: {
;smartkey.C: 326: PAIE = 0;
	bcf	(91/8),(91)&7
	line	329
;smartkey.C: 329: RegStatus &= (~0x80);
	bcf	(_RegStatus)+(7/8),(7)&7
	line	343
;smartkey.C: 341: {
;smartkey.C: 343: if ((RegStatus & 0x40) !=0){
	btfss	(_RegStatus),(6)&7
	goto	u1211
	goto	u1210
u1211:
	goto	l4216
u1210:
	goto	l4182
	line	356
	
l4134:	
;smartkey.C: 356: lostDetect =0;
	clrf	(_lostDetect)
	line	357
;smartkey.C: 357: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	358
;smartkey.C: 358: break;
	goto	l761
	line	361
	
l4136:	
;smartkey.C: 361: if(timeTick >30){
	movlw	high(01Fh)
	subwf	(_timeTick+1),w
	movlw	low(01Fh)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u1221
	goto	u1220
u1221:
	goto	l761
u1220:
	line	362
	
l4138:	
;smartkey.C: 362: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	364
	
l4140:	
;smartkey.C: 364: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u1231
	goto	u1230
u1231:
	goto	l4144
u1230:
	
l4142:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	366
	
l4144:	
;smartkey.C: 366: if((mtOldState == 3)){
	bcf	status, 5	;RP0=0, select bank0
	movf	(_mtOldState),w
	xorlw	03h
	skipz
	goto	u1241
	goto	u1240
u1241:
	goto	l4154
u1240:
	line	367
	
l4146:	
;smartkey.C: 367: beepOn();TMR2ON = 0; beep(10,1);
	fcall	_beepOn
	
l4148:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l4150:	
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	368
;smartkey.C: 368: if(reAlertOn)reAlertOn =0;
	movf	(main@reAlertOn),w
	skipz
	goto	u1250
	goto	l761
u1250:
	
l4152:	
	clrf	(main@reAlertOn)
	goto	l761
	line	370
	
l4154:	
;smartkey.C: 370: else if((mtOldState == 0)||(mtOldState == 4)){
	movf	(_mtOldState),w
	skipz
	goto	u1260
	goto	l752
u1260:
	
l4156:	
	movf	(_mtOldState),w
	xorlw	04h
	skipz
	goto	u1271
	goto	u1270
u1271:
	goto	l4160
u1270:
	
l752:	
	line	371
;smartkey.C: 371: RegStatus |=(0x20);
	bsf	(_RegStatus)+(5/8),(5)&7
	line	372
	
l4158:	
;smartkey.C: 372: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	373
;smartkey.C: 373: beep(10,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	374
;smartkey.C: 374: }
	goto	l761
	line	375
	
l4160:	
;smartkey.C: 375: else if((mtOldState == 1)){
	decf	(_mtOldState),w
	skipz
	goto	u1281
	goto	u1280
u1281:
	goto	l761
u1280:
	line	377
	
l4162:	
;smartkey.C: 377: if(reAlertOn)reAlertOn =0;
	movf	(main@reAlertOn),w
	skipz
	goto	u1290
	goto	l745
u1290:
	goto	l4152
	line	379
	
l745:	
	line	380
;smartkey.C: 378: }
;smartkey.C: 379: }
;smartkey.C: 380: break;
	goto	l761
	line	383
	
l4166:	
;smartkey.C: 383: if(timeTick > 200)
	movlw	high(0C9h)
	subwf	(_timeTick+1),w
	movlw	low(0C9h)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u1301
	goto	u1300
u1301:
	goto	l761
u1300:
	line	385
	
l4168:	
;smartkey.C: 384: {
;smartkey.C: 385: beepOff();
	fcall	_beepOff
	line	386
	
l4170:	
;smartkey.C: 386: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u1311
	goto	u1310
u1311:
	goto	l4174
u1310:
	
l4172:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	387
	
l4174:	
;smartkey.C: 387: RegStatus |=(0x20);
	bcf	status, 5	;RP0=0, select bank0
	bsf	(_RegStatus)+(5/8),(5)&7
	line	388
;smartkey.C: 388: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	goto	l761
	line	394
	
l4176:	
;smartkey.C: 394: beepOff();
	fcall	_beepOff
	line	395
	
l4178:	
;smartkey.C: 395: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	396
;smartkey.C: 396: break;
	goto	l761
	line	346
	
l4182:	
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
goto l761
movlw high(S4350)
movwf pclath
	movlw low(S4350)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S4350:
	ljmp	l761
	ljmp	l4134
	ljmp	l4136
	ljmp	l4166
	ljmp	l4176
psect	maintext

	line	422
	
l4184:	
;smartkey.C: 420: {
;smartkey.C: 422: if(lostDetect==1 && timeTick< 1500)
	decf	(_lostDetect),w
	skipz
	goto	u1321
	goto	u1320
u1321:
	goto	l764
u1320:
	
l4186:	
	movlw	high(05DCh)
	subwf	(_timeTick+1),w
	movlw	low(05DCh)
	skipnz
	subwf	(_timeTick),w
	skipnc
	goto	u1331
	goto	u1330
u1331:
	goto	l764
u1330:
	line	424
	
l4188:	
;smartkey.C: 423: {
;smartkey.C: 424: if(READ_EEPROM(0x08)==0x00) WRITE_EEPROM(0x08,0xcc);
	movlw	(08h)
	fcall	_READ_EEPROM
	iorlw	0
	skipz
	goto	u1341
	goto	u1340
u1341:
	goto	l765
u1340:
	
l4190:	
	movlw	(0CCh)
	movwf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	
l765:	
	line	426
;smartkey.C: 426: setState(3,1800);
	movlw	low(0708h)
	movwf	(?_setState)
	movlw	high(0708h)
	movwf	((?_setState))+1
	movlw	(03h)
	fcall	_setState
	line	427
	
l4192:	
;smartkey.C: 427: cntTmp = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l4194:	
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	428
	
l4196:	
;smartkey.C: 428: PR2 =11;
	movlw	(0Bh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	429
;smartkey.C: 429: beepOn();
	fcall	_beepOn
	line	430
	
l4198:	
;smartkey.C: 430: lostDetect =0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_lostDetect)
	line	431
;smartkey.C: 431: }
	goto	l4200
	line	432
	
l764:	
	line	433
;smartkey.C: 432: else {
;smartkey.C: 433: lostDetect =1;
	clrf	(_lostDetect)
	incf	(_lostDetect),f
	line	437
	
l4200:	
;smartkey.C: 436: }
;smartkey.C: 437: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	439
;smartkey.C: 438: }
;smartkey.C: 439: break;
	goto	l761
	line	443
	
l4202:	
;smartkey.C: 442: {
;smartkey.C: 443: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	444
	
l4204:	
;smartkey.C: 444: beepOn();TMR2ON = 0;
	fcall	_beepOn
	
l4206:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	445
	
l4208:	
;smartkey.C: 445: beep(10,2);
	movlw	(02h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	446
	
l4210:	
;smartkey.C: 446: if(mtOldState == 3){reAlertOn =1;}
	movf	(_mtOldState),w
	xorlw	03h
	skipz
	goto	u1351
	goto	u1350
u1351:
	goto	l761
u1350:
	
l4212:	
	clrf	(main@reAlertOn)
	incf	(main@reAlertOn),f
	goto	l761
	line	407
	
l4216:	
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
	goto	l4184
	xorlw	2^1	; case 2
	skipnz
	goto	l4202
	goto	l761
	opt asmopt_on

	line	450
	
l761:	
	line	454
;smartkey.C: 450: }
;smartkey.C: 452: }
;smartkey.C: 454: PAIE = 1;
	bsf	(91/8),(91)&7
	line	462
	
l4218:	
;smartkey.C: 455: }
;smartkey.C: 457: }
;smartkey.C: 461: {
;smartkey.C: 462: if((timeOut!=0)&&( timeTick >timeOut)){
	movf	(_timeOut+1),w
	iorwf	(_timeOut),w
	skipnz
	goto	u1361
	goto	u1360
u1361:
	goto	l770
u1360:
	
l4220:	
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
	goto	l770
u1370:
	goto	l4276
	line	473
	
l4224:	
;smartkey.C: 473: beepOff();
	fcall	_beepOff
	line	474
	
l4226:	
;smartkey.C: 474: RegStatus &=(~0x20);
	bcf	status, 5	;RP0=0, select bank0
	bcf	(_RegStatus)+(5/8),(5)&7
	line	475
	
l4228:	
;smartkey.C: 475: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	476
;smartkey.C: 476: break;
	goto	l770
	line	478
	
l4230:	
;smartkey.C: 478: beepOff();
	fcall	_beepOff
	line	479
	
l4232:	
;smartkey.C: 479: delay_x10ms(20);
	movlw	014h
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	480
	
l4234:	
;smartkey.C: 480: beepOn();TMR2ON = 0;reAlertOn =0;
	fcall	_beepOn
	
l4236:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l4238:	
	clrf	(main@reAlertOn)
	line	481
	
l4240:	
;smartkey.C: 481: beep(30,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(01Eh)
	fcall	_beep
	line	482
	
l4242:	
;smartkey.C: 482: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	line	483
;smartkey.C: 483: break;
	goto	l770
	line	486
	
l4244:	
;smartkey.C: 486: if(READ_EEPROM(0x08)==0xcc) WRITE_EEPROM(0x08,0);
	movlw	(08h)
	fcall	_READ_EEPROM
	xorlw	0CCh
	skipz
	goto	u1381
	goto	u1380
u1381:
	goto	l4248
u1380:
	
l4246:	
	clrf	(?_WRITE_EEPROM)
	movlw	(08h)
	fcall	_WRITE_EEPROM
	line	488
	
l4248:	
;smartkey.C: 488: if(reAlertOn){
	movf	(main@reAlertOn),w
	skipz
	goto	u1390
	goto	l4258
u1390:
	line	489
	
l4250:	
;smartkey.C: 489: setState(4,6000);
	movlw	low(01770h)
	movwf	(?_setState)
	movlw	high(01770h)
	movwf	((?_setState))+1
	movlw	(04h)
	fcall	_setState
	line	490
	
l4252:	
;smartkey.C: 490: cntTmp = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	
l4254:	
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	491
	
l4256:	
;smartkey.C: 491: PR2 =11;
	movlw	(0Bh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	492
;smartkey.C: 492: beepOn();
	fcall	_beepOn
	line	494
;smartkey.C: 494: }else if(mtOldState == 0){
	goto	l770
	
l4258:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_mtOldState),f
	skipz
	goto	u1401
	goto	u1400
u1401:
	goto	l4264
u1400:
	line	496
	
l4260:	
;smartkey.C: 496: beep(10,5);
	movlw	(05h)
	movwf	(?_beep)
	movlw	(0Ah)
	fcall	_beep
	line	497
	
l4262:	
;smartkey.C: 497: RegStatus |=(0x20);
	bsf	(_RegStatus)+(5/8),(5)&7
	line	499
;smartkey.C: 499: setState(1,3500);
	movlw	low(0DACh)
	movwf	(?_setState)
	movlw	high(0DACh)
	movwf	((?_setState))+1
	movlw	(01h)
	fcall	_setState
	line	501
;smartkey.C: 501: }else{
	goto	l770
	line	502
	
l4264:	
;smartkey.C: 502: beepOn();TMR2ON = 0;
	fcall	_beepOn
	
l4266:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	503
	
l4268:	
;smartkey.C: 503: reAlertOn =0;
	clrf	(main@reAlertOn)
	line	504
	
l4270:	
;smartkey.C: 504: beep(30,1);
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(01Eh)
	fcall	_beep
	line	505
	
l4272:	
;smartkey.C: 505: setState(0,0);
	clrf	(?_setState)
	clrf	(?_setState+1)
	movlw	(0)
	fcall	_setState
	goto	l770
	line	464
	
l4276:	
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
	goto	l770
	xorlw	2^1	; case 2
	skipnz
	goto	l4244
	xorlw	3^2	; case 3
	skipnz
	goto	l4224
	xorlw	4^3	; case 4
	skipnz
	goto	l4230
	goto	l770
	opt asmopt_on

	line	509
	
l770:	
	line	513
;smartkey.C: 509: }
;smartkey.C: 511: }
;smartkey.C: 513: if((RC1 ) && (mtState == 1)){
	bcf	status, 5	;RP0=0, select bank0
	btfss	(57/8),(57)&7
	goto	u1411
	goto	u1410
u1411:
	goto	l4310
u1410:
	
l4278:	
	decf	(_mtState),w
	skipz
	goto	u1421
	goto	u1420
u1421:
	goto	l4310
u1420:
	line	514
	
l4280:	
;smartkey.C: 514: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	515
;smartkey.C: 515: while(timeTick <700);
	
l4282:	
	movlw	high(02BCh)
	subwf	(_timeTick+1),w
	movlw	low(02BCh)
	skipnz
	subwf	(_timeTick),w
	skipc
	goto	u1431
	goto	u1430
u1431:
	goto	l4282
u1430:
	line	517
	
l4284:	
;smartkey.C: 517: cntTmp=0;
	clrf	(_cntTmp)
	clrf	(_cntTmp+1)
	line	518
;smartkey.C: 518: while((RC1) &&( cntTmp<9)){
	goto	l4296
	line	519
	
l4286:	
;smartkey.C: 519: beepOn();TMR2ON = 0; beep(10,1);
	fcall	_beepOn
	
l4288:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l4290:	
	clrf	(?_beep)
	incf	(?_beep),f
	movlw	(0Ah)
	fcall	_beep
	line	520
	
l4292:	
;smartkey.C: 520: cntTmp++;
	incf	(_cntTmp),f
	skipnz
	incf	(_cntTmp+1),f
	line	521
	
l4294:	
;smartkey.C: 521: _delay((unsigned long)((1000)*(4000000/4000.0)));
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

	line	518
	
l4296:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(57/8),(57)&7
	goto	u1441
	goto	u1440
u1441:
	goto	l4300
u1440:
	
l4298:	
	movlw	high(09h)
	subwf	(_cntTmp+1),w
	movlw	low(09h)
	skipnz
	subwf	(_cntTmp),w
	skipc
	goto	u1451
	goto	u1450
u1451:
	goto	l4286
u1450:
	line	523
	
l4300:	
;smartkey.C: 522: }
;smartkey.C: 523: cntTmp =0;
	clrf	(_cntTmp)
	clrf	(_cntTmp+1)
	line	524
	
l4302:	
;smartkey.C: 524: if(RC1){
	btfss	(57/8),(57)&7
	goto	u1461
	goto	u1460
u1461:
	goto	l4308
u1460:
	line	526
	
l4304:	
;smartkey.C: 526: RegStatus &=(~0x20);
	bcf	(_RegStatus)+(5/8),(5)&7
	line	527
	
l4306:	
;smartkey.C: 527: setState(2,300);
	movlw	low(012Ch)
	movwf	(?_setState)
	movlw	high(012Ch)
	movwf	((?_setState))+1
	movlw	(02h)
	fcall	_setState
	line	530
	
l4308:	
;smartkey.C: 528: }
;smartkey.C: 530: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	534
	
l4310:	
;smartkey.C: 531: }
;smartkey.C: 534: if(RegStatus & 0x20) {RC4 =1;RC2 =1;}
	btfss	(_RegStatus),(5)&7
	goto	u1471
	goto	u1470
u1471:
	goto	l792
u1470:
	
l4312:	
	bsf	(60/8),(60)&7
	bsf	(58/8),(58)&7
	goto	l4124
	line	535
	
l792:	
;smartkey.C: 535: else {RC4 =0;RC2 =0;}
	bcf	(60/8),(60)&7
	bcf	(58/8),(58)&7
	goto	l4124
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	540
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
;;		On exit  : 60/20
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
	
l3786:	
;sysinit.c: 21: OSCCON = 0B01010001;
	movlw	(051h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	22
	
l3788:	
;sysinit.c: 22: _nop();
	nop
	line	28
;sysinit.c: 28: while(HTS==0);
	
l1447:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1146/8)^080h,(1146)&7
	goto	u811
	goto	u810
u811:
	goto	l1447
u810:
	line	30
	
l1450:	
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
;;		line 166 in file "smartkey.C"
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
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
	line	166
	global	__size_of_beep
	__size_of_beep	equ	__end_of_beep-_beep
	
_beep:	
	opt	stack 5
; Regs used in _beep: [wreg+status,2+status,0+pclath+cstack]
;beep@delay stored from wreg
	movwf	(beep@delay)
	line	171
	
l3772:	
;smartkey.C: 169: {
;smartkey.C: 171: while(rep--){
	goto	l3784
	
l714:	
	line	172
;smartkey.C: 172: TMR2ON = 1;
	bsf	(146/8),(146)&7
	line	173
	
l3774:	
;smartkey.C: 173: PR2 = 12;
	movlw	(0Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	174
	
l3776:	
;smartkey.C: 174: delay_x10ms(delay);
	movf	(beep@delay),w
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	175
	
l3778:	
;smartkey.C: 175: TMR2ON = 0;RA4 =0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	
l3780:	
	bcf	(44/8),(44)&7
	line	176
	
l3782:	
;smartkey.C: 176: delay_x10ms(20);
	movlw	014h
	movwf	(?_delay_x10ms)
	clrf	(?_delay_x10ms+1)
	fcall	_delay_x10ms
	line	171
	
l3784:	
	decf	(beep@rep),f
	movf	((beep@rep)),w
	xorlw	0FFh
	skipz
	goto	u801
	goto	u800
u801:
	goto	l714
u800:
	line	180
	
l716:	
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
;;		line 67 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  tmp             1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
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
	line	67
	global	__size_of_int_init
	__size_of_int_init	equ	__end_of_int_init-_int_init
	
_int_init:	
	opt	stack 6
; Regs used in _int_init: [wreg+status,2]
	line	72
	
l3742:	
;sysinit.c: 72: INTCON = 0B00000000;
	clrf	(11)	;volatile
	line	73
;sysinit.c: 73: PIE1 = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(140)^080h	;volatile
	line	74
;sysinit.c: 74: PIR1 = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(12)	;volatile
	line	76
	
l3744:	
;sysinit.c: 76: IOCA6 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1206/8)^080h,(1206)&7
	line	77
	
l3746:	
;sysinit.c: 77: tmp = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	movf	(5),w	;volatile
	line	78
	
l3748:	
;sysinit.c: 78: PAIF = 0;
	bcf	(88/8),(88)&7
	line	79
	
l3750:	
;sysinit.c: 79: PAIE = 0;
	bcf	(91/8),(91)&7
	line	82
	
l3752:	
;sysinit.c: 82: INTEDG = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1038/8)^080h,(1038)&7
	line	83
	
l3754:	
;sysinit.c: 83: INTF = 0;
	bcf	(89/8),(89)&7
	line	84
	
l3756:	
;sysinit.c: 84: INTE = 0;
	bcf	(92/8),(92)&7
	line	86
	
l3758:	
;sysinit.c: 86: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(97/8),(97)&7
	line	87
	
l3760:	
;sysinit.c: 87: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	88
	
l3762:	
;sysinit.c: 88: TMR2ON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(146/8),(146)&7
	line	90
	
l3764:	
;sysinit.c: 90: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	91
	
l3766:	
;sysinit.c: 91: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	94
	
l3768:	
;sysinit.c: 94: PEIE = 1;
	bsf	(94/8),(94)&7
	line	96
	
l3770:	
;sysinit.c: 96: GIE = 1;
	bsf	(95/8),(95)&7
	line	97
	
l1459:	
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
;;		line 45 in file "sysinit.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
	line	45
	global	__size_of_timer_init
	__size_of_timer_init	equ	__end_of_timer_init-_timer_init
	
_timer_init:	
	opt	stack 6
; Regs used in _timer_init: [wreg+status,2]
	line	55
	
l3730:	
;sysinit.c: 55: TMR2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(17)	;volatile
	line	56
;sysinit.c: 56: PR2 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(146)^080h	;volatile
	line	57
	
l3732:	
;sysinit.c: 57: T2CON = 0B00101001;
	movlw	(029h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	60
	
l3734:	
;sysinit.c: 60: TMR1H = -5000>>8;
	movlw	(0ECh)
	movwf	(15)	;volatile
	line	61
	
l3736:	
;sysinit.c: 61: TMR1L = -5000;
	movlw	(078h)
	movwf	(14)	;volatile
	line	62
	
l3738:	
;sysinit.c: 62: T1CON = 0B00100001;
	movlw	(021h)
	movwf	(16)	;volatile
	line	63
	
l3740:	
;sysinit.c: 63: TMR1ON = 1;
	bsf	(128/8),(128)&7
	line	64
	
l1456:	
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
;;		On entry : 60/20
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
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
	
l3720:	
;sysinit.c: 34: PORTA = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(5)	;volatile
	line	35
	
l3722:	
;sysinit.c: 35: TRISA = 0B01101110;
	movlw	(06Eh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	36
	
l3724:	
;sysinit.c: 36: WPUA = 0B10010000;
	movlw	(090h)
	movwf	(149)^080h	;volatile
	line	38
;sysinit.c: 38: PORTC = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	39
	
l3726:	
;sysinit.c: 39: TRISC = 0B11101011;
	movlw	(0EBh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	40
	
l3728:	
;sysinit.c: 40: WPUC = 0B00010000;
	movlw	(010h)
	movwf	(136)^080h	;volatile
	line	42
	
l1453:	
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
;;		line 211 in file "smartkey.C"
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
;;		On entry : 40/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
	line	211
	global	__size_of_setState
	__size_of_setState	equ	__end_of_setState-_setState
	
_setState:	
	opt	stack 6
; Regs used in _setState: [wreg+status,2]
;setState@stt stored from wreg
	movwf	(setState@stt)
	line	212
	
l3714:	
;smartkey.C: 212: mtOldState = mtState;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_mtState),w
	movwf	(_mtOldState)
	line	213
;smartkey.C: 213: mtState = stt;
	movf	(setState@stt),w
	movwf	(_mtState)
	line	214
	
l3716:	
;smartkey.C: 214: timeTick =0;
	clrf	(_timeTick)
	clrf	(_timeTick+1)
	line	215
	
l3718:	
;smartkey.C: 215: timeOut = _tOut;
	movf	(setState@_tOut+1),w
	movwf	(_timeOut+1)
	movf	(setState@_tOut),w
	movwf	(_timeOut)
	line	216
	
l731:	
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
;;		line 196 in file "smartkey.C"
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
;;		On entry : 40/0
;;		On exit  : 60/20
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
	line	196
	global	__size_of_WRITE_EEPROM
	__size_of_WRITE_EEPROM	equ	__end_of_WRITE_EEPROM-_WRITE_EEPROM
	
_WRITE_EEPROM:	
	opt	stack 6
; Regs used in _WRITE_EEPROM: [wreg]
;WRITE_EEPROM@EEAddr stored from wreg
	movwf	(WRITE_EEPROM@EEAddr)
	line	197
	
l3706:	
;smartkey.C: 197: GIE = 0;
	bcf	(95/8),(95)&7
	line	198
;smartkey.C: 198: while(GIE) asm("clrwdt");
	goto	l722
	
l723:	
# 198 "smartkey.C"
clrwdt ;#
psect	text463
	
l722:	
	btfsc	(95/8),(95)&7
	goto	u781
	goto	u780
u781:
	goto	l723
u780:
	line	199
	
l3708:	
;smartkey.C: 199: EEADR = EEAddr;
	movf	(WRITE_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(155)^080h	;volatile
	line	200
;smartkey.C: 200: EEDAT = EEData;
	movf	(WRITE_EEPROM@EEData),w
	movwf	(154)^080h	;volatile
	line	201
	
l3710:	
;smartkey.C: 201: EEIF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(103/8),(103)&7
	line	202
;smartkey.C: 202: EECON1 = 0x34;
	movlw	(034h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(156)^080h	;volatile
	line	203
	
l3712:	
;smartkey.C: 203: WR = 1;
	bsf	(1256/8)^080h,(1256)&7
	line	204
;smartkey.C: 204: while(WR) asm("clrwdt");
	goto	l725
	
l726:	
# 204 "smartkey.C"
clrwdt ;#
psect	text463
	
l725:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1256/8)^080h,(1256)&7
	goto	u791
	goto	u790
u791:
	goto	l726
u790:
	
l727:	
	line	206
;smartkey.C: 206: GIE = 1;
	bsf	(95/8),(95)&7
	line	207
	
l728:	
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
;;		line 185 in file "smartkey.C"
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
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
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
	line	185
	global	__size_of_READ_EEPROM
	__size_of_READ_EEPROM	equ	__end_of_READ_EEPROM-_READ_EEPROM
	
_READ_EEPROM:	
	opt	stack 6
; Regs used in _READ_EEPROM: [wreg]
;READ_EEPROM@EEAddr stored from wreg
	line	188
	movwf	(READ_EEPROM@EEAddr)
	
l3698:	
;smartkey.C: 186: unsigned char ReEepromData;
;smartkey.C: 188: EEADR = EEAddr;
	movf	(READ_EEPROM@EEAddr),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(155)^080h	;volatile
	line	189
	
l3700:	
;smartkey.C: 189: RD = 1;
	bsf	(1248/8)^080h,(1248)&7
	line	190
;smartkey.C: 190: ReEepromData = EEDAT;
	movf	(154)^080h,w	;volatile
	movwf	(READ_EEPROM@ReEepromData)
	line	191
	
l3702:	
;smartkey.C: 191: RD = 0;
	bcf	(1248/8)^080h,(1248)&7
	line	192
;smartkey.C: 192: return ReEepromData;
	movf	(READ_EEPROM@ReEepromData),w
	line	193
	
l719:	
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
;;		line 162 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 40/20
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
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
	line	162
	global	__size_of_beepOn
	__size_of_beepOn	equ	__end_of_beepOn-_beepOn
	
_beepOn:	
	opt	stack 6
; Regs used in _beepOn: []
	line	163
	
l3696:	
;smartkey.C: 163: TMR2ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(146/8),(146)&7
	line	164
;smartkey.C: 164: TRISA &= 0xef;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(4/8),(4)&7	;volatile
	line	165
	
l710:	
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
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
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
	line	159
	global	__size_of_beepOff
	__size_of_beepOff	equ	__end_of_beepOff-_beepOff
	
_beepOff:	
	opt	stack 6
; Regs used in _beepOff: []
	line	160
	
l3694:	
;smartkey.C: 160: TMR2ON = 0;RA4 =0;TRISA |= 0x10;
	bcf	(146/8),(146)&7
	bcf	(44/8),(44)&7
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(4/8),(4)&7	;volatile
	line	161
	
l707:	
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
;;		line 154 in file "smartkey.C"
;; Parameters:    Size  Location     Type
;;  t               2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  set             2    4[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 40/20
;;		On exit  : 40/20
;;		Unchanged: FFFBF/0
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
	line	154
	global	__size_of_delay_x10ms
	__size_of_delay_x10ms	equ	__end_of_delay_x10ms-_delay_x10ms
	
_delay_x10ms:	
	opt	stack 5
; Regs used in _delay_x10ms: [wreg]
	line	155
	
l3690:	
;smartkey.C: 155: unsigned int set = t + timeTick;
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
	line	156
;smartkey.C: 156: while(timeTick < set);
	
l3692:	
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
	goto	l3692
u770:
	line	157
	
l704:	
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
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
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
	
i1l3620:	
;smartkey.C: 49: if(PAIE&&PAIF){
	btfss	(91/8),(91)&7
	goto	u58_21
	goto	u58_20
u58_21:
	goto	i1l3638
u58_20:
	
i1l3622:	
	btfss	(88/8),(88)&7
	goto	u59_21
	goto	u59_20
u59_21:
	goto	i1l3638
u59_20:
	line	52
	
i1l3624:	
;smartkey.C: 52: tmp = PORTA;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(5),w	;volatile
	line	53
	
i1l3626:	
;smartkey.C: 53: PAIF = 0;
	bcf	(88/8),(88)&7
	line	55
	
i1l3628:	
;smartkey.C: 55: if(RA6){
	btfss	(46/8),(46)&7
	goto	u60_21
	goto	u60_20
u60_21:
	goto	i1l3636
u60_20:
	line	57
	
i1l3630:	
;smartkey.C: 57: if(mode_chek == 0){
	movf	(_mode_chek),f
	skipz
	goto	u61_21
	goto	u61_20
u61_21:
	goto	i1l3638
u61_20:
	line	58
	
i1l3632:	
;smartkey.C: 58: cntCyc = 0;
	clrf	(_cntCyc)
	line	59
;smartkey.C: 59: cntOff = 0;
	clrf	(_cntOff)
	line	61
	
i1l3634:	
;smartkey.C: 61: mode_chek = 1;
	clrf	(_mode_chek)
	incf	(_mode_chek),f
	goto	i1l3638
	line	67
	
i1l3636:	
;smartkey.C: 66: else{
;smartkey.C: 67: cntOff = 0;
	clrf	(_cntOff)
	line	78
	
i1l3638:	
;smartkey.C: 70: }
;smartkey.C: 72: }
;smartkey.C: 78: if(TMR1IE&&TMR1IF){
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1120/8)^080h,(1120)&7
	goto	u62_21
	goto	u62_20
u62_21:
	goto	i1l3682
u62_20:
	
i1l3640:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(96/8),(96)&7
	goto	u63_21
	goto	u63_20
u63_21:
	goto	i1l3682
u63_20:
	line	80
	
i1l3642:	
;smartkey.C: 80: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	82
	
i1l3644:	
;smartkey.C: 82: TMR1H = -5000>>8;
	movlw	(0ECh)
	movwf	(15)	;volatile
	line	83
;smartkey.C: 83: TMR1L = -5000;
	movlw	(078h)
	movwf	(14)	;volatile
	line	89
;smartkey.C: 89: if( mode_chek == 1){
	decf	(_mode_chek),w
	skipz
	goto	u64_21
	goto	u64_20
u64_21:
	goto	i1l3666
u64_20:
	line	91
	
i1l3646:	
;smartkey.C: 91: cntCyc++;
	incf	(_cntCyc),f
	line	93
	
i1l3648:	
;smartkey.C: 93: if(RA6==0){
	btfsc	(46/8),(46)&7
	goto	u65_21
	goto	u65_20
u65_21:
	goto	i1l3666
u65_20:
	line	95
	
i1l3650:	
;smartkey.C: 95: cntOff++;
	incf	(_cntOff),f
	line	98
	
i1l3652:	
;smartkey.C: 98: if(cntOff > 15){
	movlw	(010h)
	subwf	(_cntOff),w
	skipc
	goto	u66_21
	goto	u66_20
u66_21:
	goto	i1l3666
u66_20:
	line	100
	
i1l3654:	
;smartkey.C: 100: mode_chek = 0;
	clrf	(_mode_chek)
	line	102
	
i1l3656:	
;smartkey.C: 102: if((cntCyc>15) &&(cntCyc<50)) {
	movlw	(010h)
	subwf	(_cntCyc),w
	skipc
	goto	u67_21
	goto	u67_20
u67_21:
	goto	i1l3662
u67_20:
	
i1l3658:	
	movlw	(032h)
	subwf	(_cntCyc),w
	skipnc
	goto	u68_21
	goto	u68_20
u68_21:
	goto	i1l3662
u68_20:
	line	103
	
i1l3660:	
;smartkey.C: 103: RegStatus |= (0x40);
	bsf	(_RegStatus)+(6/8),(6)&7
	line	104
;smartkey.C: 104: } else if (cntCyc>=50){
	goto	i1l688
	
i1l3662:	
	movlw	(032h)
	subwf	(_cntCyc),w
	skipc
	goto	u69_21
	goto	u69_20
u69_21:
	goto	i1l688
u69_20:
	line	105
	
i1l3664:	
;smartkey.C: 105: RegStatus &= ~(0x40);
	bcf	(_RegStatus)+(6/8),(6)&7
	line	109
	
i1l688:	
;smartkey.C: 106: }
;smartkey.C: 109: RegStatus |= 0x80;
	bsf	(_RegStatus)+(7/8),(7)&7
	line	125
	
i1l3666:	
;smartkey.C: 110: }
;smartkey.C: 112: }
;smartkey.C: 122: }
;smartkey.C: 125: timeTick++;
	incf	(_timeTick),f
	skipnz
	incf	(_timeTick+1),f
	line	127
	
i1l3668:	
;smartkey.C: 127: if((mtState == 4)||(mtState == 3)){
	movf	(_mtState),w
	xorlw	04h
	skipnz
	goto	u70_21
	goto	u70_20
u70_21:
	goto	i1l3672
u70_20:
	
i1l3670:	
	movf	(_mtState),w
	xorlw	03h
	skipz
	goto	u71_21
	goto	u71_20
u71_21:
	goto	i1l3682
u71_20:
	line	129
	
i1l3672:	
;smartkey.C: 129: if(timeTick > cntTmp){
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
	goto	i1l3682
u72_20:
	line	130
	
i1l3674:	
;smartkey.C: 130: cntTmp = timeTick+40;
	movf	(_timeTick+1),w
	movwf	(_cntTmp+1)
	movf	(_timeTick),w
	movwf	(_cntTmp)
	movlw	028h
	addwf	(_cntTmp),f
	skipnc
	incf	(_cntTmp+1),f
	line	131
;smartkey.C: 131: if(cntTmp<=timeOut)
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
	goto	i1l3682
u73_20:
	line	133
	
i1l3676:	
;smartkey.C: 132: {
;smartkey.C: 133: if(PR2 == 11)
	bsf	status, 5	;RP0=1, select bank1
	movf	(146)^080h,w	;volatile
	xorlw	0Bh
	skipz
	goto	u74_21
	goto	u74_20
u74_21:
	goto	i1l3680
u74_20:
	line	134
	
i1l3678:	
;smartkey.C: 134: PR2 = 30;
	movlw	(01Eh)
	movwf	(146)^080h	;volatile
	goto	i1l3682
	line	136
	
i1l3680:	
;smartkey.C: 135: else
;smartkey.C: 136: PR2 = 11;
	movlw	(0Bh)
	movwf	(146)^080h	;volatile
	line	145
	
i1l3682:	
;smartkey.C: 137: }
;smartkey.C: 138: }
;smartkey.C: 139: }
;smartkey.C: 142: }
;smartkey.C: 145: if(TMR2IE&&TMR2IF)
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1121/8)^080h,(1121)&7
	goto	u75_21
	goto	u75_20
u75_21:
	goto	i1l698
u75_20:
	
i1l3684:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u76_21
	goto	u76_20
u76_21:
	goto	i1l698
u76_20:
	line	147
	
i1l3686:	
;smartkey.C: 146: {
;smartkey.C: 147: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	148
	
i1l3688:	
;smartkey.C: 148: RA4 =~ RA4;
	movlw	1<<((44)&7)
	xorwf	((44)/8),f
	line	151
	
i1l698:	
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
