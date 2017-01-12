/*
   File:   main.c
   Author: recaro

   Created on 20. říjen 2011, 14:19
 */
#include <pic16f690.h>
#include <stdint.h> //Needed for uint16_t
#include "main.h"
#include "init.h"
#include "str.h"

#define MIN_W0      380
#define MAX_W0      450
#define MIN_W1      1350
#define MAX_W1      1430
#define MIN_T       1880
#define MAX_T       1950
#define MIN_TS      8100
#define MAX_TS      8200
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
const char pir1[]={'P', 'I', 'R', '1', ':', ' ','\0'};
const char pir2[]={'P', 'I', 'R', '2', ':', ' ','\0'};
const char pie1[]={'P', 'I', 'E', '1', ':', ' ','\0'};
const char pie2[]={'P', 'I', 'E', '2', ':', ' ','\0'};
const char tim0_owf[]={'T', 'I', 'M', '0', ' ', 'O', 'W', 'F', '\n' ,'\0'};

unsigned short w = 0;
unsigned short t = 0;
unsigned short w1 = 0;
unsigned short t1 = 0;
uint16_t bw[10];
uint16_t bt[10];
uint8_t buf[BUF_SIZE];
uint8_t buf_head = 0;
uint8_t buf_tail = 0;
uint8_t int_error_cnt = 0;
uint8_t t2 = 0;
uint8_t w2 = 0;
uint8_t Tim0owerflowCnt = 0;
/*uint16_t
uint16_t   */    




void receive_intr() __interrupt 0 {
    int next;
    if(T0IF){
        T0IF = 0;
        TMR0 = 0;	// Enable timer
        Tim0owerflowCnt++; 
        //SP_send(tim0_owf);
    }
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
	/*TMR1H = 0;
	TMR1L = 0;*/
    if(CCP1IF){
        CCP1IE = FALSE;
        
        if(CCP1M0){                     // if ECCP mode is Rising edge CCP1M0
            CCP1M0 = FALING;                 // set falling edge
//            CCPR1H = 0;
//            CCPR1L = 0;
            TMR1H = 0;
            TMR1L = 0;
            t=0;
            t = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
            t = t << 8;
            t = t | CCPR1L;             //ECCP combined 16 bit number formation*/
//            t2 = CCPR1L;
            bitfield.Capture = TRUE;
        }
        else{
            CCP1M0 = RISING;
            w=0;
            w = 0x0000 | CCPR1H;        //ECCP result higher 8 bits
            w = w << 8;
            w = w | CCPR1L;             //ECCP combined 16 bit number formation
//            wC2 = CCPR1L;
//            bitfield.Capture = TRUE;
        }
        CCP1IE = 1;
        CCP1IF = 0;                     //Clear interrupt flag
		/*t = 0x0000 | TMR1H;        //ECCP result higher 8 bits
        t = t << 8;
        t = t | TMR1L;             //ECCP combined 16 bit number formation
        dec_to_ascii(t);
		SP_send(enter);*/
    }
    int_error_cnt++;
    /*if (int_error_cnt > 100){
        SP_send_error(int_err);
    
        SP_send_error(pie1);
        uint8_to_ascii(PIE1);
        SP_send_error(enter);

        SP_send_error(pie2);
        uint8_to_ascii(PIE2);
    //        puint8_to_ascii(PIE2_ADDR);
            SP_send_error(enter);

        SP_send_error(pir1);
        uint8_to_ascii(PIR1);
    //        puint8_to_ascii(PIR1_ADDR);
            SP_send_error(enter);

        SP_send_error(pir2);
        uint8_to_ascii(PIR2);
//        puint8_to_ascii(PIR2_ADDR);
        SP_send_error(enter);
    }*/
}

int main(void) {
    uint8_t i = 0;
    uint8_t j = 0;
    uint8_t k = 0;
    uint8_t temp = 0;
    init();
    bitfield.Hint = FALSE;
    bitfield.Capture = FALSE;
    GIE = 0;
    TMR0 = 0;
    w2 = 250;
    t2 = 125;
    temp = TMR0;
    GIE = 1;
    SP_send(strw1);
    //circBufPush(temp);
    uint8_to_ascii_buf(temp);
    SP_send(enter);
    GIE = 0;
    TMR0 = 0;
    w1 = 430;
    t1 = 1909;
    temp = TMR0;
    GIE = 1;
    SP_send(strw);
    //circBufPush(temp);
    uint8_to_ascii_buf(temp);
    SP_send(enter);
//    GCIE = 1;
    while(1)
    {
        /*TMR1H = 0;
        TMR1L = 0;
        w = 430;
        t = 1909;
        dec_to_ascii(w);
        SP_send(tab);
        dec_to_ascii(t);
        SP_send(enter);
        t = 0x0000 | TMR1H;        //ECCP result higher 8 bits
        t = t << 8;
        t = t | TMR1L;             //ECCP combined 16 bit number formation
        dec_to_ascii(t);
        SP_send(enter);*/
        Tim0owerflowCnt = 0;
        TMR0 = 0;
        T0IF = 0;
        T0IE = 1;
        if (bitfield.Capture){
			    /*dec_to_ascii(w);
                SP_send(tab);
                dec_to_ascii(t);
                SP_send(enter);*/
//            GIE = 0;
            bitfield.Capture = FALSE;
			bitfield.Hint = TRUE;
            if (t > MIN_T && t < MAX_T && t1 > MIN_T && t1 < MAX_T){
//                bitfield.Hint = TRUE;
                if (w > MIN_W1 && w < MAX_W1 && w1 > MIN_W1 && w1 < MAX_W1){
                    SP_send(strV1);
                    t = 0;
                    w = 0;
                    i++;
                }
                if (w > MIN_W0 && w < MAX_W0 && w1 > MIN_W0 && w1 < MAX_W0){
                    SP_send(strV0);
                    t = 0;
                    w = 0;
                    i++;
                }
                if (w1 > MIN_W0 && w1 < MAX_W0 && w > MIN_W1 && w < MAX_W1){
                    SP_send(strVF);
                    t = 0;
                    w = 0;
                    i++;
                }
                T0IE = 0;
                temp = TMR0;
//                GIE = 1;
                SP_send(strw);
                //circBufPush(temp);
                uint8_to_ascii_buf(Tim0owerflowCnt);
                SP_send(tab);
                uint8_to_ascii_buf(temp);
                SP_send(enter);
            }
            if (t > MIN_TS && t < MAX_TS && w > MIN_W0 && w < MAX_W0){
                    SP_send(sync);
                    t = 0;
                    w = 0;
                    i++;
            }
            
            if (k < 10 && bitfield.Hint){ //&& t < 6000){ //k < 10
                bw[k] = w;
                bt[k] = t;
                k++;
//                GIE = 0;
//                dec_to_ascii(w);
//                SP_send(tab);
//                dec_to_ascii(t);
//                SP_send(enter);
//                GIE = 1;
                /*temp = TMR0;
//                GIE = 1;
                SP_send(strw);
                //circBufPush(temp);
                uint8_to_ascii(temp);
                SP_send(enter);*/
            }
//            GIE = 1;
            t1 = t;
            w1 = w;
        }
        if(k >= 10){
            for(j = 0; j < 10; j++){
                dec_to_ascii(bw[j]);
                SP_send(tab);
                dec_to_ascii(bt[j]);
                SP_send(enter);
            }
            SP_send(sync);
            i = 0;
            k = 0;
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
        SP_send(buf_err);
        return -1;  // quit with an error
    }
        
    buf[buf_head] = data;
    buf_head = next;
    TXIE = 1;       //Enables the EUSART transmit interrupt
    return 0;
}

