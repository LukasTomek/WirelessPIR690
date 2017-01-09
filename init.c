#include <pic16f690.h>
#include <stdint.h>
#include "main.h"

void init() {

//    LEDG_TRIS = 0;
    ADC2_TRIS = 1;
    ADC4_TRIS = 1;

    RCIN_TRIS=1;            //Input
    
    TX_TRIS=0;               // These need to be 0 for USART to work
    RX_TRIS=1;               // These need to be 1 for USART to work
    ADCON1=0x50;             //ADC Settings
    ANS11=0;                 // Turn off Analog input it necessary to function serial port RX
    ANS10=0;
    ANS7=0;
    ANS8=0;
    ANS9=0;
    ANS4=0;
    ANS2=1;                      //Zapnuti Analogovych vstupu
    ANS3=1;

    
    SPBRG=8;                // Baud Rate
    BRGH=1;                 // 115.2k
    BRG16=1;
    
    TXEN=1;			// Enable transmission mode
    SYNC=0;			// Disable Synchronous/Enable Asynchronous
    SPEN=1;			// Enable serial port

    //RCIE = 1;
    //CREN = 1;
/*
    T0CS = 0;	// Clear to enable timer mode.
	PSA = 0;	// Clear to assign prescaler to Timer 0.
    PS2 = 1;	// Set up prescaler to 1:256.
	PS1 = 1;
	PS0 = 1;*/
    
    T0CS = 0;	// Clear to enable timer mode.
	PSA = 0;	// Clear to assign prescaler to Timer 0.
    PS2 = 0;	// Set up prescaler to 1:256.
	PS1 = 0;
	PS0 = 0;

	//T0IE = 1;	// Set Timer 0 to 0.
	//TMR0 = 0;	// Enable timer
    
    CCP1CON = 5; // Setup ENHANCED CAPTURE MODULE
    CCP1IE = 0;     // ENHANCED CAPTURE MODULE Interrupt Disabled
    CCP1IF = 0;
   /* T1CKPS = 0; //TIMER1 presccaler 1
    TMR1CS = 0; // Internal clock for TIMER1 
    T1SYNC = 0; // sync mode
    T1OSCEN = 0; // LP osc off
    TMR1ON = 0; // TIMER1 off*/
    T1CON = 0;  // TIMER1 presccaler 1
        
    PEIE = 1;       // Enable peripheral interrupts.
    GIE = 1;	// Enable all interrupts.
//    LEDG_PIN = 1;
//    LEDR_PIN = 1;
    TMR1H = 0;
    TMR1L = 0;
    CCP1IE = 1;
    TMR1ON = 1;
}
