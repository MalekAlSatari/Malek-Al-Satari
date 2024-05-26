void servoinit(void);
void ADCInit(void);
unsigned int ADC_read0(void);

void main(){
unsigned int s=0;
int tick=0;
TRISC=0b00000010;
TRISB=0B00000010;
TRISD=0x00;
portb=0x00;
portd = 0x00;
ADCInit();
servoinit();

while(1) {


if(!(portc & 0b00000010)){

  s = ADC_read0();
   delay_ms(200);
  if(s>640){
  delay_ms(500);

   tick=1;
   while(tick){
   PORTD=0XFF;

   if(portb == 0b00000010){     //rb1
   tick=0;
   PORTD=0x00;

   CCPR1L = 62;
   CCP1CON&=0xCF ;
   Delay_ms(10000);


   CCPR1L = 220;
   CCP1CON&=0xCF ;
   Delay_ms(10000);


   }else{
   tick=1;
   }

    delay_ms(200);
   }

  }
   else{
    portd = 0x00;
   }

   }


  else{
   portd = 0x00;
}

delay_ms(500);

}
}

void servoinit(void){

     TRISC = TRISC & 0b11111011;

     CCP1CON = 0x0C;

     T2CON = 0x03;
     PR2 = 249;

     TMR2 = 0;

     PIR1 = PIR1 & 0b11111101;


     T2CON=T2CON | 0b00000100;
}

 void ADCInit(void){
     ADCON1 = 0x8E;
     ADCON0 = 0x81;
}

unsigned int ADC_read0(void){
ADCON0 = ADCON0 | 0x04;
     while((ADCON0 & 0x04));
return ((ADRESH<<8)|(ADRESL));
 }