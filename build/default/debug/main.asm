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
	extern	_uint8_to_ascii_buf
	extern	_SP_send_buf
	extern	_SP_send
	extern	_uint8_send
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
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
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
	global	_bwk
	global	_bw16
	global	_btk
	global	_bt16
	global	_buf
	global	_buf_head
	global	_buf_tail
	global	_int_error_cnt
	global	_w16
	global	_t16
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
	global	_tim0_owf

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
_bw	res	30

UD_main_2	udata
_bt	res	30

UD_main_3	udata
_bwk	res	6

UD_main_4	udata
_bw16	res	6

UD_main_5	udata
_btk	res	6

UD_main_6	udata
_bt16	res	6

UD_main_7	udata
_buf	res	16

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_main_0	udata
r0x107B	res	1
r0x107C	res	1
r0x1074	res	1
r0x1075	res	1
r0x1076	res	1
r0x1077	res	1
r0x1078	res	1
r0x1079	res	1
r0x107A	res	1
r0x106F	res	1
r0x1070	res	1
r0x1072	res	1
r0x1071	res	1
r0x1073	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_main_0	idata
_w
	db	0x00


ID_main_1	idata
_t
	db	0x00


ID_main_2	idata
_w1
	db	0x00


ID_main_3	idata
_t1
	db	0x00


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
_w16
	db	0x00


ID_main_8	idata
_t16
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


ID_main_25	code
_tim0_owf
	retlw 0x54
	retlw 0x49
	retlw 0x4d
	retlw 0x30
	retlw 0x20
	retlw 0x4f
	retlw 0x57
	retlw 0x46
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
;2 compiler assigned registers:
;   r0x107B
;   r0x107C
;; Starting pCode block
_receive_intr:
; 0 exit points
;	.line	103; "main.c"	void receive_intr() __interrupt 0 {
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
;	.line	105; "main.c"	if(T0IF){
	BANKSEL	_INTCONbits
	BTFSS	_INTCONbits,2
	GOTO	_00106_DS_
;	.line	106; "main.c"	T0IF = 0;
	BCF	_INTCONbits,2
;	.line	107; "main.c"	TMR0 = 0;	// Enable timer
	CLRF	_TMR0
_00106_DS_:
;	.line	111; "main.c"	if(TXIF){
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,4
	GOTO	_00113_DS_
;	.line	113; "main.c"	if (buf_head == buf_tail){
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	_buf_head
	XORWF	_buf_head,W
	BTFSS	STATUS,2
	GOTO	_00110_DS_
;	.line	114; "main.c"	TXIE = 0;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,4
	GOTO	_00113_DS_
_00110_DS_:
;	.line	119; "main.c"	TXREG = buf[buf_tail];
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x107B
	MOVWF	r0x107B
	MOVLW	high (_buf + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x107C
	MOVF	r0x107B,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x107C
	BTFSC	r0x107C,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	MOVWF	_TXREG
;	.line	120; "main.c"	buf[buf_tail] = 0;  // clear the data (optional)
	BANKSEL	r0x107B
	MOVF	r0x107B,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x107C
	BTFSC	r0x107C,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	122; "main.c"	next = buf_tail + 1;
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x107B
	MOVWF	r0x107B
	CLRF	r0x107C
	INCF	r0x107B,F
	BTFSC	STATUS,2
	INCF	r0x107C,F
;;signed compare: left < lit(0x10=16), size=2, mask=ffff
;	.line	123; "main.c"	if(next >= BUF_SIZE)
	MOVF	r0x107C,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00139_DS_
	MOVLW	0x10
	SUBWF	r0x107B,W
_00139_DS_:
	BTFSS	STATUS,0
	GOTO	_00108_DS_
;;genSkipc:3257: created from rifx:0x7fff3e47af20
;	.line	124; "main.c"	next = 0;
	BANKSEL	r0x107B
	CLRF	r0x107B
	CLRF	r0x107C
_00108_DS_:
;	.line	126; "main.c"	buf_tail = next;
	BANKSEL	r0x107B
	MOVF	r0x107B,W
	BANKSEL	_buf_tail
	MOVWF	_buf_tail
_00113_DS_:
;	.line	132; "main.c"	if(CCP1IF){
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,2
	GOTO	_00118_DS_
;	.line	133; "main.c"	CCP1IE = FALSE;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,2
;	.line	134; "main.c"	if(CCP1M0){                     // if ECCP mode is Rising edge CCP1M0
	BANKSEL	_CCP1CONbits
	BTFSS	_CCP1CONbits,0
	GOTO	_00115_DS_
;	.line	135; "main.c"	CCP1M0 = FALING;                 // set falling edge
	BCF	_CCP1CONbits,0
;	.line	138; "main.c"	TMR1H = 0;
	CLRF	_TMR1H
;	.line	139; "main.c"	TMR1L = 0;
	CLRF	_TMR1L
;	.line	144; "main.c"	t16 = CCPR1H;
	MOVF	_CCPR1H,W
	BANKSEL	_t16
	MOVWF	_t16
;	.line	145; "main.c"	t = CCPR1L;
	BANKSEL	_CCPR1L
	MOVF	_CCPR1L,W
	BANKSEL	_t
	MOVWF	_t
;	.line	146; "main.c"	bitfield.Capture = TRUE;
	BANKSEL	_bitfield
	BSF	_bitfield,0
	GOTO	_00116_DS_
_00115_DS_:
;	.line	149; "main.c"	CCP1M0 = RISING;
	BANKSEL	_CCP1CONbits
	BSF	_CCP1CONbits,0
;	.line	154; "main.c"	w16 = CCPR1H;
	MOVF	_CCPR1H,W
	BANKSEL	_w16
	MOVWF	_w16
;	.line	155; "main.c"	w = CCPR1L;
	BANKSEL	_CCPR1L
	MOVF	_CCPR1L,W
	BANKSEL	_w
	MOVWF	_w
_00116_DS_:
;	.line	158; "main.c"	CCP1IE = 1;
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,2
;	.line	159; "main.c"	CCP1IF = 0;                     //Clear interrupt flag
	BANKSEL	_PIR1bits
	BCF	_PIR1bits,2
_00118_DS_:
;	.line	161; "main.c"	int_error_cnt++;
	BANKSEL	_int_error_cnt
	INCF	_int_error_cnt,F
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
;   _uint8_to_ascii_buf
;   _SP_send
;   _uint8_to_ascii_buf
;   _SP_send
;   _uint8_to_ascii_buf
;   _SP_send
;   _uint8_to_ascii_buf
;   _SP_send
;   _uint8_to_ascii_buf
;   _SP_send
;   _uint8_to_ascii_buf
;   _SP_send
;   _SP_send
;   _init
;   _uint8_to_ascii_buf
;   _SP_send
;   _uint8_to_ascii_buf
;   _SP_send
;   _uint8_to_ascii_buf
;   _SP_send
;   _uint8_to_ascii_buf
;   _SP_send
;   _uint8_to_ascii_buf
;   _SP_send
;   _uint8_to_ascii_buf
;   _SP_send
;   _SP_send
;9 compiler assigned registers:
;   r0x1074
;   r0x1075
;   r0x1076
;   r0x1077
;   r0x1078
;   r0x1079
;   r0x107A
;   STK01
;   STK00
;; Starting pCode block
S_main__main	code
_main:
; 2 exit points
;	.line	165; "main.c"	uint8_t i = 0;
	BANKSEL	r0x1074
	CLRF	r0x1074
;	.line	167; "main.c"	uint8_t k = 0;
	CLRF	r0x1075
;	.line	169; "main.c"	init();
	PAGESEL	_init
	CALL	_init
	PAGESEL	$
;	.line	170; "main.c"	bitfield.Hint = FALSE;
	BANKSEL	_bitfield
	BCF	_bitfield,2
;	.line	171; "main.c"	bitfield.Capture = FALSE;
	BCF	_bitfield,0
;	.line	173; "main.c"	for(j = 0; j < 6; j++){
	BANKSEL	r0x1076
	CLRF	r0x1076
_00168_DS_:
;	.line	174; "main.c"	bwk[j] = 0;
	BANKSEL	r0x1076
	MOVF	r0x1076,W
	ADDLW	(_bwk + 0)
	MOVWF	r0x1077
	MOVLW	high (_bwk + 0)
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
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	175; "main.c"	bw16[j] = 0;
	BANKSEL	r0x1076
	MOVF	r0x1076,W
	ADDLW	(_bw16 + 0)
	MOVWF	r0x1077
	MOVLW	high (_bw16 + 0)
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
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	176; "main.c"	btk[j] = 0;
	BANKSEL	r0x1076
	MOVF	r0x1076,W
	ADDLW	(_btk + 0)
	MOVWF	r0x1077
	MOVLW	high (_btk + 0)
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
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	177; "main.c"	bt16[j] = 0;
	BANKSEL	r0x1076
	MOVF	r0x1076,W
	ADDLW	(_bt16 + 0)
	MOVWF	r0x1077
	MOVLW	high (_bt16 + 0)
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
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	173; "main.c"	for(j = 0; j < 6; j++){
	BANKSEL	r0x1076
	INCF	r0x1076,F
;;unsigned compare: left < lit(0x6=6), size=1
	MOVLW	0x06
	SUBWF	r0x1076,W
	BTFSS	STATUS,0
	GOTO	_00168_DS_
;;genSkipc:3257: created from rifx:0x7fff3e47af20
;	.line	179; "main.c"	j = 0;
	CLRF	r0x1076
_00166_DS_:
;	.line	183; "main.c"	if (bitfield.Capture){
	BANKSEL	_bitfield
	BTFSS	_bitfield,0
	GOTO	_00160_DS_
;	.line	184; "main.c"	bitfield.Capture = FALSE;
	BCF	_bitfield,0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0xE7=231), size=1
;	.line	186; "main.c"	if (t > MIN_T && t < MAX_T && t1 > MIN_T && t1 < MAX_T){
	MOVLW	0xe7
	BANKSEL	_t
	SUBWF	_t,W
	BTFSS	STATUS,0
	GOTO	_00001_DS_
;;genSkipc:3257: created from rifx:0x7fff3e47af20
;;unsigned compare: left < lit(0xF0=240), size=1
	MOVLW	0xf0
	SUBWF	_t,W
	BTFSC	STATUS,0
	GOTO	_00001_DS_
;;genSkipc:3257: created from rifx:0x7fff3e47af20
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0xE7=231), size=1
	MOVLW	0xe7
	BANKSEL	_t1
	SUBWF	_t1,W
	BTFSS	STATUS,0
	GOTO	_00001_DS_
;;genSkipc:3257: created from rifx:0x7fff3e47af20
;;unsigned compare: left < lit(0xF0=240), size=1
	MOVLW	0xf0
;	.line	187; "main.c"	bitfield.Hint = TRUE;
	SUBWF	_t1,W
;	.line	223; "main.c"	if (k < 30 && bitfield.Hint){ //&& t < 6000){ //k < 10
	BTFSC	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	_bitfield
	BSF	_bitfield,2
_00001_DS_:
	MOVLW	0x1e
	BANKSEL	r0x1075
	SUBWF	r0x1075,W
	BTFSC	STATUS,0
	GOTO	_00157_DS_
;;genSkipc:3257: created from rifx:0x7fff3e47af20
	BANKSEL	_bitfield
	BTFSS	_bitfield,2
	GOTO	_00157_DS_
;	.line	224; "main.c"	bw[k] = w;
	BANKSEL	r0x1075
	MOVF	r0x1075,W
	ADDLW	(_bw + 0)
	MOVWF	r0x1077
	MOVLW	high (_bw + 0)
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
	BANKSEL	_w
	MOVF	_w,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	225; "main.c"	bt[k] = t;
	BANKSEL	r0x1075
	MOVF	r0x1075,W
	ADDLW	(_bt + 0)
	MOVWF	r0x1077
	MOVLW	high (_bt + 0)
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
	BANKSEL	_t
	MOVF	_t,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	226; "main.c"	if(w16 > 0 && i < 6){
	MOVLW	0x00
	BANKSEL	_w16
	IORWF	_w16,W
	BTFSC	STATUS,2
	GOTO	_00151_DS_
;;unsigned compare: left < lit(0x6=6), size=1
	MOVLW	0x06
	BANKSEL	r0x1074
	SUBWF	r0x1074,W
	BTFSC	STATUS,0
	GOTO	_00151_DS_
;;genSkipc:3257: created from rifx:0x7fff3e47af20
;	.line	227; "main.c"	bwk[i] = k;
	MOVF	r0x1074,W
	ADDLW	(_bwk + 0)
	MOVWF	r0x1077
	MOVLW	high (_bwk + 0)
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
	MOVF	r0x1075,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	228; "main.c"	bw16[i] = w16;
	BANKSEL	r0x1074
	MOVF	r0x1074,W
	ADDLW	(_bw16 + 0)
	MOVWF	r0x1077
	MOVLW	high (_bw16 + 0)
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
	BANKSEL	_w16
	MOVF	_w16,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	229; "main.c"	i++;
	BANKSEL	r0x1074
	INCF	r0x1074,F
_00151_DS_:
;	.line	231; "main.c"	if(t16 > 0 && j < 6){
	MOVLW	0x00
	BANKSEL	_t16
	IORWF	_t16,W
	BTFSC	STATUS,2
	GOTO	_00154_DS_
;;unsigned compare: left < lit(0x6=6), size=1
	MOVLW	0x06
	BANKSEL	r0x1076
	SUBWF	r0x1076,W
	BTFSC	STATUS,0
	GOTO	_00154_DS_
;;genSkipc:3257: created from rifx:0x7fff3e47af20
;	.line	232; "main.c"	btk[j] = k;
	MOVF	r0x1076,W
	ADDLW	(_btk + 0)
	MOVWF	r0x1077
	MOVLW	high (_btk + 0)
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
	MOVF	r0x1075,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	233; "main.c"	bt16[j] = t16;
	BANKSEL	r0x1076
	MOVF	r0x1076,W
	ADDLW	(_bt16 + 0)
	MOVWF	r0x1077
	MOVLW	high (_bt16 + 0)
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
	BANKSEL	_t16
	MOVF	_t16,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	234; "main.c"	j++;
	BANKSEL	r0x1076
	INCF	r0x1076,F
_00154_DS_:
;	.line	236; "main.c"	k++;
	BANKSEL	r0x1075
	INCF	r0x1075,F
_00157_DS_:
;	.line	238; "main.c"	t1 = t;
	BANKSEL	_t
	MOVF	_t,W
	BANKSEL	_t1
	MOVWF	_t1
;	.line	239; "main.c"	w1 = w;
	BANKSEL	_w
	MOVF	_w,W
	BANKSEL	_w1
	MOVWF	_w1
;;unsigned compare: left < lit(0x1E=30), size=1
_00160_DS_:
;	.line	241; "main.c"	if(k >= 30){
	MOVLW	0x1e
	BANKSEL	r0x1075
	SUBWF	r0x1075,W
	BTFSS	STATUS,0
	GOTO	_00164_DS_
;;genSkipc:3257: created from rifx:0x7fff3e47af20
;	.line	242; "main.c"	for(j = 0; j < 30; j++){
	CLRF	r0x1077
_00170_DS_:
;	.line	243; "main.c"	uint8_to_ascii_buf(bw[j]);
	BANKSEL	r0x1077
	MOVF	r0x1077,W
	ADDLW	(_bw + 0)
	MOVWF	r0x1078
	MOVLW	high (_bw + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1079
	MOVF	r0x1078,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1079
	BTFSC	r0x1079,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x107A
	MOVWF	r0x107A
	PAGESEL	_uint8_to_ascii_buf
	CALL	_uint8_to_ascii_buf
	PAGESEL	$
;	.line	244; "main.c"	SP_send(tab);
	MOVLW	high (_tab + 0)
	BANKSEL	r0x1079
	MOVWF	r0x1079
	MOVLW	(_tab + 0)
	MOVWF	r0x1078
	MOVLW	0x80
	MOVWF	r0x107A
	MOVF	r0x1078,W
	MOVWF	STK01
	MOVF	r0x1079,W
	MOVWF	STK00
	MOVF	r0x107A,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	245; "main.c"	uint8_to_ascii_buf(bt[j]);
	BANKSEL	r0x1077
	MOVF	r0x1077,W
	ADDLW	(_bt + 0)
	MOVWF	r0x1078
	MOVLW	high (_bt + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1079
	MOVF	r0x1078,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1079
	BTFSC	r0x1079,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x107A
	MOVWF	r0x107A
	PAGESEL	_uint8_to_ascii_buf
	CALL	_uint8_to_ascii_buf
	PAGESEL	$
;	.line	246; "main.c"	SP_send(enter);
	MOVLW	high (_enter + 0)
	BANKSEL	r0x1079
	MOVWF	r0x1079
	MOVLW	(_enter + 0)
	MOVWF	r0x1078
	MOVLW	0x80
	MOVWF	r0x107A
	MOVF	r0x1078,W
	MOVWF	STK01
	MOVF	r0x1079,W
	MOVWF	STK00
	MOVF	r0x107A,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	242; "main.c"	for(j = 0; j < 30; j++){
	BANKSEL	r0x1077
	INCF	r0x1077,F
;;unsigned compare: left < lit(0x1E=30), size=1
	MOVLW	0x1e
	SUBWF	r0x1077,W
	BTFSS	STATUS,0
	GOTO	_00170_DS_
;;genSkipc:3257: created from rifx:0x7fff3e47af20
;	.line	248; "main.c"	for(j = 0; j < 6; j++){
	CLRF	r0x1077
_00172_DS_:
;	.line	249; "main.c"	uint8_to_ascii_buf(bwk[j]);
	BANKSEL	r0x1077
	MOVF	r0x1077,W
	ADDLW	(_bwk + 0)
	MOVWF	r0x1078
	MOVLW	high (_bwk + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1079
	MOVF	r0x1078,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1079
	BTFSC	r0x1079,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x107A
	MOVWF	r0x107A
	PAGESEL	_uint8_to_ascii_buf
	CALL	_uint8_to_ascii_buf
	PAGESEL	$
;	.line	250; "main.c"	SP_send(tab);
	MOVLW	high (_tab + 0)
	BANKSEL	r0x1079
	MOVWF	r0x1079
	MOVLW	(_tab + 0)
	MOVWF	r0x1078
	MOVLW	0x80
	MOVWF	r0x107A
	MOVF	r0x1078,W
	MOVWF	STK01
	MOVF	r0x1079,W
	MOVWF	STK00
	MOVF	r0x107A,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	251; "main.c"	uint8_to_ascii_buf(bw16[j]);
	BANKSEL	r0x1077
	MOVF	r0x1077,W
	ADDLW	(_bw16 + 0)
	MOVWF	r0x1078
	MOVLW	high (_bw16 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1079
	MOVF	r0x1078,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1079
	BTFSC	r0x1079,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x107A
	MOVWF	r0x107A
	PAGESEL	_uint8_to_ascii_buf
	CALL	_uint8_to_ascii_buf
	PAGESEL	$
;	.line	252; "main.c"	SP_send(tab);
	MOVLW	high (_tab + 0)
	BANKSEL	r0x1079
	MOVWF	r0x1079
	MOVLW	(_tab + 0)
	MOVWF	r0x1078
	MOVLW	0x80
	MOVWF	r0x107A
	MOVF	r0x1078,W
	MOVWF	STK01
	MOVF	r0x1079,W
	MOVWF	STK00
	MOVF	r0x107A,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	253; "main.c"	uint8_to_ascii_buf(btk[j]);
	BANKSEL	r0x1077
	MOVF	r0x1077,W
	ADDLW	(_btk + 0)
	MOVWF	r0x1078
	MOVLW	high (_btk + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1079
	MOVF	r0x1078,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1079
	BTFSC	r0x1079,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x107A
	MOVWF	r0x107A
	PAGESEL	_uint8_to_ascii_buf
	CALL	_uint8_to_ascii_buf
	PAGESEL	$
;	.line	254; "main.c"	SP_send(tab);
	MOVLW	high (_tab + 0)
	BANKSEL	r0x1079
	MOVWF	r0x1079
	MOVLW	(_tab + 0)
	MOVWF	r0x1078
	MOVLW	0x80
	MOVWF	r0x107A
	MOVF	r0x1078,W
	MOVWF	STK01
	MOVF	r0x1079,W
	MOVWF	STK00
	MOVF	r0x107A,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	255; "main.c"	uint8_to_ascii_buf(bt16[j]);
	BANKSEL	r0x1077
	MOVF	r0x1077,W
	ADDLW	(_bt16 + 0)
	MOVWF	r0x1078
	MOVLW	high (_bt16 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1079
	MOVF	r0x1078,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1079
	BTFSC	r0x1079,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x107A
	MOVWF	r0x107A
	PAGESEL	_uint8_to_ascii_buf
	CALL	_uint8_to_ascii_buf
	PAGESEL	$
;	.line	256; "main.c"	SP_send(enter);
	MOVLW	high (_enter + 0)
	BANKSEL	r0x1079
	MOVWF	r0x1079
	MOVLW	(_enter + 0)
	MOVWF	r0x1078
	MOVLW	0x80
	MOVWF	r0x107A
	MOVF	r0x1078,W
	MOVWF	STK01
	MOVF	r0x1079,W
	MOVWF	STK00
	MOVF	r0x107A,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	248; "main.c"	for(j = 0; j < 6; j++){
	BANKSEL	r0x1077
	INCF	r0x1077,F
;;unsigned compare: left < lit(0x6=6), size=1
	MOVLW	0x06
	SUBWF	r0x1077,W
	BTFSS	STATUS,0
	GOTO	_00172_DS_
;;genSkipc:3257: created from rifx:0x7fff3e47af20
;	.line	258; "main.c"	SP_send(sync);
	MOVLW	high (_sync + 0)
	MOVWF	r0x1078
	MOVLW	(_sync + 0)
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
;	.line	259; "main.c"	i = 0;
	BANKSEL	r0x1074
	CLRF	r0x1074
;	.line	260; "main.c"	k = 0;
	CLRF	r0x1075
;	.line	261; "main.c"	j = 0;
	CLRF	r0x1076
_00164_DS_:
;	.line	263; "main.c"	int_error_cnt = 0;
	BANKSEL	_int_error_cnt
	CLRF	_int_error_cnt
	GOTO	_00166_DS_
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _SP_send
;   _SP_send
;7 compiler assigned registers:
;   r0x106F
;   r0x1070
;   r0x1071
;   r0x1072
;   r0x1073
;   STK01
;   STK00
;; Starting pCode block
S_main__circBufPush	code
_circBufPush:
; 2 exit points
;	.line	267; "main.c"	int circBufPush(uint8_t data){
	BANKSEL	r0x106F
	MOVWF	r0x106F
;	.line	268; "main.c"	uint8_t next = buf_head + 1;
	BANKSEL	_buf_head
	INCF	_buf_head,W
	BANKSEL	r0x1070
	MOVWF	r0x1070
;;unsigned compare: left < lit(0x10=16), size=1
;	.line	269; "main.c"	if (next >= BUF_SIZE)
	MOVLW	0x10
;	.line	270; "main.c"	next = 0;
	SUBWF	r0x1070,W
;	.line	273; "main.c"	if (next == buf_tail){
	BTFSC	STATUS,0
	CLRF	r0x1070
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x1070
	XORWF	r0x1070,W
	BTFSS	STATUS,2
	GOTO	_00180_DS_
;	.line	274; "main.c"	SP_send(buf_err);
	MOVLW	high (_buf_err + 0)
	MOVWF	r0x1071
	MOVLW	(_buf_err + 0)
	MOVWF	r0x1072
	MOVLW	0x80
	MOVWF	r0x1073
	MOVF	r0x1072,W
	MOVWF	STK01
	MOVF	r0x1071,W
	MOVWF	STK00
	MOVF	r0x1073,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	275; "main.c"	return -1;  // quit with an error
	MOVLW	0xff
	MOVWF	STK00
	MOVLW	0xff
	GOTO	_00181_DS_
_00180_DS_:
;	.line	278; "main.c"	buf[buf_head] = data;
	BANKSEL	_buf_head
	MOVF	_buf_head,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x1072
	MOVWF	r0x1072
	MOVLW	high (_buf + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1071
	MOVF	r0x1072,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1071
	BTFSC	r0x1071,0
	BSF	STATUS,7
	MOVF	r0x106F,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	279; "main.c"	buf_head = next;
	BANKSEL	r0x1070
	MOVF	r0x1070,W
	BANKSEL	_buf_head
	MOVWF	_buf_head
;	.line	280; "main.c"	TXIE = 1;       //Enables the EUSART transmit interrupt
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,4
;	.line	281; "main.c"	return 0;
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
_00181_DS_:
	RETURN	
; exit point of _circBufPush


;	code size estimation:
;	  538+  183 =   721 instructions ( 1808 byte)

	end
