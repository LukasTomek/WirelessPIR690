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
#include "adc.h"


#define MIN_W0      380
#define MAX_W0      450
#define MIN_W1      1350
#define MAX_W1      1430
#define MIN_T       1880
#define MAX_T       1950
//#define MIN_TS      8100
//#define MAX_TS      8200
#define BUF_SIZE    16

#define MIN_TS      15000
#define MAX_TS      16000

//#define MIN_T       230
//#define MAX_T       240

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

typedef enum {
    ERR,
    BIT0,
    BIT1,
    BITF
} AddressPIR;

struct {
     unsigned Capture:1;
     unsigned Edge:1;
     unsigned Hint:1;
} bitfield;
/*
struct {
     unsigned Capture:1;
     unsigned Edge:1;
     unsigned Hint:1;
} ;*/

// internal oscilator 8Mhz divided by 2 by default
word __at 0x2007 CONFIG = _INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF; 

const char stri[]={'i', ' ', '=', ' ', '\0'};
const char strV0[]={'0', ' ', '\n' ,'\0'};
const char strV1[]={'1', ' ', '\n' ,'\0'};
const char strVF[]={'F', ' ', '\n' ,'\0'};
const char strw[]={'w', ':', ' ' ,'\0'};
const char strt[]={'t', ':', ' ' ,'\0'};
const char strw1[]={'w', '1', ':', ' ' ,'\0'};
const char strt1[]={'t', '1', ':', ' ' ,'\0'};
const char tab[]={'\t' ,'\0'};
const char space[]={' ' ,'\0'};
const char enter[]={'\n' ,'\0'};
const char sync[]={'S', 'Y', 'N', 'C', '\n' ,'\0'};
const char int_err[]={'I', 'N', 'T', ' ', 'E', 'R', 'R', '\n' ,'\0'};
const char buf_err[]={'B', 'U', 'F', 'F', 'E', 'R', ' ', 'O', 'W', 'E', 'R', 
                        'F', 'L', 'O', 'W', '\n' ,'\0'};
const char pir1[]={'P', 'I', 'R', '1', ':', ' ','\0'};
const char pir2[]={'P', 'I', 'R', '2', ':', ' ','\0'};
const char pie1[]={'P', 'I', 'E', '1', ':', ' ','\0'};
const char pie2[]={'P', 'I', 'E', '2', ':', ' ','\0'};
const char light[]={'L', 'I', 'g', 'h', 't', '\n','\0'};
const char tim0_owf[]={'T', 'I', 'M', '0', ' ', 'O', 'W', 'F', '\n' ,'\0'};
/*
const uint8_t SetAddress[] = { BIT_F, BIT_F, BIT_F, BIT_F, BIT_F, BIT_F,
                                BIT_F, BIT_F, BIT_F, BIT_F, BIT_F, BIT_F };*/
uint16_t w = 0;
uint16_t t = 0;
uint16_t w1 = 0;
uint16_t t1 = 0;
uint8_t RecAddress[20];
uint8_t SetAddress[12];
uint8_t buf[BUF_SIZE];
uint8_t buf_head = 0;
uint8_t buf_tail = 0;
uint8_t int_error_cnt = 0;  


void receive_intr() __interrupt 0 {
    int next;
    if(T0IF){
		T0IE = 0;
        T0IF = 0;
        TMR0 = 0;	// Enable timer
		OUT_PIN = 0;
    }
    if(TXIF){
        // if the head isn't ahead of the tail, we don't have any characters
        if (buf_head == buf_tail){
            TXIE = 0;
            //return -1;  // quit with an error
        }
        else{
            

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
        }
        CCP1IE = 1;
        CCP1IF = 0;                     //Clear interrupt flag
    }
    int_error_cnt++;
}

int main(void) {
    uint8_t i = 0;
    uint8_t j = 0;
    uint8_t k = 0;
    uint8_t temp = 0;
	uint16_t result = 0;
    init();
    bitfield.Hint = FALSE;
    bitfield.Capture = FALSE;
    delay_ms(10);
	for(i = 0; i <= 11; i++){
        
		result = ADC_read(i); // select chanel AN0 = 0
        SP_send_buf(stri);
        dec_to_ascii_buf(i);
        SP_send_buf(space);
        dec_to_ascii_buf(result);
        SP_send_buf(enter);

		if(result > 500)
			SetAddress[i] = BIT1;
        else if(result < 300)
			SetAddress[i] = BIT0;
		else
			SetAddress[i] = BITF;
	}

    for(i = 0; i <= 11; i++){
        SP_send_buf(stri);
        dec_to_ascii_buf(i);
        SP_send_buf(space);
        dec_to_ascii_buf(SetAddress[i]);
        SP_send_buf(enter);
    }
//    delay_ms(10);
//    for(i = 0; i <= 11; i++){
//        SP_send_buf(stri);
//        dec_to_ascii_buf(i);
//        SP_send_buf(space);
//        dec_to_ascii_buf(SetAddress[i]);
//        SP_send_buf(enter);
//    }
    while(1)
    {
        if (bitfield.Capture){
            bitfield.Capture = FALSE;
            if (t > MIN_T && t < MAX_T && t1 > MIN_T && t1 < MAX_T){
                if (w > MIN_W1 && w < MAX_W1 && w1 > MIN_W1 && w1 < MAX_W1){
//                    SP_send_buf(strV1);
					RecAddress[i] = BIT1;
                    t = 0;
                    w = 0;
                    i++;
                }
                if (w > MIN_W0 && w < MAX_W0 && w1 > MIN_W0 && w1 < MAX_W0){
//                    SP_send_buf(strV0);
					RecAddress[i] = BIT0;
                    t = 0;
                    w = 0;
                    i++;
                }
                if (w1 > MIN_W0 && w1 < MAX_W0 && w > MIN_W1 && w < MAX_W1){
//                    SP_send_buf(strVF);
					RecAddress[i] = BITF;
                    t = 0;
                    w = 0;
                    i++;
                }
            }
            if (t > MIN_TS && t < MAX_TS && w > MIN_W0 && w < MAX_W0){
                    SP_send_buf(sync);
                    t = 0;
                    w = 0;
                    temp = 1;
                    i--;
                    GIE = 0; //not tested
                    for(j = 11; j != 0; j--){
                        
                        if (RecAddress[i] != SetAddress[j]){
                            temp = 0;
                        }
                        i--;
                    }
                    GIE = 1;
                    //i++;
					if(temp){
						SP_send_buf(light);
						OUT_PIN = 1;
						TMR0 = 0;	// Enable timer
						T0IE = 1;
					}
//                    SP_send_buf(stri);
//                    uint8_to_ascii_buf(i);
//                    SP_send_buf(enter);
//                    i = 0;
//                    j = 0;
					
            }
            t1 = t;
            w1 = w;

        }
        int_error_cnt = 0;
        if(i >= 19){
            i = 0;
        }
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

