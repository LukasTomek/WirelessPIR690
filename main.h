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
    #define ADC2_TRIS	TRISA2
    #define ADC4_TRIS	TRISA4
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

