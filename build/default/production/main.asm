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
	extern	__gptrget1
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
	global	_SetAddress

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
_buf	res	16

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_main_0	udata
r0x103E	res	1
r0x103F	res	1
r0x1036	res	1
r0x1038	res	1
r0x1037	res	1
r0x1039	res	1
r0x103A	res	1
r0x103B	res	1
r0x103C	res	1
r0x1031	res	1
r0x1032	res	1
r0x1034	res	1
r0x1033	res	1
r0x1035	res	1
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
_enter
	retlw 0x0a
	retlw 0x00


ID_main_17	code
_sync
	retlw 0x53
	retlw 0x59
	retlw 0x4e
	retlw 0x43
	retlw 0x0a
	retlw 0x00


ID_main_18	code
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


ID_main_19	code
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


ID_main_20	code
_pir1
	retlw 0x50
	retlw 0x49
	retlw 0x52
	retlw 0x31
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_21	code
_pir2
	retlw 0x50
	retlw 0x49
	retlw 0x52
	retlw 0x32
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_22	code
_pie1
	retlw 0x50
	retlw 0x49
	retlw 0x45
	retlw 0x31
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_23	code
_pie2
	retlw 0x50
	retlw 0x49
	retlw 0x45
	retlw 0x32
	retlw 0x3a
	retlw 0x20
	retlw 0x00


ID_main_24	code
_light
	retlw 0x4c
	retlw 0x49
	retlw 0x67
	retlw 0x68
	retlw 0x74
	retlw 0x0a
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


ID_main_26	code
_SetAddress
	retlw 0x03
	retlw 0x03
	retlw 0x03
	retlw 0x03
	retlw 0x03
	retlw 0x03
	retlw 0x03
	retlw 0x03
	retlw 0x03
	retlw 0x03
	retlw 0x03
	retlw 0x03

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
;   r0x103E
;   r0x103F
;; Starting pCode block
_receive_intr:
; 0 exit points
;	.line	111; "main.c"	void receive_intr() __interrupt 0 {
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
;	.line	113; "main.c"	if(T0IF){
	BANKSEL	_INTCONbits
	BTFSS	_INTCONbits,2
	GOTO	_00106_DS_
;	.line	114; "main.c"	T0IE = 0;
	BCF	_INTCONbits,5
;	.line	115; "main.c"	T0IF = 0;
	BCF	_INTCONbits,2
;	.line	116; "main.c"	TMR0 = 0;	// Enable timer
	CLRF	_TMR0
;	.line	117; "main.c"	OUT_PIN = 0;
	BCF	_PORTCbits,0
_00106_DS_:
;	.line	119; "main.c"	if(TXIF){
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,4
	GOTO	_00113_DS_
;	.line	121; "main.c"	if (buf_head == buf_tail){
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	_buf_head
	XORWF	_buf_head,W
	BTFSS	STATUS,2
	GOTO	_00110_DS_
;	.line	122; "main.c"	TXIE = 0;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,4
	GOTO	_00113_DS_
_00110_DS_:
;	.line	128; "main.c"	TXREG = buf[buf_tail];
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x103E
	MOVWF	r0x103E
	MOVLW	high (_buf + 0)
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
	MOVWF	_TXREG
;	.line	129; "main.c"	buf[buf_tail] = 0;  // clear the data (optional)
	BANKSEL	r0x103E
	MOVF	r0x103E,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x103F
	BTFSC	r0x103F,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	131; "main.c"	next = buf_tail + 1;
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x103E
	MOVWF	r0x103E
	CLRF	r0x103F
	INCF	r0x103E,F
	BTFSC	STATUS,2
	INCF	r0x103F,F
;;signed compare: left < lit(0x10=16), size=2, mask=ffff
;	.line	132; "main.c"	if(next >= BUF_SIZE)
	MOVF	r0x103F,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00139_DS_
	MOVLW	0x10
	SUBWF	r0x103E,W
_00139_DS_:
	BTFSS	STATUS,0
	GOTO	_00108_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;	.line	133; "main.c"	next = 0;
	BANKSEL	r0x103E
	CLRF	r0x103E
	CLRF	r0x103F
_00108_DS_:
;	.line	135; "main.c"	buf_tail = next;
	BANKSEL	r0x103E
	MOVF	r0x103E,W
	BANKSEL	_buf_tail
	MOVWF	_buf_tail
_00113_DS_:
;	.line	139; "main.c"	if(CCP1IF){
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,2
	GOTO	_00118_DS_
;	.line	140; "main.c"	CCP1IE = FALSE;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,2
;	.line	141; "main.c"	if(CCP1M0){                     // if ECCP mode is Rising edge CCP1M0
	BANKSEL	_CCP1CONbits
	BTFSS	_CCP1CONbits,0
	GOTO	_00115_DS_
;	.line	142; "main.c"	CCP1M0 = FALING;                 // set falling edge
	BCF	_CCP1CONbits,0
;	.line	143; "main.c"	TMR1H = 0;
	CLRF	_TMR1H
;	.line	144; "main.c"	TMR1L = 0;
	CLRF	_TMR1L
;	.line	145; "main.c"	t = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
	MOVF	_CCPR1H,W
	BANKSEL	r0x103E
	MOVWF	r0x103E
	BANKSEL	_t
	MOVWF	_t
	CLRF	(_t + 1)
;	.line	146; "main.c"	t = t << 8;
	MOVF	_t,W
	MOVWF	(_t + 1)
	CLRF	_t
;	.line	147; "main.c"	t = t | CCPR1L;             //ECCP combined 16 bit number formation
	BANKSEL	_CCPR1L
	MOVF	_CCPR1L,W
	BANKSEL	r0x103E
	MOVWF	r0x103E
	CLRF	r0x103F
	MOVF	r0x103E,W
	BANKSEL	_t
	IORWF	_t,F
	MOVLW	0x00
	IORWF	(_t + 1),F
;	.line	148; "main.c"	bitfield.Capture = TRUE;
	BANKSEL	_bitfield
	BSF	_bitfield,0
	GOTO	_00116_DS_
_00115_DS_:
;	.line	151; "main.c"	CCP1M0 = RISING;
	BANKSEL	_CCP1CONbits
	BSF	_CCP1CONbits,0
;	.line	152; "main.c"	w = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
	MOVF	_CCPR1H,W
	BANKSEL	r0x103E
	MOVWF	r0x103E
	BANKSEL	_w
	MOVWF	_w
	CLRF	(_w + 1)
;	.line	153; "main.c"	w = w << 8;
	MOVF	_w,W
	MOVWF	(_w + 1)
	CLRF	_w
;	.line	154; "main.c"	w = w | CCPR1L;             //ECCP combined 16 bit number formation
	BANKSEL	_CCPR1L
	MOVF	_CCPR1L,W
	BANKSEL	r0x103E
	MOVWF	r0x103E
	CLRF	r0x103F
	MOVF	r0x103E,W
	BANKSEL	_w
	IORWF	_w,F
	MOVLW	0x00
	IORWF	(_w + 1),F
_00116_DS_:
;	.line	156; "main.c"	CCP1IE = 1;
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,2
;	.line	157; "main.c"	CCP1IF = 0;                     //Clear interrupt flag
	BANKSEL	_PIR1bits
	BCF	_PIR1bits,2
_00118_DS_:
;	.line	159; "main.c"	int_error_cnt++;
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
;   _SP_send_buf
;   _SP_send_buf
;   _SP_send_buf
;   _SP_send_buf
;   __gptrget1
;   _SP_send_buf
;   _init
;   _SP_send_buf
;   _SP_send_buf
;   _SP_send_buf
;   _SP_send_buf
;   __gptrget1
;   _SP_send_buf
;10 compiler assigned registers:
;   r0x1036
;   r0x1037
;   r0x1038
;   r0x1039
;   STK01
;   STK00
;   r0x103A
;   r0x103B
;   r0x103C
;   r0x103D
;; Starting pCode block
S_main__main	code
_main:
; 2 exit points
;	.line	163; "main.c"	uint8_t i = 0;
	BANKSEL	r0x1036
	CLRF	r0x1036
;	.line	167; "main.c"	init();
	PAGESEL	_init
	CALL	_init
	PAGESEL	$
;	.line	168; "main.c"	bitfield.Hint = FALSE;
	BANKSEL	_bitfield
	BCF	_bitfield,2
;	.line	169; "main.c"	bitfield.Capture = FALSE;
	BCF	_bitfield,0
_00179_DS_:
;	.line	172; "main.c"	if (bitfield.Capture){
	BANKSEL	_bitfield
	BTFSS	_bitfield,0
	GOTO	_00175_DS_
;	.line	173; "main.c"	bitfield.Capture = FALSE;
	BCF	_bitfield,0
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x759=1881), size=2
;	.line	174; "main.c"	if (t > MIN_T && t < MAX_T && t1 > MIN_T && t1 < MAX_T){
	MOVLW	0x07
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00269_DS_
	MOVLW	0x59
	SUBWF	_t,W
_00269_DS_:
	BTFSS	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;;unsigned compare: left < lit(0x79E=1950), size=2
	MOVLW	0x07
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00270_DS_
	MOVLW	0x9e
	SUBWF	_t,W
_00270_DS_:
	BTFSC	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x759=1881), size=2
	MOVLW	0x07
	BANKSEL	_t1
	SUBWF	(_t1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00271_DS_
	MOVLW	0x59
	SUBWF	_t1,W
_00271_DS_:
	BTFSS	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;;unsigned compare: left < lit(0x79E=1950), size=2
	MOVLW	0x07
	BANKSEL	_t1
	SUBWF	(_t1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00272_DS_
	MOVLW	0x9e
	SUBWF	_t1,W
_00272_DS_:
	BTFSC	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x547=1351), size=2
;	.line	175; "main.c"	if (w > MIN_W1 && w < MAX_W1 && w1 > MIN_W1 && w1 < MAX_W1){
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00273_DS_
	MOVLW	0x47
	SUBWF	_w,W
_00273_DS_:
	BTFSS	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;;unsigned compare: left < lit(0x596=1430), size=2
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00274_DS_
	MOVLW	0x96
	SUBWF	_w,W
_00274_DS_:
	BTFSC	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x547=1351), size=2
	MOVLW	0x05
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00275_DS_
	MOVLW	0x47
	SUBWF	_w1,W
_00275_DS_:
	BTFSS	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;;unsigned compare: left < lit(0x596=1430), size=2
	MOVLW	0x05
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00276_DS_
	MOVLW	0x96
	SUBWF	_w1,W
_00276_DS_:
	BTFSC	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;	.line	176; "main.c"	SP_send_buf(strV1);
	MOVLW	high (_strV1 + 0)
	BANKSEL	r0x1037
	MOVWF	r0x1037
	MOVLW	(_strV1 + 0)
	MOVWF	r0x1038
	MOVLW	0x80
	MOVWF	r0x1039
	MOVF	r0x1038,W
	MOVWF	STK01
	MOVF	r0x1037,W
	MOVWF	STK00
	MOVF	r0x1039,W
	PAGESEL	_SP_send_buf
	CALL	_SP_send_buf
	PAGESEL	$
;	.line	177; "main.c"	RecAddress[i] = BIT1;
	BANKSEL	r0x1036
	MOVF	r0x1036,W
	ADDLW	(_RecAddress + 0)
	MOVWF	r0x1038
	MOVLW	high (_RecAddress + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1037
	MOVF	r0x1038,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1037
	BTFSC	r0x1037,0
	BSF	STATUS,7
	MOVLW	0x02
	BANKSEL	INDF
	MOVWF	INDF
;	.line	178; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	179; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	180; "main.c"	i++;
	BANKSEL	r0x1036
	INCF	r0x1036,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
_00145_DS_:
;	.line	182; "main.c"	if (w > MIN_W0 && w < MAX_W0 && w1 > MIN_W0 && w1 < MAX_W0){
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00277_DS_
	MOVLW	0x7d
	SUBWF	_w,W
_00277_DS_:
	BTFSS	STATUS,0
	GOTO	_00150_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00278_DS_
	MOVLW	0xc2
	SUBWF	_w,W
_00278_DS_:
	BTFSC	STATUS,0
	GOTO	_00150_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00279_DS_
	MOVLW	0x7d
	SUBWF	_w1,W
_00279_DS_:
	BTFSS	STATUS,0
	GOTO	_00150_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00280_DS_
	MOVLW	0xc2
	SUBWF	_w1,W
_00280_DS_:
	BTFSC	STATUS,0
	GOTO	_00150_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;	.line	183; "main.c"	SP_send_buf(strV0);
	MOVLW	high (_strV0 + 0)
	BANKSEL	r0x1037
	MOVWF	r0x1037
	MOVLW	(_strV0 + 0)
	MOVWF	r0x1038
	MOVLW	0x80
	MOVWF	r0x1039
	MOVF	r0x1038,W
	MOVWF	STK01
	MOVF	r0x1037,W
	MOVWF	STK00
	MOVF	r0x1039,W
	PAGESEL	_SP_send_buf
	CALL	_SP_send_buf
	PAGESEL	$
;	.line	184; "main.c"	RecAddress[i] = BIT0;
	BANKSEL	r0x1036
	MOVF	r0x1036,W
	ADDLW	(_RecAddress + 0)
	MOVWF	r0x1038
	MOVLW	high (_RecAddress + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1037
	MOVF	r0x1038,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1037
	BTFSC	r0x1037,0
	BSF	STATUS,7
	MOVLW	0x01
	BANKSEL	INDF
	MOVWF	INDF
;	.line	185; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	186; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	187; "main.c"	i++;
	BANKSEL	r0x1036
	INCF	r0x1036,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
_00150_DS_:
;	.line	189; "main.c"	if (w1 > MIN_W0 && w1 < MAX_W0 && w > MIN_W1 && w < MAX_W1){
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00281_DS_
	MOVLW	0x7d
	SUBWF	_w1,W
_00281_DS_:
	BTFSS	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00282_DS_
	MOVLW	0xc2
	SUBWF	_w1,W
_00282_DS_:
	BTFSC	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x547=1351), size=2
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00283_DS_
	MOVLW	0x47
	SUBWF	_w,W
_00283_DS_:
	BTFSS	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;;unsigned compare: left < lit(0x596=1430), size=2
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00284_DS_
	MOVLW	0x96
	SUBWF	_w,W
_00284_DS_:
	BTFSC	STATUS,0
	GOTO	_00160_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;	.line	190; "main.c"	SP_send_buf(strVF);
	MOVLW	high (_strVF + 0)
	BANKSEL	r0x1037
	MOVWF	r0x1037
	MOVLW	(_strVF + 0)
	MOVWF	r0x1038
	MOVLW	0x80
	MOVWF	r0x1039
	MOVF	r0x1038,W
	MOVWF	STK01
	MOVF	r0x1037,W
	MOVWF	STK00
	MOVF	r0x1039,W
	PAGESEL	_SP_send_buf
	CALL	_SP_send_buf
	PAGESEL	$
;	.line	191; "main.c"	RecAddress[i] = BIT_F;
	BANKSEL	r0x1036
	MOVF	r0x1036,W
	ADDLW	(_RecAddress + 0)
	MOVWF	r0x1038
	MOVLW	high (_RecAddress + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1037
	MOVF	r0x1038,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1037
	BTFSC	r0x1037,0
	BSF	STATUS,7
	MOVLW	0x03
	BANKSEL	INDF
	MOVWF	INDF
;	.line	192; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	193; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	194; "main.c"	i++;
	BANKSEL	r0x1036
	INCF	r0x1036,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x3A99=15001), size=2
_00160_DS_:
;	.line	197; "main.c"	if (t > MIN_TS && t < MAX_TS && w > MIN_W0 && w < MAX_W0){
	MOVLW	0x3a
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00285_DS_
	MOVLW	0x99
	SUBWF	_t,W
_00285_DS_:
	BTFSS	STATUS,0
	GOTO	_00170_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;;unsigned compare: left < lit(0x3E80=16000), size=2
	MOVLW	0x3e
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00286_DS_
	MOVLW	0x80
	SUBWF	_t,W
_00286_DS_:
	BTFSC	STATUS,0
	GOTO	_00170_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00287_DS_
	MOVLW	0x7d
	SUBWF	_w,W
_00287_DS_:
	BTFSS	STATUS,0
	GOTO	_00170_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00288_DS_
	MOVLW	0xc2
	SUBWF	_w,W
_00288_DS_:
	BTFSC	STATUS,0
	GOTO	_00170_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;	.line	198; "main.c"	SP_send_buf(sync);
	MOVLW	high (_sync + 0)
	BANKSEL	r0x1037
	MOVWF	r0x1037
	MOVLW	(_sync + 0)
	MOVWF	r0x1038
	MOVLW	0x80
	MOVWF	r0x1039
	MOVF	r0x1038,W
	MOVWF	STK01
	MOVF	r0x1037,W
	MOVWF	STK00
	MOVF	r0x1039,W
	PAGESEL	_SP_send_buf
	CALL	_SP_send_buf
	PAGESEL	$
;	.line	199; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	200; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	201; "main.c"	temp = 1;
	MOVLW	0x01
	BANKSEL	r0x1038
	MOVWF	r0x1038
;	.line	202; "main.c"	i--;
	DECF	r0x1036,F
;	.line	203; "main.c"	GIE = 0; //not tested
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,7
;	.line	204; "main.c"	for(j = 11; j != 0; j--){
	BANKSEL	r0x1036
	MOVF	r0x1036,W
	MOVWF	r0x1037
	MOVLW	0x0b
	MOVWF	r0x1039
_00181_DS_:
;	.line	206; "main.c"	if (RecAddress[i] != SetAddress[j]){
	BANKSEL	r0x1037
	MOVF	r0x1037,W
	ADDLW	(_RecAddress + 0)
	MOVWF	r0x103A
	MOVLW	high (_RecAddress + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x103B
	MOVF	r0x103A,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x103B
	BTFSC	r0x103B,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x103C
	MOVWF	r0x103C
	MOVF	r0x1039,W
	ADDLW	(_SetAddress + 0)
	MOVWF	r0x103A
	MOVLW	high (_SetAddress + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x103B
	MOVF	r0x103A,W
	MOVWF	STK01
	MOVF	r0x103B,W
	MOVWF	STK00
	MOVLW	0x80
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
;;1	MOVWF	r0x103D
;	.line	207; "main.c"	temp = 0;
	BANKSEL	r0x103C
	XORWF	r0x103C,W
;	.line	209; "main.c"	i--;
	BTFSS	STATUS,2
	CLRF	r0x1038
	DECF	r0x1037,F
;	.line	204; "main.c"	for(j = 11; j != 0; j--){
	DECFSZ	r0x1039,F
	GOTO	_00181_DS_
	MOVF	r0x1037,W
	MOVWF	r0x1036
;	.line	211; "main.c"	GIE = 1;
	BANKSEL	_INTCONbits
	BSF	_INTCONbits,7
;	.line	213; "main.c"	if(temp){
	BANKSEL	r0x1038
	MOVF	r0x1038,W
	BTFSC	STATUS,2
	GOTO	_00170_DS_
;	.line	214; "main.c"	SP_send_buf(light);
	MOVLW	high (_light + 0)
	MOVWF	r0x1037
	MOVLW	(_light + 0)
	MOVWF	r0x1038
	MOVLW	0x80
	MOVWF	r0x1039
	MOVF	r0x1038,W
	MOVWF	STK01
	MOVF	r0x1037,W
	MOVWF	STK00
	MOVF	r0x1039,W
	PAGESEL	_SP_send_buf
	CALL	_SP_send_buf
	PAGESEL	$
;	.line	215; "main.c"	OUT_PIN = 1;
	BANKSEL	_PORTCbits
	BSF	_PORTCbits,0
;	.line	216; "main.c"	TMR0 = 0;	// Enable timer
	CLRF	_TMR0
;	.line	217; "main.c"	T0IE = 1;
	BSF	_INTCONbits,5
_00170_DS_:
;	.line	226; "main.c"	t1 = t;
	BANKSEL	_t
	MOVF	_t,W
	BANKSEL	_t1
	MOVWF	_t1
	BANKSEL	_t
	MOVF	(_t + 1),W
	BANKSEL	_t1
	MOVWF	(_t1 + 1)
;	.line	227; "main.c"	w1 = w;
	BANKSEL	_w
	MOVF	_w,W
	BANKSEL	_w1
	MOVWF	_w1
	BANKSEL	_w
	MOVF	(_w + 1),W
	BANKSEL	_w1
	MOVWF	(_w1 + 1)
_00175_DS_:
;	.line	230; "main.c"	int_error_cnt = 0;
	BANKSEL	_int_error_cnt
	CLRF	_int_error_cnt
;;unsigned compare: left < lit(0x13=19), size=1
;	.line	231; "main.c"	if(i >= 19){
	MOVLW	0x13
	BANKSEL	r0x1036
	SUBWF	r0x1036,W
	BTFSS	STATUS,0
	GOTO	_00179_DS_
;;genSkipc:3257: created from rifx:0x7ffefaaaf730
;	.line	232; "main.c"	i = 0;
	CLRF	r0x1036
	GOTO	_00179_DS_
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
;   r0x1031
;   r0x1032
;   r0x1033
;   r0x1034
;   r0x1035
;   STK01
;   STK00
;; Starting pCode block
S_main__circBufPush	code
_circBufPush:
; 2 exit points
;	.line	237; "main.c"	int circBufPush(uint8_t data){
	BANKSEL	r0x1031
	MOVWF	r0x1031
;	.line	238; "main.c"	uint8_t next = buf_head + 1;
	BANKSEL	_buf_head
	INCF	_buf_head,W
	BANKSEL	r0x1032
	MOVWF	r0x1032
;;unsigned compare: left < lit(0x10=16), size=1
;	.line	239; "main.c"	if (next >= BUF_SIZE)
	MOVLW	0x10
;	.line	240; "main.c"	next = 0;
	SUBWF	r0x1032,W
;	.line	243; "main.c"	if (next == buf_tail){
	BTFSC	STATUS,0
	CLRF	r0x1032
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x1032
	XORWF	r0x1032,W
	BTFSS	STATUS,2
	GOTO	_00297_DS_
;	.line	244; "main.c"	SP_send(buf_err);
	MOVLW	high (_buf_err + 0)
	MOVWF	r0x1033
	MOVLW	(_buf_err + 0)
	MOVWF	r0x1034
	MOVLW	0x80
	MOVWF	r0x1035
	MOVF	r0x1034,W
	MOVWF	STK01
	MOVF	r0x1033,W
	MOVWF	STK00
	MOVF	r0x1035,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	245; "main.c"	return -1;  // quit with an error
	MOVLW	0xff
	MOVWF	STK00
	MOVLW	0xff
	GOTO	_00298_DS_
_00297_DS_:
;	.line	248; "main.c"	buf[buf_head] = data;
	BANKSEL	_buf_head
	MOVF	_buf_head,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x1034
	MOVWF	r0x1034
	MOVLW	high (_buf + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1033
	MOVF	r0x1034,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1033
	BTFSC	r0x1033,0
	BSF	STATUS,7
	MOVF	r0x1031,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	249; "main.c"	buf_head = next;
	BANKSEL	r0x1032
	MOVF	r0x1032,W
	BANKSEL	_buf_head
	MOVWF	_buf_head
;	.line	250; "main.c"	TXIE = 1;       //Enables the EUSART transmit interrupt
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,4
;	.line	251; "main.c"	return 0;
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
_00298_DS_:
	RETURN	
; exit point of _circBufPush


;	code size estimation:
;	  517+  141 =   658 instructions ( 1598 byte)

	end
