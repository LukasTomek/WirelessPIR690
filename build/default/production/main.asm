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
	extern	__gptrget1
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_SP_send_error
	global	_SP_send
	global	_dec_to_ascii
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
r0x1042	res	1
r0x1043	res	1
r0x1044	res	1
r0x103E	res	1
r0x1040	res	1
r0x103F	res	1
r0x1041	res	1
r0x102A	res	1
r0x102B	res	1
r0x102D	res	1
r0x102C	res	1
r0x102E	res	1
r0x1038	res	1
r0x1037	res	1
r0x1039	res	1
r0x103A	res	1
r0x103C	res	1
r0x103D	res	1
r0x1031	res	1
r0x1030	res	1
r0x102F	res	1
r0x1032	res	1
r0x1033	res	1
r0x1034	res	1
r0x1035	res	1
r0x1036	res	1
r0x1024	res	1
r0x1023	res	1
r0x1022	res	1
r0x1025	res	1
r0x1026	res	1
r0x1027	res	1
r0x1028	res	1
r0x1029	res	1
_dec_to_ascii_i_1_22	res	1
_dec_to_ascii_number_1_22	res	4
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
;   _SP_send_error
;   _SP_send_error
;5 compiler assigned registers:
;   r0x1042
;   r0x1043
;   r0x1044
;   STK01
;   STK00
;; Starting pCode block
_receive_intr:
; 0 exit points
;	.line	84; "main.c"	void receive_intr() __interrupt 0 {
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
;	.line	86; "main.c"	if(TXIF){
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,4
	GOTO	_00111_DS_
;	.line	88; "main.c"	if (buf_head == buf_tail){
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	_buf_head
	XORWF	_buf_head,W
	BTFSS	STATUS,2
	GOTO	_00108_DS_
;	.line	89; "main.c"	TXIE = 0;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,4
	GOTO	_00111_DS_
_00108_DS_:
;	.line	94; "main.c"	TXREG = buf[buf_tail];
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x1042
	MOVWF	r0x1042
	MOVLW	high (_buf + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1043
	MOVF	r0x1042,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1043
	BTFSC	r0x1043,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	MOVWF	_TXREG
;	.line	95; "main.c"	buf[buf_tail] = 0;  // clear the data (optional)
	BANKSEL	r0x1042
	MOVF	r0x1042,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1043
	BTFSC	r0x1043,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	97; "main.c"	next = buf_tail + 1;
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x1042
	MOVWF	r0x1042
	CLRF	r0x1043
	INCF	r0x1042,F
	BTFSC	STATUS,2
	INCF	r0x1043,F
;;signed compare: left < lit(0x10=16), size=2, mask=ffff
;	.line	98; "main.c"	if(next >= BUF_SIZE)
	MOVF	r0x1043,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00139_DS_
	MOVLW	0x10
	SUBWF	r0x1042,W
_00139_DS_:
	BTFSS	STATUS,0
	GOTO	_00106_DS_
;;genSkipc:3257: created from rifx:0x7ffc8cbcdf40
;	.line	99; "main.c"	next = 0;
	BANKSEL	r0x1042
	CLRF	r0x1042
	CLRF	r0x1043
_00106_DS_:
;	.line	101; "main.c"	buf_tail = next;
	BANKSEL	r0x1042
	MOVF	r0x1042,W
	BANKSEL	_buf_tail
	MOVWF	_buf_tail
_00111_DS_:
;	.line	105; "main.c"	if(CCP1IF){
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,2
	GOTO	_00116_DS_
;	.line	106; "main.c"	CCP1IE = FALSE;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,2
;	.line	108; "main.c"	if(CCP1M0){                     // if ECCP mode is Rising edge CCP1M0
	BANKSEL	_CCP1CONbits
	BTFSS	_CCP1CONbits,0
	GOTO	_00113_DS_
;	.line	109; "main.c"	CCP1M0 = FALING;                 // set falling edge
	BCF	_CCP1CONbits,0
;	.line	110; "main.c"	TMR1H = 0;
	CLRF	_TMR1H
;	.line	111; "main.c"	TMR1L = 0;
	CLRF	_TMR1L
;	.line	112; "main.c"	t = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
	MOVF	_CCPR1H,W
	BANKSEL	r0x1042
	MOVWF	r0x1042
	BANKSEL	_t
	MOVWF	_t
	CLRF	(_t + 1)
;	.line	113; "main.c"	t = t << 8;
	MOVF	_t,W
	MOVWF	(_t + 1)
	CLRF	_t
;	.line	114; "main.c"	t = t | CCPR1L;             //ECCP combined 16 bit number formation
	BANKSEL	_CCPR1L
	MOVF	_CCPR1L,W
	BANKSEL	r0x1042
	MOVWF	r0x1042
	CLRF	r0x1043
	MOVF	r0x1042,W
	BANKSEL	_t
	IORWF	_t,F
	MOVLW	0x00
	IORWF	(_t + 1),F
;	.line	115; "main.c"	bitfield.Capture = TRUE;
	BANKSEL	_bitfield
	BSF	_bitfield,0
	GOTO	_00114_DS_
_00113_DS_:
;	.line	118; "main.c"	CCP1M0 = RISING;
	BANKSEL	_CCP1CONbits
	BSF	_CCP1CONbits,0
;	.line	119; "main.c"	w = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
	MOVF	_CCPR1H,W
	BANKSEL	r0x1042
	MOVWF	r0x1042
	BANKSEL	_w
	MOVWF	_w
	CLRF	(_w + 1)
;	.line	120; "main.c"	w = w << 8;
	MOVF	_w,W
	MOVWF	(_w + 1)
	CLRF	_w
;	.line	121; "main.c"	w = w | CCPR1L;             //ECCP combined 16 bit number formation
	BANKSEL	_CCPR1L
	MOVF	_CCPR1L,W
	BANKSEL	r0x1042
	MOVWF	r0x1042
	CLRF	r0x1043
	MOVF	r0x1042,W
	BANKSEL	_w
	IORWF	_w,F
	MOVLW	0x00
	IORWF	(_w + 1),F
_00114_DS_:
;	.line	124; "main.c"	CCP1IE = 1;
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,2
;	.line	125; "main.c"	CCP1IF = 0;                     //Clear interrupt flag
	BANKSEL	_PIR1bits
	BCF	_PIR1bits,2
_00116_DS_:
;	.line	127; "main.c"	int_error_cnt++;
	BANKSEL	_int_error_cnt
	INCF	_int_error_cnt,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x65=101), size=1
;	.line	128; "main.c"	if (int_error_cnt > 100)
	MOVLW	0x65
	SUBWF	_int_error_cnt,W
	BTFSS	STATUS,0
	GOTO	_00119_DS_
;;genSkipc:3257: created from rifx:0x7ffc8cbcdf40
;	.line	129; "main.c"	SP_send_error(int_err);
	MOVLW	high (_int_err + 0)
	BANKSEL	r0x1043
	MOVWF	r0x1043
	MOVLW	(_int_err + 0)
	MOVWF	r0x1042
	MOVLW	0x80
	MOVWF	r0x1044
	MOVF	r0x1042,W
	MOVWF	STK01
	MOVF	r0x1043,W
	MOVWF	STK00
	MOVF	r0x1044,W
	PAGESEL	_SP_send_error
	CALL	_SP_send_error
	PAGESEL	$
_00119_DS_:
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
;   _dec_to_ascii
;   _SP_send
;   _dec_to_ascii
;   _SP_send
;   _dec_to_ascii
;   _SP_send
;   _dec_to_ascii
;   _SP_send
;   _init
;   _dec_to_ascii
;   _SP_send
;   _dec_to_ascii
;   _SP_send
;   _dec_to_ascii
;   _SP_send
;   _dec_to_ascii
;   _SP_send
;6 compiler assigned registers:
;   r0x103E
;   STK00
;   r0x103F
;   r0x1040
;   r0x1041
;   STK01
;; Starting pCode block
S_main__main	code
_main:
; 2 exit points
;	.line	135; "main.c"	init();
	PAGESEL	_init
	CALL	_init
	PAGESEL	$
;	.line	136; "main.c"	while(1)
	BANKSEL	r0x103E
	CLRF	r0x103E
_00155_DS_:
;	.line	139; "main.c"	if (bitfield.Capture){
	BANKSEL	_bitfield
	BTFSS	_bitfield,0
	GOTO	_00153_DS_
;	.line	140; "main.c"	dec_to_ascii(w);
	BANKSEL	_w
	MOVF	_w,W
	MOVWF	STK00
	MOVF	(_w + 1),W
	PAGESEL	_dec_to_ascii
	CALL	_dec_to_ascii
	PAGESEL	$
;	.line	141; "main.c"	SP_send(tab);
	MOVLW	high (_tab + 0)
	BANKSEL	r0x103F
	MOVWF	r0x103F
	MOVLW	(_tab + 0)
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
;	.line	142; "main.c"	dec_to_ascii(t);
	BANKSEL	_t
	MOVF	_t,W
	MOVWF	STK00
	MOVF	(_t + 1),W
	PAGESEL	_dec_to_ascii
	CALL	_dec_to_ascii
	PAGESEL	$
;	.line	143; "main.c"	SP_send(enter);
	MOVLW	high (_enter + 0)
	BANKSEL	r0x103F
	MOVWF	r0x103F
	MOVLW	(_enter + 0)
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
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x759=1881), size=2
;	.line	147; "main.c"	if (t > MIN_T && t < MAX_T && t1 > MIN_T && t1 < MAX_T){
	MOVLW	0x07
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00183_DS_
	MOVLW	0x59
	SUBWF	_t,W
_00183_DS_:
	BTFSS	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffc8cbcdf40
;;unsigned compare: left < lit(0x79E=1950), size=2
	MOVLW	0x07
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00184_DS_
	MOVLW	0x9e
	SUBWF	_t,W
_00184_DS_:
	BTFSC	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffc8cbcdf40
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x759=1881), size=2
	MOVLW	0x07
	BANKSEL	_t1
	SUBWF	(_t1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00185_DS_
	MOVLW	0x59
	SUBWF	_t1,W
_00185_DS_:
	BTFSS	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffc8cbcdf40
;;unsigned compare: left < lit(0x79E=1950), size=2
	MOVLW	0x07
	BANKSEL	_t1
	SUBWF	(_t1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00186_DS_
	MOVLW	0x9e
	SUBWF	_t1,W
_00186_DS_:
	BTFSC	STATUS,0
	GOTO	_00145_DS_
;;genSkipc:3257: created from rifx:0x7ffc8cbcdf40
;	.line	148; "main.c"	bitfield.Hint = TRUE;
	BANKSEL	_bitfield
	BSF	_bitfield,2
;;unsigned compare: left < lit(0x64=100), size=1
_00145_DS_:
;	.line	150; "main.c"	if (i < 100 && bitfield.Hint){
	MOVLW	0x64
	BANKSEL	r0x103E
	SUBWF	r0x103E,W
	BTFSC	STATUS,0
	GOTO	_00150_DS_
;;genSkipc:3257: created from rifx:0x7ffc8cbcdf40
	BANKSEL	_bitfield
	BTFSS	_bitfield,2
	GOTO	_00150_DS_
;	.line	151; "main.c"	dec_to_ascii(w);
	BANKSEL	_w
	MOVF	_w,W
	MOVWF	STK00
	MOVF	(_w + 1),W
	PAGESEL	_dec_to_ascii
	CALL	_dec_to_ascii
	PAGESEL	$
;	.line	152; "main.c"	SP_send(tab);
	MOVLW	high (_tab + 0)
	BANKSEL	r0x103F
	MOVWF	r0x103F
	MOVLW	(_tab + 0)
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
;	.line	153; "main.c"	dec_to_ascii(t);
	BANKSEL	_t
	MOVF	_t,W
	MOVWF	STK00
	MOVF	(_t + 1),W
	PAGESEL	_dec_to_ascii
	CALL	_dec_to_ascii
	PAGESEL	$
;	.line	154; "main.c"	SP_send(enter);
	MOVLW	high (_enter + 0)
	BANKSEL	r0x103F
	MOVWF	r0x103F
	MOVLW	(_enter + 0)
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
;	.line	155; "main.c"	i++;
	BANKSEL	r0x103E
	INCF	r0x103E,F
_00150_DS_:
;	.line	157; "main.c"	t1 = t;
	BANKSEL	_t
	MOVF	_t,W
	BANKSEL	_t1
	MOVWF	_t1
	BANKSEL	_t
	MOVF	(_t + 1),W
	BANKSEL	_t1
	MOVWF	(_t1 + 1)
;	.line	158; "main.c"	w1 = w;
	BANKSEL	_w
	MOVF	_w,W
	BANKSEL	_w1
	MOVWF	_w1
	BANKSEL	_w
	MOVF	(_w + 1),W
	BANKSEL	_w1
	MOVWF	(_w1 + 1)
;	.line	159; "main.c"	bitfield.Capture = FALSE;
	BANKSEL	_bitfield
	BCF	_bitfield,0
_00153_DS_:
;	.line	162; "main.c"	int_error_cnt = 0;
	BANKSEL	_int_error_cnt
	CLRF	_int_error_cnt
	GOTO	_00155_DS_
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
;   r0x1022
;   STK00
;   r0x1023
;   STK01
;   r0x1024
;   r0x1025
;   r0x1026
;   r0x1027
;   r0x1028
;   r0x1029
;; Starting pCode block
S_main__SP_send_error	code
_SP_send_error:
; 2 exit points
;	.line	221; "main.c"	void SP_send_error(char str[])
	BANKSEL	r0x1022
	MOVWF	r0x1022
	MOVF	STK00,W
	MOVWF	r0x1023
	MOVF	STK01,W
	MOVWF	r0x1024
;	.line	224; "main.c"	GIE = FALSE;	// Disable all interrupts.
	BANKSEL	_INTCONbits
	BCF	_INTCONbits,7
;	.line	225; "main.c"	for(i=0; str[i] != '\0'; i++)
	BANKSEL	r0x1025
	CLRF	r0x1025
_00226_DS_:
	BANKSEL	r0x1025
	MOVF	r0x1025,W
	ADDWF	r0x1024,W
	MOVWF	r0x1026
	MOVF	r0x1023,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1027
	MOVF	r0x1022,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1028
	MOVF	r0x1026,W
	MOVWF	STK01
	MOVF	r0x1027,W
	MOVWF	STK00
	MOVF	r0x1028,W
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1029
	MOVWF	r0x1029
	MOVF	r0x1029,W
	BTFSC	STATUS,2
	GOTO	_00228_DS_
;	.line	227; "main.c"	TXREG=str[i];	// Add a character to the output buffer
	MOVF	r0x1029,W
	BANKSEL	_TXREG
	MOVWF	_TXREG
_00221_DS_:
;	.line	228; "main.c"	while(!TXIF);	// Wait while the output buffer is full
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,4
	GOTO	_00221_DS_
;	.line	225; "main.c"	for(i=0; str[i] != '\0'; i++)
	BANKSEL	r0x1025
	INCF	r0x1025,F
	GOTO	_00226_DS_
_00228_DS_:
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
;   r0x102F
;   STK00
;   r0x1030
;   STK01
;   r0x1031
;   r0x1032
;   r0x1033
;   r0x1034
;   r0x1035
;   r0x1036
;; Starting pCode block
S_main__SP_send	code
_SP_send:
; 2 exit points
;	.line	213; "main.c"	void SP_send(char str[]){
	BANKSEL	r0x102F
	MOVWF	r0x102F
	MOVF	STK00,W
	MOVWF	r0x1030
	MOVF	STK01,W
	MOVWF	r0x1031
;	.line	215; "main.c"	for(i=0; str[i] != '\0'; i++)
	CLRF	r0x1032
_00214_DS_:
	BANKSEL	r0x1032
	MOVF	r0x1032,W
	ADDWF	r0x1031,W
	MOVWF	r0x1033
	MOVF	r0x1030,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1034
	MOVF	r0x102F,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1035
	MOVF	r0x1033,W
	MOVWF	STK01
	MOVF	r0x1034,W
	MOVWF	STK00
	MOVF	r0x1035,W
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1036
	MOVWF	r0x1036
	MOVF	r0x1036,W
	BTFSC	STATUS,2
	GOTO	_00216_DS_
;	.line	217; "main.c"	circBufPush(str[i]);
	MOVF	r0x1036,W
	PAGESEL	_circBufPush
	CALL	_circBufPush
	PAGESEL	$
;	.line	215; "main.c"	for(i=0; str[i] != '\0'; i++)
	BANKSEL	r0x1032
	INCF	r0x1032,F
	GOTO	_00214_DS_
_00216_DS_:
	RETURN	
; exit point of _SP_send

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
;10 compiler assigned registers:
;   r0x1037
;   STK00
;   r0x1038
;   r0x1039
;   r0x103A
;   STK02
;   STK01
;   r0x103B
;   r0x103C
;   r0x103D
;; Starting pCode block
S_main__dec_to_ascii	code
_dec_to_ascii:
; 2 exit points
;	.line	195; "main.c"	void dec_to_ascii(unsigned short dec)
	BANKSEL	r0x1037
	MOVWF	r0x1037
	MOVF	STK00,W
	MOVWF	r0x1038
;	.line	200; "main.c"	for (i=0 ; dec!=0; i++)
	BANKSEL	_dec_to_ascii_i_1_22
	CLRF	_dec_to_ascii_i_1_22
_00205_DS_:
	BANKSEL	r0x1038
	MOVF	r0x1038,W
	IORWF	r0x1037,W
	BTFSC	STATUS,2
	GOTO	_00201_DS_
;	.line	202; "main.c"	number[i]=(dec % 10);
	BANKSEL	_dec_to_ascii_i_1_22
	MOVF	_dec_to_ascii_i_1_22,W
	ADDLW	(_dec_to_ascii_number_1_22 + 0)
	BANKSEL	r0x1039
	MOVWF	r0x1039
	MOVLW	high (_dec_to_ascii_number_1_22 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x103A
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1038,W
	MOVWF	STK00
	MOVF	r0x1037,W
	PAGESEL	__moduint
	CALL	__moduint
	PAGESEL	$
;;1	MOVWF	r0x103B
	MOVF	STK00,W
	BANKSEL	r0x103C
	MOVWF	r0x103C
	MOVWF	r0x103D
	MOVF	r0x1039,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x103A
	BTFSC	r0x103A,0
	BSF	STATUS,7
	MOVF	r0x103D,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	203; "main.c"	dec /=10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	BANKSEL	r0x1038
	MOVF	r0x1038,W
	MOVWF	STK00
	MOVF	r0x1037,W
	PAGESEL	__divuint
	CALL	__divuint
	PAGESEL	$
	BANKSEL	r0x1037
	MOVWF	r0x1037
	MOVF	STK00,W
	MOVWF	r0x1038
;	.line	204; "main.c"	number[i] +=48;
	BANKSEL	_dec_to_ascii_i_1_22
	MOVF	_dec_to_ascii_i_1_22,W
	ADDLW	(_dec_to_ascii_number_1_22 + 0)
	BANKSEL	r0x1039
	MOVWF	r0x1039
	MOVLW	high (_dec_to_ascii_number_1_22 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x103A
	MOVF	r0x1039,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x103A
	BTFSC	r0x103A,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x103C
	MOVWF	r0x103C
	MOVLW	0x30
	ADDWF	r0x103C,F
	MOVF	r0x1039,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x103A
	BTFSC	r0x103A,0
	BSF	STATUS,7
	MOVF	r0x103C,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	200; "main.c"	for (i=0 ; dec!=0; i++)
	BANKSEL	_dec_to_ascii_i_1_22
	INCF	_dec_to_ascii_i_1_22,F
	GOTO	_00205_DS_
_00201_DS_:
;	.line	206; "main.c"	while (i--)
	BANKSEL	_dec_to_ascii_i_1_22
	MOVF	_dec_to_ascii_i_1_22,W
	BANKSEL	r0x1038
	MOVWF	r0x1038
	BANKSEL	_dec_to_ascii_i_1_22
	DECF	_dec_to_ascii_i_1_22,F
	BANKSEL	r0x1038
	MOVF	r0x1038,W
	BTFSC	STATUS,2
	GOTO	_00207_DS_
;	.line	208; "main.c"	circBufPush(number[i]);	// Add a character to the output buffer
	BANKSEL	_dec_to_ascii_i_1_22
	MOVF	_dec_to_ascii_i_1_22,W
	ADDLW	(_dec_to_ascii_number_1_22 + 0)
	BANKSEL	r0x1038
	MOVWF	r0x1038
	MOVLW	high (_dec_to_ascii_number_1_22 + 0)
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
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1039
	MOVWF	r0x1039
	PAGESEL	_circBufPush
	CALL	_circBufPush
	PAGESEL	$
	GOTO	_00201_DS_
_00207_DS_:
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
;   r0x102A
;   r0x102B
;   r0x102C
;   r0x102D
;   r0x102E
;   STK01
;   STK00
;; Starting pCode block
S_main__circBufPush	code
_circBufPush:
; 2 exit points
;	.line	166; "main.c"	int circBufPush(uint8_t data){
	BANKSEL	r0x102A
	MOVWF	r0x102A
;	.line	167; "main.c"	uint8_t next = buf_head + 1;
	BANKSEL	_buf_head
	INCF	_buf_head,W
	BANKSEL	r0x102B
	MOVWF	r0x102B
;;unsigned compare: left < lit(0x10=16), size=1
;	.line	168; "main.c"	if (next >= BUF_SIZE)
	MOVLW	0x10
;	.line	169; "main.c"	next = 0;
	SUBWF	r0x102B,W
;	.line	172; "main.c"	if (next == buf_tail){
	BTFSC	STATUS,0
	CLRF	r0x102B
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x102B
	XORWF	r0x102B,W
	BTFSS	STATUS,2
	GOTO	_00194_DS_
;	.line	173; "main.c"	SP_send_error(buf_err);
	MOVLW	high (_buf_err + 0)
	MOVWF	r0x102C
	MOVLW	(_buf_err + 0)
	MOVWF	r0x102D
	MOVLW	0x80
	MOVWF	r0x102E
	MOVF	r0x102D,W
	MOVWF	STK01
	MOVF	r0x102C,W
	MOVWF	STK00
	MOVF	r0x102E,W
	PAGESEL	_SP_send_error
	CALL	_SP_send_error
	PAGESEL	$
;	.line	174; "main.c"	return -1;  // quit with an error
	MOVLW	0xff
	MOVWF	STK00
	MOVLW	0xff
	GOTO	_00195_DS_
_00194_DS_:
;	.line	177; "main.c"	buf[buf_head] = data;
	BANKSEL	_buf_head
	MOVF	_buf_head,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x102D
	MOVWF	r0x102D
	MOVLW	high (_buf + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x102C
	MOVF	r0x102D,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x102C
	BTFSC	r0x102C,0
	BSF	STATUS,7
	MOVF	r0x102A,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	178; "main.c"	buf_head = next;
	BANKSEL	r0x102B
	MOVF	r0x102B,W
	BANKSEL	_buf_head
	MOVWF	_buf_head
;	.line	179; "main.c"	TXIE = 1;       //Enables the EUSART transmit interrupt
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,4
;	.line	180; "main.c"	return 0;
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
_00195_DS_:
	RETURN	
; exit point of _circBufPush


;	code size estimation:
;	  452+  158 =   610 instructions ( 1536 byte)

	end
