/*
   File:   main.c
   Author: recaro

   Created on 20. říjen 2011, 14:19
 */
#include <pic16f690.h>
#include <stdint.h> //Needed for uint16_t
#include "init.h"

#define MIN_W0      380
#define MAX_W0      450
#define MIN_W1      1350
#define MAX_W1      1430
#define MIN_T       1880
#define MAX_T       1950
#define MIN_TS      4*1880
#define MAX_TS      4*1950
#define BUF_SIZE    16

typedef unsigned int word;
/*
typedef struct
{
    uint16_t buffer[BUF_SIZE];
    int head;
    int tail;
}circBuf_t;
*/
/*
typedef enum {
    
    
};
*/

typedef enum {
    FALSE,
    TRUE
} boolean;

typedef enum {
    FALING,
    RISING
} PulseEdge;

struct {
     unsigned Capture:1;
     unsigned Edge:1;
     unsigned Hint:1;
} bitfield;

// internal oscilator 8Mhz divided by 2 by default
word __at 0x2007 CONFIG = _INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF; 

const char strV0[]={'0', ' ', '\n' ,'\0'};
const char strV1[]={'1', ' ', '\n' ,'\0'};
const char strVF[]={'F', ' ', '\n' ,'\0'};
const char strw[]={'w', ':', ' ' ,'\0'};
const char strt[]={'t', ':', ' ' ,'\0'};
const char strw1[]={'w', '1', ':', ' ' ,'\0'};
const char strt1[]={'t', '1', ':', ' ' ,'\0'};
const char tab[]={'\t' ,'\0'};
const char enter[]={'\n' ,'\0'};
const char sync[]={'S', 'Y', 'N', 'C', '\n' ,'\0'};
const char int_err[]={'I', 'N', 'T', ' ', 'E', 'R', 'R', '\n' ,'\0'};
const char buf_err[]={'B', 'U', 'F', 'F', 'E', 'R', ' ', 'O', 'W', 'E', 'R', 
                        'F', 'L', 'O', 'W', '\n' ,'\0'};

unsigned short w = 0;
unsigned short t = 0;
unsigned short w1 = 0;
unsigned short t1 = 0;
uint8_t buf[BUF_SIZE];
uint8_t buf_head = 0;
uint8_t buf_tail = 0;
uint8_t int_error_cnt = 0;

void SP_send(char str[]);
int circBufPush(uint8_t data);
void dec_to_ascii(unsigned short dec);
void SP_send_error(char str[]);

void receive_intr() __interrupt 0 {
    int next;
    if(TXIF){
        // if the head isn't ahead of the tail, we don't have any characters
        if (buf_head == buf_tail){
            TXIE = 0;
        }
        else{
            //return -1;  // quit with an error

            TXREG = buf[buf_tail];
            buf[buf_tail] = 0;  // clear the data (optional)

            next = buf_tail + 1;
            if(next >= BUF_SIZE)
                next = 0;

            buf_tail = next;
        }
        //return 0;
    }
    if(CCP1IF){
        CCP1IE = FALSE;
        
        if(CCP1M0){                     // if ECCP mode is Rising edge CCP1M0
            CCP1M0 = FALING;                 // set falling edge
            TMR1H = 0;
            TMR1L = 0;
            t = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
            t = t << 8;
            t = t | CCPR1L;             //ECCP combined 16 bit number formation
            bitfield.Capture = TRUE;
        }
        else{
            CCP1M0 = RISING;
            w = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
            w = w << 8;
            w = w | CCPR1L;             //ECCP combined 16 bit number formation
            //bitfield.Capture = TRUE;
        }
        CCP1IE = 1;
        CCP1IF = 0;                     //Clear interrupt flag
    }
    int_error_cnt++;
    if (int_error_cnt > 100)
        SP_send_error(int_err);
}

int main(void) {
    uint8_t i = 0;
    uint8_t hint = 0;
    init();
    while(1)
    {

        if (bitfield.Capture){
                dec_to_ascii(w);
                SP_send(tab);
                dec_to_ascii(t);
                SP_send(enter);
            /*if (t > MIN_TS && t < MAX_TS && w > MIN_W0 && w < MAX_W0){
               SP_send(sync);
            }*/
            if (t > MIN_T && t < MAX_T && t1 > MIN_T && t1 < MAX_T){
                bitfield.Hint = TRUE;
            }
            if (i < 100 && bitfield.Hint){
                dec_to_ascii(w);
                SP_send(tab);
                dec_to_ascii(t);
                SP_send(enter);
                i++;
            }
            t1 = t;
            w1 = w;
            bitfield.Capture = FALSE;

        }
        int_error_cnt = 0;
    }
}

int circBufPush(uint8_t data){
    uint8_t next = buf_head + 1;
    if (next >= BUF_SIZE)
        next = 0;
 
    // Cicular buffer is full
    if (next == buf_tail){
        SP_send_error(buf_err);
        return -1;  // quit with an error
    }
        
    buf[buf_head] = data;
    buf_head = next;
    TXIE = 1;       //Enables the EUSART transmit interrupt
    return 0;
}
/*
void dec_to_ascii(unsigned short dec){
	uint8_t number = 0;
	uint8_t i = 0;
    
    for (i = 0 ; dec != 0 || i == 0; i++)
    {
        number = (dec % 10);
        dec /= 10;
        number += 48;
        circBufPush(number);
	}
}*/
void dec_to_ascii(unsigned short dec)
{
	static unsigned char number[4];
	static unsigned char i;

    for (i=0 ; dec!=0; i++)
    {
        number[i]=(dec % 10);
        dec /=10;
        number[i] +=48;
	}
	while (i--)
	{
		circBufPush(number[i]);	// Add a character to the output buffer
		//while(!TXIF);       // Wait while the output buffer is full*/
	}
}

void SP_send(char str[]){
	uint8_t i;
	for(i=0; str[i] != '\0'; i++)
	{
        circBufPush(str[i]);
	}
}

void SP_send_error(char str[])
{
	uint8_t i;
    GIE = FALSE;	// Disable all interrupts.
	for(i=0; str[i] != '\0'; i++)
	{
		TXREG=str[i];	// Add a character to the output buffer
		while(!TXIF);	// Wait while the output buffer is full
	}
}