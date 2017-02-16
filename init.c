#include <pic16f690.h>
#include <stdint.h>
#include "main.h"

void init() {

//    LEDG_TRIS = 0;
    ADC11_TRIS = 1;
    ADC10_TRIS = 1;
	ADC9_TRIS = 1;
    ADC8_TRIS = 1;
	ADC7_TRIS = 1;
    ADC6_TRIS = 1;
	ADC5_TRIS = 1;
    ADC4_TRIS = 1;
	ADC3_TRIS = 1;
    ADC2_TRIS = 1;
    ADC1_TRIS = 1;
    ADC0_TRIS = 1;
	
    RCIN_TRIS=1;            //Input
    
    TX_TRIS=0;               // These need to be 0 for USART to work
    RX_TRIS=1;               // These need to be 1 for USART to work
    ADCON1=0x50;             //ADC Settings
    ANS11=1;                 // Turn off Analog input it necessary to function serial port RX
    ANS10=1;
	ANS9=1;
	ANS8=1;
    ANS7=1;
    ANS6=1;
    ANS5=1;
    ANS4=1;
    ANS3=1;                      //Zapnuti Analogovych vstupu
    ANS2=1;
	ANS1=1;
	ANS0=1;

    OUT_TRIS=0;             //Output
    
    // USART
	
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
    /*
    PS<2:0>: Prescaler Rate Select bits
Bit Value Timer0 Rate WDT Rate
000 1 : 2
001 1 : 4
010 1 : 8
011 1 : 16
100 1 : 32
101 1 : 64
110 1 : 128
111 1 : 256*/ 
    
    T0CS = 0;	// Clear to enable timer mode.
	PSA = 0;	// Clear to assign prescaler to Timer 0.
    PS2 = 1;	// Set up prescaler to 1:1.
	PS1 = 1;
	PS0 = 0;


	
	//T0IE = 1;	// Set Timer 0 to 0.
	//TMR0 = 0;	// Enable timer
    
    /*T1CKPS<1:0>: Timer1 Input Clock Prescale Select bits
	11 = 1:8 Prescale Value
    10 = 1:4 Prescale Value
    01 = 1:2 Prescale Value
    00 = 1:1 Prescale Value*/
    /*
    T1CKPS0 = 1;
    T1CKPS1 = 1;
    TMR1CS = 0; // Internal clock for TIMER1 
    T1SYNC = 0; // sync mode
    T1OSCEN = 0; // LP osc off
    TMR1ON = 0; // TIMER1 off*/
    T1CON = 0;  // TIMER1 presccaler 1
    //T1IF = 0;
//	T1CKPS0 = 1;
//    T1CKPS1 = 1;
	
	
    // Setup ENHANCED CAPTURE MODULE
    CCP1CON = 5; 
    CCP1IE = 0;     // ENHANCED CAPTURE MODULE Interrupt Disabled
    CCP1IF = 0;

    
	//T1CKPS =
	
	//TODO change timer 1 prescaler to 1:8 for testing
	
        
    PEIE = 1;       // Enable peripheral interrupts.
    GIE = 1;	// Enable all interrupts.
//    LEDG_PIN = 1;
//    LEDR_PIN = 1;
    TMR1H = 0;
    TMR1L = 0;
    CCP1IE = 1;
    TMR1ON = 1;
}
