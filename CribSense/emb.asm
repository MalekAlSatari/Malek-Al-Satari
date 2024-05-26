
_main:

;emb.c,5 :: 		void main(){
;emb.c,6 :: 		unsigned int s=0;
	CLRF       main_s_L0+0
	CLRF       main_s_L0+1
	CLRF       main_tick_L0+0
	CLRF       main_tick_L0+1
;emb.c,8 :: 		TRISC=0b00000010;
	MOVLW      2
	MOVWF      TRISC+0
;emb.c,9 :: 		TRISB=0B00000010;
	MOVLW      2
	MOVWF      TRISB+0
;emb.c,10 :: 		TRISD=0x00;
	CLRF       TRISD+0
;emb.c,11 :: 		portb=0x00;
	CLRF       PORTB+0
;emb.c,12 :: 		portd = 0x00;
	CLRF       PORTD+0
;emb.c,13 :: 		ADCInit();
	CALL       _ADCInit+0
;emb.c,14 :: 		servoinit();
	CALL       _servoinit+0
;emb.c,16 :: 		while(1) {
L_main0:
;emb.c,19 :: 		if(!(portc & 0b00000010)){
	BTFSC      PORTC+0, 1
	GOTO       L_main2
;emb.c,21 :: 		s = ADC_read0();
	CALL       _ADC_read0+0
	MOVF       R0+0, 0
	MOVWF      main_s_L0+0
	MOVF       R0+1, 0
	MOVWF      main_s_L0+1
;emb.c,22 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;emb.c,23 :: 		if(s>640){
	MOVF       main_s_L0+1, 0
	SUBLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVF       main_s_L0+0, 0
	SUBLW      128
L__main19:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;emb.c,24 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;emb.c,26 :: 		tick=1;
	MOVLW      1
	MOVWF      main_tick_L0+0
	MOVLW      0
	MOVWF      main_tick_L0+1
;emb.c,27 :: 		while(tick){
L_main6:
	MOVF       main_tick_L0+0, 0
	IORWF      main_tick_L0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
;emb.c,28 :: 		PORTD=0XFF;
	MOVLW      255
	MOVWF      PORTD+0
;emb.c,30 :: 		if(portb == 0b00000010){     //rb1
	MOVF       PORTB+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;emb.c,31 :: 		tick=0;
	CLRF       main_tick_L0+0
	CLRF       main_tick_L0+1
;emb.c,32 :: 		PORTD=0x00;
	CLRF       PORTD+0
;emb.c,34 :: 		CCPR1L = 62;
	MOVLW      62
	MOVWF      CCPR1L+0
;emb.c,35 :: 		CCP1CON&=0xCF ;
	MOVLW      207
	ANDWF      CCP1CON+0, 1
;emb.c,36 :: 		Delay_ms(10000);
	MOVLW      102
	MOVWF      R11+0
	MOVLW      118
	MOVWF      R12+0
	MOVLW      193
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
;emb.c,39 :: 		CCPR1L = 220;
	MOVLW      220
	MOVWF      CCPR1L+0
;emb.c,40 :: 		CCP1CON&=0xCF ;
	MOVLW      207
	ANDWF      CCP1CON+0, 1
;emb.c,41 :: 		Delay_ms(10000);
	MOVLW      102
	MOVWF      R11+0
	MOVLW      118
	MOVWF      R12+0
	MOVLW      193
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
;emb.c,44 :: 		}else{
	GOTO       L_main11
L_main8:
;emb.c,45 :: 		tick=1;
	MOVLW      1
	MOVWF      main_tick_L0+0
	MOVLW      0
	MOVWF      main_tick_L0+1
;emb.c,46 :: 		}
L_main11:
;emb.c,48 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	DECFSZ     R11+0, 1
	GOTO       L_main12
;emb.c,49 :: 		}
	GOTO       L_main6
L_main7:
;emb.c,51 :: 		}
	GOTO       L_main13
L_main4:
;emb.c,53 :: 		portd = 0x00;
	CLRF       PORTD+0
;emb.c,54 :: 		}
L_main13:
;emb.c,56 :: 		}
	GOTO       L_main14
L_main2:
;emb.c,60 :: 		portd = 0x00;
	CLRF       PORTD+0
;emb.c,61 :: 		}
L_main14:
;emb.c,63 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	DECFSZ     R11+0, 1
	GOTO       L_main15
	NOP
	NOP
;emb.c,65 :: 		}
	GOTO       L_main0
;emb.c,66 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_servoinit:

;emb.c,68 :: 		void servoinit(void){
;emb.c,70 :: 		TRISC = TRISC & 0b11111011;
	MOVLW      251
	ANDWF      TRISC+0, 1
;emb.c,72 :: 		CCP1CON = 0x0C;
	MOVLW      12
	MOVWF      CCP1CON+0
;emb.c,74 :: 		T2CON = 0x03;
	MOVLW      3
	MOVWF      T2CON+0
;emb.c,75 :: 		PR2 = 249;
	MOVLW      249
	MOVWF      PR2+0
;emb.c,77 :: 		TMR2 = 0;
	CLRF       TMR2+0
;emb.c,79 :: 		PIR1 = PIR1 & 0b11111101;
	MOVLW      253
	ANDWF      PIR1+0, 1
;emb.c,82 :: 		T2CON=T2CON | 0b00000100;
	BSF        T2CON+0, 2
;emb.c,83 :: 		}
L_end_servoinit:
	RETURN
; end of _servoinit

_ADCInit:

;emb.c,85 :: 		void ADCInit(void){
;emb.c,86 :: 		ADCON1 = 0x8E;
	MOVLW      142
	MOVWF      ADCON1+0
;emb.c,87 :: 		ADCON0 = 0x81;
	MOVLW      129
	MOVWF      ADCON0+0
;emb.c,88 :: 		}
L_end_ADCInit:
	RETURN
; end of _ADCInit

_ADC_read0:

;emb.c,90 :: 		unsigned int ADC_read0(void){
;emb.c,91 :: 		ADCON0 = ADCON0 | 0x04;
	BSF        ADCON0+0, 2
;emb.c,92 :: 		while((ADCON0 & 0x04));
L_ADC_read016:
	BTFSS      ADCON0+0, 2
	GOTO       L_ADC_read017
	GOTO       L_ADC_read016
L_ADC_read017:
;emb.c,93 :: 		return ((ADRESH<<8)|(ADRESL));
	MOVF       ADRESH+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       ADRESL+0, 0
	IORWF      R0+0, 1
	MOVLW      0
	IORWF      R0+1, 1
;emb.c,94 :: 		}
L_end_ADC_read0:
	RETURN
; end of _ADC_read0
