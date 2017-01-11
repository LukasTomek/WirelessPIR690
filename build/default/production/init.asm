;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"init.c"
	list	p=16f690
	radix dec
	include "p16f690.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
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

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_init

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_init	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_init__init	code
_init:
; 2 exit points
;	.line	8; "init.c"	ADC2_TRIS = 1;
	BANKSEL	_TRISAbits
	BSF	_TRISAbits,2
;	.line	9; "init.c"	ADC4_TRIS = 1;
	BSF	_TRISAbits,4
;	.line	11; "init.c"	RCIN_TRIS=1;            //Input
	BSF	_TRISCbits,5
;	.line	13; "init.c"	TX_TRIS=0;               // These need to be 0 for USART to work
	BCF	_TRISBbits,7
;	.line	14; "init.c"	RX_TRIS=1;               // These need to be 1 for USART to work
	BSF	_TRISBbits,5
;	.line	15; "init.c"	ADCON1=0x50;             //ADC Settings
	MOVLW	0x50
	MOVWF	_ADCON1
;	.line	16; "init.c"	ANS11=0;                 // Turn off Analog input it necessary to function serial port RX
	BANKSEL	_ANSELHbits
	BCF	_ANSELHbits,3
;	.line	17; "init.c"	ANS10=0;
	BCF	_ANSELHbits,2
;	.line	18; "init.c"	ANS7=0;
	BCF	_ANSELbits,7
;	.line	19; "init.c"	ANS8=0;
	BCF	_ANSELHbits,0
;	.line	20; "init.c"	ANS9=0;
	BCF	_ANSELHbits,1
;	.line	21; "init.c"	ANS4=0;
	BCF	_ANSELbits,4
;	.line	22; "init.c"	ANS2=1;                      //Zapnuti Analogovych vstupu
	BSF	_ANSELbits,2
;	.line	23; "init.c"	ANS3=1;
	BSF	_ANSELbits,3
;	.line	27; "init.c"	SPBRG=8;                // Baud Rate
	MOVLW	0x08
	BANKSEL	_SPBRG
	MOVWF	_SPBRG
;	.line	28; "init.c"	BRGH=1;                 // 115.2k
	BSF	_TXSTAbits,2
;	.line	29; "init.c"	BRG16=1;
	BSF	_BAUDCTLbits,3
;	.line	31; "init.c"	TXEN=1;			// Enable transmission mode
	BSF	_TXSTAbits,5
;	.line	32; "init.c"	SYNC=0;			// Disable Synchronous/Enable Asynchronous
	BCF	_TXSTAbits,4
;	.line	33; "init.c"	SPEN=1;			// Enable serial port
	BANKSEL	_RCSTAbits
	BSF	_RCSTAbits,7
;	.line	44; "init.c"	T0CS = 0;	// Clear to enable timer mode.
	BANKSEL	_OPTION_REGbits
	BCF	_OPTION_REGbits,5
;	.line	45; "init.c"	PSA = 0;	// Clear to assign prescaler to Timer 0.
	BCF	_OPTION_REGbits,3
;	.line	46; "init.c"	PS2 = 0;	// Set up prescaler to 1:1.
	BCF	_OPTION_REGbits,2
;	.line	47; "init.c"	PS1 = 0;
	BCF	_OPTION_REGbits,1
;	.line	48; "init.c"	PS0 = 0;
	BCF	_OPTION_REGbits,0
;	.line	67; "init.c"	T1CON = 0;  // TIMER1 presccaler 1
	BANKSEL	_T1CON
	CLRF	_T1CON
;	.line	68; "init.c"	T1IF = 0;
	BCF	_PIR1bits,0
;	.line	70; "init.c"	CCP1CON = 5; 
	MOVLW	0x05
	MOVWF	_CCP1CON
;	.line	71; "init.c"	CCP1IE = 0;     // ENHANCED CAPTURE MODULE Interrupt Disabled
	BANKSEL	_PIE1bits
	BCF	_PIE1bits,2
;	.line	72; "init.c"	CCP1IF = 0;
	BANKSEL	_PIR1bits
	BCF	_PIR1bits,2
;	.line	80; "init.c"	PEIE = 1;       // Enable peripheral interrupts.
	BSF	_INTCONbits,6
;	.line	81; "init.c"	GIE = 1;	// Enable all interrupts.
	BSF	_INTCONbits,7
;	.line	84; "init.c"	TMR1H = 0;
	CLRF	_TMR1H
;	.line	85; "init.c"	TMR1L = 0;
	CLRF	_TMR1L
;	.line	87; "init.c"	TMR1ON = 1;
	BSF	_T1CONbits,0
	RETURN	
; exit point of _init


;	code size estimation:
;	   39+    8 =    47 instructions (  110 byte)

	end
