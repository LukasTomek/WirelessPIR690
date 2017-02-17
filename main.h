/* 
 * File:   main.h
 * Author: lukas
 *
 * Created on 05 January 2017, 20:08
 */

#ifndef MAIN_H
#define	MAIN_H

#ifdef	__cplusplus
extern "C" {
#endif
    #define RCIN_TRIS   TRISC5              // Wireless input
    #define RCIN_PIN    RC5                 // Wireless input
	
    #define TX_TRIS		TRISB7
    #define RX_TRIS		TRISB5
	
    #define ADC11_TRIS	TRISB5
    #define ADC10_TRIS	TRISB4
    #define ADC9_TRIS	TRISC7
	#define ADC8_TRIS	TRISC6
    #define ADC7_TRIS	TRISC3
    #define ADC6_TRIS	TRISC2
	#define ADC5_TRIS	TRISC1
    #define ADC4_TRIS	TRISC0
	#define ADC3_TRIS	TRISA4
    #define ADC2_TRIS	TRISA2
	#define ADC1_TRIS	TRISA1
    #define ADC0_TRIS	TRISA0
	
    #define OUT_TRIS	TRISC0
    #define OUT_PIN     RC0
    //#define LEDG_TRIS	TRISB6
    //#define LEDG_PIN	RB6
    //#define LEDR_TRIS	TRISA2
    //#define LEDR_PIN	RA2
    int circBufPush(uint8_t data);
    

#ifdef	__cplusplus
}
#endif

#endif	/* MAIN_H */

