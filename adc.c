#include <pic16f690.h>
#include "adc.h"

unsigned short ADC_read(int pin) // select chanel AN0 = 0
{
unsigned char x,y;
unsigned short z;
		x=0x81;
		y=pin<<2;
		x=x|y;
		ADCON0=x;
		delay_ms(1);
		GO=1;
		while(GO==1)
		{
			delay_ms(1);
		}
		x=ADRESH;     //ADC result higher 2 bits
 		y=ADRESL;     //ADC result lower 8 bits
		z=x<<8;
		z=z|y;       //combined 10 bit number formation
	return z;
}

void delay_ms(long ms)
{
    long i;
    while (ms--)
        for (i=0; i < 330; i++)
            ;
}