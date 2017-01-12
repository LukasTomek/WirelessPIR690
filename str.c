#include <pic16f690.h>
#include <stdint.h>
#include "str.h"
#include "main.h"
/*
void dec_to_ascii_buf(unsigned short dec)
{
	unsigned char number[5];
	unsigned char i;

    for (i=0 ; dec!=0 || i == 0; i++)
    {
        number[i] = (dec % 10);
        dec /= 10;
        number[i] += 48;
	}
	while (i--)
	{
		circBufPush(number[i]);	// Add a character to the output buffer
//        TXREG = number[i];	// Add a character to the output buffer
		//while(!TXIF);       // Wait while the output buffer is full
	}
}*/

void uint8_to_ascii_buf(uint8_t dec)
{
	uint8_t number[4];
	uint8_t i;

    for (i=0 ; dec != 0  || i == 0; i++)
    {
        number[i] = (dec % 10);
        dec /= 10;
        number[i] += 48;
	}
	while (i--)
	{
		circBufPush(number[i]);	// Add a character to the output buffer
//        TXREG = number[i];	// Add a character to the output buffer
//		while(!TXIF);       // Wait while the output buffer is full
	}
}

void SP_send_buf(char str[]){
	uint8_t i;
	for(i=0; str[i] != '\0'; i++)
	{
        circBufPush(str[i]);
	}
}

void SP_send(char str[])
{
	uint8_t i;
	for(i=0; str[i] != '\0'; i++)
	{
		TXREG=str[i];	// Add a character to the output buffer
		while(!TXIF);	// Wait while the output buffer is full
	}
}

void uint8_send(uint8_t uint){
    TXREG = uint;	// Add a character to the output buffer
	while(!TXIF);	// Wait while the output buffer is full
}
/*
void SP_send_errorP(char str[])
{
    GIE = FALSE;	// Disable all interrupts.
	/*for(i=0; str[i] != '\0'; i++)
	{*/
		/*TXREG=str[0];	// Add a character to the output buffer
		while(!TXIF);	// Wait while the output buffer is full
//	}
}*/
/*
void puint8_to_ascii(uint8_t *dec)
{
	unsigned char number[4];
	unsigned char i;

    for (i = 0 ; *dec != 0  || i == 0; i++)
    {
        number[i] = (*dec % 10);
        *dec /= 10;
        number[i] += 48;
	}
	while (i--)
	{
		TXREG = number[i];	// Add a character to the output buffer
		while(!TXIF);       // Wait while the output buffer is full
	}
}*/

