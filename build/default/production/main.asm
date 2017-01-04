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
	global	_SP_send
	global	_receive_intr
	global	_circBufPush
	global	_dec_to_ascii
	global	_main
	global	_capture
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
_buf	res	16

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_main_0	udata
r0x1030	res	1
r0x1031	res	1
r0x1032	res	1
r0x101F	res	1
r0x1020	res	1
r0x1021	res	1
r0x1022	res	1
r0x1023	res	1
r0x1025	res	1
r0x1024	res	1
r0x1026	res	1
r0x1029	res	1
r0x1027	res	1
r0x1028	res	1
r0x102A	res	1
r0x102B	res	1
r0x102C	res	1
r0x102E	res	1
r0x102D	res	1
r0x102F	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

ID_main_0	idata
_capture
	db	0x00


ID_main_1	idata
_w
	db	0x00, 0x00


ID_main_2	idata
_t
	db	0x00, 0x00


ID_main_3	idata
_w1
	db	0x00, 0x00


ID_main_4	idata
_t1
	db	0x00, 0x00


ID_main_5	idata
_buf_head
	db	0x00, 0x00


ID_main_6	idata
_buf_tail
	db	0x00, 0x00


ID_main_7	idata
_int_error_cnt
	db	0x00


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
;   _SP_send
;   _SP_send
;5 compiler assigned registers:
;   r0x1030
;   r0x1031
;   r0x1032
;   STK01
;   STK00
;; Starting pCode block
_receive_intr:
; 0 exit points
;	.line	87; "main.c"	void receive_intr() __interrupt 0 {
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
;	.line	89; "main.c"	if(TXIF){
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,4
	GOTO	_00111_DS_
;	.line	91; "main.c"	if (buf_head == buf_tail){
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	_buf_head
	XORWF	_buf_head,W
	BTFSS	STATUS,2
	GOTO	_00108_DS_
	BANKSEL	_buf_tail
	MOVF	(_buf_tail + 1),W
	BANKSEL	_buf_head
	XORWF	(_buf_head + 1),W
	BTFSS	STATUS,2
	GOTO	_00108_DS_
;	.line	92; "main.c"	TXIE = 0;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,4
	GOTO	_00111_DS_
_00108_DS_:
;	.line	97; "main.c"	TXREG = buf[buf_tail];
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x1030
	MOVWF	r0x1030
	MOVLW	high (_buf + 0)
	MOVWF	r0x1031
	BANKSEL	_buf_tail
	MOVF	(_buf_tail + 1),W
	BTFSC	STATUS,0
	INCF	(_buf_tail + 1),W
	BTFSC	STATUS,2
	GOTO	_00002_DS_
	BANKSEL	r0x1031
	ADDWF	r0x1031,F
_00002_DS_:
	BANKSEL	r0x1030
	MOVF	r0x1030,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1031
	BTFSC	r0x1031,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	MOVWF	_TXREG
;	.line	98; "main.c"	buf[buf_tail] = 0;  // clear the data (optional)
	BANKSEL	r0x1030
	MOVF	r0x1030,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1031
	BTFSC	r0x1031,0
	BSF	STATUS,7
	MOVLW	0x00
	BANKSEL	INDF
	MOVWF	INDF
;	.line	100; "main.c"	next = buf_tail + 1;
	MOVLW	0x01
	BANKSEL	_buf_tail
	ADDWF	_buf_tail,W
	BANKSEL	r0x1030
	MOVWF	r0x1030
	CLRF	r0x1031
	RLF	r0x1031,F
	BANKSEL	_buf_tail
	MOVF	(_buf_tail + 1),W
	BANKSEL	r0x1031
	ADDWF	r0x1031,F
;;signed compare: left < lit(0x10=16), size=2, mask=ffff
;	.line	101; "main.c"	if(next >= BUF_SIZE)
	MOVF	r0x1031,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00139_DS_
	MOVLW	0x10
	SUBWF	r0x1030,W
_00139_DS_:
	BTFSS	STATUS,0
	GOTO	_00106_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;	.line	102; "main.c"	next = 0;
	BANKSEL	r0x1030
	CLRF	r0x1030
	CLRF	r0x1031
_00106_DS_:
;	.line	104; "main.c"	buf_tail = next;
	BANKSEL	r0x1030
	MOVF	r0x1030,W
	BANKSEL	_buf_tail
	MOVWF	_buf_tail
	BANKSEL	r0x1031
	MOVF	r0x1031,W
	BANKSEL	_buf_tail
	MOVWF	(_buf_tail + 1)
_00111_DS_:
;	.line	108; "main.c"	if(CCP1IF){
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,2
	GOTO	_00116_DS_
;	.line	109; "main.c"	CCP1IE = 0;
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,2
;	.line	110; "main.c"	if(CCP1M0){                     // if ECCP mode is Rising edge CCP1M0
	BANKSEL	_CCP1CONbits
	BTFSS	_CCP1CONbits,0
	GOTO	_00113_DS_
;	.line	111; "main.c"	CCP1M0 = 0;                 // set falling edge
	BCF	_CCP1CONbits,0
;	.line	112; "main.c"	TMR1H = 0;
	CLRF	_TMR1H
;	.line	113; "main.c"	TMR1L = 0;
	CLRF	_TMR1L
;	.line	114; "main.c"	t = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
	MOVF	_CCPR1H,W
	BANKSEL	r0x1030
	MOVWF	r0x1030
	BANKSEL	_t
	MOVWF	_t
	CLRF	(_t + 1)
;	.line	115; "main.c"	t = t << 8;
	MOVF	_t,W
	MOVWF	(_t + 1)
	CLRF	_t
;	.line	116; "main.c"	t = t | CCPR1L;             //ECCP combined 16 bit number formation
	BANKSEL	_CCPR1L
	MOVF	_CCPR1L,W
	BANKSEL	r0x1030
	MOVWF	r0x1030
	CLRF	r0x1031
	MOVF	r0x1030,W
	BANKSEL	_t
	IORWF	_t,F
	MOVLW	0x00
	IORWF	(_t + 1),F
;	.line	117; "main.c"	capture = 1;
	MOVLW	0x01
	BANKSEL	_capture
	MOVWF	_capture
	GOTO	_00114_DS_
_00113_DS_:
;	.line	120; "main.c"	CCP1M0 = 1;
	BANKSEL	_CCP1CONbits
	BSF	_CCP1CONbits,0
;	.line	121; "main.c"	w = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
	MOVF	_CCPR1H,W
	BANKSEL	r0x1030
	MOVWF	r0x1030
	BANKSEL	_w
	MOVWF	_w
	CLRF	(_w + 1)
;	.line	122; "main.c"	w = w << 8;
	MOVF	_w,W
	MOVWF	(_w + 1)
	CLRF	_w
;	.line	123; "main.c"	w = w | CCPR1L;             //ECCP combined 16 bit number formation
	BANKSEL	_CCPR1L
	MOVF	_CCPR1L,W
	BANKSEL	r0x1030
	MOVWF	r0x1030
	CLRF	r0x1031
	MOVF	r0x1030,W
	BANKSEL	_w
	IORWF	_w,F
	MOVLW	0x00
	IORWF	(_w + 1),F
_00114_DS_:
;	.line	125; "main.c"	CCP1IE = 1;
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,2
;	.line	126; "main.c"	CCP1IF = 0;
	BANKSEL	_PIR1bits
	BCF	_PIR1bits,2
_00116_DS_:
;	.line	128; "main.c"	int_error_cnt++;
	BANKSEL	_int_error_cnt
	INCF	_int_error_cnt,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x65=101), size=1
;	.line	129; "main.c"	if (int_error_cnt > 100)
	MOVLW	0x65
	SUBWF	_int_error_cnt,W
	BTFSS	STATUS,0
	GOTO	_00119_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;	.line	130; "main.c"	SP_send(int_err);
	MOVLW	high (_int_err + 0)
	BANKSEL	r0x1031
	MOVWF	r0x1031
	MOVLW	(_int_err + 0)
	MOVWF	r0x1030
	MOVLW	0x80
	MOVWF	r0x1032
	MOVF	r0x1030,W
	MOVWF	STK01
	MOVF	r0x1031,W
	MOVWF	STK00
	MOVF	r0x1032,W
	PAGESEL	_SP_send
	CALL	_SP_send
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
;   _SP_send
;   _dec_to_ascii
;   _SP_send
;   _dec_to_ascii
;   _SP_send
;   _dec_to_ascii
;   _SP_send
;   _dec_to_ascii
;   _SP_send
;   _SP_send
;   _SP_send
;   _SP_send
;   _SP_send
;   _dec_to_ascii
;   _SP_send
;   _dec_to_ascii
;   _SP_send
;   _dec_to_ascii
;   _SP_send
;   _dec_to_ascii
;   _SP_send
;   _SP_send
;   _SP_send
;   _SP_send
;6 compiler assigned registers:
;   r0x102C
;   r0x102D
;   r0x102E
;   r0x102F
;   STK01
;   STK00
;; Starting pCode block
S_main__main	code
_main:
; 2 exit points
;	.line	190; "main.c"	unsigned char i = 0;
	BANKSEL	r0x102C
	CLRF	r0x102C
;	.line	191; "main.c"	LEDG_TRIS = 0;
	BANKSEL	_TRISBbits
	BCF	_TRISBbits,6
;	.line	192; "main.c"	ADC2_TRIS = 1;
	BSF	_TRISAbits,2
;	.line	193; "main.c"	ADC4_TRIS = 1;
	BSF	_TRISAbits,4
;	.line	194; "main.c"	DAC0_TRIS = 0;
	BCF	_TRISCbits,5
;	.line	195; "main.c"	DAC1_TRIS = 0;
	BCF	_TRISCbits,4
;	.line	196; "main.c"	DAC2_TRIS = 0;
	BCF	_TRISCbits,3
;	.line	197; "main.c"	DAC3_TRIS = 0;
	BCF	_TRISCbits,6
;	.line	198; "main.c"	DAC4_TRIS = 0;
	BCF	_TRISCbits,7
;	.line	199; "main.c"	DAC5_TRIS = 0;
	BCF	_TRISBbits,4
;	.line	200; "main.c"	DAC0_PIN=0;
	BANKSEL	_PORTCbits
	BCF	_PORTCbits,5
;	.line	201; "main.c"	DAC1_PIN=0;
	BCF	_PORTCbits,4
;	.line	202; "main.c"	DAC2_PIN=0;
	BCF	_PORTCbits,3
;	.line	203; "main.c"	DAC3_PIN=0;
	BCF	_PORTCbits,6
;	.line	204; "main.c"	DAC4_PIN=0;
	BCF	_PORTCbits,7
;	.line	205; "main.c"	DAC5_PIN=0;
	BCF	_PORTBbits,4
;	.line	206; "main.c"	RCIN_TRIS=1;            //Input
	BANKSEL	_TRISCbits
	BSF	_TRISCbits,5
;	.line	208; "main.c"	TX_TRIS=0;               // These need to be 0 for USART to work
	BCF	_TRISBbits,7
;	.line	209; "main.c"	RX_TRIS=1;               // These need to be 1 for USART to work
	BSF	_TRISBbits,5
;	.line	210; "main.c"	ADCON1=0x50;             //ADC Settings
	MOVLW	0x50
	MOVWF	_ADCON1
;	.line	211; "main.c"	ANS11=0;                 // Turn off Analog input it necessary to function serial port RX
	BANKSEL	_ANSELHbits
	BCF	_ANSELHbits,3
;	.line	212; "main.c"	ANS10=0;
	BCF	_ANSELHbits,2
;	.line	213; "main.c"	ANS7=0;
	BCF	_ANSELbits,7
;	.line	214; "main.c"	ANS8=0;
	BCF	_ANSELHbits,0
;	.line	215; "main.c"	ANS9=0;
	BCF	_ANSELHbits,1
;	.line	216; "main.c"	ANS4=0;
	BCF	_ANSELbits,4
;	.line	217; "main.c"	ANS2=1;                      //Zapnuti Analogovych vstupu
	BSF	_ANSELbits,2
;	.line	218; "main.c"	ANS3=1;
	BSF	_ANSELbits,3
;	.line	221; "main.c"	SPBRG=8;                // Baud Rate
	MOVLW	0x08
	BANKSEL	_SPBRG
	MOVWF	_SPBRG
;	.line	222; "main.c"	BRGH=1;                 // 115.2k
	BSF	_TXSTAbits,2
;	.line	223; "main.c"	BRG16=1;
	BSF	_BAUDCTLbits,3
;	.line	225; "main.c"	TXEN=1;			// Enable transmission mode
	BSF	_TXSTAbits,5
;	.line	226; "main.c"	SYNC=0;			// Disable Synchronous/Enable Asynchronous
	BCF	_TXSTAbits,4
;	.line	227; "main.c"	SPEN=1;			// Enable serial port
	BANKSEL	_RCSTAbits
	BSF	_RCSTAbits,7
;	.line	241; "main.c"	CCP1CON = 5; // Setup ENHANCED CAPTURE MODULE
	MOVLW	0x05
	MOVWF	_CCP1CON
;	.line	242; "main.c"	CCP1IE = 0;     // ENHANCED CAPTURE MODULE Disabled
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,2
;	.line	248; "main.c"	T1CON = 0;  // TIMER1 presccaler 1
	BANKSEL	_T1CON
	CLRF	_T1CON
;	.line	250; "main.c"	PEIE = 1;       // Enable peripheral interrupts.
	BSF	_INTCONbits,6
;	.line	251; "main.c"	GIE = 1;	// Enable all interrupts.
	BSF	_INTCONbits,7
;	.line	254; "main.c"	TMR1H = 0;
	CLRF	_TMR1H
;	.line	255; "main.c"	TMR1L = 0;
	CLRF	_TMR1L
;	.line	256; "main.c"	CCP1IE = 1;
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,2
;	.line	257; "main.c"	TMR1ON = 1;
	BANKSEL	_T1CONbits
	BSF	_T1CONbits,0
_00202_DS_:
;	.line	262; "main.c"	if (capture){            
	MOVLW	0x00
	BANKSEL	_capture
	IORWF	_capture,W
	BTFSC	STATUS,2
	GOTO	_00198_DS_
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x1D61=7521), size=2
;	.line	263; "main.c"	if (t > MIN_TS && t < MAX_TS && w > MIN_W0 && w < MAX_W0){
	MOVLW	0x1d
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00275_DS_
	MOVLW	0x61
	SUBWF	_t,W
_00275_DS_:
	BTFSS	STATUS,0
	GOTO	_00173_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;;unsigned compare: left < lit(0x1E78=7800), size=2
	MOVLW	0x1e
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00276_DS_
	MOVLW	0x78
	SUBWF	_t,W
_00276_DS_:
	BTFSC	STATUS,0
	GOTO	_00173_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00277_DS_
	MOVLW	0x7d
	SUBWF	_w,W
_00277_DS_:
	BTFSS	STATUS,0
	GOTO	_00173_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
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
	GOTO	_00173_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;	.line	264; "main.c"	SP_send(sync);
	MOVLW	high (_sync + 0)
	BANKSEL	r0x102D
	MOVWF	r0x102D
	MOVLW	(_sync + 0)
	MOVWF	r0x102E
	MOVLW	0x80
	MOVWF	r0x102F
	MOVF	r0x102E,W
	MOVWF	STK01
	MOVF	r0x102D,W
	MOVWF	STK00
	MOVF	r0x102F,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x759=1881), size=2
_00173_DS_:
;	.line	266; "main.c"	if (t > MIN_T && t < MAX_T && t1 > MIN_T && t1 < MAX_T){
	MOVLW	0x07
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00279_DS_
	MOVLW	0x59
	SUBWF	_t,W
_00279_DS_:
	BTFSS	STATUS,0
	GOTO	_00193_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;;unsigned compare: left < lit(0x79E=1950), size=2
	MOVLW	0x07
	BANKSEL	_t
	SUBWF	(_t + 1),W
	BTFSS	STATUS,2
	GOTO	_00280_DS_
	MOVLW	0x9e
	SUBWF	_t,W
_00280_DS_:
	BTFSC	STATUS,0
	GOTO	_00193_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x759=1881), size=2
	MOVLW	0x07
	BANKSEL	_t1
	SUBWF	(_t1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00281_DS_
	MOVLW	0x59
	SUBWF	_t1,W
_00281_DS_:
	BTFSS	STATUS,0
	GOTO	_00193_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;;unsigned compare: left < lit(0x79E=1950), size=2
	MOVLW	0x07
	BANKSEL	_t1
	SUBWF	(_t1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00282_DS_
	MOVLW	0x9e
	SUBWF	_t1,W
_00282_DS_:
	BTFSC	STATUS,0
	GOTO	_00193_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;	.line	269; "main.c"	dec_to_ascii(w1);
	BANKSEL	_w1
	MOVF	_w1,W
	MOVWF	STK00
	MOVF	(_w1 + 1),W
	PAGESEL	_dec_to_ascii
	CALL	_dec_to_ascii
	PAGESEL	$
;	.line	270; "main.c"	SP_send(tab);
	MOVLW	high (_tab + 0)
	BANKSEL	r0x102D
	MOVWF	r0x102D
	MOVLW	(_tab + 0)
	MOVWF	r0x102E
	MOVLW	0x80
	MOVWF	r0x102F
	MOVF	r0x102E,W
	MOVWF	STK01
	MOVF	r0x102D,W
	MOVWF	STK00
	MOVF	r0x102F,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	271; "main.c"	dec_to_ascii(t1);
	BANKSEL	_t1
	MOVF	_t1,W
	MOVWF	STK00
	MOVF	(_t1 + 1),W
	PAGESEL	_dec_to_ascii
	CALL	_dec_to_ascii
	PAGESEL	$
;	.line	272; "main.c"	SP_send(tab);
	MOVLW	high (_tab + 0)
	BANKSEL	r0x102D
	MOVWF	r0x102D
	MOVLW	(_tab + 0)
	MOVWF	r0x102E
	MOVLW	0x80
	MOVWF	r0x102F
	MOVF	r0x102E,W
	MOVWF	STK01
	MOVF	r0x102D,W
	MOVWF	STK00
	MOVF	r0x102F,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	273; "main.c"	dec_to_ascii(w);
	BANKSEL	_w
	MOVF	_w,W
	MOVWF	STK00
	MOVF	(_w + 1),W
	PAGESEL	_dec_to_ascii
	CALL	_dec_to_ascii
	PAGESEL	$
;	.line	274; "main.c"	SP_send(tab);
	MOVLW	high (_tab + 0)
	BANKSEL	r0x102D
	MOVWF	r0x102D
	MOVLW	(_tab + 0)
	MOVWF	r0x102E
	MOVLW	0x80
	MOVWF	r0x102F
	MOVF	r0x102E,W
	MOVWF	STK01
	MOVF	r0x102D,W
	MOVWF	STK00
	MOVF	r0x102F,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	275; "main.c"	dec_to_ascii(t);
	BANKSEL	_t
	MOVF	_t,W
	MOVWF	STK00
	MOVF	(_t + 1),W
	PAGESEL	_dec_to_ascii
	CALL	_dec_to_ascii
	PAGESEL	$
;	.line	276; "main.c"	SP_send(enter);
	MOVLW	high (_enter + 0)
	BANKSEL	r0x102D
	MOVWF	r0x102D
	MOVLW	(_enter + 0)
	MOVWF	r0x102E
	MOVLW	0x80
	MOVWF	r0x102F
	MOVF	r0x102E,W
	MOVWF	STK01
	MOVF	r0x102D,W
	MOVWF	STK00
	MOVF	r0x102F,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x547=1351), size=2
;	.line	292; "main.c"	if (w > MIN_W1 && w < MAX_W1 && w1 > MIN_W1 && w1 < MAX_W1){
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00283_DS_
	MOVLW	0x47
	SUBWF	_w,W
_00283_DS_:
	BTFSS	STATUS,0
	GOTO	_00178_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
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
	GOTO	_00178_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x547=1351), size=2
	MOVLW	0x05
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00285_DS_
	MOVLW	0x47
	SUBWF	_w1,W
_00285_DS_:
	BTFSS	STATUS,0
	GOTO	_00178_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;;unsigned compare: left < lit(0x596=1430), size=2
	MOVLW	0x05
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00286_DS_
	MOVLW	0x96
	SUBWF	_w1,W
_00286_DS_:
	BTFSC	STATUS,0
	GOTO	_00178_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;	.line	293; "main.c"	SP_send(strV1);
	MOVLW	high (_strV1 + 0)
	BANKSEL	r0x102D
	MOVWF	r0x102D
	MOVLW	(_strV1 + 0)
	MOVWF	r0x102E
	MOVLW	0x80
	MOVWF	r0x102F
	MOVF	r0x102E,W
	MOVWF	STK01
	MOVF	r0x102D,W
	MOVWF	STK00
	MOVF	r0x102F,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	298; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	299; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	300; "main.c"	i++;
	BANKSEL	r0x102C
	INCF	r0x102C,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
_00178_DS_:
;	.line	302; "main.c"	if (w > MIN_W0 && w < MAX_W0 && w1 > MIN_W0 && w1 < MAX_W0){
	MOVLW	0x01
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00287_DS_
	MOVLW	0x7d
	SUBWF	_w,W
_00287_DS_:
	BTFSS	STATUS,0
	GOTO	_00183_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
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
	GOTO	_00183_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00289_DS_
	MOVLW	0x7d
	SUBWF	_w1,W
_00289_DS_:
	BTFSS	STATUS,0
	GOTO	_00183_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00290_DS_
	MOVLW	0xc2
	SUBWF	_w1,W
_00290_DS_:
	BTFSC	STATUS,0
	GOTO	_00183_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;	.line	303; "main.c"	SP_send(strV0);
	MOVLW	high (_strV0 + 0)
	BANKSEL	r0x102D
	MOVWF	r0x102D
	MOVLW	(_strV0 + 0)
	MOVWF	r0x102E
	MOVLW	0x80
	MOVWF	r0x102F
	MOVF	r0x102E,W
	MOVWF	STK01
	MOVF	r0x102D,W
	MOVWF	STK00
	MOVF	r0x102F,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	308; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	309; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	310; "main.c"	i++;
	BANKSEL	r0x102C
	INCF	r0x102C,F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x17D=381), size=2
_00183_DS_:
;	.line	312; "main.c"	if (w1 > MIN_W0 && w1 < MAX_W0 && w > MIN_W1 && w < MAX_W1){
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00291_DS_
	MOVLW	0x7d
	SUBWF	_w1,W
_00291_DS_:
	BTFSS	STATUS,0
	GOTO	_00193_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;;unsigned compare: left < lit(0x1C2=450), size=2
	MOVLW	0x01
	BANKSEL	_w1
	SUBWF	(_w1 + 1),W
	BTFSS	STATUS,2
	GOTO	_00292_DS_
	MOVLW	0xc2
	SUBWF	_w1,W
_00292_DS_:
	BTFSC	STATUS,0
	GOTO	_00193_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit(0x547=1351), size=2
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00293_DS_
	MOVLW	0x47
	SUBWF	_w,W
_00293_DS_:
	BTFSS	STATUS,0
	GOTO	_00193_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;;unsigned compare: left < lit(0x596=1430), size=2
	MOVLW	0x05
	BANKSEL	_w
	SUBWF	(_w + 1),W
	BTFSS	STATUS,2
	GOTO	_00294_DS_
	MOVLW	0x96
	SUBWF	_w,W
_00294_DS_:
	BTFSC	STATUS,0
	GOTO	_00193_DS_
;;genSkipc:3257: created from rifx:0x7ffc79079d00
;	.line	313; "main.c"	SP_send(strVF);
	MOVLW	high (_strVF + 0)
	BANKSEL	r0x102D
	MOVWF	r0x102D
	MOVLW	(_strVF + 0)
	MOVWF	r0x102E
	MOVLW	0x80
	MOVWF	r0x102F
	MOVF	r0x102E,W
	MOVWF	STK01
	MOVF	r0x102D,W
	MOVWF	STK00
	MOVF	r0x102F,W
	PAGESEL	_SP_send
	CALL	_SP_send
	PAGESEL	$
;	.line	318; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	319; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	320; "main.c"	i++;
	BANKSEL	r0x102C
	INCF	r0x102C,F
_00193_DS_:
;	.line	323; "main.c"	t1 = t;
	BANKSEL	_t
	MOVF	_t,W
	BANKSEL	_t1
	MOVWF	_t1
	BANKSEL	_t
	MOVF	(_t + 1),W
	BANKSEL	_t1
	MOVWF	(_t1 + 1)
;	.line	324; "main.c"	w1 = w;
	BANKSEL	_w
	MOVF	_w,W
	BANKSEL	_w1
	MOVWF	_w1
	BANKSEL	_w
	MOVF	(_w + 1),W
	BANKSEL	_w1
	MOVWF	(_w1 + 1)
;	.line	325; "main.c"	t = 0;
	BANKSEL	_t
	CLRF	_t
	CLRF	(_t + 1)
;	.line	326; "main.c"	w = 0;
	BANKSEL	_w
	CLRF	_w
	CLRF	(_w + 1)
;	.line	328; "main.c"	capture = 0;
	BANKSEL	_capture
	CLRF	_capture
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x7=7), size=1
_00198_DS_:
;	.line	330; "main.c"	if (i > 6){
	MOVLW	0x07
;	.line	331; "main.c"	i = 0;
	BANKSEL	r0x102C
	SUBWF	r0x102C,W
;	.line	393; "main.c"	int_error_cnt = 0;
	BTFSC	STATUS,0
	CLRF	r0x102C
	BANKSEL	_int_error_cnt
	CLRF	_int_error_cnt
	GOTO	_00202_DS_
	RETURN	
; exit point of _main

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
;   r0x1024
;   STK00
;   r0x1025
;   STK01
;   r0x1026
;   r0x1027
;   r0x1028
;   r0x1029
;   r0x102A
;   r0x102B
;; Starting pCode block
S_main__SP_send	code
_SP_send:
; 2 exit points
;	.line	174; "main.c"	void SP_send(char str[]){
	BANKSEL	r0x1024
	MOVWF	r0x1024
	MOVF	STK00,W
	MOVWF	r0x1025
	MOVF	STK01,W
	MOVWF	r0x1026
;	.line	176; "main.c"	for(i=0; str[i] != '\0'; i++)
	CLRF	r0x1027
_00165_DS_:
	BANKSEL	r0x1027
	MOVF	r0x1027,W
	ADDWF	r0x1026,W
	MOVWF	r0x1028
	MOVF	r0x1025,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1029
	MOVF	r0x1024,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x102A
	MOVF	r0x1028,W
	MOVWF	STK01
	MOVF	r0x1029,W
	MOVWF	STK00
	MOVF	r0x102A,W
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x102B
	MOVWF	r0x102B
	MOVF	r0x102B,W
	BTFSC	STATUS,2
	GOTO	_00167_DS_
;	.line	181; "main.c"	circBufPush(str[i]);
	MOVF	r0x102B,W
	PAGESEL	_circBufPush
	CALL	_circBufPush
	PAGESEL	$
;	.line	176; "main.c"	for(i=0; str[i] != '\0'; i++)
	BANKSEL	r0x1027
	INCF	r0x1027,F
	GOTO	_00165_DS_
_00167_DS_:
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
;9 compiler assigned registers:
;   r0x1024
;   STK00
;   r0x1025
;   r0x1026
;   STK02
;   STK01
;   r0x1027
;   r0x1028
;   r0x1029
;; Starting pCode block
S_main__dec_to_ascii	code
_dec_to_ascii:
; 2 exit points
;	.line	148; "main.c"	void dec_to_ascii(unsigned short dec){
	BANKSEL	r0x1024
	MOVWF	r0x1024
	MOVF	STK00,W
	MOVWF	r0x1025
;	.line	152; "main.c"	for (i = 0 ; dec != 0 || i == 0; i++)
	CLRF	r0x1026
_00156_DS_:
	BANKSEL	r0x1025
	MOVF	r0x1025,W
	IORWF	r0x1024,W
	BTFSS	STATUS,2
	GOTO	_00155_DS_
	MOVF	r0x1026,W
	BTFSS	STATUS,2
	GOTO	_00158_DS_
_00155_DS_:
;	.line	154; "main.c"	number = (dec % 10);
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	BANKSEL	r0x1025
	MOVF	r0x1025,W
	MOVWF	STK00
	MOVF	r0x1024,W
	PAGESEL	__moduint
	CALL	__moduint
	PAGESEL	$
;;1	MOVWF	r0x1027
	MOVF	STK00,W
;;1	MOVWF	r0x1028
	BANKSEL	r0x1029
	MOVWF	r0x1029
;	.line	155; "main.c"	dec /= 10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1025,W
	MOVWF	STK00
	MOVF	r0x1024,W
	PAGESEL	__divuint
	CALL	__divuint
	PAGESEL	$
	BANKSEL	r0x1024
	MOVWF	r0x1024
	MOVF	STK00,W
	MOVWF	r0x1025
;	.line	156; "main.c"	number += 48;
	MOVLW	0x30
	ADDWF	r0x1029,F
;	.line	157; "main.c"	circBufPush(number);
	MOVF	r0x1029,W
	PAGESEL	_circBufPush
	CALL	_circBufPush
	PAGESEL	$
;	.line	152; "main.c"	for (i = 0 ; dec != 0 || i == 0; i++)
	BANKSEL	r0x1026
	INCF	r0x1026,F
	GOTO	_00156_DS_
_00158_DS_:
	RETURN	
; exit point of _dec_to_ascii

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;6 compiler assigned registers:
;   r0x101F
;   r0x1020
;   r0x1021
;   r0x1022
;   STK00
;   r0x1023
;; Starting pCode block
S_main__circBufPush	code
_circBufPush:
; 2 exit points
;	.line	133; "main.c"	int circBufPush(uint8_t data){
	BANKSEL	r0x101F
	MOVWF	r0x101F
;	.line	134; "main.c"	uint8_t next = buf_head + 1;
	BANKSEL	_buf_head
	MOVF	_buf_head,W
	BANKSEL	r0x1020
	MOVWF	r0x1020
	INCF	r0x1020,F
;;unsigned compare: left < lit(0x10=16), size=1
;	.line	135; "main.c"	if (next >= BUF_SIZE)
	MOVLW	0x10
;	.line	136; "main.c"	next = 0;
	SUBWF	r0x1020,W
;	.line	139; "main.c"	if (next == buf_tail)
	BTFSC	STATUS,0
	CLRF	r0x1020
	MOVF	r0x1020,W
	MOVWF	r0x1021
	CLRF	r0x1022
	BANKSEL	_buf_tail
	MOVF	_buf_tail,W
	BANKSEL	r0x1021
	XORWF	r0x1021,W
	BTFSS	STATUS,2
	GOTO	_00147_DS_
	BANKSEL	_buf_tail
	MOVF	(_buf_tail + 1),W
	BANKSEL	r0x1022
	XORWF	r0x1022,W
	BTFSS	STATUS,2
	GOTO	_00147_DS_
;	.line	140; "main.c"	return -1;  // quit with an error
	MOVLW	0xff
	MOVWF	STK00
	MOVLW	0xff
	GOTO	_00148_DS_
_00147_DS_:
;	.line	142; "main.c"	buf[buf_head] = data;
	BANKSEL	_buf_head
	MOVF	_buf_head,W
	ADDLW	(_buf + 0)
	BANKSEL	r0x1020
	MOVWF	r0x1020
	MOVLW	high (_buf + 0)
	MOVWF	r0x1023
	BANKSEL	_buf_head
	MOVF	(_buf_head + 1),W
	BTFSC	STATUS,0
	INCF	(_buf_head + 1),W
	BTFSC	STATUS,2
	GOTO	_00001_DS_
	BANKSEL	r0x1023
	ADDWF	r0x1023,F
_00001_DS_:
	BANKSEL	r0x1020
	MOVF	r0x1020,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1023
	BTFSC	r0x1023,0
	BSF	STATUS,7
	MOVF	r0x101F,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	143; "main.c"	buf_head = next;
	BANKSEL	r0x1021
	MOVF	r0x1021,W
	BANKSEL	_buf_head
	MOVWF	_buf_head
	BANKSEL	r0x1022
	MOVF	r0x1022,W
	BANKSEL	_buf_head
	MOVWF	(_buf_head + 1)
;	.line	144; "main.c"	TXIE = 1;       //Enables the EUSART transmit interrupt
	BANKSEL	_PIE1bits
	BSF	_PIE1bits,4
;	.line	145; "main.c"	return 0;
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
_00148_DS_:
	RETURN	
; exit point of _circBufPush


;	code size estimation:
;	  615+  181 =   796 instructions ( 1954 byte)

	end
