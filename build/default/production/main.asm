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
	extern	_dec_to_ascii_buf
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
	extern	__mulchar
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
	global	_buf
	global	_buf_head
	global	_buf_tail
	global	_int_error_cnt
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
r0x1053	res	1
r0x1054	res	1
r0x104A	res	1
r0x104B	res	1
r0x104D	res	1
r0x104C	res	1
r0x104E	res	1
r0x104F	res	1
r0x1050	res	1
r0x1051	res	1
r0x1052	res	1
r0x1045	res	1
r0x1046	res	1
r0x1048	res	1
r0x1047	res	1
r0x1049	res	1
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


ID_main_7	code
_strV0
	retlw 0x30
	retlw 0x20
	retlw 0x0a
	retlw 0x00


ID_main_8	code
_strV1
	retlw 0x31
	retlw 0x20
	retlw 0x0a
	retlw 0x00


ID_main_9	code
_strVF
	retlw 0x46
	retlw 0x20
	retlw 0x0a
	retlw 0x00


ID_main_10	code
_strw
	retlw 0x77
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_11	code
_strt
	retlw 0x74
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_12	code
_strw1
	retlw 0x77
	retlw 0x31
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_13	code
_strt1
	retlw 0x74
	retlw 0x31
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_14	code
_tab
	retlw 0x09
	retlw 0x00


ID_main_15	code
_enter
	retlw 0x0a
	retlw 0x00


ID_main_16	code
_sync
	retlw 0x53
	retlw 0x59
	retlw 0x4e
	retlw 0x43
	retlw 0x0a
	retlw 0x00


ID_main_17	code
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


ID_main_18	code
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


ID_main_19	code
_pir1
	retlw 0x50
	retlw 0x49
	retlw 0x52
	retlw 0x31
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_20	code
_pir2
	retlw 0x50
	retlw 0x49
	retlw 0x52
	retlw 0x32
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_21	code
_pie1
	retlw 0x50
	retlw 0x49
	retlw 0x45
	retlw 0x31
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_22	code
_pie2
	retlw 0x50
	retlw 0x49
	retlw 0x45
	retlw 0x32
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_23	code
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
;   r0x1053
;   r0x1054
;; Starting pCode block
_receive_intr:
; 0 exit points
;	.line	106; "main.c"	void receive_intr() __interrupt 0 {
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
;	.line	108; "main.c"	if(T0IF){
	BANKSEL	_INTCONbits
	BTFSS	_INTCONbits,2
	GOTO	_00106_DS_
;	.line	109; "main.c"	T0IF = 0;
	BCF	_INTCONbits,2
;	.line	110; "main.c"	TMR0 = 0;	// Enable timer
	CLRF	_TMR0
_00106_DS_:
;	.line	114; "main.c"	if(TXIF){
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,4
	GOTO	_00113_DS_
;	.line	116; "main.c"	if (buf_head == buf_tail){
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	_buf_head
	XORWF	_buf_head,W
	BTFSS	STATUS,2
	GOTO	_00110_DS_
;	.line	117; "main.c"	TXIE = 0;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,4
	GOTO	_00113_DS_
_00110_DS_:
;	.line	122; "main.c"	TXREG = buf[buf_tail];
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x1053
	MOVWF	r0x1053
	MOVLW	high (_buf + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1054
	MOVF	r0x1053,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1054
	BTFSC	r0x1054,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	MOVWF	_TXREG
;	.line	123; "main.c"	buf[buf_tail] = 0;  // clear the data (optional)
	BANKSEL	r0x1053
	MOVF	r0x1053,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1054
	BTFSC	r0x1054,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	125; "main.c"	next = buf_tail + 1;
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x1053
	MOVWF	r0x1053
	CLRF	r0x1054
	INCF	r0x1053,F
	BTFSC	STATUS,2
	INCF	r0x1054,F
;;signed compare: left < lit(0x10=16), size=2, mask=ffff
;	.line	126; "main.c"	if(next >= BUF_SIZE)
	MOVF	r0x1054,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00139_DS_
	MOVLW	0x10
	SUBWF	r0x1053,W
_00139_DS_:
	BTFSS	STATUS,0
	GOTO	_00108_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;	.line	127; "main.c"	next = 0;
	BANKSEL	r0x1053
	CLRF	r0x1053
	CLRF	r0x1054
_00108_DS_:
;	.line	129; "main.c"	buf_tail = next;
	BANKSEL	r0x1053
	MOVF	r0x1053,W
	BANKSEL	_buf_tail
	MOVWF	_buf_tail
_00113_DS_:
;	.line	135; "main.c"	if(CCP1IF){
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,2
	GOTO	_00118_DS_
;	.line	136; "main.c"	CCP1IE = FALSE;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,2
;	.line	137; "main.c"	if(CCP1M0){                     // if ECCP mode is Rising edge CCP1M0
	BANKSEL	_CCP1CONbits
	BTFSS	_CCP1CONbits,0
	GOTO	_00115_DS_
;	.line	138; "main.c"	CCP1M0 = FALING;                 // set falling edge
	BCF	_CCP1CONbits,0
;	.line	141; "main.c"	TMR1H = 0;
	CLRF	_TMR1H
;	.line	142; "main.c"	TMR1L = 0;
	CLRF	_TMR1L
;	.line	144; "main.c"	t = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
	MOVF	_CCPR1H,W
	BANKSEL	r0x1053
	MOVWF	r0x1053
	BANKSEL	_t
	MOVWF	_t
	CLRF	(_t + 1)
;	.line	145; "main.c"	t = t << 8;
	MOVF	_t,W
	MOVWF	(_t + 1)
	CLRF	_t
;	.line	146; "main.c"	t = t | CCPR1L;             //ECCP combined 16 bit number formation
	BANKSEL	_CCPR1L
	MOVF	_CCPR1L,W
	BANKSEL	r0x1053
	MOVWF	r0x1053
	CLRF	r0x1054
	MOVF	r0x1053,W
	BANKSEL	_t
	IORWF	_t,F
	MOVLW	0x00
	IORWF	(_t + 1),F
;	.line	149; "main.c"	bitfield.Capture = TRUE;
	BANKSEL	_bitfield
	BSF	_bitfield,0
	GOTO	_00116_DS_
_00115_DS_:
;	.line	152; "main.c"	CCP1M0 = RISING;
	BANKSEL	_CCP1CONbits
	BSF	_CCP1CONbits,0
;	.line	154; "main.c"	w = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
	MOVF	_CCPR1H,W
	BANKSEL	r0x1053
	MOVWF	r0x1053
	BANKSEL	_w
	MOVWF	_w
	CLRF	(_w + 1)
;	.line	155; "main.c"	w = w << 8;
	MOVF	_w,W
	MOVWF	(_w + 1)
	CLRF	_w
;	.line	156; "main.c"	w = w | CCPR1L;             //ECCP combined 16 bit number formation
	BANKSEL	_CCPR1L
	MOVF	_CCPR1L,W
	BANKSEL	r0x1053
	MOVWF	r0x1053
	CLRF	r0x1054
	MOVF	r0x1053,W
	BANKSEL	_w
	IORWF	_w,F
	MOVLW	0x00
	IORWF	(_w + 1),F
_00116_DS_:
;	.line	161; "main.c"	CCP1IE = 1;
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,2
;	.line	162; "main.c"	CCP1IF = 0;                     //Clear interrupt flag
	BANKSEL	_PIR1bits
	BCF	_PIR1bits,2
_00118_DS_:
;	.line	164; "main.c"	int_error_cnt++;
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
;   _SP_send
;   _SP_send
;   _SP_send
;   _SP_send
;   __mulchar
;   _dec_to_ascii_buf
;   _SP_send
;   _dec_to_ascii_buf
;   _SP_send
;   _SP_send
;   _init
;   _SP_send
;   _SP_send
;   _SP_send
;   _SP_send
;   __mulchar
;   _dec_to_ascii_buf
;   _SP_send
;   _dec_to_ascii_buf
;   _SP_send
;   _SP_send
;11 compiler assigned registers:
;   r0x104A
;   r0x104B
;   r0x104C
;   r0x104D
;   r0x104E
;   STK01
;   STK00
;   r0x104F
;   r0x1050
;   r0x1051
;   r0x1052
;; Starting pCode block
S_main__main	code
_main:
; 2 exit points
;	.line	168; "main.c"	uint8_t i = 0;
	BANKSEL	r0x104A
	CLRF	r0x104A
;	.line	170; "main.c"	uint8_t k = 0;
	CLRF	r0x104B
;	.line	172; "main.c"	init();
	PAGESEL	_init
	CALL	_init
	PAGESEL	$
;	.line	173; "main.c"	bitfield.Hint = FALSE;
	BANKSEL	_bitfield
	BCF	_bitfield,2
;	.line	174; "main.c"	bitfield.Capture = FALSE;
	BCF	_bitfield,0
_00175_DS_:
;	.line	186; "main.c"	if (bitfield.Capture){
	BANKSEL	_bitfield
	BTFSS	_bitfield,0
	GOTO	_00170_DS_
;	.line	187; "main.c"	bitfield.Capture = FALSE;
	BCF	_bitfield,0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x759=1881), size=2
;	.line	189; "main.c"	if (t > MIN_T && t < MAX_T && t1 > MIN_T && t1 < MAX_T){
	MOVLW	0x07
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00257_DS_
	MOVLW	0x59
	SUBWF	_t,W
_00257_DS_:
	BTFSS	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;;unsigned compare: left < lit(0x79E=1950), size=2
	MOVLW	0x07
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00258_DS_
	MOVLW	0x9e
	SUBWF	_t,W
_00258_DS_:
	BTFSC	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x759=1881), size=2
	MOVLW	0x07
	BANKSEL	_t1
	SUBWF	(_t1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00259_DS_
	MOVLW	0x59
	SUBWF	_t1,W
_00259_DS_:
	BTFSS	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;;unsigned compare: left < lit(0x79E=1950), size=2
	MOVLW	0x07
	BANKSEL	_t1
	SUBWF	(_t1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00260_DS_
	MOVLW	0x9e
	SUBWF	_t1,W
_00260_DS_:
	BTFSC	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;	.line	190; "main.c"	bitfield.Hint = TRUE;
	BANKSEL	_bitfield
	BSF	_bitfield,2
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x547=1351), size=2
;	.line	191; "main.c"	if (w > MIN_W1 && w < MAX_W1 && w1 > MIN_W1 && w1 < MAX_W1){
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00261_DS_
	MOVLW	0x47
	SUBWF	_w,W
_00261_DS_:
	BTFSS	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;;unsigned compare: left < lit(0x596=1430), size=2
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00262_DS_
	MOVLW	0x96
	SUBWF	_w,W
_00262_DS_:
	BTFSC	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x547=1351), size=2
	MOVLW	0x05
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00263_DS_
	MOVLW	0x47
	SUBWF	_w1,W
_00263_DS_:
	BTFSS	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;;unsigned compare: left < lit(0x596=1430), size=2
	MOVLW	0x05
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00264_DS_
	MOVLW	0x96
	SUBWF	_w1,W
_00264_DS_:
	BTFSC	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;	.line	192; "main.c"	SP_send(strV1);
	MOVLW	high (_strV1 + 0)
	BANKSEL	r0x104C
	MOVWF	r0x104C
	MOVLW	(_strV1 + 0)
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
;	.line	193; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	194; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	195; "main.c"	i++;
	BANKSEL	r0x104A
	INCF	r0x104A,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
_00145_DS_:
;	.line	197; "main.c"	if (w > MIN_W0 && w < MAX_W0 && w1 > MIN_W0 && w1 < MAX_W0){
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00265_DS_
	MOVLW	0x7d
	SUBWF	_w,W
_00265_DS_:
	BTFSS	STATUS,0
	GOTO	_00150_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00266_DS_
	MOVLW	0xc2
	SUBWF	_w,W
_00266_DS_:
	BTFSC	STATUS,0
	GOTO	_00150_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00267_DS_
	MOVLW	0x7d
	SUBWF	_w1,W
_00267_DS_:
	BTFSS	STATUS,0
	GOTO	_00150_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00268_DS_
	MOVLW	0xc2
	SUBWF	_w1,W
_00268_DS_:
	BTFSC	STATUS,0
	GOTO	_00150_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;	.line	198; "main.c"	SP_send(strV0);
	MOVLW	high (_strV0 + 0)
	BANKSEL	r0x104C
	MOVWF	r0x104C
	MOVLW	(_strV0 + 0)
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
;	.line	199; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	200; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	201; "main.c"	i++;
	BANKSEL	r0x104A
	INCF	r0x104A,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
_00150_DS_:
;	.line	203; "main.c"	if (w1 > MIN_W0 && w1 < MAX_W0 && w > MIN_W1 && w < MAX_W1){
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00269_DS_
	MOVLW	0x7d
	SUBWF	_w1,W
_00269_DS_:
	BTFSS	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00270_DS_
	MOVLW	0xc2
	SUBWF	_w1,W
_00270_DS_:
	BTFSC	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x547=1351), size=2
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00271_DS_
	MOVLW	0x47
	SUBWF	_w,W
_00271_DS_:
	BTFSS	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;;unsigned compare: left < lit(0x596=1430), size=2
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00272_DS_
	MOVLW	0x96
	SUBWF	_w,W
_00272_DS_:
	BTFSC	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;	.line	204; "main.c"	SP_send(strVF);
	MOVLW	high (_strVF + 0)
	BANKSEL	r0x104C
	MOVWF	r0x104C
	MOVLW	(_strVF + 0)
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
;	.line	205; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	206; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	207; "main.c"	i++;
	BANKSEL	r0x104A
	INCF	r0x104A,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x3A99=15001), size=2
_00160_DS_:
;	.line	220; "main.c"	if (t > MIN_TS && t < MAX_TS && w > MIN_W0 && w < MAX_W0){
	MOVLW	0x3a
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00273_DS_
	MOVLW	0x99
	SUBWF	_t,W
_00273_DS_:
	BTFSS	STATUS,0
	GOTO	_00165_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;;unsigned compare: left < lit(0x3E80=16000), size=2
	MOVLW	0x3e
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00274_DS_
	MOVLW	0x80
	SUBWF	_t,W
_00274_DS_:
	BTFSC	STATUS,0
	GOTO	_00165_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00275_DS_
	MOVLW	0x7d
	SUBWF	_w,W
_00275_DS_:
	BTFSS	STATUS,0
	GOTO	_00165_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00276_DS_
	MOVLW	0xc2
	SUBWF	_w,W
_00276_DS_:
	BTFSC	STATUS,0
	GOTO	_00165_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;	.line	221; "main.c"	SP_send(sync);
	MOVLW	high (_sync + 0)
	BANKSEL	r0x104C
	MOVWF	r0x104C
	MOVLW	(_sync + 0)
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
;	.line	222; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	223; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	224; "main.c"	i++;
	BANKSEL	r0x104A
	INCF	r0x104A,F
_00165_DS_:
;	.line	242; "main.c"	t1 = t;
	BANKSEL	_t
	MOVF	_t,W
	BANKSEL	_t1
	MOVWF	_t1
	BANKSEL	_t
	MOVF	(_t + 1),W
	BANKSEL	_t1
	MOVWF	(_t1 + 1)
;	.line	243; "main.c"	w1 = w;
	BANKSEL	_w
	MOVF	_w,W
	BANKSEL	_w1
	MOVWF	_w1
	BANKSEL	_w
	MOVF	(_w + 1),W
	BANKSEL	_w1
	MOVWF	(_w1 + 1)
_00170_DS_:
;	.line	245; "main.c"	CCP1IE = 0;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,2
;;unsigned compare: left < lit(0xA=10), size=1
;	.line	246; "main.c"	if(k >= 10){
	MOVLW	0x0a
	BANKSEL	r0x104B
	SUBWF	r0x104B,W
	BTFSS	STATUS,0
	GOTO	_00173_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;	.line	247; "main.c"	for(j = 0; j < 10; j++){
	CLRF	r0x104D
_00177_DS_:
;	.line	248; "main.c"	dec_to_ascii_buf(bw[j]);
	MOVLW	0x02
	MOVWF	STK00
	BANKSEL	r0x104D
	MOVF	r0x104D,W
	PAGESEL	__mulchar
	CALL	__mulchar
	PAGESEL	$
	BANKSEL	r0x104C
	MOVWF	r0x104C
	CLRF	r0x104E
	MOVF	r0x104C,W
	ADDLW	(_bw + 0)
	MOVWF	r0x104F
	MOVLW	high (_bw + 0)
	MOVWF	r0x1050
	MOVLW	0x00
	BTFSC	STATUS,0
	INCFSZ	r0x104E,W
	ADDWF	r0x1050,F
	MOVF	r0x104F,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1050
	BTFSC	r0x1050,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1051
	MOVWF	r0x1051
	BANKSEL	FSR
	INCF	FSR,F
	MOVF	INDF,W
	BANKSEL	r0x1052
	MOVWF	r0x1052
	MOVF	r0x1051,W
	MOVWF	STK00
	MOVF	r0x1052,W
	PAGESEL	_dec_to_ascii_buf
	CALL	_dec_to_ascii_buf
	PAGESEL	$
;	.line	249; "main.c"	SP_send(tab);
	MOVLW	high (_tab + 0)
	BANKSEL	r0x1050
	MOVWF	r0x1050
	MOVLW	(_tab + 0)
	MOVWF	r0x104F
	MOVLW	0x80
	MOVWF	r0x1051
	MOVF	r0x104F,W
	MOVWF	STK01
	MOVF	r0x1050,W
	MOVWF	STK00
	MOVF	r0x1051,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	250; "main.c"	dec_to_ascii_buf(bt[j]);
	BANKSEL	r0x104C
	MOVF	r0x104C,W
	ADDLW	(_bt + 0)
	MOVWF	r0x104C
	MOVF	r0x104E,W
	BTFSC	STATUS,0
	INCFSZ	r0x104E,W
	ADDLW	high (_bt + 0)
	MOVWF	r0x104E
	MOVF	r0x104C,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x104E
	BTFSC	r0x104E,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x104F
	MOVWF	r0x104F
	BANKSEL	FSR
	INCF	FSR,F
	MOVF	INDF,W
	BANKSEL	r0x1050
	MOVWF	r0x1050
	MOVF	r0x104F,W
	MOVWF	STK00
	MOVF	r0x1050,W
	PAGESEL	_dec_to_ascii_buf
	CALL	_dec_to_ascii_buf
	PAGESEL	$
;	.line	251; "main.c"	SP_send(enter);
	MOVLW	high (_enter + 0)
	BANKSEL	r0x104E
	MOVWF	r0x104E
	MOVLW	(_enter + 0)
	MOVWF	r0x104C
	MOVLW	0x80
	MOVWF	r0x104F
	MOVF	r0x104C,W
	MOVWF	STK01
	MOVF	r0x104E,W
	MOVWF	STK00
	MOVF	r0x104F,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	247; "main.c"	for(j = 0; j < 10; j++){
	BANKSEL	r0x104D
	INCF	r0x104D,F
;;unsigned compare: left < lit(0xA=10), size=1
	MOVLW	0x0a
	SUBWF	r0x104D,W
	BTFSS	STATUS,0
	GOTO	_00177_DS_
;;genSkipc:3257: created from rifx:0x7ffffb8f35a0
;	.line	263; "main.c"	SP_send(sync);
	MOVLW	high (_sync + 0)
	MOVWF	r0x104C
	MOVLW	(_sync + 0)
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
;	.line	264; "main.c"	i = 0;
	BANKSEL	r0x104A
	CLRF	r0x104A
;	.line	265; "main.c"	k = 0;
	CLRF	r0x104B
_00173_DS_:
;	.line	268; "main.c"	CCP1IE = 1;
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,2
;	.line	269; "main.c"	int_error_cnt = 0;
	BANKSEL	_int_error_cnt
	CLRF	_int_error_cnt
	GOTO	_00175_DS_
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
;   r0x1045
;   r0x1046
;   r0x1047
;   r0x1048
;   r0x1049
;   STK01
;   STK00
;; Starting pCode block
S_main__circBufPush	code
_circBufPush:
; 2 exit points
;	.line	273; "main.c"	int circBufPush(uint8_t data){
	BANKSEL	r0x1045
	MOVWF	r0x1045
;	.line	274; "main.c"	uint8_t next = buf_head + 1;
	BANKSEL	_buf_head
	INCF	_buf_head,W
	BANKSEL	r0x1046
	MOVWF	r0x1046
;;unsigned compare: left < lit(0x10=16), size=1
;	.line	275; "main.c"	if (next >= BUF_SIZE)
	MOVLW	0x10
;	.line	276; "main.c"	next = 0;
	SUBWF	r0x1046,W
;	.line	279; "main.c"	if (next == buf_tail){
	BTFSC	STATUS,0
	CLRF	r0x1046
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x1046
	XORWF	r0x1046,W
	BTFSS	STATUS,2
	GOTO	_00284_DS_
;	.line	280; "main.c"	SP_send(buf_err);
	MOVLW	high (_buf_err + 0)
	MOVWF	r0x1047
	MOVLW	(_buf_err + 0)
	MOVWF	r0x1048
	MOVLW	0x80
	MOVWF	r0x1049
	MOVF	r0x1048,W
	MOVWF	STK01
	MOVF	r0x1047,W
	MOVWF	STK00
	MOVF	r0x1049,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	281; "main.c"	return -1;  // quit with an error
	MOVLW	0xff
	MOVWF	STK00
	MOVLW	0xff
	GOTO	_00285_DS_
_00284_DS_:
;	.line	284; "main.c"	buf[buf_head] = data;
	BANKSEL	_buf_head
	MOVF	_buf_head,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x1048
	MOVWF	r0x1048
	MOVLW	high (_buf + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1047
	MOVF	r0x1048,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1047
	BTFSC	r0x1047,0
	BSF	STATUS,7
	MOVF	r0x1045,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	285; "main.c"	buf_head = next;
	BANKSEL	r0x1046
	MOVF	r0x1046,W
	BANKSEL	_buf_head
	MOVWF	_buf_head
;	.line	286; "main.c"	TXIE = 1;       //Enables the EUSART transmit interrupt
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,4
;	.line	287; "main.c"	return 0;
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
_00285_DS_:
	RETURN	
; exit point of _circBufPush


;	code size estimation:
;	  510+  148 =   658 instructions ( 1612 byte)

	end
