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
_buf	res	16

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_main_0	udata
r0x1026	res	1
r0x1027	res	1
r0x1022	res	1
r0x1024	res	1
r0x1023	res	1
r0x1025	res	1
r0x101D	res	1
r0x101E	res	1
r0x1020	res	1
r0x101F	res	1
r0x1021	res	1
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
;   r0x1026
;   r0x1027
;; Starting pCode block
_receive_intr:
; 0 exit points
;	.line	94; "main.c"	void receive_intr() __interrupt 0 {
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
;	.line	96; "main.c"	if(T0IF){
	BANKSEL	_INTCONbits
	BTFSS	_INTCONbits,2
	GOTO	_00106_DS_
;	.line	97; "main.c"	T0IF = 0;
	BCF	_INTCONbits,2
;	.line	98; "main.c"	TMR0 = 0;	// Enable timer
	CLRF	_TMR0
_00106_DS_:
;	.line	100; "main.c"	if(TXIF){
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,4
	GOTO	_00113_DS_
;	.line	102; "main.c"	if (buf_head == buf_tail){
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	_buf_head
	XORWF	_buf_head,W
	BTFSS	STATUS,2
	GOTO	_00110_DS_
;	.line	103; "main.c"	TXIE = 0;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,4
	GOTO	_00113_DS_
_00110_DS_:
;	.line	109; "main.c"	TXREG = buf[buf_tail];
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x1026
	MOVWF	r0x1026
	MOVLW	high (_buf + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1027
	MOVF	r0x1026,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1027
	BTFSC	r0x1027,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	MOVWF	_TXREG
;	.line	110; "main.c"	buf[buf_tail] = 0;  // clear the data (optional)
	BANKSEL	r0x1026
	MOVF	r0x1026,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1027
	BTFSC	r0x1027,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	112; "main.c"	next = buf_tail + 1;
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x1026
	MOVWF	r0x1026
	CLRF	r0x1027
	INCF	r0x1026,F
	BTFSC	STATUS,2
	INCF	r0x1027,F
;;signed compare: left < lit(0x10=16), size=2, mask=ffff
;	.line	113; "main.c"	if(next >= BUF_SIZE)
	MOVF	r0x1027,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00139_DS_
	MOVLW	0x10
	SUBWF	r0x1026,W
_00139_DS_:
	BTFSS	STATUS,0
	GOTO	_00108_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;	.line	114; "main.c"	next = 0;
	BANKSEL	r0x1026
	CLRF	r0x1026
	CLRF	r0x1027
_00108_DS_:
;	.line	116; "main.c"	buf_tail = next;
	BANKSEL	r0x1026
	MOVF	r0x1026,W
	BANKSEL	_buf_tail
	MOVWF	_buf_tail
_00113_DS_:
;	.line	120; "main.c"	if(CCP1IF){
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,2
	GOTO	_00118_DS_
;	.line	121; "main.c"	CCP1IE = FALSE;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,2
;	.line	122; "main.c"	if(CCP1M0){                     // if ECCP mode is Rising edge CCP1M0
	BANKSEL	_CCP1CONbits
	BTFSS	_CCP1CONbits,0
	GOTO	_00115_DS_
;	.line	123; "main.c"	CCP1M0 = FALING;                 // set falling edge
	BCF	_CCP1CONbits,0
;	.line	124; "main.c"	TMR1H = 0;
	CLRF	_TMR1H
;	.line	125; "main.c"	TMR1L = 0;
	CLRF	_TMR1L
;	.line	127; "main.c"	t = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
	MOVF	_CCPR1H,W
	BANKSEL	r0x1026
	MOVWF	r0x1026
	BANKSEL	_t
	MOVWF	_t
	CLRF	(_t + 1)
;	.line	128; "main.c"	t = t << 8;
	MOVF	_t,W
	MOVWF	(_t + 1)
	CLRF	_t
;	.line	129; "main.c"	t = t | CCPR1L;             //ECCP combined 16 bit number formation
	BANKSEL	_CCPR1L
	MOVF	_CCPR1L,W
	BANKSEL	r0x1026
	MOVWF	r0x1026
	CLRF	r0x1027
	MOVF	r0x1026,W
	BANKSEL	_t
	IORWF	_t,F
	MOVLW	0x00
	IORWF	(_t + 1),F
;	.line	130; "main.c"	bitfield.Capture = TRUE;
	BANKSEL	_bitfield
	BSF	_bitfield,0
	GOTO	_00116_DS_
_00115_DS_:
;	.line	133; "main.c"	CCP1M0 = RISING;
	BANKSEL	_CCP1CONbits
	BSF	_CCP1CONbits,0
;	.line	134; "main.c"	w = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
	MOVF	_CCPR1H,W
	BANKSEL	r0x1026
	MOVWF	r0x1026
	BANKSEL	_w
	MOVWF	_w
	CLRF	(_w + 1)
;	.line	135; "main.c"	w = w << 8;
	MOVF	_w,W
	MOVWF	(_w + 1)
	CLRF	_w
;	.line	136; "main.c"	w = w | CCPR1L;             //ECCP combined 16 bit number formation
	BANKSEL	_CCPR1L
	MOVF	_CCPR1L,W
	BANKSEL	r0x1026
	MOVWF	r0x1026
	CLRF	r0x1027
	MOVF	r0x1026,W
	BANKSEL	_w
	IORWF	_w,F
	MOVLW	0x00
	IORWF	(_w + 1),F
_00116_DS_:
;	.line	138; "main.c"	CCP1IE = 1;
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,2
;	.line	139; "main.c"	CCP1IF = 0;                     //Clear interrupt flag
	BANKSEL	_PIR1bits
	BCF	_PIR1bits,2
_00118_DS_:
;	.line	141; "main.c"	int_error_cnt++;
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
;   _init
;   _SP_send
;   _SP_send
;   _SP_send
;   _SP_send
;6 compiler assigned registers:
;   r0x1022
;   r0x1023
;   r0x1024
;   r0x1025
;   STK01
;   STK00
;; Starting pCode block
S_main__main	code
_main:
; 2 exit points
;	.line	145; "main.c"	uint8_t i = 0;
	BANKSEL	r0x1022
	CLRF	r0x1022
;	.line	149; "main.c"	init();
	PAGESEL	_init
	CALL	_init
	PAGESEL	$
;	.line	150; "main.c"	bitfield.Hint = FALSE;
	BANKSEL	_bitfield
	BCF	_bitfield,2
;	.line	151; "main.c"	bitfield.Capture = FALSE;
	BCF	_bitfield,0
_00172_DS_:
;	.line	154; "main.c"	if (bitfield.Capture){
	BANKSEL	_bitfield
	BTFSS	_bitfield,0
	GOTO	_00170_DS_
;	.line	155; "main.c"	bitfield.Capture = FALSE;
	BCF	_bitfield,0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x759=1881), size=2
;	.line	156; "main.c"	if (t > MIN_T && t < MAX_T && t1 > MIN_T && t1 < MAX_T){
	MOVLW	0x07
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00242_DS_
	MOVLW	0x59
	SUBWF	_t,W
_00242_DS_:
	BTFSS	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;;unsigned compare: left < lit(0x79E=1950), size=2
	MOVLW	0x07
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00243_DS_
	MOVLW	0x9e
	SUBWF	_t,W
_00243_DS_:
	BTFSC	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x759=1881), size=2
	MOVLW	0x07
	BANKSEL	_t1
	SUBWF	(_t1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00244_DS_
	MOVLW	0x59
	SUBWF	_t1,W
_00244_DS_:
	BTFSS	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;;unsigned compare: left < lit(0x79E=1950), size=2
	MOVLW	0x07
	BANKSEL	_t1
	SUBWF	(_t1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00245_DS_
	MOVLW	0x9e
	SUBWF	_t1,W
_00245_DS_:
	BTFSC	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x547=1351), size=2
;	.line	157; "main.c"	if (w > MIN_W1 && w < MAX_W1 && w1 > MIN_W1 && w1 < MAX_W1){
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00246_DS_
	MOVLW	0x47
	SUBWF	_w,W
_00246_DS_:
	BTFSS	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;;unsigned compare: left < lit(0x596=1430), size=2
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00247_DS_
	MOVLW	0x96
	SUBWF	_w,W
_00247_DS_:
	BTFSC	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x547=1351), size=2
	MOVLW	0x05
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00248_DS_
	MOVLW	0x47
	SUBWF	_w1,W
_00248_DS_:
	BTFSS	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;;unsigned compare: left < lit(0x596=1430), size=2
	MOVLW	0x05
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00249_DS_
	MOVLW	0x96
	SUBWF	_w1,W
_00249_DS_:
	BTFSC	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;	.line	158; "main.c"	SP_send(strV1);
	MOVLW	high (_strV1 + 0)
	BANKSEL	r0x1023
	MOVWF	r0x1023
	MOVLW	(_strV1 + 0)
	MOVWF	r0x1024
	MOVLW	0x80
	MOVWF	r0x1025
	MOVF	r0x1024,W
	MOVWF	STK01
	MOVF	r0x1023,W
	MOVWF	STK00
	MOVF	r0x1025,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	159; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	160; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	161; "main.c"	i++;
	BANKSEL	r0x1022
	INCF	r0x1022,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
_00145_DS_:
;	.line	163; "main.c"	if (w > MIN_W0 && w < MAX_W0 && w1 > MIN_W0 && w1 < MAX_W0){
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00250_DS_
	MOVLW	0x7d
	SUBWF	_w,W
_00250_DS_:
	BTFSS	STATUS,0
	GOTO	_00150_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00251_DS_
	MOVLW	0xc2
	SUBWF	_w,W
_00251_DS_:
	BTFSC	STATUS,0
	GOTO	_00150_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00252_DS_
	MOVLW	0x7d
	SUBWF	_w1,W
_00252_DS_:
	BTFSS	STATUS,0
	GOTO	_00150_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00253_DS_
	MOVLW	0xc2
	SUBWF	_w1,W
_00253_DS_:
	BTFSC	STATUS,0
	GOTO	_00150_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;	.line	164; "main.c"	SP_send(strV0);
	MOVLW	high (_strV0 + 0)
	BANKSEL	r0x1023
	MOVWF	r0x1023
	MOVLW	(_strV0 + 0)
	MOVWF	r0x1024
	MOVLW	0x80
	MOVWF	r0x1025
	MOVF	r0x1024,W
	MOVWF	STK01
	MOVF	r0x1023,W
	MOVWF	STK00
	MOVF	r0x1025,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	165; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	166; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	167; "main.c"	i++;
	BANKSEL	r0x1022
	INCF	r0x1022,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
_00150_DS_:
;	.line	169; "main.c"	if (w1 > MIN_W0 && w1 < MAX_W0 && w > MIN_W1 && w < MAX_W1){
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00254_DS_
	MOVLW	0x7d
	SUBWF	_w1,W
_00254_DS_:
	BTFSS	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00255_DS_
	MOVLW	0xc2
	SUBWF	_w1,W
_00255_DS_:
	BTFSC	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x547=1351), size=2
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00256_DS_
	MOVLW	0x47
	SUBWF	_w,W
_00256_DS_:
	BTFSS	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;;unsigned compare: left < lit(0x596=1430), size=2
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00257_DS_
	MOVLW	0x96
	SUBWF	_w,W
_00257_DS_:
	BTFSC	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;	.line	170; "main.c"	SP_send(strVF);
	MOVLW	high (_strVF + 0)
	BANKSEL	r0x1023
	MOVWF	r0x1023
	MOVLW	(_strVF + 0)
	MOVWF	r0x1024
	MOVLW	0x80
	MOVWF	r0x1025
	MOVF	r0x1024,W
	MOVWF	STK01
	MOVF	r0x1023,W
	MOVWF	STK00
	MOVF	r0x1025,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	171; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	172; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	173; "main.c"	i++;
	BANKSEL	r0x1022
	INCF	r0x1022,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x3A99=15001), size=2
_00160_DS_:
;	.line	176; "main.c"	if (t > MIN_TS && t < MAX_TS && w > MIN_W0 && w < MAX_W0){
	MOVLW	0x3a
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00258_DS_
	MOVLW	0x99
	SUBWF	_t,W
_00258_DS_:
	BTFSS	STATUS,0
	GOTO	_00165_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;;unsigned compare: left < lit(0x3E80=16000), size=2
	MOVLW	0x3e
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00259_DS_
	MOVLW	0x80
	SUBWF	_t,W
_00259_DS_:
	BTFSC	STATUS,0
	GOTO	_00165_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00260_DS_
	MOVLW	0x7d
	SUBWF	_w,W
_00260_DS_:
	BTFSS	STATUS,0
	GOTO	_00165_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00261_DS_
	MOVLW	0xc2
	SUBWF	_w,W
_00261_DS_:
	BTFSC	STATUS,0
	GOTO	_00165_DS_
;;genSkipc:3257: created from rifx:0x7ffebfd704b0
;	.line	177; "main.c"	SP_send(sync);
	MOVLW	high (_sync + 0)
	BANKSEL	r0x1023
	MOVWF	r0x1023
	MOVLW	(_sync + 0)
	MOVWF	r0x1024
	MOVLW	0x80
	MOVWF	r0x1025
	MOVF	r0x1024,W
	MOVWF	STK01
	MOVF	r0x1023,W
	MOVWF	STK00
	MOVF	r0x1025,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	178; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	179; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	180; "main.c"	i++;
	BANKSEL	r0x1022
	INCF	r0x1022,F
_00165_DS_:
;	.line	182; "main.c"	t1 = t;
	BANKSEL	_t
	MOVF	_t,W
	BANKSEL	_t1
	MOVWF	_t1
	BANKSEL	_t
	MOVF	(_t + 1),W
	BANKSEL	_t1
	MOVWF	(_t1 + 1)
;	.line	183; "main.c"	w1 = w;
	BANKSEL	_w
	MOVF	_w,W
	BANKSEL	_w1
	MOVWF	_w1
	BANKSEL	_w
	MOVF	(_w + 1),W
	BANKSEL	_w1
	MOVWF	(_w1 + 1)
_00170_DS_:
;	.line	185; "main.c"	int_error_cnt = 0;
	BANKSEL	_int_error_cnt
	CLRF	_int_error_cnt
	GOTO	_00172_DS_
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
;   r0x101D
;   r0x101E
;   r0x101F
;   r0x1020
;   r0x1021
;   STK01
;   STK00
;; Starting pCode block
S_main__circBufPush	code
_circBufPush:
; 2 exit points
;	.line	189; "main.c"	int circBufPush(uint8_t data){
	BANKSEL	r0x101D
	MOVWF	r0x101D
;	.line	190; "main.c"	uint8_t next = buf_head + 1;
	BANKSEL	_buf_head
	INCF	_buf_head,W
	BANKSEL	r0x101E
	MOVWF	r0x101E
;;unsigned compare: left < lit(0x10=16), size=1
;	.line	191; "main.c"	if (next >= BUF_SIZE)
	MOVLW	0x10
;	.line	192; "main.c"	next = 0;
	SUBWF	r0x101E,W
;	.line	195; "main.c"	if (next == buf_tail){
	BTFSC	STATUS,0
	CLRF	r0x101E
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x101E
	XORWF	r0x101E,W
	BTFSS	STATUS,2
	GOTO	_00269_DS_
;	.line	196; "main.c"	SP_send(buf_err);
	MOVLW	high (_buf_err + 0)
	MOVWF	r0x101F
	MOVLW	(_buf_err + 0)
	MOVWF	r0x1020
	MOVLW	0x80
	MOVWF	r0x1021
	MOVF	r0x1020,W
	MOVWF	STK01
	MOVF	r0x101F,W
	MOVWF	STK00
	MOVF	r0x1021,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	197; "main.c"	return -1;  // quit with an error
	MOVLW	0xff
	MOVWF	STK00
	MOVLW	0xff
	GOTO	_00270_DS_
_00269_DS_:
;	.line	200; "main.c"	buf[buf_head] = data;
	BANKSEL	_buf_head
	MOVF	_buf_head,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x1020
	MOVWF	r0x1020
	MOVLW	high (_buf + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x101F
	MOVF	r0x1020,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x101F
	BTFSC	r0x101F,0
	BSF	STATUS,7
	MOVF	r0x101D,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	201; "main.c"	buf_head = next;
	BANKSEL	r0x101E
	MOVF	r0x101E,W
	BANKSEL	_buf_head
	MOVWF	_buf_head
;	.line	202; "main.c"	TXIE = 1;       //Enables the EUSART transmit interrupt
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,4
;	.line	203; "main.c"	return 0;
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
_00270_DS_:
	RETURN	
; exit point of _circBufPush


;	code size estimation:
;	  407+  113 =   520 instructions ( 1266 byte)

	end
