#ifndef __USART__H__
#define __USART__H__
#include <stdio.h>
char tx_size;      //number of bytes used
//check buffer is empty
int tx_isempty();
//places a single character into the output bufffer
int put_tx( char byte);
//initializes usart
void init_usart(int ubrr);
//puts a string into the outout buffer, that is stored in flash, not ram
int pgm_uout(const char * buff);
//puts a string into the buffer that is stored in RAM
int ram_uout( char * buff);
//get a single character from usart via polling. 
char bgetc();
#endif

