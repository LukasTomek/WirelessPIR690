;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"str.c"
	list	p=16f690
	radix dec
	include "p16f690.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_circBufPush
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
	extern	__gptrget1

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
	global	_uint8_send
	global	_SP_send
	global	_SP_send_buf
	global	_dec_to_ascii_buf

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_str_0	udata
r0x1016	res	1
r0x1015	res	1
r0x1017	res	1
r0x1018	res	1
r0x1019	res	1
r0x101C	res	1
r0x100F	res	1
r0x100E	res	1
r0x100D	res	1
r0x1010	res	1
r0x1011	res	1
r0x1012	res	1
r0x1013	res	1
r0x1014	res	1
r0x1007	res	1
r0x1006	res	1
r0x1005	res	1
r0x1008	res	1
r0x1009	res	1
r0x100A	res	1
r0x100B	res	1
r0x100C	res	1
_dec_to_ascii_buf_number_1_7	res	5
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
code_str	code
;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
S_str__uint8_send	code
_uint8_send:
; 2 exit points
;	.line	62; "str.c"	void uint8_send(uint8_t uint){
	BANKSEL	_TXREG
	MOVWF	_TXREG
_00144_DS_:
;	.line	64; "str.c"	while(!TXIF);	// Wait while the output buffer is full
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,4
	GOTO	_00144_DS_
	RETURN	
; exit point of _uint8_send

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   __gptrget1
;   __gptrget1
;10 compiler assigned registers:
;   r0x1005
;   STK00
;   r0x1006
;   STK01
;   r0x1007
;   r0x1008
;   r0x1009
;   r0x100A
;   r0x100B
;   r0x100C
;; Starting pCode block
S_str__SP_send	code
_SP_send:
; 2 exit points
;	.line	52; "str.c"	void SP_send(char str[])
	BANKSEL	r0x1005
	MOVWF	r0x1005
	MOVF	STK00,W
	MOVWF	r0x1006
	MOVF	STK01,W
	MOVWF	r0x1007
;	.line	55; "str.c"	for(i=0; str[i] != '\0'; i++)
	CLRF	r0x1008
_00137_DS_:
	BANKSEL	r0x1008
	MOVF	r0x1008,W
	ADDWF	r0x1007,W
	MOVWF	r0x1009
	MOVF	r0x1006,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x100A
	MOVF	r0x1005,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x100B
	MOVF	r0x1009,W
	MOVWF	STK01
	MOVF	r0x100A,W
	MOVWF	STK00
	MOVF	r0x100B,W
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x100C
	MOVWF	r0x100C
	MOVF	r0x100C,W
	BTFSC	STATUS,2
	GOTO	_00139_DS_
;	.line	57; "str.c"	TXREG=str[i];	// Add a character to the output buffer
	MOVF	r0x100C,W
	BANKSEL	_TXREG
	MOVWF	_TXREG
_00132_DS_:
;	.line	58; "str.c"	while(!TXIF);	// Wait while the output buffer is full
	BANKSEL	_PIR1bits
	BTFSS	_PIR1bits,4
	GOTO	_00132_DS_
;	.line	55; "str.c"	for(i=0; str[i] != '\0'; i++)
	BANKSEL	r0x1008
	INCF	r0x1008,F
	GOTO	_00137_DS_
_00139_DS_:
	RETURN	
; exit point of _SP_send

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
;   r0x100D
;   STK00
;   r0x100E
;   STK01
;   r0x100F
;   r0x1010
;   r0x1011
;   r0x1012
;   r0x1013
;   r0x1014
;; Starting pCode block
S_str__SP_send_buf	code
_SP_send_buf:
; 2 exit points
;	.line	44; "str.c"	void SP_send_buf(char str[]){
	BANKSEL	r0x100D
	MOVWF	r0x100D
	MOVF	STK00,W
	MOVWF	r0x100E
	MOVF	STK01,W
	MOVWF	r0x100F
;	.line	46; "str.c"	for(i=0; str[i] != '\0'; i++)
	CLRF	r0x1010
_00125_DS_:
	BANKSEL	r0x1010
	MOVF	r0x1010,W
	ADDWF	r0x100F,W
	MOVWF	r0x1011
	MOVF	r0x100E,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1012
	MOVF	r0x100D,W
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1013
	MOVF	r0x1011,W
	MOVWF	STK01
	MOVF	r0x1012,W
	MOVWF	STK00
	MOVF	r0x1013,W
	PAGESEL	__gptrget1
	CALL	__gptrget1
	PAGESEL	$
	BANKSEL	r0x1014
	MOVWF	r0x1014
	MOVF	r0x1014,W
	BTFSC	STATUS,2
	GOTO	_00127_DS_
;	.line	48; "str.c"	circBufPush(str[i]);
	MOVF	r0x1014,W
	PAGESEL	_circBufPush
	CALL	_circBufPush
	PAGESEL	$
;	.line	46; "str.c"	for(i=0; str[i] != '\0'; i++)
	BANKSEL	r0x1010
	INCF	r0x1010,F
	GOTO	_00125_DS_
_00127_DS_:
	RETURN	
; exit point of _SP_send_buf

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
;   r0x1015
;   STK00
;   r0x1016
;   r0x1017
;   r0x1018
;   r0x1019
;   STK02
;   STK01
;   r0x101A
;   r0x101B
;   r0x101C
;; Starting pCode block
S_str__dec_to_ascii_buf	code
_dec_to_ascii_buf:
; 2 exit points
;	.line	6; "str.c"	void dec_to_ascii_buf(unsigned short dec)
	BANKSEL	r0x1015
	MOVWF	r0x1015
	MOVF	STK00,W
	MOVWF	r0x1016
;	.line	11; "str.c"	for (i=0 ; dec!=0 || i == 0; i++)
	CLRF	r0x1017
_00111_DS_:
	BANKSEL	r0x1016
	MOVF	r0x1016,W
	IORWF	r0x1015,W
	BTFSS	STATUS,2
	GOTO	_00110_DS_
	MOVF	r0x1017,W
	BTFSS	STATUS,2
	GOTO	_00118_DS_
_00110_DS_:
;	.line	13; "str.c"	number[i] = (dec % 10);
	BANKSEL	r0x1017
	MOVF	r0x1017,W
	ADDLW	(_dec_to_ascii_buf_number_1_7 + 0)
	MOVWF	r0x1018
	MOVLW	high (_dec_to_ascii_buf_number_1_7 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1019
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1016,W
	MOVWF	STK00
	MOVF	r0x1015,W
	PAGESEL	__moduint
	CALL	__moduint
	PAGESEL	$
;;1	MOVWF	r0x101A
	MOVF	STK00,W
;;1	MOVWF	r0x101B
	BANKSEL	r0x101C
	MOVWF	r0x101C
	MOVF	r0x1018,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1019
	BTFSC	r0x1019,0
	BSF	STATUS,7
	MOVF	r0x101C,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	14; "str.c"	dec /= 10;
	MOVLW	0x0a
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	BANKSEL	r0x1016
	MOVF	r0x1016,W
	MOVWF	STK00
	MOVF	r0x1015,W
	PAGESEL	__divuint
	CALL	__divuint
	PAGESEL	$
	BANKSEL	r0x1015
	MOVWF	r0x1015
	MOVF	STK00,W
	MOVWF	r0x1016
;	.line	15; "str.c"	number[i] += 48;
	MOVLW	0x30
	ADDWF	r0x101C,F
	MOVF	r0x1018,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1019
	BTFSC	r0x1019,0
	BSF	STATUS,7
	MOVF	r0x101C,W
	BANKSEL	INDF
	MOVWF	INDF
;	.line	11; "str.c"	for (i=0 ; dec!=0 || i == 0; i++)
	BANKSEL	r0x1017
	INCF	r0x1017,F
	GOTO	_00111_DS_
_00118_DS_:
;	.line	17; "str.c"	while (i--)
	BANKSEL	r0x1017
	MOVF	r0x1017,W
	MOVWF	r0x1016
_00106_DS_:
	BANKSEL	r0x1016
	MOVF	r0x1016,W
	MOVWF	r0x1015
	DECF	r0x1016,F
	MOVF	r0x1015,W
	BTFSC	STATUS,2
	GOTO	_00113_DS_
;	.line	19; "str.c"	circBufPush(number[i]);	// Add a character to the output buffer
	MOVF	r0x1016,W
	ADDLW	(_dec_to_ascii_buf_number_1_7 + 0)
	MOVWF	r0x1015
	MOVLW	high (_dec_to_ascii_buf_number_1_7 + 0)
	BTFSC	STATUS,0
	ADDLW	0x01
	MOVWF	r0x1017
	MOVF	r0x1015,W
	BANKSEL	FSR
	MOVWF	FSR
	BCF	STATUS,7
	BANKSEL	r0x1017
	BTFSC	r0x1017,0
	BSF	STATUS,7
	BANKSEL	INDF
	MOVF	INDF,W
	BANKSEL	r0x1018
	MOVWF	r0x1018
	PAGESEL	_circBufPush
	CALL	_circBufPush
	PAGESEL	$
	GOTO	_00106_DS_
_00113_DS_:
	RETURN	
; exit point of _dec_to_ascii_buf


;	code size estimation:
;	  152+   43 =   195 instructions (  476 byte)

	end
