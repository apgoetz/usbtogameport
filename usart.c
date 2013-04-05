#include "avr/io.h"
#include "avr/interrupt.h"
#include "stdio.h"
#include "usart.h"
#include <avr/pgmspace.h>
#define TXBUFSIZE 16 //size in bytes of the Tx buffer. 
                      //Cannot be larger than 256
volatile unsigned char tx_buf[TXBUFSIZE];
volatile unsigned char tx_rear_ptr;  //position in queue of rear
volatile unsigned char tx_front_ptr; //position in queue of front
//ubrr is the weird bitrate number.
//this function initializes the USART driver.
void init_usart(int ubrr)
{
  tx_rear_ptr = 0;
  tx_front_ptr = 0;
  tx_size = -1;
  //enable Tx, and the data register empty interrupt
  //also enabling Rx.
  UCSRB |=  (1 << TXCIE) | (1 << TXEN) | (1 << RXEN
);
  //sets the data frame to be 8 bits
  UCSRC |= (1 << URSEL) | (1 << UCSZ1) | (1 << UCSZ0);
  //sets the ubrr value, which is used to determine baud rate.
  //UBRRH = (unsigned char) ubrr >> 8;
  UBRRL = (unsigned char) ubrr;
}
//function used by stdio for the usart device
int put_tx(char byte)
{
      cli();   //Disable interrupts in order to prevent race conditions.
  if(tx_size == TXBUFSIZE)
    { 
      sei();
      return 1;
    }
  else if (tx_size == -1)
    {
      UDR = byte; 
      tx_size = 0;
      sei();
      return 0;
    }
  else
    {
      
      tx_buf[tx_rear_ptr] = byte;
      tx_size++;
      if (++tx_rear_ptr == TXBUFSIZE)//make sure that the value loops
	tx_rear_ptr = 0;
      sei();
      return 0;
    }

}
//Basic looper to print more than one byte
//only for strings stored in ROM
int pgm_uout(const char *buff)
{
  int orig_ptr = (int)buff;
  int c;
  while ((c = pgm_read_byte(buff++)))
    if (put_tx(c))
      return (int)buff - orig_ptr - 1;
  return 0;
}
//same thing, 
int ram_uout( char *buff)
{
  
  int i = 0;
  int c;
  while ((c = buff[i])){
    if(!put_tx(c))
      i++;
  }
  return 0;
}

//returns single character with blocking I/O
char bgetc()
{
  while ( !(UCSRA & (1<<RXC)) )
    ;
  return UDR;

}

//Interrupt service routine for Tx output
//triggers when the Tx byte has finished sending
ISR(USART_TXC_vect)
{
  //decrements queue size by one, and checks to see if there is
  //nothing there
  //if there is something there, we set the UDR Registry to contain
  //the next byte to write
  if (tx_size-- > 0)
    {
      //data to punch out.
      UDR = tx_buf[tx_front_ptr];
      if(++tx_front_ptr == TXBUFSIZE)
	tx_front_ptr = 0;
    }
 }

//Check if Tx buffer is empty.
int tx_isempty()
{
  return !(tx_size);
}
