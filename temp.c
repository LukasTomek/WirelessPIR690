
int temp_main(void) {
//  unsigned short arrayW[5];
//    unsigned short arrayW1[5];
//    unsigned short arrayT[5];
//    unsigned short arrayT1[5];
    unsigned char i = 0;
    LEDG_TRIS = 0;
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

	//T0IE = 1;	// Set Timer 0 to 0.
	//TMR0 = 0;	// Enable timer
    
    CCP1CON = 5; // Setup ENHANCED CAPTURE MODULE
    CCP1IE = 0;     // ENHANCED CAPTURE MODULE Disabled
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
    //RCIN_LAST = RCIN_PIN;
    while(1)
    {

        if (capture){            
            if (t > MIN_TS && t < MAX_TS && w > MIN_W0 && w < MAX_W0){
               SP_send(sync);
            }
            if (t > MIN_T && t < MAX_T && t1 > MIN_T && t1 < MAX_T){
            /*GIE = 0;*/
                
                dec_to_ascii(w1);
                SP_send(tab);
                dec_to_ascii(t1);
                SP_send(tab);
                dec_to_ascii(w);
                SP_send(tab);
                dec_to_ascii(t);
                SP_send(enter);
                /*
                SP_send(strw);
                dec_to_ascii(w);
                SP_send(enter);
                SP_send(strt);
                dec_to_ascii(t);
                SP_send(enter);
                SP_send(strw1);
                dec_to_ascii(w1);
                SP_send(enter);
                SP_send(strt1);
                dec_to_ascii(t1);
                SP_send(enter);*/
                
                
                if (w > MIN_W1 && w < MAX_W1 && w1 > MIN_W1 && w1 < MAX_W1){
                    SP_send(strV1);
//                    arrayW[i] = w;
//                    arrayW1[i] = w1;
//                    arrayT[i] = t;
//                    arrayT1[i] = w1;
                    t = 0;
                    w = 0;
                    i++;
                }
                if (w > MIN_W0 && w < MAX_W0 && w1 > MIN_W0 && w1 < MAX_W0){
                    SP_send(strV0);
//                    arrayW[i] = w;
//                    arrayW1[i] = w1;
//                    arrayT[i] = t;
//                    arrayT1[i] = w1;
                    t = 0;
                    w = 0;
                    i++;
                }
                if (w1 > MIN_W0 && w1 < MAX_W0 && w > MIN_W1 && w < MAX_W1){
                    SP_send(strVF);
//                    arrayW[i] = w;
//                    arrayW1[i] = w1;
//                    arrayT[i] = t;
//                    arrayT1[i] = w1;
                    t = 0;
                    w = 0;
                    i++;
                }
            }
            t1 = t;
            w1 = w;
            t = 0;
            w = 0;
            //GIE = 1;
            capture = 0;
        }
       if (i > 6){
           i = 0;
       }
       /*if(i >= 6 || j <= 6){
            w = arrayW[j];
            w1 = arrayW1[j];
            t = arrayT[j];
            t1 = arrayT1[j];
            SP_send(strw);
            dec_to_ascii(w);
            SP_send(enter);
            SP_send(strt);
            dec_to_ascii(t);
            SP_send(enter);
            SP_send(strw1);
            dec_to_ascii(w1);
            SP_send(enter);
            SP_send(strt1);
            dec_to_ascii(t1);
            SP_send(enter);
            if (t > 1880 && t < 1920 && t1 > 1880 && t1 < 1920){
                if (w > 1350 && w < 1400 && w1 > 1350 && w1 < 1400){
                    SP_send(strV1);
                    t = 0;
                    w = 0;
                }
                if (w > 380 && w < 420 && w1 > 380 && w1 < 420){
                    SP_send(strV0);
                    t = 0;
                    w = 0;
                }
                if (w1 > 380 && w1 < 430 && w > 1350 && w < 1400){
                    SP_send(strVF);
                    t = 0;
                    w = 0;
                }
            }
            j++; 
       }*/
       /*if(RCIN_LAST != RCIN_PIN){
           RCIN_LAST = RCIN_PIN;
           if(TMR1ON == 0){
            TMR1H = 0;
            TMR1L = 0;
            TMR1ON = 1;
           }
           else{
            x=TMR1H;     //TMR1 result higher 8 bits
            y=TMR1L;     //TMR1 result lower 8 bits
            z=x<<8;
            z=z|y;       //combined 10 bit number formation
            TMR1ON = 0;
            //if(z > 100){
            dec_to_ascii(z);
            SP_send(enter);
            //}
           }
           dec_to_ascii(RCIN_PIN);
           SP_send(enter);*/
       /*}*/
       
       //TMR1H = 0;
        //TMR1L = 0;
        int_error_cnt = 0;
    }
}

int circBufPush(uint8_t data){
    uint8_t next = buf_head + 1;
    if (next >= BUF_SIZE)
        next = 0;
 
    // Cicular buffer is full
    if (next == buf_tail)
        return -1;  // quit with an error
 
    buf[buf_head] = data;
    buf_head = next;
    TXIE = 1;       //Enables the EUSART transmit interrupt
    return 0;
}

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
   
	/*while (i--)
	{
//        buf[buf_pos++] = str[i];
        //SP_send(str4);
		TXREG = number[i];	// Add a character to the output buffer
		while(!TXIF);       // Wait while the output buffer is full
        /*SP_send(str6);
        SP_send(str5);
        TXREG = i + 48;	// Add a character to the output buffer
		while(!TXIF);       // Wait while the output buffer is full
        SP_send(str6);*/
	/*}*/
}

void SP_send(char str[]){
	uint8_t i;
	for(i=0; str[i] != '\0'; i++)
	{
//		TXREG=str[i];	// Add a character to the output buffer
//		while(!TXIF);	// Wait while the output buffer is full
//        buf[buf_pos++] = str[i];
        circBufPush(str[i]);
	}
}