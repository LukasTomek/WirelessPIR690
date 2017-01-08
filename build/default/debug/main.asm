;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"main.c"
	list	p=16f690
	radix dec
	include "p16f690.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3fd4
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_init
	extern	__moduint
	extern	__divuint
	extern	_STATUSbits
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_INTCONbits
	extern	_PIR1bits
	extern	_PIR2bits
	extern	_T1CONbits
	extern	_T2CONbits
	extern	_SSPCONbits
	extern	_CCP1CONbits
	extern	_RCSTAbits
	extern	_PWM1CONbits
	extern	_ECCPASbits
	extern	_ADCON0bits
	extern	_OPTION_REGbits
	extern	_TRISAbits
	extern	_TRISBbits
	extern	_TRISCbits
	extern	_PIE1bits
	extern	_PIE2bits
	extern	_PCONbits
	extern	_OSCCONbits
	extern	_OSCTUNEbits
	extern	_MSKbits
	extern	_SSPMSKbits
	extern	_SSPSTATbits
	extern	_WPUbits
	extern	_WPUAbits
	extern	_IOCbits
	extern	_IOCAbits
	extern	_WDTCONbits
	extern	_TXSTAbits
	extern	_SPBRGbits
	extern	_SPBRGHbits
	extern	_BAUDCTLbits
	extern	_ADCON1bits
	extern	_WPUBbits
	extern	_IOCBbits
	extern	_VRCONbits
	extern	_CM1CON0bits
	extern	_CM2CON0bits
	extern	_CM2CON1bits
	extern	_ANSELbits
	extern	_ANSELHbits
	extern	_EECON1bits
	extern	_PSTRCONbits
	extern	_SRCONbits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PCLATH
	extern	_INTCON
	extern	_PIR1
	extern	_PIR2
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_T1CON
	extern	_TMR2
	extern	_T2CON
	extern	_SSPBUF
	extern	_SSPCON
	extern	_CCPR
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_CCP1CON
	extern	_RCSTA
	extern	_TXREG
	extern	_RCREG
	extern	_PWM1CON
	extern	_ECCPAS
	extern	_ADRESH
	extern	_ADCON0
	extern	_OPTION_REG
	extern	_TRISA
	extern	_TRISB
	extern	_TRISC
	extern	_PIE1
	extern	_PIE2
	extern	_PCON
	extern	_OSCCON
	extern	_OSCTUNE
	extern	_PR2
	extern	_MSK
	extern	_SSPADD
	extern	_SSPMSK
	extern	_SSPSTAT
	extern	_WPU
	extern	_WPUA
	extern	_IOC
	extern	_IOCA
	extern	_WDTCON
	extern	_TXSTA
	extern	_SPBRG
	extern	_SPBRGH
	extern	_BAUDCTL
	extern	_ADRESL
	extern	_ADCON1
	extern	_EEDAT
	extern	_EEDATA
	extern	_EEADR
	extern	_EEDATH
	extern	_EEADRH
	extern	_WPUB
	extern	_IOCB
	extern	_VRCON
	extern	_CM1CON0
	extern	_CM2CON0
	extern	_CM2CON1
	extern	_ANSEL
	extern	_ANSELH
	extern	_EECON1
	extern	_EECON2
	extern	_PSTRCON
	extern	_SRCON
	extern	___sdcc_saved_fsr
	extern	__mulchar
	extern	__moduchar
	extern	__divuchar
	extern	__gptrget1
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_SP_send_error
	global	_SP_send
	global	_uint8_to_ascii
	global	_dec_to_ascii
	global	_circBufPush
	global	_receive_intr
	global	_main
	global	_bitfield
	global	_w
	global	_t
	global	_w1
	global	_t1
	global	_bw
	global	_bt
	global	_buf
	global	_buf_head
	global	_buf_tail
	global	_int_error_cnt
	global	_t2
	global	_w2
	global	_strV0
	global	_strV1
	global	_strVF
	global	_strw
	global	_strt
	global	_strw1
	global	_strt1
	global	_tab
	global	_enter
	global	_sync
	global	_int_err
	global	_buf_err

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0070
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
UD_main_0	udata
_bitfield	res	1

UD_main_1	udata
_bw	res	20

UD_main_2	udata
_bt	res	20

UD_main_3	udata
_buf	res	16

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_main_0	udata
r0x1077	res	1
r0x1078	res	1
r0x1079	res	1
r0x106F	res	1
r0x1071	res	1
r0x1070	res	1
r0x1072	res	1
r0x1073	res	1
r0x1074	res	1
r0x1075	res	1
r0x1076	res	1
r0x1055	res	1
r0x1056	res	1
r0x1058	res	1
r0x1057	res	1
r0x1059	res	1
r0x1068	res	1
r0x1067	res	1
r0x1069	res	1
r0x106A	res	1
r0x106B	res	1
r0x106E	res	1
r0x1062	res	1
r0x1063	res	1
r0x1064	res	1
r0x1065	res	1
r0x1066	res	1
r0x105C	res	1
r0x105B	res	1
r0x105A	res	1
r0x105D	res	1
r0x105E	res	1
r0x105F	res	1
r0x1060	res	1
r0x1061	res	1
r0x104F	res	1
r0x104E	res	1
r0x104D	res	1
r0x1050	res	1
r0x1051	res	1
r0x1052	res	1
r0x1053	res	1
r0x1054	res	1
_dec_to_ascii_number_1_25	res	4
_uint8_to_ascii_number_1_29	res	4
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_main_0	idata
_w
	db	0x00, 0x00


ID_main_1	idata
_t
	db	0x00, 0x00


ID_main_2	idata
_w1
	db	0x00, 0x00


ID_main_3	idata
_t1
	db	0x00, 0x00


ID_main_4	idata
_buf_head
	db	0x00


ID_main_5	idata
_buf_tail
	db	0x00


ID_main_6	idata
_int_error_cnt
	db	0x00


ID_main_7	idata
_t2
	db	0x00


ID_main_8	idata
_w2
	db	0x00


ID_main_9	code
_strV0
	retlw 0x30
	retlw 0x20
	retlw 0x0a
	retlw 0x00


ID_main_10	code
_strV1
	retlw 0x31
	retlw 0x20
	retlw 0x0a
	retlw 0x00


ID_main_11	code
_strVF
	retlw 0x46
	retlw 0x20
	retlw 0x0a
	retlw 0x00


ID_main_12	code
_strw
	retlw 0x77
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_13	code
_strt
	retlw 0x74
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_14	code
_strw1
	retlw 0x77
	retlw 0x31
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_15	code
_strt1
	retlw 0x74
	retlw 0x31
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_16	code
_tab
	retlw 0x09
	retlw 0x00


ID_main_17	code
_enter
	retlw 0x0a
	retlw 0x00


ID_main_18	code
_sync
	retlw 0x53
	retlw 0x59
	retlw 0x4e
	retlw 0x43
	retlw 0x0a
	retlw 0x00


ID_main_19	code
_int_err
	retlw 0x49
	retlw 0x4e
	retlw 0x54
	retlw 0x20
	retlw 0x45
	retlw 0x52
	retlw 0x52
	retlw 0x0a
	retlw 0x00


ID_main_20	code
_buf_err
	retlw 0x42
	retlw 0x55
	retlw 0x46
	retlw 0x46
	retlw 0x45
	retlw 0x52
	retlw 0x20
	retlw 0x4f
	retlw 0x57
	retlw 0x45
	retlw 0x52
	retlw 0x46
	retlw 0x4c
	retlw 0x4f
	retlw 0x57
	retlw 0x0a
	retlw 0x00

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
c_interrupt	code	0x0004
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;functions called:
;   _dec_to_ascii
;   _SP_send
;   _dec_to_ascii
;   _SP_send
;5 compiler assigned registers:
;   r0x1077
;   r0x1078
;   STK00
;   r0x1079
;   STK01
;; Starting pCode block
_receive_intr:
; 0 exit points
;	.line	91; "main.c"	void receive_intr() __interrupt 0 {
	MOVWF	WSAVE
	SWAPF	STATUS,W
	CLRF	STATUS
	MOVWF	SSAVE
	MOVF	PCLATH,W
	CLRF	PCLATH
	MOVWF	PSAVE
	MOVF	FSR,W
	BANKSEL	___sdcc_saved_fsr
	MOVWF	___sdcc_saved_fsr
;	.line	93; "main.c"	if(TXIF){
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,4
	GOTO	_00111_DS_
;	.line	95; "main.c"	if (buf_head == buf_tail){
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	_buf_head
	XORWF	_buf_head,W
	BTFSS	STATUS,2
	GOTO	_00108_DS_
;	.line	96; "main.c"	TXIE = 0;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,4
	GOTO	_00111_DS_
_00108_DS_:
;	.line	101; "main.c"	TXREG = buf[buf_tail];
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x1077
	MOVWF	r0x1077
	MOVLW	high (_buf + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1078
	MOVF	r0x1077,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1078
	BTFSC	r0x1078,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	MOVWF	_TXREG
;	.line	102; "main.c"	buf[buf_tail] = 0;  // clear the data (optional)
	BANKSEL	r0x1077
	MOVF	r0x1077,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1078
	BTFSC	r0x1078,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	104; "main.c"	next = buf_tail + 1;
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x1077
	MOVWF	r0x1077
	CLRF	r0x1078
	INCF	r0x1077,F
	BTFSC	STATUS,2
	INCF	r0x1078,F
;;signed compare: left < lit(0x10=16), size=2, mask=ffff
;	.line	105; "main.c"	if(next >= BUF_SIZE)
	MOVF	r0x1078,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00134_DS_
	MOVLW	0x10
	SUBWF	r0x1077,W
_00134_DS_:
	BTFSS	STATUS,0
	GOTO	_00106_DS_
;;genSkipc:3257: created from rifx:0x7ffe5fb33c30
;	.line	106; "main.c"	next = 0;
	BANKSEL	r0x1077
	CLRF	r0x1077
	CLRF	r0x1078
_00106_DS_:
;	.line	108; "main.c"	buf_tail = next;
	BANKSEL	r0x1077
	MOVF	r0x1077,W
	BANKSEL	_buf_tail
	MOVWF	_buf_tail
_00111_DS_:
;	.line	112; "main.c"	TMR1H = 0;
	BANKSEL	_TMR1H
	CLRF	_TMR1H
;	.line	113; "main.c"	TMR1L = 0;
	CLRF	_TMR1L
;	.line	114; "main.c"	if(CCP1IF){
	BTFSS	_PIR1bits,2
	GOTO	_00117_DS_
;	.line	115; "main.c"	CCP1IE = FALSE;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,2
;	.line	117; "main.c"	if(CCP1M0){                     // if ECCP mode is Rising edge CCP1M0
	BANKSEL	_CCP1CONbits
	BTFSS	_CCP1CONbits,0
	GOTO	_00113_DS_
;	.line	118; "main.c"	CCP1M0 = FALING;                 // set falling edge
	BCF	_CCP1CONbits,0
;	.line	119; "main.c"	CCPR1H = 0;
	CLRF	_CCPR1H
;	.line	120; "main.c"	CCPR1L = 0;
	CLRF	_CCPR1L
;	.line	122; "main.c"	t = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
	MOVF	_CCPR1H,W
	BANKSEL	r0x1077
	MOVWF	r0x1077
	BANKSEL	_t
	MOVWF	_t
	CLRF	(_t + 1)
;	.line	123; "main.c"	t = t << 8;
	MOVF	_t,W
	MOVWF	(_t + 1)
	CLRF	_t
;	.line	124; "main.c"	t = t | CCPR1L;             //ECCP combined 16 bit number formation*/
	BANKSEL	_CCPR1L
	MOVF	_CCPR1L,W
	BANKSEL	r0x1077
	MOVWF	r0x1077
	CLRF	r0x1078
	MOVF	r0x1077,W
	BANKSEL	_t
	IORWF	_t,F
	MOVLW	0x00
	IORWF	(_t + 1),F
;	.line	126; "main.c"	bitfield.Capture = TRUE;
	BANKSEL	_bitfield
	BSF	_bitfield,0
	GOTO	_00114_DS_
_00113_DS_:
;	.line	129; "main.c"	CCP1M0 = RISING;
	BANKSEL	_CCP1CONbits
	BSF	_CCP1CONbits,0
;	.line	131; "main.c"	w = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
	MOVF	_CCPR1H,W
	BANKSEL	r0x1077
	MOVWF	r0x1077
	BANKSEL	_w
	MOVWF	_w
	CLRF	(_w + 1)
;	.line	132; "main.c"	w = w << 8;
	MOVF	_w,W
	MOVWF	(_w + 1)
	CLRF	_w
;	.line	133; "main.c"	w = w | CCPR1L;             //ECCP combined 16 bit number formation
	BANKSEL	_CCPR1L
	MOVF	_CCPR1L,W
	BANKSEL	r0x1077
	MOVWF	r0x1077
	CLRF	r0x1078
	MOVF	r0x1077,W
	BANKSEL	_w
	IORWF	_w,F
	MOVLW	0x00
	IORWF	(_w + 1),F
;	.line	135; "main.c"	bitfield.Capture = TRUE;
	BANKSEL	_bitfield
	BSF	_bitfield,0
_00114_DS_:
;	.line	138; "main.c"	CCP1IF = 0;                     //Clear interrupt flag
	BANKSEL	_PIR1bits
	BCF	_PIR1bits,2
;	.line	139; "main.c"	t = 0x0000 | TMR1H;        //ECCP result higher 8 bits
	MOVF	_TMR1H,W
	BANKSEL	r0x1077
	MOVWF	r0x1077
	BANKSEL	_t
	MOVWF	_t
	CLRF	(_t + 1)
;	.line	140; "main.c"	t = t << 8;
	MOVF	_t,W
	MOVWF	(_t + 1)
	CLRF	_t
;	.line	141; "main.c"	t = t | TMR1L;             //ECCP combined 16 bit number formation
	BANKSEL	_TMR1L
	MOVF	_TMR1L,W
	BANKSEL	r0x1077
	MOVWF	r0x1077
	CLRF	r0x1078
	MOVF	r0x1077,W
	BANKSEL	_t
	IORWF	_t,F
	MOVLW	0x00
	IORWF	(_t + 1),F
;	.line	142; "main.c"	dec_to_ascii(t);
	MOVF	_t,W
	MOVWF	STK00
	MOVF	(_t + 1),W
	PAGESEL	_dec_to_ascii
	CALL	_dec_to_ascii
	PAGESEL	$
;	.line	143; "main.c"	SP_send(enter);
	MOVLW	high (_enter + 0)
	BANKSEL	r0x1078
	MOVWF	r0x1078
	MOVLW	(_enter + 0)
	MOVWF	r0x1077
	MOVLW	0x80
	MOVWF	r0x1079
	MOVF	r0x1077,W
	MOVWF	STK01
	MOVF	r0x1078,W
	MOVWF	STK00
	MOVF	r0x1079,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
_00117_DS_:
	BANKSEL	___sdcc_saved_fsr
	MOVF	___sdcc_saved_fsr,W
	BANKSEL	FSR
	MOVWF	FSR
	MOVF	PSAVE,W
	MOVWF	PCLATH
	CLRF	STATUS
	SWAPF	SSAVE,W
	MOVWF	STATUS
	SWAPF	WSAVE,F
	SWAPF	WSAVE,W
END_OF_INTERRUPT:
	RETFIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
code_main	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _init
;   _SP_send
;   _uint8_to_ascii
;   _SP_send
;   __mulchar
;   _SP_send
;   _circBufPush
;   _SP_send
;   __mulchar
;   _dec_to_ascii
;   _SP_send
;   _dec_to_ascii
;   _SP_send
;   _SP_send
;   _init
;   _SP_send
;   _uint8_to_ascii
;   _SP_send
;   __mulchar
;   _SP_send
;   _circBufPush
;   _SP_send
;   __mulchar
;   _dec_to_ascii
;   _SP_send
;   _dec_to_ascii
;   _SP_send
;   _SP_send
;10 compiler assigned registers:
;   r0x106F
;   r0x1070
;   r0x1071
;   r0x1072
;   STK01
;   STK00
;   r0x1073
;   r0x1074
;   r0x1075
;   r0x1076
;; Starting pCode block
S_main__main	code
_main:
; 2 exit points
;	.line	160; "main.c"	init();
	PAGESEL	_init
	CALL	_init
	PAGESEL	$
;	.line	161; "main.c"	bitfield.Hint = FALSE;
	BANKSEL	_bitfield
	BCF	_bitfield,2
;	.line	162; "main.c"	TMR0 = 0;
	BANKSEL	_TMR0
	CLRF	_TMR0
;	.line	163; "main.c"	hint = TMR0;
	MOVF	_TMR0,W
	BANKSEL	r0x106F
	MOVWF	r0x106F
;	.line	164; "main.c"	SP_send(strw1);
	MOVLW	high (_strw1 + 0)
	MOVWF	r0x1070
	MOVLW	(_strw1 + 0)
	MOVWF	r0x1071
	MOVLW	0x80
	MOVWF	r0x1072
	MOVF	r0x1071,W
	MOVWF	STK01
	MOVF	r0x1070,W
	MOVWF	STK00
	MOVF	r0x1072,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	165; "main.c"	uint8_to_ascii(hint);
	BANKSEL	r0x106F
	MOVF	r0x106F,W
	PAGESEL	_uint8_to_ascii
	CALL	_uint8_to_ascii
	PAGESEL	$
;	.line	166; "main.c"	SP_send(enter);
	MOVLW	high (_enter + 0)
	BANKSEL	r0x1071
	MOVWF	r0x1071
	MOVLW	(_enter + 0)
	MOVWF	r0x106F
	MOVLW	0x80
	MOVWF	r0x1070
	MOVF	r0x106F,W
	MOVWF	STK01
	MOVF	r0x1071,W
	MOVWF	STK00
	MOVF	r0x1070,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	167; "main.c"	while(1)
	BANKSEL	r0x106F
	CLRF	r0x106F
_00153_DS_:
;	.line	183; "main.c"	if (bitfield.Capture){
	BANKSEL	_bitfield
	BTFSS	_bitfield,0
	GOTO	_00148_DS_
;	.line	184; "main.c"	bitfield.Capture = FALSE;
	BCF	_bitfield,0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x759=1881), size=2
;	.line	194; "main.c"	if (t > MIN_T && t < MAX_T && t1 > MIN_T && t1 < MAX_T){
	MOVLW	0x07
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00193_DS_
	MOVLW	0x59
	SUBWF	_t,W
_00193_DS_:
	BTFSS	STATUS,0
	GOTO	_00140_DS_
;;genSkipc:3257: created from rifx:0x7ffe5fb33c30
;;unsigned compare: left < lit(0x79E=1950), size=2
	MOVLW	0x07
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00194_DS_
	MOVLW	0x9e
	SUBWF	_t,W
_00194_DS_:
	BTFSC	STATUS,0
	GOTO	_00140_DS_
;;genSkipc:3257: created from rifx:0x7ffe5fb33c30
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x759=1881), size=2
	MOVLW	0x07
	BANKSEL	_t1
	SUBWF	(_t1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00195_DS_
	MOVLW	0x59
	SUBWF	_t1,W
_00195_DS_:
	BTFSS	STATUS,0
	GOTO	_00140_DS_
;;genSkipc:3257: created from rifx:0x7ffe5fb33c30
;;unsigned compare: left < lit(0x79E=1950), size=2
	MOVLW	0x07
	BANKSEL	_t1
	SUBWF	(_t1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00196_DS_
	MOVLW	0x9e
	SUBWF	_t1,W
_00196_DS_:
	BTFSC	STATUS,0
	GOTO	_00140_DS_
;;genSkipc:3257: created from rifx:0x7ffe5fb33c30
;	.line	195; "main.c"	bitfield.Hint = TRUE;
	BANKSEL	_bitfield
	BSF	_bitfield,2
;;unsigned compare: left < lit(0xA=10), size=1
_00140_DS_:
;	.line	197; "main.c"	if (i < 10 && bitfield.Hint){
	MOVLW	0x0a
	BANKSEL	r0x106F
	SUBWF	r0x106F,W
	BTFSC	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffe5fb33c30
	BANKSEL	_bitfield
	BTFSS	_bitfield,2
	GOTO	_00145_DS_
;	.line	198; "main.c"	bw[i] = w;
	MOVLW	0x02
	MOVWF	STK00
	BANKSEL	r0x106F
	MOVF	r0x106F,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x1071
	MOVWF	r0x1071
	CLRF	r0x1070
	MOVF	r0x1071,W
	ADDLW	(_bw + 0)
	MOVWF	r0x1072
	MOVLW	high (_bw + 0)
	MOVWF	r0x1073
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x1070,W
	ADDWF	r0x1073,F
	MOVF	r0x1072,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1073
	BTFSC	r0x1073,0
	BSF	STATUS,7
	BANKSEL	_w
	MOVF	_w,W
	BANKSEL	INDF
	MOVWF	INDF
	INCF	FSR,F
	BANKSEL	_w
	MOVF	(_w + 1),W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	200; "main.c"	bt[i] = t;
	BANKSEL	r0x1071
	MOVF	r0x1071,W
	ADDLW	(_bt + 0)
	MOVWF	r0x1071
	MOVF	r0x1070,W
	BTFSC	STATUS,0
	INCFSZ	r0x1070,W
	ADDLW	high (_bt + 0)
	MOVWF	r0x1070
	MOVF	r0x1071,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1070
	BTFSC	r0x1070,0
	BSF	STATUS,7
	BANKSEL	_t
	MOVF	_t,W
	BANKSEL	INDF
	MOVWF	INDF
	INCF	FSR,F
	BANKSEL	_t
	MOVF	(_t + 1),W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	202; "main.c"	i++;
	BANKSEL	r0x106F
	INCF	r0x106F,F
_00145_DS_:
;	.line	204; "main.c"	SP_send(strt1);
	MOVLW	high (_strt1 + 0)
	BANKSEL	r0x1070
	MOVWF	r0x1070
	MOVLW	(_strt1 + 0)
	MOVWF	r0x1071
	MOVLW	0x80
	MOVWF	r0x1072
	MOVF	r0x1071,W
	MOVWF	STK01
	MOVF	r0x1070,W
	MOVWF	STK00
	MOVF	r0x1072,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	205; "main.c"	circBufPush(TMR0);
	BANKSEL	_TMR0
	MOVF	_TMR0,W
	PAGESEL	_circBufPush
	CALL	_circBufPush
	PAGESEL	$
;	.line	207; "main.c"	SP_send(enter);
	MOVLW	high (_enter + 0)
	BANKSEL	r0x1070
	MOVWF	r0x1070
	MOVLW	(_enter + 0)
	MOVWF	r0x1071
	MOVLW	0x80
	MOVWF	r0x1072
	MOVF	r0x1071,W
	MOVWF	STK01
	MOVF	r0x1070,W
	MOVWF	STK00
	MOVF	r0x1072,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	210; "main.c"	t1 = t;
	BANKSEL	_t
	MOVF	_t,W
	BANKSEL	_t1
	MOVWF	_t1
	BANKSEL	_t
	MOVF	(_t + 1),W
	BANKSEL	_t1
	MOVWF	(_t1 + 1)
;	.line	211; "main.c"	w1 = w;
	BANKSEL	_w
	MOVF	_w,W
	BANKSEL	_w1
	MOVWF	_w1
	BANKSEL	_w
	MOVF	(_w + 1),W
	BANKSEL	_w1
	MOVWF	(_w1 + 1)
;;unsigned compare: left < lit(0xA=10), size=1
_00148_DS_:
;	.line	213; "main.c"	if(i >= 10){
	MOVLW	0x0a
	BANKSEL	r0x106F
	SUBWF	r0x106F,W
	BTFSS	STATUS,0
	GOTO	_00151_DS_
;;genSkipc:3257: created from rifx:0x7ffe5fb33c30
;	.line	214; "main.c"	for(j = 0; j < 10; j++){
	CLRF	r0x1071
_00155_DS_:
;	.line	215; "main.c"	dec_to_ascii(bw[j]);
	MOVLW	0x02
	MOVWF	STK00
	BANKSEL	r0x1071
	MOVF	r0x1071,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x1070
	MOVWF	r0x1070
	CLRF	r0x1072
	MOVF	r0x1070,W
	ADDLW	(_bw + 0)
	MOVWF	r0x1073
	MOVLW	high (_bw + 0)
	MOVWF	r0x1074
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x1072,W
	ADDWF	r0x1074,F
	MOVF	r0x1073,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1074
	BTFSC	r0x1074,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1075
	MOVWF	r0x1075
	BANKSEL	FSR
	INCF	FSR,F
	MOVF	INDF,W
	BANKSEL	r0x1076
	MOVWF	r0x1076
	MOVF	r0x1075,W
	MOVWF	STK00
	MOVF	r0x1076,W
	PAGESEL	_dec_to_ascii
	CALL	_dec_to_ascii
	PAGESEL	$
;	.line	216; "main.c"	SP_send(tab);
	MOVLW	high (_tab + 0)
	BANKSEL	r0x1074
	MOVWF	r0x1074
	MOVLW	(_tab + 0)
	MOVWF	r0x1073
	MOVLW	0x80
	MOVWF	r0x1075
	MOVF	r0x1073,W
	MOVWF	STK01
	MOVF	r0x1074,W
	MOVWF	STK00
	MOVF	r0x1075,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	217; "main.c"	dec_to_ascii(bt[j]);
	BANKSEL	r0x1070
	MOVF	r0x1070,W
	ADDLW	(_bt + 0)
	MOVWF	r0x1070
	MOVF	r0x1072,W
	BTFSC	STATUS,0
	INCFSZ	r0x1072,W
	ADDLW	high (_bt + 0)
	MOVWF	r0x1072
	MOVF	r0x1070,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1072
	BTFSC	r0x1072,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1073
	MOVWF	r0x1073
	BANKSEL	FSR
	INCF	FSR,F
	MOVF	INDF,W
	BANKSEL	r0x1074
	MOVWF	r0x1074
	MOVF	r0x1073,W
	MOVWF	STK00
	MOVF	r0x1074,W
	PAGESEL	_dec_to_ascii
	CALL	_dec_to_ascii
	PAGESEL	$
;	.line	218; "main.c"	SP_send(enter);
	MOVLW	high (_enter + 0)
	BANKSEL	r0x1072
	MOVWF	r0x1072
	MOVLW	(_enter + 0)
	MOVWF	r0x1070
	MOVLW	0x80
	MOVWF	r0x1073
	MOVF	r0x1070,W
	MOVWF	STK01
	MOVF	r0x1072,W
	MOVWF	STK00
	MOVF	r0x1073,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	214; "main.c"	for(j = 0; j < 10; j++){
	BANKSEL	r0x1071
	INCF	r0x1071,F
;;unsigned compare: left < lit(0xA=10), size=1
	MOVLW	0x0a
	SUBWF	r0x1071,W
	BTFSS	STATUS,0
	GOTO	_00155_DS_
;;genSkipc:3257: created from rifx:0x7ffe5fb33c30
;	.line	220; "main.c"	SP_send(sync);
	MOVLW	high (_sync + 0)
	MOVWF	r0x1070
	MOVLW	(_sync + 0)
	MOVWF	r0x1071
	MOVLW	0x80
	MOVWF	r0x1072
	MOVF	r0x1071,W
	MOVWF	STK01
	MOVF	r0x1070,W
	MOVWF	STK00
	MOVF	r0x1072,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
_00151_DS_:
;	.line	222; "main.c"	int_error_cnt = 0;
	BANKSEL	_int_error_cnt
	CLRF	_int_error_cnt
	GOTO	_00153_DS_
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrget1
;10 compiler assigned registers:
;   r0x104D
;   STK00
;   r0x104E
;   STK01
;   r0x104F
;   r0x1050
;   r0x1051
;   r0x1052
;   r0x1053
;   r0x1054
;; Starting pCode block
S_main__SP_send_error	code
_SP_send_error:
; 2 exit points
;	.line	300; "main.c"	void SP_send_error(char str[])
	BANKSEL	r0x104D
	MOVWF	r0x104D
	MOVF	STK00,W
	MOVWF	r0x104E
	MOVF	STK01,W
	MOVWF	r0x104F
;	.line	303; "main.c"	GIE = FALSE;	// Disable all interrupts.
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,7
;	.line	304; "main.c"	for(i=0; str[i] != '\0'; i++)
	BANKSEL	r0x1050
	CLRF	r0x1050
_00262_DS_:
	BANKSEL	r0x1050
	MOVF	r0x1050,W
	ADDWF	r0x104F,W
	MOVWF	r0x1051
	MOVF	r0x104E,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1052
	MOVF	r0x104D,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1053
	MOVF	r0x1051,W
	MOVWF	STK01
	MOVF	r0x1052,W
	MOVWF	STK00
	MOVF	r0x1053,W
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1054
	MOVWF	r0x1054
	MOVF	r0x1054,W
	BTFSC	STATUS,2
	GOTO	_00264_DS_
;	.line	306; "main.c"	TXREG=str[i];	// Add a character to the output buffer
	MOVF	r0x1054,W
	BANKSEL	_TXREG
	MOVWF	_TXREG
_00257_DS_:
;	.line	307; "main.c"	while(!TXIF);	// Wait while the output buffer is full
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,4
	GOTO	_00257_DS_
;	.line	304; "main.c"	for(i=0; str[i] != '\0'; i++)
	BANKSEL	r0x1050
	INCF	r0x1050,F
	GOTO	_00262_DS_
_00264_DS_:
	RETURN	
; exit point of _SP_send_error

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   _circBufPush
;   __gptrget1
;   _circBufPush
;10 compiler assigned registers:
;   r0x105A
;   STK00
;   r0x105B
;   STK01
;   r0x105C
;   r0x105D
;   r0x105E
;   r0x105F
;   r0x1060
;   r0x1061
;; Starting pCode block
S_main__SP_send	code
_SP_send:
; 2 exit points
;	.line	292; "main.c"	void SP_send(char str[]){
	BANKSEL	r0x105A
	MOVWF	r0x105A
	MOVF	STK00,W
	MOVWF	r0x105B
	MOVF	STK01,W
	MOVWF	r0x105C
;	.line	294; "main.c"	for(i=0; str[i] != '\0'; i++)
	CLRF	r0x105D
_00250_DS_:
	BANKSEL	r0x105D
	MOVF	r0x105D,W
	ADDWF	r0x105C,W
	MOVWF	r0x105E
	MOVF	r0x105B,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x105F
	MOVF	r0x105A,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1060
	MOVF	r0x105E,W
	MOVWF	STK01
	MOVF	r0x105F,W
	MOVWF	STK00
	MOVF	r0x1060,W
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1061
	MOVWF	r0x1061
	MOVF	r0x1061,W
	BTFSC	STATUS,2
	GOTO	_00252_DS_
;	.line	296; "main.c"	circBufPush(str[i]);
	MOVF	r0x1061,W
	PAGESEL	_circBufPush
	CALL	_circBufPush
	PAGESEL	$
;	.line	294; "main.c"	for(i=0; str[i] != '\0'; i++)
	BANKSEL	r0x105D
	INCF	r0x105D,F
	GOTO	_00250_DS_
_00252_DS_:
	RETURN	
; exit point of _SP_send

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __moduchar
;   __divuchar
;   _circBufPush
;   __moduchar
;   __divuchar
;   _circBufPush
;6 compiler assigned registers:
;   r0x1062
;   r0x1063
;   r0x1064
;   r0x1065
;   STK00
;   r0x1066
;; Starting pCode block
S_main__uint8_to_ascii	code
_uint8_to_ascii:
; 2 exit points
;	.line	273; "main.c"	void uint8_to_ascii(uint8_t dec)
	BANKSEL	r0x1062
	MOVWF	r0x1062
;	.line	278; "main.c"	for (i=0 ; dec!=0; i++)
	CLRF	r0x1063
_00234_DS_:
	MOVLW	0x00
	BANKSEL	r0x1062
	IORWF	r0x1062,W
	BTFSC	STATUS,2
	GOTO	_00243_DS_
;	.line	280; "main.c"	number[i]=(dec % 10);
	MOVF	r0x1063,W
	ADDLW	(_uint8_to_ascii_number_1_29 + 0)
	MOVWF	r0x1064
	MOVLW	high (_uint8_to_ascii_number_1_29 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1065
	MOVLW	0x0a
	MOVWF	STK00
	MOVF	r0x1062,W
	PAGESEL	__moduchar
	CALL	__moduchar
	PAGESEL	$
	BANKSEL	r0x1066
	MOVWF	r0x1066
	MOVF	r0x1064,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1065
	BTFSC	r0x1065,0
	BSF	STATUS,7
	MOVF	r0x1066,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	281; "main.c"	dec /=10;
	MOVLW	0x0a
	MOVWF	STK00
	BANKSEL	r0x1062
	MOVF	r0x1062,W
	PAGESEL	__divuchar
	CALL	__divuchar
	PAGESEL	$
	BANKSEL	r0x1062
	MOVWF	r0x1062
;	.line	282; "main.c"	number[i] +=48;
	MOVLW	0x30
	ADDWF	r0x1066,F
	MOVF	r0x1064,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1065
	BTFSC	r0x1065,0
	BSF	STATUS,7
	MOVF	r0x1066,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	278; "main.c"	for (i=0 ; dec!=0; i++)
	BANKSEL	r0x1063
	INCF	r0x1063,F
	GOTO	_00234_DS_
_00243_DS_:
;	.line	284; "main.c"	while (i--)
	BANKSEL	r0x1063
	MOVF	r0x1063,W
	MOVWF	r0x1062
_00230_DS_:
	BANKSEL	r0x1062
	MOVF	r0x1062,W
	MOVWF	r0x1063
	DECF	r0x1062,F
	MOVF	r0x1063,W
	BTFSC	STATUS,2
	GOTO	_00236_DS_
;	.line	286; "main.c"	circBufPush(number[i]);	// Add a character to the output buffer
	MOVF	r0x1062,W
	ADDLW	(_uint8_to_ascii_number_1_29 + 0)
	MOVWF	r0x1063
	MOVLW	high (_uint8_to_ascii_number_1_29 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1064
	MOVF	r0x1063,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1064
	BTFSC	r0x1064,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1065
	MOVWF	r0x1065
	PAGESEL	_circBufPush
	CALL	_circBufPush
	PAGESEL	$
	GOTO	_00230_DS_
_00236_DS_:
	RETURN	
; exit point of _uint8_to_ascii

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __moduint
;   __divuint
;   _circBufPush
;   __moduint
;   __divuint
;   _circBufPush
;11 compiler assigned registers:
;   r0x1067
;   STK00
;   r0x1068
;   r0x1069
;   r0x106A
;   r0x106B
;   STK02
;   STK01
;   r0x106C
;   r0x106D
;   r0x106E
;; Starting pCode block
S_main__dec_to_ascii	code
_dec_to_ascii:
; 2 exit points
;	.line	255; "main.c"	void dec_to_ascii(unsigned short dec)
	BANKSEL	r0x1067
	MOVWF	r0x1067
	MOVF	STK00,W
	MOVWF	r0x1068
;	.line	260; "main.c"	for (i=0 ; dec!=0; i++)
	CLRF	r0x1069
_00215_DS_:
	BANKSEL	r0x1068
	MOVF	r0x1068,W
	IORWF	r0x1067,W
	BTFSC	STATUS,2
	GOTO	_00224_DS_
;	.line	262; "main.c"	number[i]=(dec % 10);
	MOVF	r0x1069,W
	ADDLW	(_dec_to_ascii_number_1_25 + 0)
	MOVWF	r0x106A
	MOVLW	high (_dec_to_ascii_number_1_25 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x106B
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1068,W
	MOVWF	STK00
	MOVF	r0x1067,W
	PAGESEL	__moduint
	CALL	__moduint
	PAGESEL	$
;;1	MOVWF	r0x106C
	MOVF	STK00,W
;;1	MOVWF	r0x106D
	BANKSEL	r0x106E
	MOVWF	r0x106E
	MOVF	r0x106A,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x106B
	BTFSC	r0x106B,0
	BSF	STATUS,7
	MOVF	r0x106E,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	263; "main.c"	dec /=10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	BANKSEL	r0x1068
	MOVF	r0x1068,W
	MOVWF	STK00
	MOVF	r0x1067,W
	PAGESEL	__divuint
	CALL	__divuint
	PAGESEL	$
	BANKSEL	r0x1067
	MOVWF	r0x1067
	MOVF	STK00,W
	MOVWF	r0x1068
;	.line	264; "main.c"	number[i] +=48;
	MOVLW	0x30
	ADDWF	r0x106E,F
	MOVF	r0x106A,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x106B
	BTFSC	r0x106B,0
	BSF	STATUS,7
	MOVF	r0x106E,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	260; "main.c"	for (i=0 ; dec!=0; i++)
	BANKSEL	r0x1069
	INCF	r0x1069,F
	GOTO	_00215_DS_
_00224_DS_:
;	.line	266; "main.c"	while (i--)
	BANKSEL	r0x1069
	MOVF	r0x1069,W
	MOVWF	r0x1068
_00211_DS_:
	BANKSEL	r0x1068
	MOVF	r0x1068,W
	MOVWF	r0x1067
	DECF	r0x1068,F
	MOVF	r0x1067,W
	BTFSC	STATUS,2
	GOTO	_00217_DS_
;	.line	268; "main.c"	circBufPush(number[i]);	// Add a character to the output buffer
	MOVF	r0x1068,W
	ADDLW	(_dec_to_ascii_number_1_25 + 0)
	MOVWF	r0x1067
	MOVLW	high (_dec_to_ascii_number_1_25 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1069
	MOVF	r0x1067,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1069
	BTFSC	r0x1069,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x106A
	MOVWF	r0x106A
	PAGESEL	_circBufPush
	CALL	_circBufPush
	PAGESEL	$
	GOTO	_00211_DS_
_00217_DS_:
	RETURN	
; exit point of _dec_to_ascii

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SP_send_error
;   _SP_send_error
;7 compiler assigned registers:
;   r0x1055
;   r0x1056
;   r0x1057
;   r0x1058
;   r0x1059
;   STK01
;   STK00
;; Starting pCode block
S_main__circBufPush	code
_circBufPush:
; 2 exit points
;	.line	226; "main.c"	int circBufPush(uint8_t data){
	BANKSEL	r0x1055
	MOVWF	r0x1055
;	.line	227; "main.c"	uint8_t next = buf_head + 1;
	BANKSEL	_buf_head
	INCF	_buf_head,W
	BANKSEL	r0x1056
	MOVWF	r0x1056
;;unsigned compare: left < lit(0x10=16), size=1
;	.line	228; "main.c"	if (next >= BUF_SIZE)
	MOVLW	0x10
;	.line	229; "main.c"	next = 0;
	SUBWF	r0x1056,W
;	.line	232; "main.c"	if (next == buf_tail){
	BTFSC	STATUS,0
	CLRF	r0x1056
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x1056
	XORWF	r0x1056,W
	BTFSS	STATUS,2
	GOTO	_00204_DS_
;	.line	233; "main.c"	SP_send_error(buf_err);
	MOVLW	high (_buf_err + 0)
	MOVWF	r0x1057
	MOVLW	(_buf_err + 0)
	MOVWF	r0x1058
	MOVLW	0x80
	MOVWF	r0x1059
	MOVF	r0x1058,W
	MOVWF	STK01
	MOVF	r0x1057,W
	MOVWF	STK00
	MOVF	r0x1059,W
	PAGESEL	_SP_send_error
	CALL	_SP_send_error
	PAGESEL	$
;	.line	234; "main.c"	return -1;  // quit with an error
	MOVLW	0xff
	MOVWF	STK00
	MOVLW	0xff
	GOTO	_00205_DS_
_00204_DS_:
;	.line	237; "main.c"	buf[buf_head] = data;
	BANKSEL	_buf_head
	MOVF	_buf_head,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x1058
	MOVWF	r0x1058
	MOVLW	high (_buf + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1057
	MOVF	r0x1058,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1057
	BTFSC	r0x1057,0
	BSF	STATUS,7
	MOVF	r0x1055,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	238; "main.c"	buf_head = next;
	BANKSEL	r0x1056
	MOVF	r0x1056,W
	BANKSEL	_buf_head
	MOVWF	_buf_head
;	.line	239; "main.c"	TXIE = 1;       //Enables the EUSART transmit interrupt
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,4
;	.line	240; "main.c"	return 0;
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
_00205_DS_:
	RETURN	
; exit point of _circBufPush


;	code size estimation:
;	  652+  218 =   870 instructions ( 2176 byte)

	end
