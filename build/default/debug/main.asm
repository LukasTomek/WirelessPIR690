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
	extern	_ADC_read
	extern	_delay_ms
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
	global	_RecAddress
	global	_SetAddress
	global	_buf
	global	_buf_head
	global	_buf_tail
	global	_int_error_cnt
	global	_stri
	global	_strV0
	global	_strV1
	global	_strVF
	global	_strw
	global	_strt
	global	_strw1
	global	_strt1
	global	_tab
	global	_space
	global	_enter
	global	_sync
	global	_int_err
	global	_buf_err
	global	_pir1
	global	_pir2
	global	_pie1
	global	_pie2
	global	_light
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
_RecAddress	res	20

UD_main_2	udata
_SetAddress	res	12

UD_main_3	udata
_buf	res	16

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_main_0	udata
r0x104A	res	1
r0x104B	res	1
r0x1042	res	1
r0x1043	res	1
r0x1044	res	1
r0x1046	res	1
r0x1045	res	1
r0x1047	res	1
r0x1048	res	1
r0x103D	res	1
r0x103E	res	1
r0x1040	res	1
r0x103F	res	1
r0x1041	res	1
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
_stri
	retlw 0x69
	retlw 0x20
	retlw 0x3d
	retlw 0x20
	retlw 0x00


ID_main_8	code
_strV0
	retlw 0x30
	retlw 0x20
	retlw 0x0a
	retlw 0x00


ID_main_9	code
_strV1
	retlw 0x31
	retlw 0x20
	retlw 0x0a
	retlw 0x00


ID_main_10	code
_strVF
	retlw 0x46
	retlw 0x20
	retlw 0x0a
	retlw 0x00


ID_main_11	code
_strw
	retlw 0x77
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_12	code
_strt
	retlw 0x74
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_13	code
_strw1
	retlw 0x77
	retlw 0x31
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_14	code
_strt1
	retlw 0x74
	retlw 0x31
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_15	code
_tab
	retlw 0x09
	retlw 0x00


ID_main_16	code
_space
	retlw 0x20
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
_light
	retlw 0x4c
	retlw 0x49
	retlw 0x67
	retlw 0x68
	retlw 0x74
	retlw 0x0a
	retlw 0x00


ID_main_26	code
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
;   r0x104A
;   r0x104B
;; Starting pCode block
_receive_intr:
; 0 exit points
;	.line	115; "main.c"	void receive_intr() __interrupt 0 {
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
;	.line	117; "main.c"	if(T0IF){
	BANKSEL	_INTCONbits
	BTFSS	_INTCONbits,2
	GOTO	_00106_DS_
;	.line	118; "main.c"	T0IE = 0;
	BCF	_INTCONbits,5
;	.line	119; "main.c"	T0IF = 0;
	BCF	_INTCONbits,2
;	.line	120; "main.c"	TMR0 = 0;	// Enable timer
	CLRF	_TMR0
;	.line	121; "main.c"	OUT_PIN = 0;
	BCF	_PORTBbits,6
_00106_DS_:
;	.line	123; "main.c"	if(TXIF){
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,4
	GOTO	_00113_DS_
;	.line	125; "main.c"	if (buf_head == buf_tail){
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	_buf_head
	XORWF	_buf_head,W
	BTFSS	STATUS,2
	GOTO	_00110_DS_
;	.line	126; "main.c"	TXIE = 0;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,4
	GOTO	_00113_DS_
_00110_DS_:
;	.line	132; "main.c"	TXREG = buf[buf_tail];
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x104A
	MOVWF	r0x104A
	MOVLW	high (_buf + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x104B
	MOVF	r0x104A,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x104B
	BTFSC	r0x104B,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	MOVWF	_TXREG
;	.line	133; "main.c"	buf[buf_tail] = 0;  // clear the data (optional)
	BANKSEL	r0x104A
	MOVF	r0x104A,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x104B
	BTFSC	r0x104B,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	135; "main.c"	next = buf_tail + 1;
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x104A
	MOVWF	r0x104A
	CLRF	r0x104B
	INCF	r0x104A,F
	BTFSC	STATUS,2
	INCF	r0x104B,F
;;signed compare: left < lit(0x10=16), size=2, mask=ffff
;	.line	136; "main.c"	if(next >= BUF_SIZE)
	MOVF	r0x104B,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00139_DS_
	MOVLW	0x10
	SUBWF	r0x104A,W
_00139_DS_:
	BTFSS	STATUS,0
	GOTO	_00108_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;	.line	137; "main.c"	next = 0;
	BANKSEL	r0x104A
	CLRF	r0x104A
	CLRF	r0x104B
_00108_DS_:
;	.line	139; "main.c"	buf_tail = next;
	BANKSEL	r0x104A
	MOVF	r0x104A,W
	BANKSEL	_buf_tail
	MOVWF	_buf_tail
_00113_DS_:
;	.line	143; "main.c"	if(CCP1IF){
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,2
	GOTO	_00118_DS_
;	.line	144; "main.c"	CCP1IE = FALSE;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,2
;	.line	145; "main.c"	if(CCP1M0){                     // if ECCP mode is Rising edge CCP1M0
	BANKSEL	_CCP1CONbits
	BTFSS	_CCP1CONbits,0
	GOTO	_00115_DS_
;	.line	146; "main.c"	CCP1M0 = FALING;                 // set falling edge
	BCF	_CCP1CONbits,0
;	.line	147; "main.c"	TMR1H = 0;
	CLRF	_TMR1H
;	.line	148; "main.c"	TMR1L = 0;
	CLRF	_TMR1L
;	.line	149; "main.c"	t = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
	MOVF	_CCPR1H,W
	BANKSEL	r0x104A
	MOVWF	r0x104A
	BANKSEL	_t
	MOVWF	_t
	CLRF	(_t + 1)
;	.line	150; "main.c"	t = t << 8;
	MOVF	_t,W
	MOVWF	(_t + 1)
	CLRF	_t
;	.line	151; "main.c"	t = t | CCPR1L;             //ECCP combined 16 bit number formation
	BANKSEL	_CCPR1L
	MOVF	_CCPR1L,W
	BANKSEL	r0x104A
	MOVWF	r0x104A
	CLRF	r0x104B
	MOVF	r0x104A,W
	BANKSEL	_t
	IORWF	_t,F
	MOVLW	0x00
	IORWF	(_t + 1),F
;	.line	152; "main.c"	bitfield.Capture = TRUE;
	BANKSEL	_bitfield
	BSF	_bitfield,0
	GOTO	_00116_DS_
_00115_DS_:
;	.line	155; "main.c"	CCP1M0 = RISING;
	BANKSEL	_CCP1CONbits
	BSF	_CCP1CONbits,0
;	.line	156; "main.c"	w = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
	MOVF	_CCPR1H,W
	BANKSEL	r0x104A
	MOVWF	r0x104A
	BANKSEL	_w
	MOVWF	_w
	CLRF	(_w + 1)
;	.line	157; "main.c"	w = w << 8;
	MOVF	_w,W
	MOVWF	(_w + 1)
	CLRF	_w
;	.line	158; "main.c"	w = w | CCPR1L;             //ECCP combined 16 bit number formation
	BANKSEL	_CCPR1L
	MOVF	_CCPR1L,W
	BANKSEL	r0x104A
	MOVWF	r0x104A
	CLRF	r0x104B
	MOVF	r0x104A,W
	BANKSEL	_w
	IORWF	_w,F
	MOVLW	0x00
	IORWF	(_w + 1),F
_00116_DS_:
;	.line	160; "main.c"	CCP1IE = 1;
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,2
;	.line	161; "main.c"	CCP1IF = 0;                     //Clear interrupt flag
	BANKSEL	_PIR1bits
	BCF	_PIR1bits,2
_00118_DS_:
;	.line	163; "main.c"	int_error_cnt++;
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
;   _ADC_read
;   _SP_send_buf
;   _dec_to_ascii_buf
;   _SP_send_buf
;   _dec_to_ascii_buf
;   _SP_send_buf
;   _delay_ms
;   _SP_send_buf
;   _dec_to_ascii_buf
;   _SP_send_buf
;   _dec_to_ascii_buf
;   _SP_send_buf
;   _delay_ms
;   _SP_send_buf
;   _dec_to_ascii_buf
;   _SP_send_buf
;   _dec_to_ascii_buf
;   _SP_send_buf
;   _SP_send_buf
;   _SP_send_buf
;   _init
;   _ADC_read
;   _SP_send_buf
;   _dec_to_ascii_buf
;   _SP_send_buf
;   _dec_to_ascii_buf
;   _SP_send_buf
;   _delay_ms
;   _SP_send_buf
;   _dec_to_ascii_buf
;   _SP_send_buf
;   _dec_to_ascii_buf
;   _SP_send_buf
;   _delay_ms
;   _SP_send_buf
;   _dec_to_ascii_buf
;   _SP_send_buf
;   _dec_to_ascii_buf
;   _SP_send_buf
;   _SP_send_buf
;   _SP_send_buf
;11 compiler assigned registers:
;   r0x1042
;   r0x1043
;   r0x1044
;   STK00
;   r0x1045
;   r0x1046
;   r0x1047
;   STK01
;   STK02
;   r0x1048
;   r0x1049
;; Starting pCode block
S_main__main	code
_main:
; 2 exit points
;	.line	172; "main.c"	init();
	PAGESEL	_init
	CALL	_init
	PAGESEL	$
;	.line	173; "main.c"	bitfield.Hint = FALSE;
	BANKSEL	_bitfield
	BCF	_bitfield,2
;	.line	174; "main.c"	bitfield.Capture = FALSE;
	BCF	_bitfield,0
;	.line	175; "main.c"	for(i = 0; i <= 11; i++){
	BANKSEL	r0x1042
	CLRF	r0x1042
;;106	MOVF	r0x1042,W
_00190_DS_:
;	.line	177; "main.c"	result = ADC_read(i); // select chanel AN0 = 0
	BANKSEL	r0x1044
	CLRF	r0x1044
;;105	MOVF	r0x1043,W
	MOVF	r0x1042,W
	MOVWF	r0x1043
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_ADC_read
	CALL	_ADC_read
	PAGESEL	$
	BANKSEL	r0x1044
	MOVWF	r0x1044
	MOVF	STK00,W
	MOVWF	r0x1043
;	.line	178; "main.c"	SP_send_buf(stri);
	MOVLW	high (_stri + 0)
	MOVWF	r0x1045
	MOVLW	(_stri + 0)
	MOVWF	r0x1046
	MOVLW	0x80
	MOVWF	r0x1047
	MOVF	r0x1046,W
	MOVWF	STK01
	MOVF	r0x1045,W
	MOVWF	STK00
	MOVF	r0x1047,W
	PAGESEL	_SP_send_buf
	CALL	_SP_send_buf
	PAGESEL	$
;;102	MOVF	r0x1042,W
;	.line	179; "main.c"	dec_to_ascii_buf(i);
	BANKSEL	r0x1045
	CLRF	r0x1045
;;101	MOVF	r0x1046,W
	MOVF	r0x1042,W
	MOVWF	r0x1046
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_dec_to_ascii_buf
	CALL	_dec_to_ascii_buf
	PAGESEL	$
;	.line	180; "main.c"	SP_send_buf(space);
	MOVLW	high (_space + 0)
	BANKSEL	r0x1045
	MOVWF	r0x1045
	MOVLW	(_space + 0)
	MOVWF	r0x1046
	MOVLW	0x80
	MOVWF	r0x1047
	MOVF	r0x1046,W
	MOVWF	STK01
	MOVF	r0x1045,W
	MOVWF	STK00
	MOVF	r0x1047,W
	PAGESEL	_SP_send_buf
	CALL	_SP_send_buf
	PAGESEL	$
;	.line	181; "main.c"	dec_to_ascii_buf(result);
	BANKSEL	r0x1043
	MOVF	r0x1043,W
	MOVWF	STK00
	MOVF	r0x1044,W
	PAGESEL	_dec_to_ascii_buf
	CALL	_dec_to_ascii_buf
	PAGESEL	$
;	.line	182; "main.c"	SP_send_buf(enter);
	MOVLW	high (_enter + 0)
	BANKSEL	r0x1045
	MOVWF	r0x1045
	MOVLW	(_enter + 0)
	MOVWF	r0x1046
	MOVLW	0x80
	MOVWF	r0x1047
	MOVF	r0x1046,W
	MOVWF	STK01
	MOVF	r0x1045,W
	MOVWF	STK00
	MOVF	r0x1047,W
	PAGESEL	_SP_send_buf
	CALL	_SP_send_buf
	PAGESEL	$
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x1F5=501), size=2
;	.line	184; "main.c"	if(result > 500)
	MOVLW	0x01
	BANKSEL	r0x1044
	SUBWF	r0x1044,W
	BTFSS	STATUS,2
	GOTO	_00310_DS_
	MOVLW	0xf5
	SUBWF	r0x1043,W
_00310_DS_:
	BTFSS	STATUS,0
	GOTO	_00148_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;	.line	185; "main.c"	SetAddress[i] = BIT1;
	BANKSEL	r0x1042
	MOVF	r0x1042,W
	ADDLW	(_SetAddress + 0)
	MOVWF	r0x1046
	MOVLW	high (_SetAddress + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1045
	MOVF	r0x1046,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1045
	BTFSC	r0x1045,0
	BSF	STATUS,7
	MOVLW	0x02
	BANKSEL	INDF
	MOVWF	INDF
	GOTO	_00191_DS_
;;unsigned compare: left < lit(0x12C=300), size=2
_00148_DS_:
;	.line	186; "main.c"	else if(result < 300)
	MOVLW	0x01
	BANKSEL	r0x1044
	SUBWF	r0x1044,W
	BTFSS	STATUS,2
	GOTO	_00311_DS_
	MOVLW	0x2c
	SUBWF	r0x1043,W
_00311_DS_:
	BTFSC	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;	.line	187; "main.c"	SetAddress[i] = BIT0;
	BANKSEL	r0x1042
	MOVF	r0x1042,W
	ADDLW	(_SetAddress + 0)
	MOVWF	r0x1043
	MOVLW	high (_SetAddress + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1044
	MOVF	r0x1043,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1044
	BTFSC	r0x1044,0
	BSF	STATUS,7
	MOVLW	0x01
	BANKSEL	INDF
	MOVWF	INDF
	GOTO	_00191_DS_
_00145_DS_:
;	.line	189; "main.c"	SetAddress[i] = BITF;
	BANKSEL	r0x1042
	MOVF	r0x1042,W
	ADDLW	(_SetAddress + 0)
	MOVWF	r0x1043
	MOVLW	high (_SetAddress + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1044
	MOVF	r0x1043,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1044
	BTFSC	r0x1044,0
	BSF	STATUS,7
	MOVLW	0x03
	BANKSEL	INDF
	MOVWF	INDF
_00191_DS_:
;	.line	175; "main.c"	for(i = 0; i <= 11; i++){
	BANKSEL	r0x1042
	INCF	r0x1042,F
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xC=12), size=1
	MOVLW	0x0c
	SUBWF	r0x1042,W
	BTFSS	STATUS,0
	GOTO	_00190_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;	.line	191; "main.c"	delay_ms(10);
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay_ms
	CALL	_delay_ms
	PAGESEL	$
;	.line	192; "main.c"	for(i = 0; i <= 11; i++){
	BANKSEL	r0x1042
	CLRF	r0x1042
_00192_DS_:
;	.line	193; "main.c"	SP_send_buf(stri);
	MOVLW	high (_stri + 0)
	BANKSEL	r0x1044
	MOVWF	r0x1044
	MOVLW	(_stri + 0)
	MOVWF	r0x1043
	MOVLW	0x80
	MOVWF	r0x1046
	MOVF	r0x1043,W
	MOVWF	STK01
	MOVF	r0x1044,W
	MOVWF	STK00
	MOVF	r0x1046,W
	PAGESEL	_SP_send_buf
	CALL	_SP_send_buf
	PAGESEL	$
;;104	MOVF	r0x1042,W
;	.line	194; "main.c"	dec_to_ascii_buf(i);
	BANKSEL	r0x1044
	CLRF	r0x1044
;;103	MOVF	r0x1043,W
	MOVF	r0x1042,W
	MOVWF	r0x1043
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_dec_to_ascii_buf
	CALL	_dec_to_ascii_buf
	PAGESEL	$
;	.line	195; "main.c"	SP_send_buf(space);
	MOVLW	high (_space + 0)
	BANKSEL	r0x1044
	MOVWF	r0x1044
	MOVLW	(_space + 0)
	MOVWF	r0x1043
	MOVLW	0x80
	MOVWF	r0x1046
	MOVF	r0x1043,W
	MOVWF	STK01
	MOVF	r0x1044,W
	MOVWF	STK00
	MOVF	r0x1046,W
	PAGESEL	_SP_send_buf
	CALL	_SP_send_buf
	PAGESEL	$
;	.line	196; "main.c"	dec_to_ascii_buf(SetAddress[i]);
	BANKSEL	r0x1042
	MOVF	r0x1042,W
	ADDLW	(_SetAddress + 0)
	MOVWF	r0x1043
	MOVLW	high (_SetAddress + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1044
	MOVF	r0x1043,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1044
	BTFSC	r0x1044,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1046
	MOVWF	r0x1046
	MOVWF	r0x1043
	CLRF	r0x1044
	MOVF	r0x1043,W
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_dec_to_ascii_buf
	CALL	_dec_to_ascii_buf
	PAGESEL	$
;	.line	197; "main.c"	SP_send_buf(enter);
	MOVLW	high (_enter + 0)
	BANKSEL	r0x1044
	MOVWF	r0x1044
	MOVLW	(_enter + 0)
	MOVWF	r0x1043
	MOVLW	0x80
	MOVWF	r0x1046
	MOVF	r0x1043,W
	MOVWF	STK01
	MOVF	r0x1044,W
	MOVWF	STK00
	MOVF	r0x1046,W
	PAGESEL	_SP_send_buf
	CALL	_SP_send_buf
	PAGESEL	$
;	.line	192; "main.c"	for(i = 0; i <= 11; i++){
	BANKSEL	r0x1042
	INCF	r0x1042,F
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xC=12), size=1
	MOVLW	0x0c
	SUBWF	r0x1042,W
	BTFSS	STATUS,0
	GOTO	_00192_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;	.line	199; "main.c"	delay_ms(10);
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay_ms
	CALL	_delay_ms
	PAGESEL	$
;	.line	200; "main.c"	for(i = 0; i <= 11; i++){
	BANKSEL	r0x1042
	CLRF	r0x1042
_00194_DS_:
;	.line	201; "main.c"	SP_send_buf(stri);
	MOVLW	high (_stri + 0)
	BANKSEL	r0x1044
	MOVWF	r0x1044
	MOVLW	(_stri + 0)
	MOVWF	r0x1043
	MOVLW	0x80
	MOVWF	r0x1046
	MOVF	r0x1043,W
	MOVWF	STK01
	MOVF	r0x1044,W
	MOVWF	STK00
	MOVF	r0x1046,W
	PAGESEL	_SP_send_buf
	CALL	_SP_send_buf
	PAGESEL	$
;;100	MOVF	r0x1042,W
;	.line	202; "main.c"	dec_to_ascii_buf(i);
	BANKSEL	r0x1044
	CLRF	r0x1044
;;99	MOVF	r0x1043,W
	MOVF	r0x1042,W
	MOVWF	r0x1043
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_dec_to_ascii_buf
	CALL	_dec_to_ascii_buf
	PAGESEL	$
;	.line	203; "main.c"	SP_send_buf(space);
	MOVLW	high (_space + 0)
	BANKSEL	r0x1044
	MOVWF	r0x1044
	MOVLW	(_space + 0)
	MOVWF	r0x1043
	MOVLW	0x80
	MOVWF	r0x1046
	MOVF	r0x1043,W
	MOVWF	STK01
	MOVF	r0x1044,W
	MOVWF	STK00
	MOVF	r0x1046,W
	PAGESEL	_SP_send_buf
	CALL	_SP_send_buf
	PAGESEL	$
;	.line	204; "main.c"	dec_to_ascii_buf(SetAddress[i]);
	BANKSEL	r0x1042
	MOVF	r0x1042,W
	ADDLW	(_SetAddress + 0)
	MOVWF	r0x1043
	MOVLW	high (_SetAddress + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1044
	MOVF	r0x1043,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1044
	BTFSC	r0x1044,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1046
	MOVWF	r0x1046
	MOVWF	r0x1043
	CLRF	r0x1044
	MOVF	r0x1043,W
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_dec_to_ascii_buf
	CALL	_dec_to_ascii_buf
	PAGESEL	$
;	.line	205; "main.c"	SP_send_buf(enter);
	MOVLW	high (_enter + 0)
	BANKSEL	r0x1044
	MOVWF	r0x1044
	MOVLW	(_enter + 0)
	MOVWF	r0x1043
	MOVLW	0x80
	MOVWF	r0x1046
	MOVF	r0x1043,W
	MOVWF	STK01
	MOVF	r0x1044,W
	MOVWF	STK00
	MOVF	r0x1046,W
	PAGESEL	_SP_send_buf
	CALL	_SP_send_buf
	PAGESEL	$
;	.line	200; "main.c"	for(i = 0; i <= 11; i++){
	BANKSEL	r0x1042
	INCF	r0x1042,F
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0xC=12), size=1
	MOVLW	0x0c
	SUBWF	r0x1042,W
	BTFSS	STATUS,0
	GOTO	_00194_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
_00188_DS_:
;	.line	209; "main.c"	if (bitfield.Capture){
	BANKSEL	_bitfield
	BTFSS	_bitfield,0
	GOTO	_00184_DS_
;	.line	210; "main.c"	bitfield.Capture = FALSE;
	BCF	_bitfield,0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x759=1881), size=2
;	.line	211; "main.c"	if (t > MIN_T && t < MAX_T && t1 > MIN_T && t1 < MAX_T){
	MOVLW	0x07
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00315_DS_
	MOVLW	0x59
	SUBWF	_t,W
_00315_DS_:
	BTFSS	STATUS,0
	GOTO	_00169_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;;unsigned compare: left < lit(0x79E=1950), size=2
	MOVLW	0x07
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00316_DS_
	MOVLW	0x9e
	SUBWF	_t,W
_00316_DS_:
	BTFSC	STATUS,0
	GOTO	_00169_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x759=1881), size=2
	MOVLW	0x07
	BANKSEL	_t1
	SUBWF	(_t1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00317_DS_
	MOVLW	0x59
	SUBWF	_t1,W
_00317_DS_:
	BTFSS	STATUS,0
	GOTO	_00169_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;;unsigned compare: left < lit(0x79E=1950), size=2
	MOVLW	0x07
	BANKSEL	_t1
	SUBWF	(_t1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00318_DS_
	MOVLW	0x9e
	SUBWF	_t1,W
_00318_DS_:
	BTFSC	STATUS,0
	GOTO	_00169_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x547=1351), size=2
;	.line	212; "main.c"	if (w > MIN_W1 && w < MAX_W1 && w1 > MIN_W1 && w1 < MAX_W1){
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00319_DS_
	MOVLW	0x47
	SUBWF	_w,W
_00319_DS_:
	BTFSS	STATUS,0
	GOTO	_00154_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;;unsigned compare: left < lit(0x596=1430), size=2
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00320_DS_
	MOVLW	0x96
	SUBWF	_w,W
_00320_DS_:
	BTFSC	STATUS,0
	GOTO	_00154_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x547=1351), size=2
	MOVLW	0x05
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00321_DS_
	MOVLW	0x47
	SUBWF	_w1,W
_00321_DS_:
	BTFSS	STATUS,0
	GOTO	_00154_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;;unsigned compare: left < lit(0x596=1430), size=2
	MOVLW	0x05
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00322_DS_
	MOVLW	0x96
	SUBWF	_w1,W
_00322_DS_:
	BTFSC	STATUS,0
	GOTO	_00154_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;	.line	214; "main.c"	RecAddress[i] = BIT1;
	BANKSEL	r0x1042
	MOVF	r0x1042,W
	ADDLW	(_RecAddress + 0)
	MOVWF	r0x1043
	MOVLW	high (_RecAddress + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1044
	MOVF	r0x1043,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1044
	BTFSC	r0x1044,0
	BSF	STATUS,7
	MOVLW	0x02
	BANKSEL	INDF
	MOVWF	INDF
;	.line	215; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	216; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	217; "main.c"	i++;
	BANKSEL	r0x1042
	INCF	r0x1042,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
_00154_DS_:
;	.line	219; "main.c"	if (w > MIN_W0 && w < MAX_W0 && w1 > MIN_W0 && w1 < MAX_W0){
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00323_DS_
	MOVLW	0x7d
	SUBWF	_w,W
_00323_DS_:
	BTFSS	STATUS,0
	GOTO	_00159_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00324_DS_
	MOVLW	0xc2
	SUBWF	_w,W
_00324_DS_:
	BTFSC	STATUS,0
	GOTO	_00159_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00325_DS_
	MOVLW	0x7d
	SUBWF	_w1,W
_00325_DS_:
	BTFSS	STATUS,0
	GOTO	_00159_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00326_DS_
	MOVLW	0xc2
	SUBWF	_w1,W
_00326_DS_:
	BTFSC	STATUS,0
	GOTO	_00159_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;	.line	221; "main.c"	RecAddress[i] = BIT0;
	BANKSEL	r0x1042
	MOVF	r0x1042,W
	ADDLW	(_RecAddress + 0)
	MOVWF	r0x1043
	MOVLW	high (_RecAddress + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1044
	MOVF	r0x1043,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1044
	BTFSC	r0x1044,0
	BSF	STATUS,7
	MOVLW	0x01
	BANKSEL	INDF
	MOVWF	INDF
;	.line	222; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	223; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	224; "main.c"	i++;
	BANKSEL	r0x1042
	INCF	r0x1042,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
_00159_DS_:
;	.line	226; "main.c"	if (w1 > MIN_W0 && w1 < MAX_W0 && w > MIN_W1 && w < MAX_W1){
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00327_DS_
	MOVLW	0x7d
	SUBWF	_w1,W
_00327_DS_:
	BTFSS	STATUS,0
	GOTO	_00169_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00328_DS_
	MOVLW	0xc2
	SUBWF	_w1,W
_00328_DS_:
	BTFSC	STATUS,0
	GOTO	_00169_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x547=1351), size=2
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00329_DS_
	MOVLW	0x47
	SUBWF	_w,W
_00329_DS_:
	BTFSS	STATUS,0
	GOTO	_00169_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;;unsigned compare: left < lit(0x596=1430), size=2
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00330_DS_
	MOVLW	0x96
	SUBWF	_w,W
_00330_DS_:
	BTFSC	STATUS,0
	GOTO	_00169_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;	.line	228; "main.c"	RecAddress[i] = BITF;
	BANKSEL	r0x1042
	MOVF	r0x1042,W
	ADDLW	(_RecAddress + 0)
	MOVWF	r0x1043
	MOVLW	high (_RecAddress + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1044
	MOVF	r0x1043,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1044
	BTFSC	r0x1044,0
	BSF	STATUS,7
	MOVLW	0x03
	BANKSEL	INDF
	MOVWF	INDF
;	.line	229; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	230; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	231; "main.c"	i++;
	BANKSEL	r0x1042
	INCF	r0x1042,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x3A99=15001), size=2
_00169_DS_:
;	.line	234; "main.c"	if (t > MIN_TS && t < MAX_TS && w > MIN_W0 && w < MAX_W0){
	MOVLW	0x3a
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00331_DS_
	MOVLW	0x99
	SUBWF	_t,W
_00331_DS_:
	BTFSS	STATUS,0
	GOTO	_00179_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;;unsigned compare: left < lit(0x3E80=16000), size=2
	MOVLW	0x3e
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00332_DS_
	MOVLW	0x80
	SUBWF	_t,W
_00332_DS_:
	BTFSC	STATUS,0
	GOTO	_00179_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00333_DS_
	MOVLW	0x7d
	SUBWF	_w,W
_00333_DS_:
	BTFSS	STATUS,0
	GOTO	_00179_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00334_DS_
	MOVLW	0xc2
	SUBWF	_w,W
_00334_DS_:
	BTFSC	STATUS,0
	GOTO	_00179_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;	.line	235; "main.c"	SP_send_buf(sync);
	MOVLW	high (_sync + 0)
	BANKSEL	r0x1044
	MOVWF	r0x1044
	MOVLW	(_sync + 0)
	MOVWF	r0x1043
	MOVLW	0x80
	MOVWF	r0x1046
	MOVF	r0x1043,W
	MOVWF	STK01
	MOVF	r0x1044,W
	MOVWF	STK00
	MOVF	r0x1046,W
	PAGESEL	_SP_send_buf
	CALL	_SP_send_buf
	PAGESEL	$
;	.line	236; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	237; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	238; "main.c"	temp = 1;
	MOVLW	0x01
	BANKSEL	r0x1043
	MOVWF	r0x1043
;	.line	239; "main.c"	i--;
	DECF	r0x1042,F
;	.line	240; "main.c"	GIE = 0; //not tested
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,7
;	.line	241; "main.c"	for(j = 11; j != 0; j--){
	BANKSEL	r0x1042
	MOVF	r0x1042,W
	MOVWF	r0x1044
	MOVLW	0x0b
	MOVWF	r0x1046
_00196_DS_:
;	.line	243; "main.c"	if (RecAddress[i] != SetAddress[j]){
	BANKSEL	r0x1044
	MOVF	r0x1044,W
	ADDLW	(_RecAddress + 0)
	MOVWF	r0x1045
	MOVLW	high (_RecAddress + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1047
	MOVF	r0x1045,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1047
	BTFSC	r0x1047,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1048
	MOVWF	r0x1048
	MOVF	r0x1046,W
	ADDLW	(_SetAddress + 0)
	MOVWF	r0x1045
	MOVLW	high (_SetAddress + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1047
	MOVF	r0x1045,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1047
	BTFSC	r0x1047,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
;;1	MOVWF	r0x1049
;	.line	244; "main.c"	temp = 0;
	BANKSEL	r0x1048
	XORWF	r0x1048,W
;	.line	246; "main.c"	i--;
	BTFSS	STATUS,2
	CLRF	r0x1043
	DECF	r0x1044,F
;	.line	241; "main.c"	for(j = 11; j != 0; j--){
	DECFSZ	r0x1046,F
	GOTO	_00196_DS_
	MOVF	r0x1044,W
	MOVWF	r0x1042
;	.line	248; "main.c"	GIE = 1;
	BANKSEL	_INTCONbits
	BSF	_INTCONbits,7
;	.line	250; "main.c"	if(temp){
	BANKSEL	r0x1043
	MOVF	r0x1043,W
	BTFSC	STATUS,2
	GOTO	_00179_DS_
;	.line	251; "main.c"	SP_send_buf(light);
	MOVLW	high (_light + 0)
	MOVWF	r0x1044
	MOVLW	(_light + 0)
	MOVWF	r0x1043
	MOVLW	0x80
	MOVWF	r0x1046
	MOVF	r0x1043,W
	MOVWF	STK01
	MOVF	r0x1044,W
	MOVWF	STK00
	MOVF	r0x1046,W
	PAGESEL	_SP_send_buf
	CALL	_SP_send_buf
	PAGESEL	$
;	.line	252; "main.c"	OUT_PIN = 1;
	BANKSEL	_PORTBbits
	BSF	_PORTBbits,6
;	.line	253; "main.c"	TMR0 = 0;	// Enable timer
	CLRF	_TMR0
;	.line	254; "main.c"	T0IE = 1;
	BSF	_INTCONbits,5
_00179_DS_:
;	.line	263; "main.c"	t1 = t;
	BANKSEL	_t
	MOVF	_t,W
	BANKSEL	_t1
	MOVWF	_t1
	BANKSEL	_t
	MOVF	(_t + 1),W
	BANKSEL	_t1
	MOVWF	(_t1 + 1)
;	.line	264; "main.c"	w1 = w;
	BANKSEL	_w
	MOVF	_w,W
	BANKSEL	_w1
	MOVWF	_w1
	BANKSEL	_w
	MOVF	(_w + 1),W
	BANKSEL	_w1
	MOVWF	(_w1 + 1)
_00184_DS_:
;	.line	267; "main.c"	int_error_cnt = 0;
	BANKSEL	_int_error_cnt
	CLRF	_int_error_cnt
;;unsigned compare: left < lit(0x13=19), size=1
;	.line	268; "main.c"	if(i >= 19){
	MOVLW	0x13
	BANKSEL	r0x1042
	SUBWF	r0x1042,W
	BTFSS	STATUS,0
	GOTO	_00188_DS_
;;genSkipc:3257: created from rifx:0x7ffe65d6a650
;	.line	269; "main.c"	i = 0;
	CLRF	r0x1042
	GOTO	_00188_DS_
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
;   r0x103D
;   r0x103E
;   r0x103F
;   r0x1040
;   r0x1041
;   STK01
;   STK00
;; Starting pCode block
S_main__circBufPush	code
_circBufPush:
; 2 exit points
;	.line	274; "main.c"	int circBufPush(uint8_t data){
	BANKSEL	r0x103D
	MOVWF	r0x103D
;	.line	275; "main.c"	uint8_t next = buf_head + 1;
	BANKSEL	_buf_head
	INCF	_buf_head,W
	BANKSEL	r0x103E
	MOVWF	r0x103E
;;unsigned compare: left < lit(0x10=16), size=1
;	.line	276; "main.c"	if (next >= BUF_SIZE)
	MOVLW	0x10
;	.line	277; "main.c"	next = 0;
	SUBWF	r0x103E,W
;	.line	280; "main.c"	if (next == buf_tail){
	BTFSC	STATUS,0
	CLRF	r0x103E
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x103E
	XORWF	r0x103E,W
	BTFSS	STATUS,2
	GOTO	_00343_DS_
;	.line	281; "main.c"	SP_send(buf_err);
	MOVLW	high (_buf_err + 0)
	MOVWF	r0x103F
	MOVLW	(_buf_err + 0)
	MOVWF	r0x1040
	MOVLW	0x80
	MOVWF	r0x1041
	MOVF	r0x1040,W
	MOVWF	STK01
	MOVF	r0x103F,W
	MOVWF	STK00
	MOVF	r0x1041,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	282; "main.c"	return -1;  // quit with an error
	MOVLW	0xff
	MOVWF	STK00
	MOVLW	0xff
	GOTO	_00344_DS_
_00343_DS_:
;	.line	285; "main.c"	buf[buf_head] = data;
	BANKSEL	_buf_head
	MOVF	_buf_head,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x1040
	MOVWF	r0x1040
	MOVLW	high (_buf + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x103F
	MOVF	r0x1040,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x103F
	BTFSC	r0x103F,0
	BSF	STATUS,7
	MOVF	r0x103D,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	286; "main.c"	buf_head = next;
	BANKSEL	r0x103E
	MOVF	r0x103E,W
	BANKSEL	_buf_head
	MOVWF	_buf_head
;	.line	287; "main.c"	TXIE = 1;       //Enables the EUSART transmit interrupt
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,4
;	.line	288; "main.c"	return 0;
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
_00344_DS_:
	RETURN	
; exit point of _circBufPush


;	code size estimation:
;	  753+  212 =   965 instructions ( 2354 byte)

	end
