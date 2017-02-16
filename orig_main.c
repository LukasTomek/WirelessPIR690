/* 
 * File:   main.c
 * Author: lukas
 *
 * Created on 5. duben 2013, 12:02
 */

/* ----------------------------------------------------------------------- */
/* Šablona zdrojového kódu generovná programem Piklab */
#include <main.h>
/* ----------------------------------------------------------------------- */
/* Konfigurační bity: upravte dle vašeho nastavení a potřeb */
typedef unsigned int word;

word __at 0x2007 CONFIG = _INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _BOR_ON & _IESO_ON & _FCMEN_ON;




void SP_send(char str[]);

void isr() __interrupt  0 {                                                                                                            /* podprogram pro obsluhu přerušení */
    /* << vložit kód pro obsluhu přerušení >> */
    if( RCIF )
    {
        Buffer[BufferItems] = RCREG;
        BufferItems += 1;
    }
    C1IF=0;
}


void init ();
void delay_ms(long ms);
void SP_send(char str[]);
void dec_to_ascii(unsigned short dec);
void DecodeRead();
void SetAnalog(unsigned char SelAn, unsigned char AnVal);
void dec_to_bin(unsigned char dec);
//void delay_us(long us);



void main()
{
//    unsigned char Vystupy;
//    unsigned char MerenyVystup;
//    char i=0;
//    char j=0;
//    char SS2=0;

    init();

    E1=0; //Aktivace prvniho Multiplexu ventilu
    S0 = 0;
    S1 = 1;
    S2 = 0;
    delay_ms(1);
    E1=1; //DeAktivace prvniho Multiplexu ventilu



    while(1) //Main loop forever
    {
//        delay_ms(100);
        if (OERR) // Reset USART if Recive Error
        {
            CREN = 0;
            CREN = 1;
            SP_send(ErrorRec);
        }

//        if (BufferItems != 0)
//        {
//            DecodeRead();
//        }
    }        // Loop forever


}

void init ()
{
    RX_TRIS=1;  //Nastaveni pinu jako vstupy
    Y1_TRIS=1;
    Y2_TRIS=1;
//    Y7_TRIS=1;
    Y8_TRIS=1;
    EV5_TRIS=1;
    EV6_TRIS=1;

    S2_TRIS=0;	//Nastaveni pinu jako vystupy
    S1_TRIS=0;
    S0_TRIS=0;
    E1_TRIS=0;
    E2_TRIS=0;
//    E7_TRIS=0;
    E8_TRIS=0;
    CKL_TRIS=0;
    DI_TRIS=0;
    LD_TRIS=0;

    TX_TRIS=0;	// These need to be 1 for USART to work
    SPBRG=12;	// Baud Rate register, calculated by macro
    BRGH=1;
    BRG16=0;    // USART speed 19200 baud rate

    SYNC=0;			// Disable Synchronous/Enable Asynchronous
    SPEN=1;			// Enable serial port
    TXEN=1;			// Enable transmission mode
    CREN=1;                     // Enable recive mode

//    ADCON1=0x50;            //ADC Settings
//    TRISA2=1;
//    TRISA4=1;
//    TRISC0=1;
//    TRISC1=1;
    NOT_RABPU =1;                // 1 = PORTA/PORTB pull-ups are disabled

    ANS0=0;                     //Vypnutí Analogovych vstupu
    ANS1=0;
    ANS2=0;
    ANS3=0;
    ANS4=0;
    ANS5=0;
    ANS6=0;
    ANS7=0;
    ANS8=0;
    ANS9=0;
    ANS10=0;
    ANS11=0;
                                //Zapnuti Analogovych vstupu


    GIE=0;  //Disables all interrupts

    S0=0;
    S1=0;
    S2=0;
    E1=1;
    E2=1;
//    E7=1;
    E8=1;
    CKL=0;  //ma byt 1
    LD=0;
    DI=0;

    RCIE = 1;   // Enable Rx interrupt
    PEIE = 1; // Enable per. interrupt
    GIE  = 1; // Enable interup

//    E1=0; //Aktivace prvniho Multiplexu ventilu
}

void delay_ms(long ms)
{
    long i;
    while (ms--)
        for (i=0; i < 330; i++)
            ;
}

//void delay_us(long us)
//{
//    long i;
//    while (us--)
//        for (i=0; i < 330; i++)
//            ;
//}

void SP_send(char str[])
{
    unsigned char i;
    for(i=0; str[i] != '\0'; i++)
    {
        TXREG=str[i];	// Add a character to the output buffer
        while(!TXIF);	// Wait while the output buffer is full
    }
}

void dec_to_ascii(unsigned short dec)
{
    unsigned char number[4];
    unsigned char i=0;
    do
    {
        number[i]=(dec % 10);
        dec /=10;
        number[i] +=48;
        i++;
    }
    while(dec!=0);
    i--;
    do
    {
        TXREG=number[i];	// Add a character to the output buffer
        while(!TXIF);	// Wait while the output buffer is full*/
    }
    while (i--);
}

void dec_to_bin(unsigned char dec)
{
    unsigned char bin=0;
    while(dec > 0)
    {
        bin = dec % 2;
        dec = dec / 2;
    }
}

void SetAnalog(unsigned char SelAn, unsigned char AnVal)
{
    unsigned short AnalogVystup;
    unsigned char SelAnt = 0;
    char i;
    SP_send(Analog);
    // Rotace 4 bitu
    SelAnt = (SelAn & 1) << 3;
    SelAnt |= (SelAn & 2)  << 1;
    SelAnt |= (SelAn & 4) >> 1;
    SelAnt |= (SelAn & 8) >> 3;

    AnalogVystup = SelAnt;
    AnalogVystup <<= 8;
    AnalogVystup |= AnVal;
    SP_send(Mezera);
    dec_to_ascii(AnalogVystup);
    GIE = 0;
    for (i = 0; i < 12; i++)
    {
        CKL=0;

        nop();
        nop();
        DI=AnalogVystup >> (11 - i);
        nop();
        nop();
        CKL=1;
        nop();
        nop();
        nop();

    }
    CKL=0;
    nop();
    nop();
    nop();
    LD=1;
    nop();
    nop();
    nop();
    LD=0;
    nop();
    nop();
    nop();
    CKL=1;
    GIE = 1;
}

void DecodeRead()
{
    if (Buffer[BufferItems - 1] == ';')
    {
        unsigned char j;
        unsigned char BufferRX[20];
        unsigned char BufferCout=0;
        unsigned char SelAn = 0;
        unsigned char AnVal = 0;
        for (j = 0; j < BufferItems; j++)
            BufferRX[j] = Buffer[j];
        BufferCout = BufferItems;
        BufferItems = 0;
        SP_send(Prijato);
        BufferRX[BufferCout] = '\n';
        BufferRX[BufferCout + 1] = '\0';
        SP_send(BufferRX);
        for (j = 0; j < BufferCout; j++)
        {
            if (BufferRX[j] == '#')
            {
                SelAn = (BufferRX[j + 1] - 48)*10 + BufferRX[j + 2] - 48;
                AnVal = (BufferRX[j + 4] - 48)*100 + (BufferRX[j + 5] - 48)*10 + BufferRX[j + 6] - 48;
                dec_to_ascii(SelAn);
                SP_send(Mezera);
                dec_to_ascii(AnVal);
                SP_send(Mezera);
                SetAnalog(SelAn, AnVal);
            }
        }
    }
}
