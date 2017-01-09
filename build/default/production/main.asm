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
	extern	__gptrget1
	extern	__moduchar
	extern	__divuchar
	extern	__gptrput1
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_SP_send_errorP
	global	_SP_send_error
	global	_SP_send
	global	_uint8_to_ascii
	global	_puint8_to_ascii
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
	global	_pir1
	global	_pir2
	global	_pie1
	global	_pie2

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
r0x1089	res	1
r0x108A	res	1
r0x1081	res	1
r0x1083	res	1
r0x1082	res	1
r0x1084	res	1
r0x1085	res	1
r0x1086	res	1
r0x1087	res	1
r0x1088	res	1
r0x105E	res	1
r0x105F	res	1
r0x1061	res	1
r0x1060	res	1
r0x1062	res	1
r0x107A	res	1
r0x1079	res	1
r0x107B	res	1
r0x107C	res	1
r0x107D	res	1
r0x1080	res	1
r0x1072	res	1
r0x1071	res	1
r0x1070	res	1
r0x1073	res	1
r0x1074	res	1
r0x1075	res	1
r0x1076	res	1
r0x1077	res	1
r0x106B	res	1
r0x106C	res	1
r0x106D	res	1
r0x106E	res	1
r0x106F	res	1
r0x1065	res	1
r0x1064	res	1
r0x1063	res	1
r0x1066	res	1
r0x1067	res	1
r0x1068	res	1
r0x1069	res	1
r0x106A	res	1
r0x1058	res	1
r0x1057	res	1
r0x1056	res	1
r0x1059	res	1
r0x105A	res	1
r0x105B	res	1
r0x105C	res	1
r0x105D	res	1
r0x1055	res	1
r0x1054	res	1
r0x1053	res	1
_dec_to_ascii_number_1_27	res	4
_puint8_to_ascii_number_1_31	res	4
_uint8_to_ascii_number_1_35	res	4
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


ID_main_21	code
_pir1
	retlw 0x50
	retlw 0x49
	retlw 0x52
	retlw 0x31
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_22	code
_pir2
	retlw 0x50
	retlw 0x49
	retlw 0x52
	retlw 0x32
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_23	code
_pie1
	retlw 0x50
	retlw 0x49
	retlw 0x45
	retlw 0x31
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_24	code
_pie2
	retlw 0x50
	retlw 0x49
	retlw 0x45
	retlw 0x32
	retlw 0x3a
	retlw 0x20
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
;2 compiler assigned registers:
;   r0x1089
;   r0x108A
;; Starting pCode block
_receive_intr:
; 0 exit points
;	.line	97; "main.c"	void receive_intr() __interrupt 0 {
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
;	.line	99; "main.c"	if(TXIF){
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,4
	GOTO	_00111_DS_
;	.line	101; "main.c"	if (buf_head == buf_tail){
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	_buf_head
	XORWF	_buf_head,W
	BTFSS	STATUS,2
	GOTO	_00108_DS_
;	.line	102; "main.c"	TXIE = 0;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,4
	GOTO	_00111_DS_
_00108_DS_:
;	.line	107; "main.c"	TXREG = buf[buf_tail];
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x1089
	MOVWF	r0x1089
	MOVLW	high (_buf + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x108A
	MOVF	r0x1089,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x108A
	BTFSC	r0x108A,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	MOVWF	_TXREG
;	.line	108; "main.c"	buf[buf_tail] = 0;  // clear the data (optional)
	BANKSEL	r0x1089
	MOVF	r0x1089,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x108A
	BTFSC	r0x108A,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	110; "main.c"	next = buf_tail + 1;
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x1089
	MOVWF	r0x1089
	CLRF	r0x108A
	INCF	r0x1089,F
	BTFSC	STATUS,2
	INCF	r0x108A,F
;;signed compare: left < lit(0x10=16), size=2, mask=ffff
;	.line	111; "main.c"	if(next >= BUF_SIZE)
	MOVF	r0x108A,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00134_DS_
	MOVLW	0x10
	SUBWF	r0x1089,W
_00134_DS_:
	BTFSS	STATUS,0
	GOTO	_00106_DS_
;;genSkipc:3257: created from rifx:0x7ffe58591a10
;	.line	112; "main.c"	next = 0;
	BANKSEL	r0x1089
	CLRF	r0x1089
	CLRF	r0x108A
_00106_DS_:
;	.line	114; "main.c"	buf_tail = next;
	BANKSEL	r0x1089
	MOVF	r0x1089,W
	BANKSEL	_buf_tail
	MOVWF	_buf_tail
_00111_DS_:
;	.line	120; "main.c"	if(CCP1IF){
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,2
	GOTO	_00117_DS_
;	.line	121; "main.c"	CCP1IE = FALSE;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,2
;	.line	123; "main.c"	if(CCP1M0){                     // if ECCP mode is Rising edge CCP1M0
	BANKSEL	_CCP1CONbits
	BTFSS	_CCP1CONbits,0
	GOTO	_00113_DS_
;	.line	124; "main.c"	CCP1M0 = FALING;                 // set falling edge
	BCF	_CCP1CONbits,0
;	.line	127; "main.c"	TMR1H = 0;
	CLRF	_TMR1H
;	.line	128; "main.c"	TMR1L = 0;
	CLRF	_TMR1L
;	.line	130; "main.c"	t = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
	MOVF	_CCPR1H,W
	BANKSEL	r0x1089
	MOVWF	r0x1089
	BANKSEL	_t
	MOVWF	_t
	CLRF	(_t + 1)
;	.line	131; "main.c"	t = t << 8;
	MOVF	_t,W
	MOVWF	(_t + 1)
	CLRF	_t
;	.line	132; "main.c"	t = t | CCPR1L;             //ECCP combined 16 bit number formation*/
	BANKSEL	_CCPR1L
	MOVF	_CCPR1L,W
	BANKSEL	r0x1089
	MOVWF	r0x1089
	CLRF	r0x108A
	MOVF	r0x1089,W
	BANKSEL	_t
	IORWF	_t,F
	MOVLW	0x00
	IORWF	(_t + 1),F
;	.line	134; "main.c"	bitfield.Capture = TRUE;
	BANKSEL	_bitfield
	BSF	_bitfield,0
	GOTO	_00114_DS_
_00113_DS_:
;	.line	137; "main.c"	CCP1M0 = RISING;
	BANKSEL	_CCP1CONbits
	BSF	_CCP1CONbits,0
;	.line	139; "main.c"	w = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
	MOVF	_CCPR1H,W
	BANKSEL	r0x1089
	MOVWF	r0x1089
	BANKSEL	_w
	MOVWF	_w
	CLRF	(_w + 1)
;	.line	140; "main.c"	w = w << 8;
	MOVF	_w,W
	MOVWF	(_w + 1)
	CLRF	_w
;	.line	141; "main.c"	w = w | CCPR1L;             //ECCP combined 16 bit number formation
	BANKSEL	_CCPR1L
	MOVF	_CCPR1L,W
	BANKSEL	r0x1089
	MOVWF	r0x1089
	CLRF	r0x108A
	MOVF	r0x1089,W
	BANKSEL	_w
	IORWF	_w,F
	MOVLW	0x00
	IORWF	(_w + 1),F
_00114_DS_:
;	.line	145; "main.c"	CCP1IE = 1;
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,2
;	.line	146; "main.c"	CCP1IF = 0;                     //Clear interrupt flag
	BANKSEL	_PIR1bits
	BCF	_PIR1bits,2
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
;   _SP_send
;   _uint8_to_ascii
;   _SP_send
;   __mulchar
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
;   _SP_send
;   _uint8_to_ascii
;   _SP_send
;   __mulchar
;   __mulchar
;   _dec_to_ascii
;   _SP_send
;   _dec_to_ascii
;   _SP_send
;   _SP_send
;10 compiler assigned registers:
;   r0x1081
;   r0x1082
;   r0x1083
;   r0x1084
;   STK01
;   STK00
;   r0x1085
;   r0x1086
;   r0x1087
;   r0x1088
;; Starting pCode block
S_main__main	code
_main:
; 2 exit points
;	.line	179; "main.c"	init();
	PAGESEL	_init
	CALL	_init
	PAGESEL	$
;	.line	180; "main.c"	bitfield.Hint = FALSE;
	BANKSEL	_bitfield
	BCF	_bitfield,2
;	.line	181; "main.c"	bitfield.Capture = FALSE;
	BCF	_bitfield,0
;	.line	182; "main.c"	GIE = 0;
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,7
;	.line	183; "main.c"	TMR0 = 0;
	CLRF	_TMR0
;	.line	184; "main.c"	w2 = 250;
	MOVLW	0xfa
	BANKSEL	_w2
	MOVWF	_w2
;	.line	185; "main.c"	t2 = 125;
	MOVLW	0x7d
	BANKSEL	_t2
	MOVWF	_t2
;	.line	186; "main.c"	temp = TMR0;
	BANKSEL	_TMR0
	MOVF	_TMR0,W
	BANKSEL	r0x1081
	MOVWF	r0x1081
;	.line	187; "main.c"	GIE = 1;
	BANKSEL	_INTCONbits
	BSF	_INTCONbits,7
;	.line	188; "main.c"	SP_send(strw1);
	MOVLW	high (_strw1 + 0)
	BANKSEL	r0x1082
	MOVWF	r0x1082
	MOVLW	(_strw1 + 0)
	MOVWF	r0x1083
	MOVLW	0x80
	MOVWF	r0x1084
	MOVF	r0x1083,W
	MOVWF	STK01
	MOVF	r0x1082,W
	MOVWF	STK00
	MOVF	r0x1084,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	190; "main.c"	uint8_to_ascii(temp);
	BANKSEL	r0x1081
	MOVF	r0x1081,W
	PAGESEL	_uint8_to_ascii
	CALL	_uint8_to_ascii
	PAGESEL	$
;	.line	191; "main.c"	SP_send(enter);
	MOVLW	high (_enter + 0)
	BANKSEL	r0x1082
	MOVWF	r0x1082
	MOVLW	(_enter + 0)
	MOVWF	r0x1083
	MOVLW	0x80
	MOVWF	r0x1084
	MOVF	r0x1083,W
	MOVWF	STK01
	MOVF	r0x1082,W
	MOVWF	STK00
	MOVF	r0x1084,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	192; "main.c"	GIE = 0;
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,7
;	.line	193; "main.c"	TMR0 = 0;
	CLRF	_TMR0
;	.line	194; "main.c"	w1 = 430;
	MOVLW	0xae
	BANKSEL	_w1
	MOVWF	_w1
	MOVLW	0x01
	MOVWF	(_w1 + 1)
;	.line	195; "main.c"	t1 = 1909;
	MOVLW	0x75
	BANKSEL	_t1
	MOVWF	_t1
	MOVLW	0x07
	MOVWF	(_t1 + 1)
;	.line	196; "main.c"	temp = TMR0;
	BANKSEL	_TMR0
	MOVF	_TMR0,W
	BANKSEL	r0x1081
	MOVWF	r0x1081
;	.line	197; "main.c"	GIE = 1;
	BANKSEL	_INTCONbits
	BSF	_INTCONbits,7
;	.line	198; "main.c"	SP_send(strw);
	MOVLW	high (_strw + 0)
	BANKSEL	r0x1082
	MOVWF	r0x1082
	MOVLW	(_strw + 0)
	MOVWF	r0x1083
	MOVLW	0x80
	MOVWF	r0x1084
	MOVF	r0x1083,W
	MOVWF	STK01
	MOVF	r0x1082,W
	MOVWF	STK00
	MOVF	r0x1084,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	200; "main.c"	uint8_to_ascii(temp);
	BANKSEL	r0x1081
	MOVF	r0x1081,W
	PAGESEL	_uint8_to_ascii
	CALL	_uint8_to_ascii
	PAGESEL	$
;	.line	201; "main.c"	SP_send(enter);
	MOVLW	high (_enter + 0)
	BANKSEL	r0x1083
	MOVWF	r0x1083
	MOVLW	(_enter + 0)
	MOVWF	r0x1081
	MOVLW	0x80
	MOVWF	r0x1082
	MOVF	r0x1081,W
	MOVWF	STK01
	MOVF	r0x1083,W
	MOVWF	STK00
	MOVF	r0x1082,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	203; "main.c"	while(1)
	BANKSEL	r0x1081
	CLRF	r0x1081
_00153_DS_:
;	.line	219; "main.c"	TMR0 = 0;
	BANKSEL	_TMR0
	CLRF	_TMR0
;	.line	220; "main.c"	if (bitfield.Capture){
	BANKSEL	_bitfield
	BTFSS	_bitfield,0
	GOTO	_00148_DS_
;	.line	222; "main.c"	bitfield.Capture = FALSE;
	BCF	_bitfield,0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x759=1881), size=2
;	.line	223; "main.c"	if (t > MIN_T && t < MAX_T && t1 > MIN_T && t1 < MAX_T){
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
;;genSkipc:3257: created from rifx:0x7ffe58591a10
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
;;genSkipc:3257: created from rifx:0x7ffe58591a10
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
;;genSkipc:3257: created from rifx:0x7ffe58591a10
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
;;genSkipc:3257: created from rifx:0x7ffe58591a10
;	.line	224; "main.c"	bitfield.Hint = TRUE;
	BANKSEL	_bitfield
	BSF	_bitfield,2
;;unsigned compare: left < lit(0xA=10), size=1
_00140_DS_:
;	.line	226; "main.c"	if (i < 10 && bitfield.Hint){
	MOVLW	0x0a
	BANKSEL	r0x1081
	SUBWF	r0x1081,W
	BTFSC	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffe58591a10
	BANKSEL	_bitfield
	BTFSS	_bitfield,2
	GOTO	_00145_DS_
;	.line	227; "main.c"	bw[i] = w;
	MOVLW	0x02
	MOVWF	STK00
	BANKSEL	r0x1081
	MOVF	r0x1081,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x1083
	MOVWF	r0x1083
	CLRF	r0x1082
	MOVF	r0x1083,W
	ADDLW	(_bw + 0)
	MOVWF	r0x1084
	MOVLW	high (_bw + 0)
	MOVWF	r0x1085
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x1082,W
	ADDWF	r0x1085,F
	MOVF	r0x1084,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1085
	BTFSC	r0x1085,0
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
;	.line	228; "main.c"	bt[i] = t;
	BANKSEL	r0x1083
	MOVF	r0x1083,W
	ADDLW	(_bt + 0)
	MOVWF	r0x1083
	MOVF	r0x1082,W
	BTFSC	STATUS,0
	INCFSZ	r0x1082,W
	ADDLW	high (_bt + 0)
	MOVWF	r0x1082
	MOVF	r0x1083,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1082
	BTFSC	r0x1082,0
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
;	.line	229; "main.c"	i++;
	BANKSEL	r0x1081
	INCF	r0x1081,F
_00145_DS_:
;	.line	238; "main.c"	t1 = t;
	BANKSEL	_t
	MOVF	_t,W
	BANKSEL	_t1
	MOVWF	_t1
	BANKSEL	_t
	MOVF	(_t + 1),W
	BANKSEL	_t1
	MOVWF	(_t1 + 1)
;	.line	239; "main.c"	w1 = w;
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
;	.line	241; "main.c"	if(i >= 10){
	MOVLW	0x0a
	BANKSEL	r0x1081
	SUBWF	r0x1081,W
	BTFSS	STATUS,0
	GOTO	_00151_DS_
;;genSkipc:3257: created from rifx:0x7ffe58591a10
;	.line	242; "main.c"	for(j = 0; j < 10; j++){
	CLRF	r0x1083
_00155_DS_:
;	.line	243; "main.c"	dec_to_ascii(bw[j]);
	MOVLW	0x02
	MOVWF	STK00
	BANKSEL	r0x1083
	MOVF	r0x1083,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x1082
	MOVWF	r0x1082
	CLRF	r0x1084
	MOVF	r0x1082,W
	ADDLW	(_bw + 0)
	MOVWF	r0x1085
	MOVLW	high (_bw + 0)
	MOVWF	r0x1086
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x1084,W
	ADDWF	r0x1086,F
	MOVF	r0x1085,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1086
	BTFSC	r0x1086,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1087
	MOVWF	r0x1087
	BANKSEL	FSR
	INCF	FSR,F
	MOVF	INDF,W
	BANKSEL	r0x1088
	MOVWF	r0x1088
	MOVF	r0x1087,W
	MOVWF	STK00
	MOVF	r0x1088,W
	PAGESEL	_dec_to_ascii
	CALL	_dec_to_ascii
	PAGESEL	$
;	.line	244; "main.c"	SP_send(tab);
	MOVLW	high (_tab + 0)
	BANKSEL	r0x1086
	MOVWF	r0x1086
	MOVLW	(_tab + 0)
	MOVWF	r0x1085
	MOVLW	0x80
	MOVWF	r0x1087
	MOVF	r0x1085,W
	MOVWF	STK01
	MOVF	r0x1086,W
	MOVWF	STK00
	MOVF	r0x1087,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	245; "main.c"	dec_to_ascii(bt[j]);
	BANKSEL	r0x1082
	MOVF	r0x1082,W
	ADDLW	(_bt + 0)
	MOVWF	r0x1082
	MOVF	r0x1084,W
	BTFSC	STATUS,0
	INCFSZ	r0x1084,W
	ADDLW	high (_bt + 0)
	MOVWF	r0x1084
	MOVF	r0x1082,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1084
	BTFSC	r0x1084,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1085
	MOVWF	r0x1085
	BANKSEL	FSR
	INCF	FSR,F
	MOVF	INDF,W
	BANKSEL	r0x1086
	MOVWF	r0x1086
	MOVF	r0x1085,W
	MOVWF	STK00
	MOVF	r0x1086,W
	PAGESEL	_dec_to_ascii
	CALL	_dec_to_ascii
	PAGESEL	$
;	.line	246; "main.c"	SP_send(enter);
	MOVLW	high (_enter + 0)
	BANKSEL	r0x1084
	MOVWF	r0x1084
	MOVLW	(_enter + 0)
	MOVWF	r0x1082
	MOVLW	0x80
	MOVWF	r0x1085
	MOVF	r0x1082,W
	MOVWF	STK01
	MOVF	r0x1084,W
	MOVWF	STK00
	MOVF	r0x1085,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	242; "main.c"	for(j = 0; j < 10; j++){
	BANKSEL	r0x1083
	INCF	r0x1083,F
;;unsigned compare: left < lit(0xA=10), size=1
	MOVLW	0x0a
	SUBWF	r0x1083,W
	BTFSS	STATUS,0
	GOTO	_00155_DS_
;;genSkipc:3257: created from rifx:0x7ffe58591a10
;	.line	248; "main.c"	SP_send(sync);
	MOVLW	high (_sync + 0)
	MOVWF	r0x1082
	MOVLW	(_sync + 0)
	MOVWF	r0x1083
	MOVLW	0x80
	MOVWF	r0x1084
	MOVF	r0x1083,W
	MOVWF	STK01
	MOVF	r0x1082,W
	MOVWF	STK00
	MOVF	r0x1084,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
_00151_DS_:
;	.line	250; "main.c"	int_error_cnt = 0;
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
;5 compiler assigned registers:
;   r0x1053
;   STK00
;   r0x1054
;   STK01
;   r0x1055
;; Starting pCode block
S_main__SP_send_errorP	code
_SP_send_errorP:
; 2 exit points
;	.line	356; "main.c"	void SP_send_errorP(char str[])
	BANKSEL	r0x1053
	MOVWF	r0x1053
	MOVF	STK00,W
	MOVWF	r0x1054
	MOVF	STK01,W
	MOVWF	r0x1055
;	.line	359; "main.c"	GIE = FALSE;	// Disable all interrupts.
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,7
;	.line	362; "main.c"	TXREG=str[0];	// Add a character to the output buffer
	BANKSEL	r0x1055
	MOVF	r0x1055,W
	MOVWF	STK01
	MOVF	r0x1054,W
	MOVWF	STK00
	MOVF	r0x1053,W
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	_TXREG
	MOVWF	_TXREG
_00289_DS_:
;	.line	363; "main.c"	while(!TXIF);	// Wait while the output buffer is full
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,4
	GOTO	_00289_DS_
	RETURN	
; exit point of _SP_send_errorP

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrget1
;10 compiler assigned registers:
;   r0x1056
;   STK00
;   r0x1057
;   STK01
;   r0x1058
;   r0x1059
;   r0x105A
;   r0x105B
;   r0x105C
;   r0x105D
;; Starting pCode block
S_main__SP_send_error	code
_SP_send_error:
; 2 exit points
;	.line	345; "main.c"	void SP_send_error(char str[])
	BANKSEL	r0x1056
	MOVWF	r0x1056
	MOVF	STK00,W
	MOVWF	r0x1057
	MOVF	STK01,W
	MOVWF	r0x1058
;	.line	348; "main.c"	GIE = FALSE;	// Disable all interrupts.
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,7
;	.line	349; "main.c"	for(i=0; str[i] != '\0'; i++)
	BANKSEL	r0x1059
	CLRF	r0x1059
_00282_DS_:
	BANKSEL	r0x1059
	MOVF	r0x1059,W
	ADDWF	r0x1058,W
	MOVWF	r0x105A
	MOVF	r0x1057,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x105B
	MOVF	r0x1056,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x105C
	MOVF	r0x105A,W
	MOVWF	STK01
	MOVF	r0x105B,W
	MOVWF	STK00
	MOVF	r0x105C,W
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x105D
	MOVWF	r0x105D
	MOVF	r0x105D,W
	BTFSC	STATUS,2
	GOTO	_00284_DS_
;	.line	351; "main.c"	TXREG=str[i];	// Add a character to the output buffer
	MOVF	r0x105D,W
	BANKSEL	_TXREG
	MOVWF	_TXREG
_00277_DS_:
;	.line	352; "main.c"	while(!TXIF);	// Wait while the output buffer is full
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,4
	GOTO	_00277_DS_
;	.line	349; "main.c"	for(i=0; str[i] != '\0'; i++)
	BANKSEL	r0x1059
	INCF	r0x1059,F
	GOTO	_00282_DS_
_00284_DS_:
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
;   r0x1063
;   STK00
;   r0x1064
;   STK01
;   r0x1065
;   r0x1066
;   r0x1067
;   r0x1068
;   r0x1069
;   r0x106A
;; Starting pCode block
S_main__SP_send	code
_SP_send:
; 2 exit points
;	.line	337; "main.c"	void SP_send(char str[]){
	BANKSEL	r0x1063
	MOVWF	r0x1063
	MOVF	STK00,W
	MOVWF	r0x1064
	MOVF	STK01,W
	MOVWF	r0x1065
;	.line	339; "main.c"	for(i=0; str[i] != '\0'; i++)
	CLRF	r0x1066
_00270_DS_:
	BANKSEL	r0x1066
	MOVF	r0x1066,W
	ADDWF	r0x1065,W
	MOVWF	r0x1067
	MOVF	r0x1064,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1068
	MOVF	r0x1063,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1069
	MOVF	r0x1067,W
	MOVWF	STK01
	MOVF	r0x1068,W
	MOVWF	STK00
	MOVF	r0x1069,W
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x106A
	MOVWF	r0x106A
	MOVF	r0x106A,W
	BTFSC	STATUS,2
	GOTO	_00272_DS_
;	.line	341; "main.c"	circBufPush(str[i]);
	MOVF	r0x106A,W
	PAGESEL	_circBufPush
	CALL	_circBufPush
	PAGESEL	$
;	.line	339; "main.c"	for(i=0; str[i] != '\0'; i++)
	BANKSEL	r0x1066
	INCF	r0x1066,F
	GOTO	_00270_DS_
_00272_DS_:
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
;   r0x106B
;   r0x106C
;   r0x106D
;   r0x106E
;   STK00
;   r0x106F
;; Starting pCode block
S_main__uint8_to_ascii	code
_uint8_to_ascii:
; 2 exit points
;	.line	319; "main.c"	void uint8_to_ascii(uint8_t dec)
	BANKSEL	r0x106B
	MOVWF	r0x106B
;	.line	324; "main.c"	for (i=0 ; dec!=0  || i == 0; i++)
	CLRF	r0x106C
_00256_DS_:
	MOVLW	0x00
	BANKSEL	r0x106B
	IORWF	r0x106B,W
	BTFSS	STATUS,2
	GOTO	_00255_DS_
	MOVF	r0x106C,W
	BTFSS	STATUS,2
	GOTO	_00263_DS_
_00255_DS_:
;	.line	326; "main.c"	number[i]=(dec % 10);
	BANKSEL	r0x106C
	MOVF	r0x106C,W
	ADDLW	(_uint8_to_ascii_number_1_35 + 0)
	MOVWF	r0x106D
	MOVLW	high (_uint8_to_ascii_number_1_35 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x106E
	MOVLW	0x0a
	MOVWF	STK00
	MOVF	r0x106B,W
	PAGESEL	__moduchar
	CALL	__moduchar
	PAGESEL	$
	BANKSEL	r0x106F
	MOVWF	r0x106F
	MOVF	r0x106D,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x106E
	BTFSC	r0x106E,0
	BSF	STATUS,7
	MOVF	r0x106F,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	327; "main.c"	dec /=10;
	MOVLW	0x0a
	MOVWF	STK00
	BANKSEL	r0x106B
	MOVF	r0x106B,W
	PAGESEL	__divuchar
	CALL	__divuchar
	PAGESEL	$
	BANKSEL	r0x106B
	MOVWF	r0x106B
;	.line	328; "main.c"	number[i] +=48;
	MOVLW	0x30
	ADDWF	r0x106F,F
	MOVF	r0x106D,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x106E
	BTFSC	r0x106E,0
	BSF	STATUS,7
	MOVF	r0x106F,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	324; "main.c"	for (i=0 ; dec!=0  || i == 0; i++)
	BANKSEL	r0x106C
	INCF	r0x106C,F
	GOTO	_00256_DS_
_00263_DS_:
;	.line	330; "main.c"	while (i--)
	BANKSEL	r0x106C
	MOVF	r0x106C,W
	MOVWF	r0x106B
_00251_DS_:
	BANKSEL	r0x106B
	MOVF	r0x106B,W
	MOVWF	r0x106C
	DECF	r0x106B,F
	MOVF	r0x106C,W
	BTFSC	STATUS,2
	GOTO	_00258_DS_
;	.line	332; "main.c"	circBufPush(number[i]);	// Add a character to the output buffer
	MOVF	r0x106B,W
	ADDLW	(_uint8_to_ascii_number_1_35 + 0)
	MOVWF	r0x106C
	MOVLW	high (_uint8_to_ascii_number_1_35 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x106D
	MOVF	r0x106C,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x106D
	BTFSC	r0x106D,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x106E
	MOVWF	r0x106E
	PAGESEL	_circBufPush
	CALL	_circBufPush
	PAGESEL	$
	GOTO	_00251_DS_
_00258_DS_:
	RETURN	
; exit point of _uint8_to_ascii

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrget1
;   __moduchar
;   __gptrget1
;   __divuchar
;   __gptrput1
;   __gptrget1
;   __gptrget1
;   __moduchar
;   __gptrget1
;   __divuchar
;   __gptrput1
;12 compiler assigned registers:
;   r0x1070
;   STK00
;   r0x1071
;   STK01
;   r0x1072
;   r0x1073
;   r0x1074
;   r0x1075
;   r0x1076
;   r0x1077
;   r0x1078
;   STK02
;; Starting pCode block
S_main__puint8_to_ascii	code
_puint8_to_ascii:
; 2 exit points
;	.line	301; "main.c"	void puint8_to_ascii(uint8_t *dec)
	BANKSEL	r0x1070
	MOVWF	r0x1070
	MOVF	STK00,W
	MOVWF	r0x1071
	MOVF	STK01,W
	MOVWF	r0x1072
;	.line	306; "main.c"	for (i = 0 ; *dec != 0  || i == 0; i++)
	CLRF	r0x1073
_00238_DS_:
	BANKSEL	r0x1072
	MOVF	r0x1072,W
	MOVWF	STK01
	MOVF	r0x1071,W
	MOVWF	STK00
	MOVF	r0x1070,W
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1074
	MOVWF	r0x1074
	MOVF	r0x1074,W
	BTFSS	STATUS,2
	GOTO	_00237_DS_
	MOVF	r0x1073,W
	BTFSS	STATUS,2
	GOTO	_00245_DS_
_00237_DS_:
;	.line	308; "main.c"	number[i] = (*dec % 10);
	BANKSEL	r0x1073
	MOVF	r0x1073,W
	ADDLW	(_puint8_to_ascii_number_1_31 + 0)
	MOVWF	r0x1074
	MOVLW	high (_puint8_to_ascii_number_1_31 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1075
	MOVF	r0x1072,W
	MOVWF	STK01
	MOVF	r0x1071,W
	MOVWF	STK00
	MOVF	r0x1070,W
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1076
	MOVWF	r0x1076
	MOVLW	0x0a
	MOVWF	STK00
	MOVF	r0x1076,W
	PAGESEL	__moduchar
	CALL	__moduchar
	PAGESEL	$
	BANKSEL	r0x1077
	MOVWF	r0x1077
	MOVF	r0x1074,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1075
	BTFSC	r0x1075,0
	BSF	STATUS,7
	MOVF	r0x1077,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	309; "main.c"	*dec /= 10;
	BANKSEL	r0x1072
	MOVF	r0x1072,W
	MOVWF	STK01
	MOVF	r0x1071,W
	MOVWF	STK00
	MOVF	r0x1070,W
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1076
	MOVWF	r0x1076
	MOVLW	0x0a
	MOVWF	STK00
	MOVF	r0x1076,W
	PAGESEL	__divuchar
	CALL	__divuchar
	PAGESEL	$
;;1	MOVWF	r0x1078
	MOVWF	STK02
	BANKSEL	r0x1072
	MOVF	r0x1072,W
	MOVWF	STK01
	MOVF	r0x1071,W
	MOVWF	STK00
	MOVF	r0x1070,W
	PAGESEL	__gptrput1
	CALL	__gptrput1
	PAGESEL	$
;	.line	310; "main.c"	number[i] += 48;
	MOVLW	0x30
	BANKSEL	r0x1077
	ADDWF	r0x1077,F
	MOVF	r0x1074,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1075
	BTFSC	r0x1075,0
	BSF	STATUS,7
	MOVF	r0x1077,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	306; "main.c"	for (i = 0 ; *dec != 0  || i == 0; i++)
	BANKSEL	r0x1073
	INCF	r0x1073,F
	GOTO	_00238_DS_
_00245_DS_:
;	.line	312; "main.c"	while (i--)
	BANKSEL	r0x1073
	MOVF	r0x1073,W
	MOVWF	r0x1072
_00233_DS_:
	BANKSEL	r0x1072
	MOVF	r0x1072,W
	MOVWF	r0x1071
	DECF	r0x1072,F
	MOVF	r0x1071,W
	BTFSC	STATUS,2
	GOTO	_00240_DS_
;	.line	314; "main.c"	TXREG = number[i];	// Add a character to the output buffer
	MOVF	r0x1072,W
	ADDLW	(_puint8_to_ascii_number_1_31 + 0)
	MOVWF	r0x1071
	MOVLW	high (_puint8_to_ascii_number_1_31 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1070
	MOVF	r0x1071,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1070
	BTFSC	r0x1070,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	MOVWF	_TXREG
_00230_DS_:
;	.line	315; "main.c"	while(!TXIF);       // Wait while the output buffer is full
	BANKSEL	_PIR1bits
	BTFSC	_PIR1bits,4
	GOTO	_00233_DS_
	GOTO	_00230_DS_
_00240_DS_:
	RETURN	
; exit point of _puint8_to_ascii

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
;   r0x1079
;   STK00
;   r0x107A
;   r0x107B
;   r0x107C
;   r0x107D
;   STK02
;   STK01
;   r0x107E
;   r0x107F
;   r0x1080
;; Starting pCode block
S_main__dec_to_ascii	code
_dec_to_ascii:
; 2 exit points
;	.line	283; "main.c"	void dec_to_ascii(unsigned short dec)
	BANKSEL	r0x1079
	MOVWF	r0x1079
	MOVF	STK00,W
	MOVWF	r0x107A
;	.line	288; "main.c"	for (i=0 ; dec!=0; i++)
	CLRF	r0x107B
_00215_DS_:
	BANKSEL	r0x107A
	MOVF	r0x107A,W
	IORWF	r0x1079,W
	BTFSC	STATUS,2
	GOTO	_00224_DS_
;	.line	290; "main.c"	number[i]=(dec % 10);
	MOVF	r0x107B,W
	ADDLW	(_dec_to_ascii_number_1_27 + 0)
	MOVWF	r0x107C
	MOVLW	high (_dec_to_ascii_number_1_27 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x107D
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x107A,W
	MOVWF	STK00
	MOVF	r0x1079,W
	PAGESEL	__moduint
	CALL	__moduint
	PAGESEL	$
;;1	MOVWF	r0x107E
	MOVF	STK00,W
;;1	MOVWF	r0x107F
	BANKSEL	r0x1080
	MOVWF	r0x1080
	MOVF	r0x107C,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x107D
	BTFSC	r0x107D,0
	BSF	STATUS,7
	MOVF	r0x1080,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	291; "main.c"	dec /=10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	BANKSEL	r0x107A
	MOVF	r0x107A,W
	MOVWF	STK00
	MOVF	r0x1079,W
	PAGESEL	__divuint
	CALL	__divuint
	PAGESEL	$
	BANKSEL	r0x1079
	MOVWF	r0x1079
	MOVF	STK00,W
	MOVWF	r0x107A
;	.line	292; "main.c"	number[i] +=48;
	MOVLW	0x30
	ADDWF	r0x1080,F
	MOVF	r0x107C,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x107D
	BTFSC	r0x107D,0
	BSF	STATUS,7
	MOVF	r0x1080,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	288; "main.c"	for (i=0 ; dec!=0; i++)
	BANKSEL	r0x107B
	INCF	r0x107B,F
	GOTO	_00215_DS_
_00224_DS_:
;	.line	294; "main.c"	while (i--)
	BANKSEL	r0x107B
	MOVF	r0x107B,W
	MOVWF	r0x107A
_00211_DS_:
	BANKSEL	r0x107A
	MOVF	r0x107A,W
	MOVWF	r0x1079
	DECF	r0x107A,F
	MOVF	r0x1079,W
	BTFSC	STATUS,2
	GOTO	_00217_DS_
;	.line	296; "main.c"	circBufPush(number[i]);	// Add a character to the output buffer
	MOVF	r0x107A,W
	ADDLW	(_dec_to_ascii_number_1_27 + 0)
	MOVWF	r0x1079
	MOVLW	high (_dec_to_ascii_number_1_27 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x107B
	MOVF	r0x1079,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x107B
	BTFSC	r0x107B,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x107C
	MOVWF	r0x107C
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
;   r0x105E
;   r0x105F
;   r0x1060
;   r0x1061
;   r0x1062
;   STK01
;   STK00
;; Starting pCode block
S_main__circBufPush	code
_circBufPush:
; 2 exit points
;	.line	254; "main.c"	int circBufPush(uint8_t data){
	BANKSEL	r0x105E
	MOVWF	r0x105E
;	.line	255; "main.c"	uint8_t next = buf_head + 1;
	BANKSEL	_buf_head
	INCF	_buf_head,W
	BANKSEL	r0x105F
	MOVWF	r0x105F
;;unsigned compare: left < lit(0x10=16), size=1
;	.line	256; "main.c"	if (next >= BUF_SIZE)
	MOVLW	0x10
;	.line	257; "main.c"	next = 0;
	SUBWF	r0x105F,W
;	.line	260; "main.c"	if (next == buf_tail){
	BTFSC	STATUS,0
	CLRF	r0x105F
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x105F
	XORWF	r0x105F,W
	BTFSS	STATUS,2
	GOTO	_00204_DS_
;	.line	261; "main.c"	SP_send_error(buf_err);
	MOVLW	high (_buf_err + 0)
	MOVWF	r0x1060
	MOVLW	(_buf_err + 0)
	MOVWF	r0x1061
	MOVLW	0x80
	MOVWF	r0x1062
	MOVF	r0x1061,W
	MOVWF	STK01
	MOVF	r0x1060,W
	MOVWF	STK00
	MOVF	r0x1062,W
	PAGESEL	_SP_send_error
	CALL	_SP_send_error
	PAGESEL	$
;	.line	262; "main.c"	return -1;  // quit with an error
	MOVLW	0xff
	MOVWF	STK00
	MOVLW	0xff
	GOTO	_00205_DS_
_00204_DS_:
;	.line	265; "main.c"	buf[buf_head] = data;
	BANKSEL	_buf_head
	MOVF	_buf_head,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x1061
	MOVWF	r0x1061
	MOVLW	high (_buf + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1060
	MOVF	r0x1061,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1060
	BTFSC	r0x1060,0
	BSF	STATUS,7
	MOVF	r0x105E,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	266; "main.c"	buf_head = next;
	BANKSEL	r0x105F
	MOVF	r0x105F,W
	BANKSEL	_buf_head
	MOVWF	_buf_head
;	.line	267; "main.c"	TXIE = 1;       //Enables the EUSART transmit interrupt
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,4
;	.line	268; "main.c"	return 0;
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
_00205_DS_:
	RETURN	
; exit point of _circBufPush


;	code size estimation:
;	  760+  263 =  1023 instructions ( 2572 byte)

	end
