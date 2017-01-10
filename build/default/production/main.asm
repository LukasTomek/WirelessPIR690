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
	extern	_puint8_to_ascii
	extern	_SP_send_errorP
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
r0x104F	res	1
r0x1050	res	1
r0x104A	res	1
r0x104B	res	1
r0x104D	res	1
r0x104C	res	1
r0x104E	res	1
r0x1030	res	1
r0x1031	res	1
r0x1033	res	1
r0x1032	res	1
r0x1034	res	1
r0x1043	res	1
r0x1042	res	1
r0x1044	res	1
r0x1045	res	1
r0x1046	res	1
r0x1049	res	1
r0x103D	res	1
r0x103E	res	1
r0x103F	res	1
r0x1040	res	1
r0x1041	res	1
r0x1037	res	1
r0x1036	res	1
r0x1035	res	1
r0x1038	res	1
r0x1039	res	1
r0x103A	res	1
r0x103B	res	1
r0x103C	res	1
r0x102A	res	1
r0x1029	res	1
r0x1028	res	1
r0x102B	res	1
r0x102C	res	1
r0x102D	res	1
r0x102E	res	1
r0x102F	res	1
_dec_to_ascii_number_1_28	res	5
_uint8_to_ascii_number_1_32	res	4
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
;   r0x104F
;   r0x1050
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
	BANKSEL	r0x104F
	MOVWF	r0x104F
	MOVLW	high (_buf + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1050
	MOVF	r0x104F,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1050
	BTFSC	r0x1050,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	MOVWF	_TXREG
;	.line	108; "main.c"	buf[buf_tail] = 0;  // clear the data (optional)
	BANKSEL	r0x104F
	MOVF	r0x104F,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1050
	BTFSC	r0x1050,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	110; "main.c"	next = buf_tail + 1;
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x104F
	MOVWF	r0x104F
	CLRF	r0x1050
	INCF	r0x104F,F
	BTFSC	STATUS,2
	INCF	r0x1050,F
;;signed compare: left < lit(0x10=16), size=2, mask=ffff
;	.line	111; "main.c"	if(next >= BUF_SIZE)
	MOVF	r0x1050,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00134_DS_
	MOVLW	0x10
	SUBWF	r0x104F,W
_00134_DS_:
	BTFSS	STATUS,0
	GOTO	_00106_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;	.line	112; "main.c"	next = 0;
	BANKSEL	r0x104F
	CLRF	r0x104F
	CLRF	r0x1050
_00106_DS_:
;	.line	114; "main.c"	buf_tail = next;
	BANKSEL	r0x104F
	MOVF	r0x104F,W
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
	BANKSEL	r0x104F
	MOVWF	r0x104F
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
	BANKSEL	r0x104F
	MOVWF	r0x104F
	CLRF	r0x1050
	MOVF	r0x104F,W
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
	BANKSEL	r0x104F
	MOVWF	r0x104F
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
	BANKSEL	r0x104F
	MOVWF	r0x104F
	CLRF	r0x1050
	MOVF	r0x104F,W
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
;   _SP_send
;   _SP_send
;   _SP_send
;   _SP_send
;   _init
;   _SP_send
;   _uint8_to_ascii
;   _SP_send
;   _SP_send
;   _uint8_to_ascii
;   _SP_send
;   _SP_send
;   _SP_send
;   _SP_send
;   _SP_send
;7 compiler assigned registers:
;   r0x104A
;   r0x104B
;   r0x104C
;   r0x104D
;   r0x104E
;   STK01
;   STK00
;; Starting pCode block
S_main__main	code
_main:
; 2 exit points
;	.line	176; "main.c"	uint8_t i = 0;
	BANKSEL	r0x104A
	CLRF	r0x104A
;	.line	180; "main.c"	init();
	PAGESEL	_init
	CALL	_init
	PAGESEL	$
;	.line	181; "main.c"	bitfield.Hint = FALSE;
	BANKSEL	_bitfield
	BCF	_bitfield,2
;	.line	182; "main.c"	bitfield.Capture = FALSE;
	BCF	_bitfield,0
;	.line	183; "main.c"	GIE = 0;
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,7
;	.line	184; "main.c"	TMR0 = 0;
	CLRF	_TMR0
;	.line	185; "main.c"	w2 = 250;
	MOVLW	0xfa
	BANKSEL	_w2
	MOVWF	_w2
;	.line	186; "main.c"	t2 = 125;
	MOVLW	0x7d
	BANKSEL	_t2
	MOVWF	_t2
;	.line	187; "main.c"	temp = TMR0;
	BANKSEL	_TMR0
	MOVF	_TMR0,W
	BANKSEL	r0x104B
	MOVWF	r0x104B
;	.line	188; "main.c"	GIE = 1;
	BANKSEL	_INTCONbits
	BSF	_INTCONbits,7
;	.line	189; "main.c"	SP_send(strw1);
	MOVLW	high (_strw1 + 0)
	BANKSEL	r0x104C
	MOVWF	r0x104C
	MOVLW	(_strw1 + 0)
	MOVWF	r0x104D
	MOVLW	0x80
	MOVWF	r0x104E
	MOVF	r0x104D,W
	MOVWF	STK01
	MOVF	r0x104C,W
	MOVWF	STK00
	MOVF	r0x104E,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	191; "main.c"	uint8_to_ascii(temp);
	BANKSEL	r0x104B
	MOVF	r0x104B,W
	PAGESEL	_uint8_to_ascii
	CALL	_uint8_to_ascii
	PAGESEL	$
;	.line	192; "main.c"	SP_send(enter);
	MOVLW	high (_enter + 0)
	BANKSEL	r0x104C
	MOVWF	r0x104C
	MOVLW	(_enter + 0)
	MOVWF	r0x104D
	MOVLW	0x80
	MOVWF	r0x104E
	MOVF	r0x104D,W
	MOVWF	STK01
	MOVF	r0x104C,W
	MOVWF	STK00
	MOVF	r0x104E,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	193; "main.c"	GIE = 0;
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,7
;	.line	194; "main.c"	TMR0 = 0;
	CLRF	_TMR0
;	.line	195; "main.c"	w1 = 430;
	MOVLW	0xae
	BANKSEL	_w1
	MOVWF	_w1
	MOVLW	0x01
	MOVWF	(_w1 + 1)
;	.line	196; "main.c"	t1 = 1909;
	MOVLW	0x75
	BANKSEL	_t1
	MOVWF	_t1
	MOVLW	0x07
	MOVWF	(_t1 + 1)
;	.line	197; "main.c"	temp = TMR0;
	BANKSEL	_TMR0
	MOVF	_TMR0,W
	BANKSEL	r0x104B
	MOVWF	r0x104B
;	.line	198; "main.c"	GIE = 1;
	BANKSEL	_INTCONbits
	BSF	_INTCONbits,7
;	.line	199; "main.c"	SP_send(strw);
	MOVLW	high (_strw + 0)
	BANKSEL	r0x104C
	MOVWF	r0x104C
	MOVLW	(_strw + 0)
	MOVWF	r0x104D
	MOVLW	0x80
	MOVWF	r0x104E
	MOVF	r0x104D,W
	MOVWF	STK01
	MOVF	r0x104C,W
	MOVWF	STK00
	MOVF	r0x104E,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	201; "main.c"	uint8_to_ascii(temp);
	BANKSEL	r0x104B
	MOVF	r0x104B,W
	PAGESEL	_uint8_to_ascii
	CALL	_uint8_to_ascii
	PAGESEL	$
;	.line	202; "main.c"	SP_send(enter);
	MOVLW	high (_enter + 0)
	BANKSEL	r0x104D
	MOVWF	r0x104D
	MOVLW	(_enter + 0)
	MOVWF	r0x104B
	MOVLW	0x80
	MOVWF	r0x104C
	MOVF	r0x104B,W
	MOVWF	STK01
	MOVF	r0x104D,W
	MOVWF	STK00
	MOVF	r0x104C,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
_00167_DS_:
;	.line	220; "main.c"	TMR0 = 0;
	BANKSEL	_TMR0
	CLRF	_TMR0
;	.line	221; "main.c"	if (bitfield.Capture){
	BANKSEL	_bitfield
	BTFSS	_bitfield,0
	GOTO	_00165_DS_
;	.line	223; "main.c"	bitfield.Capture = FALSE;
	BCF	_bitfield,0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x759=1881), size=2
;	.line	224; "main.c"	if (t > MIN_T && t < MAX_T && t1 > MIN_T && t1 < MAX_T){
	MOVLW	0x07
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00237_DS_
	MOVLW	0x59
	SUBWF	_t,W
_00237_DS_:
	BTFSS	STATUS,0
	GOTO	_00155_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;;unsigned compare: left < lit(0x79E=1950), size=2
	MOVLW	0x07
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00238_DS_
	MOVLW	0x9e
	SUBWF	_t,W
_00238_DS_:
	BTFSC	STATUS,0
	GOTO	_00155_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x759=1881), size=2
	MOVLW	0x07
	BANKSEL	_t1
	SUBWF	(_t1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00239_DS_
	MOVLW	0x59
	SUBWF	_t1,W
_00239_DS_:
	BTFSS	STATUS,0
	GOTO	_00155_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;;unsigned compare: left < lit(0x79E=1950), size=2
	MOVLW	0x07
	BANKSEL	_t1
	SUBWF	(_t1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00240_DS_
	MOVLW	0x9e
	SUBWF	_t1,W
_00240_DS_:
	BTFSC	STATUS,0
	GOTO	_00155_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x547=1351), size=2
;	.line	226; "main.c"	if (w > MIN_W1 && w < MAX_W1 && w1 > MIN_W1 && w1 < MAX_W1){
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00241_DS_
	MOVLW	0x47
	SUBWF	_w,W
_00241_DS_:
	BTFSS	STATUS,0
	GOTO	_00140_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;;unsigned compare: left < lit(0x596=1430), size=2
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00242_DS_
	MOVLW	0x96
	SUBWF	_w,W
_00242_DS_:
	BTFSC	STATUS,0
	GOTO	_00140_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x547=1351), size=2
	MOVLW	0x05
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00243_DS_
	MOVLW	0x47
	SUBWF	_w1,W
_00243_DS_:
	BTFSS	STATUS,0
	GOTO	_00140_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;;unsigned compare: left < lit(0x596=1430), size=2
	MOVLW	0x05
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00244_DS_
	MOVLW	0x96
	SUBWF	_w1,W
_00244_DS_:
	BTFSC	STATUS,0
	GOTO	_00140_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;	.line	227; "main.c"	SP_send(strV1);
	MOVLW	high (_strV1 + 0)
	BANKSEL	r0x104D
	MOVWF	r0x104D
	MOVLW	(_strV1 + 0)
	MOVWF	r0x104B
	MOVLW	0x80
	MOVWF	r0x104C
	MOVF	r0x104B,W
	MOVWF	STK01
	MOVF	r0x104D,W
	MOVWF	STK00
	MOVF	r0x104C,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	228; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	229; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	230; "main.c"	i++;
	BANKSEL	r0x104A
	INCF	r0x104A,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
_00140_DS_:
;	.line	232; "main.c"	if (w > MIN_W0 && w < MAX_W0 && w1 > MIN_W0 && w1 < MAX_W0){
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00245_DS_
	MOVLW	0x7d
	SUBWF	_w,W
_00245_DS_:
	BTFSS	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00246_DS_
	MOVLW	0xc2
	SUBWF	_w,W
_00246_DS_:
	BTFSC	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00247_DS_
	MOVLW	0x7d
	SUBWF	_w1,W
_00247_DS_:
	BTFSS	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00248_DS_
	MOVLW	0xc2
	SUBWF	_w1,W
_00248_DS_:
	BTFSC	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;	.line	233; "main.c"	SP_send(strV0);
	MOVLW	high (_strV0 + 0)
	BANKSEL	r0x104D
	MOVWF	r0x104D
	MOVLW	(_strV0 + 0)
	MOVWF	r0x104B
	MOVLW	0x80
	MOVWF	r0x104C
	MOVF	r0x104B,W
	MOVWF	STK01
	MOVF	r0x104D,W
	MOVWF	STK00
	MOVF	r0x104C,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	234; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	235; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	236; "main.c"	i++;
	BANKSEL	r0x104A
	INCF	r0x104A,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
_00145_DS_:
;	.line	238; "main.c"	if (w1 > MIN_W0 && w1 < MAX_W0 && w > MIN_W1 && w < MAX_W1){
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00249_DS_
	MOVLW	0x7d
	SUBWF	_w1,W
_00249_DS_:
	BTFSS	STATUS,0
	GOTO	_00155_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00250_DS_
	MOVLW	0xc2
	SUBWF	_w1,W
_00250_DS_:
	BTFSC	STATUS,0
	GOTO	_00155_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x547=1351), size=2
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00251_DS_
	MOVLW	0x47
	SUBWF	_w,W
_00251_DS_:
	BTFSS	STATUS,0
	GOTO	_00155_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;;unsigned compare: left < lit(0x596=1430), size=2
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00252_DS_
	MOVLW	0x96
	SUBWF	_w,W
_00252_DS_:
	BTFSC	STATUS,0
	GOTO	_00155_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;	.line	239; "main.c"	SP_send(strVF);
	MOVLW	high (_strVF + 0)
	BANKSEL	r0x104D
	MOVWF	r0x104D
	MOVLW	(_strVF + 0)
	MOVWF	r0x104B
	MOVLW	0x80
	MOVWF	r0x104C
	MOVF	r0x104B,W
	MOVWF	STK01
	MOVF	r0x104D,W
	MOVWF	STK00
	MOVF	r0x104C,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	240; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	241; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	242; "main.c"	i++;
	BANKSEL	r0x104A
	INCF	r0x104A,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x1FA5=8101), size=2
_00155_DS_:
;	.line	245; "main.c"	if (t > MIN_TS && t < MAX_TS && w > MIN_W0 && w < MAX_W0){
	MOVLW	0x1f
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00253_DS_
	MOVLW	0xa5
	SUBWF	_t,W
_00253_DS_:
	BTFSS	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;;unsigned compare: left < lit(0x2008=8200), size=2
	MOVLW	0x20
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00254_DS_
	MOVLW	0x08
	SUBWF	_t,W
_00254_DS_:
	BTFSC	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00255_DS_
	MOVLW	0x7d
	SUBWF	_w,W
_00255_DS_:
	BTFSS	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00256_DS_
	MOVLW	0xc2
	SUBWF	_w,W
_00256_DS_:
	BTFSC	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7fff21886bf0
;	.line	246; "main.c"	SP_send(sync);
	MOVLW	high (_sync + 0)
	BANKSEL	r0x104D
	MOVWF	r0x104D
	MOVLW	(_sync + 0)
	MOVWF	r0x104B
	MOVLW	0x80
	MOVWF	r0x104C
	MOVF	r0x104B,W
	MOVWF	STK01
	MOVF	r0x104D,W
	MOVWF	STK00
	MOVF	r0x104C,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	247; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	248; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	249; "main.c"	i++;
	BANKSEL	r0x104A
	INCF	r0x104A,F
_00160_DS_:
;	.line	270; "main.c"	t1 = t;
	BANKSEL	_t
	MOVF	_t,W
	BANKSEL	_t1
	MOVWF	_t1
	BANKSEL	_t
	MOVF	(_t + 1),W
	BANKSEL	_t1
	MOVWF	(_t1 + 1)
;	.line	271; "main.c"	w1 = w;
	BANKSEL	_w
	MOVF	_w,W
	BANKSEL	_w1
	MOVWF	_w1
	BANKSEL	_w
	MOVF	(_w + 1),W
	BANKSEL	_w1
	MOVWF	(_w1 + 1)
_00165_DS_:
;	.line	284; "main.c"	int_error_cnt = 0;
	BANKSEL	_int_error_cnt
	CLRF	_int_error_cnt
	GOTO	_00167_DS_
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
;   r0x1028
;   STK00
;   r0x1029
;   STK01
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;; Starting pCode block
S_main__SP_send_error	code
_SP_send_error:
; 2 exit points
;	.line	368; "main.c"	void SP_send_error(char str[])
	BANKSEL	r0x1028
	MOVWF	r0x1028
	MOVF	STK00,W
	MOVWF	r0x1029
	MOVF	STK01,W
	MOVWF	r0x102A
;	.line	371; "main.c"	GIE = FALSE;	// Disable all interrupts.
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,7
;	.line	372; "main.c"	for(i=0; str[i] != '\0'; i++)
	BANKSEL	r0x102B
	CLRF	r0x102B
_00320_DS_:
	BANKSEL	r0x102B
	MOVF	r0x102B,W
	ADDWF	r0x102A,W
	MOVWF	r0x102C
	MOVF	r0x1029,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x102D
	MOVF	r0x1028,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x102E
	MOVF	r0x102C,W
	MOVWF	STK01
	MOVF	r0x102D,W
	MOVWF	STK00
	MOVF	r0x102E,W
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x102F
	MOVWF	r0x102F
	MOVF	r0x102F,W
	BTFSC	STATUS,2
	GOTO	_00322_DS_
;	.line	374; "main.c"	TXREG=str[i];	// Add a character to the output buffer
	MOVF	r0x102F,W
	BANKSEL	_TXREG
	MOVWF	_TXREG
_00315_DS_:
;	.line	375; "main.c"	while(!TXIF);	// Wait while the output buffer is full
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,4
	GOTO	_00315_DS_
;	.line	372; "main.c"	for(i=0; str[i] != '\0'; i++)
	BANKSEL	r0x102B
	INCF	r0x102B,F
	GOTO	_00320_DS_
_00322_DS_:
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
;   r0x1035
;   STK00
;   r0x1036
;   STK01
;   r0x1037
;   r0x1038
;   r0x1039
;   r0x103A
;   r0x103B
;   r0x103C
;; Starting pCode block
S_main__SP_send	code
_SP_send:
; 2 exit points
;	.line	360; "main.c"	void SP_send(char str[]){
	BANKSEL	r0x1035
	MOVWF	r0x1035
	MOVF	STK00,W
	MOVWF	r0x1036
	MOVF	STK01,W
	MOVWF	r0x1037
;	.line	362; "main.c"	for(i=0; str[i] != '\0'; i++)
	CLRF	r0x1038
_00308_DS_:
	BANKSEL	r0x1038
	MOVF	r0x1038,W
	ADDWF	r0x1037,W
	MOVWF	r0x1039
	MOVF	r0x1036,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x103A
	MOVF	r0x1035,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x103B
	MOVF	r0x1039,W
	MOVWF	STK01
	MOVF	r0x103A,W
	MOVWF	STK00
	MOVF	r0x103B,W
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x103C
	MOVWF	r0x103C
	MOVF	r0x103C,W
	BTFSC	STATUS,2
	GOTO	_00310_DS_
;	.line	364; "main.c"	circBufPush(str[i]);
	MOVF	r0x103C,W
	PAGESEL	_circBufPush
	CALL	_circBufPush
	PAGESEL	$
;	.line	362; "main.c"	for(i=0; str[i] != '\0'; i++)
	BANKSEL	r0x1038
	INCF	r0x1038,F
	GOTO	_00308_DS_
_00310_DS_:
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
;   r0x103D
;   r0x103E
;   r0x103F
;   r0x1040
;   STK00
;   r0x1041
;; Starting pCode block
S_main__uint8_to_ascii	code
_uint8_to_ascii:
; 2 exit points
;	.line	342; "main.c"	void uint8_to_ascii(uint8_t dec)
	BANKSEL	r0x103D
	MOVWF	r0x103D
;	.line	347; "main.c"	for (i=0 ; dec!=0  || i == 0; i++)
	CLRF	r0x103E
_00294_DS_:
	MOVLW	0x00
	BANKSEL	r0x103D
	IORWF	r0x103D,W
	BTFSS	STATUS,2
	GOTO	_00293_DS_
	MOVF	r0x103E,W
	BTFSS	STATUS,2
	GOTO	_00301_DS_
_00293_DS_:
;	.line	349; "main.c"	number[i]=(dec % 10);
	BANKSEL	r0x103E
	MOVF	r0x103E,W
	ADDLW	(_uint8_to_ascii_number_1_32 + 0)
	MOVWF	r0x103F
	MOVLW	high (_uint8_to_ascii_number_1_32 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1040
	MOVLW	0x0a
	MOVWF	STK00
	MOVF	r0x103D,W
	PAGESEL	__moduchar
	CALL	__moduchar
	PAGESEL	$
	BANKSEL	r0x1041
	MOVWF	r0x1041
	MOVF	r0x103F,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1040
	BTFSC	r0x1040,0
	BSF	STATUS,7
	MOVF	r0x1041,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	350; "main.c"	dec /=10;
	MOVLW	0x0a
	MOVWF	STK00
	BANKSEL	r0x103D
	MOVF	r0x103D,W
	PAGESEL	__divuchar
	CALL	__divuchar
	PAGESEL	$
	BANKSEL	r0x103D
	MOVWF	r0x103D
;	.line	351; "main.c"	number[i] +=48;
	MOVLW	0x30
	ADDWF	r0x1041,F
	MOVF	r0x103F,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1040
	BTFSC	r0x1040,0
	BSF	STATUS,7
	MOVF	r0x1041,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	347; "main.c"	for (i=0 ; dec!=0  || i == 0; i++)
	BANKSEL	r0x103E
	INCF	r0x103E,F
	GOTO	_00294_DS_
_00301_DS_:
;	.line	353; "main.c"	while (i--)
	BANKSEL	r0x103E
	MOVF	r0x103E,W
	MOVWF	r0x103D
_00289_DS_:
	BANKSEL	r0x103D
	MOVF	r0x103D,W
	MOVWF	r0x103E
	DECF	r0x103D,F
	MOVF	r0x103E,W
	BTFSC	STATUS,2
	GOTO	_00296_DS_
;	.line	355; "main.c"	circBufPush(number[i]);	// Add a character to the output buffer
	MOVF	r0x103D,W
	ADDLW	(_uint8_to_ascii_number_1_32 + 0)
	MOVWF	r0x103E
	MOVLW	high (_uint8_to_ascii_number_1_32 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x103F
	MOVF	r0x103E,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x103F
	BTFSC	r0x103F,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1040
	MOVWF	r0x1040
	PAGESEL	_circBufPush
	CALL	_circBufPush
	PAGESEL	$
	GOTO	_00289_DS_
_00296_DS_:
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
;   r0x1042
;   STK00
;   r0x1043
;   r0x1044
;   r0x1045
;   r0x1046
;   STK02
;   STK01
;   r0x1047
;   r0x1048
;   r0x1049
;; Starting pCode block
S_main__dec_to_ascii	code
_dec_to_ascii:
; 2 exit points
;	.line	305; "main.c"	void dec_to_ascii(unsigned short dec)
	BANKSEL	r0x1042
	MOVWF	r0x1042
	MOVF	STK00,W
	MOVWF	r0x1043
;	.line	310; "main.c"	for (i=0 ; dec!=0 || i == 0; i++)
	CLRF	r0x1044
_00276_DS_:
	BANKSEL	r0x1043
	MOVF	r0x1043,W
	IORWF	r0x1042,W
	BTFSS	STATUS,2
	GOTO	_00275_DS_
	MOVF	r0x1044,W
	BTFSS	STATUS,2
	GOTO	_00283_DS_
_00275_DS_:
;	.line	312; "main.c"	number[i] = (dec % 10);
	BANKSEL	r0x1044
	MOVF	r0x1044,W
	ADDLW	(_dec_to_ascii_number_1_28 + 0)
	MOVWF	r0x1045
	MOVLW	high (_dec_to_ascii_number_1_28 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1046
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1043,W
	MOVWF	STK00
	MOVF	r0x1042,W
	PAGESEL	__moduint
	CALL	__moduint
	PAGESEL	$
;;1	MOVWF	r0x1047
	MOVF	STK00,W
;;1	MOVWF	r0x1048
	BANKSEL	r0x1049
	MOVWF	r0x1049
	MOVF	r0x1045,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1046
	BTFSC	r0x1046,0
	BSF	STATUS,7
	MOVF	r0x1049,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	313; "main.c"	dec /= 10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	BANKSEL	r0x1043
	MOVF	r0x1043,W
	MOVWF	STK00
	MOVF	r0x1042,W
	PAGESEL	__divuint
	CALL	__divuint
	PAGESEL	$
	BANKSEL	r0x1042
	MOVWF	r0x1042
	MOVF	STK00,W
	MOVWF	r0x1043
;	.line	314; "main.c"	number[i] += 48;
	MOVLW	0x30
	ADDWF	r0x1049,F
	MOVF	r0x1045,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1046
	BTFSC	r0x1046,0
	BSF	STATUS,7
	MOVF	r0x1049,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	310; "main.c"	for (i=0 ; dec!=0 || i == 0; i++)
	BANKSEL	r0x1044
	INCF	r0x1044,F
	GOTO	_00276_DS_
_00283_DS_:
;	.line	316; "main.c"	while (i--)
	BANKSEL	r0x1044
	MOVF	r0x1044,W
	MOVWF	r0x1043
_00271_DS_:
	BANKSEL	r0x1043
	MOVF	r0x1043,W
	MOVWF	r0x1042
	DECF	r0x1043,F
	MOVF	r0x1042,W
	BTFSC	STATUS,2
	GOTO	_00278_DS_
;	.line	318; "main.c"	circBufPush(number[i]);	// Add a character to the output buffer
	MOVF	r0x1043,W
	ADDLW	(_dec_to_ascii_number_1_28 + 0)
	MOVWF	r0x1042
	MOVLW	high (_dec_to_ascii_number_1_28 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1044
	MOVF	r0x1042,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1044
	BTFSC	r0x1044,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1045
	MOVWF	r0x1045
	PAGESEL	_circBufPush
	CALL	_circBufPush
	PAGESEL	$
	GOTO	_00271_DS_
_00278_DS_:
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
;   r0x1030
;   r0x1031
;   r0x1032
;   r0x1033
;   r0x1034
;   STK01
;   STK00
;; Starting pCode block
S_main__circBufPush	code
_circBufPush:
; 2 exit points
;	.line	288; "main.c"	int circBufPush(uint8_t data){
	BANKSEL	r0x1030
	MOVWF	r0x1030
;	.line	289; "main.c"	uint8_t next = buf_head + 1;
	BANKSEL	_buf_head
	INCF	_buf_head,W
	BANKSEL	r0x1031
	MOVWF	r0x1031
;;unsigned compare: left < lit(0x10=16), size=1
;	.line	290; "main.c"	if (next >= BUF_SIZE)
	MOVLW	0x10
;	.line	291; "main.c"	next = 0;
	SUBWF	r0x1031,W
;	.line	294; "main.c"	if (next == buf_tail){
	BTFSC	STATUS,0
	CLRF	r0x1031
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x1031
	XORWF	r0x1031,W
	BTFSS	STATUS,2
	GOTO	_00264_DS_
;	.line	295; "main.c"	SP_send_error(buf_err);
	MOVLW	high (_buf_err + 0)
	MOVWF	r0x1032
	MOVLW	(_buf_err + 0)
	MOVWF	r0x1033
	MOVLW	0x80
	MOVWF	r0x1034
	MOVF	r0x1033,W
	MOVWF	STK01
	MOVF	r0x1032,W
	MOVWF	STK00
	MOVF	r0x1034,W
	PAGESEL	_SP_send_error
	CALL	_SP_send_error
	PAGESEL	$
;	.line	296; "main.c"	return -1;  // quit with an error
	MOVLW	0xff
	MOVWF	STK00
	MOVLW	0xff
	GOTO	_00265_DS_
_00264_DS_:
;	.line	299; "main.c"	buf[buf_head] = data;
	BANKSEL	_buf_head
	MOVF	_buf_head,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x1033
	MOVWF	r0x1033
	MOVLW	high (_buf + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1032
	MOVF	r0x1033,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1032
	BTFSC	r0x1032,0
	BSF	STATUS,7
	MOVF	r0x1030,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	300; "main.c"	buf_head = next;
	BANKSEL	r0x1031
	MOVF	r0x1031,W
	BANKSEL	_buf_head
	MOVWF	_buf_head
;	.line	301; "main.c"	TXIE = 1;       //Enables the EUSART transmit interrupt
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,4
;	.line	302; "main.c"	return 0;
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
_00265_DS_:
	RETURN	
; exit point of _circBufPush


;	code size estimation:
;	  695+  210 =   905 instructions ( 2230 byte)

	end
