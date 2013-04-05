#include <avr/io.h>
#include <stdio.h>
#include <avr/interrupt.h>
#include <util/delay_basic.h>
#include "usart.h"
#include <avr/wdt.h>
#include <avr/pgmspace.h>
#include <stdint.h>

#include "usbdrv.h"
#define BAUD_RATE 38400
#define F_CPU 16000000
#define UBRR ((F_CPU/(16*BAUD_RATE))-1)
#define ADPS_BITS 7 		/* we want to divide by 128 */
#define ADSCR_START ((1 << ADEN ) | (1 << ADSC) | (ADPS_BITS << ADPS0))


const PROGMEM char usbHidReportDescriptor [45] = {   
  0x05, 0x01,                    // USAGE_PAGE (Generic Desktop)
  0x09, 0x04,                    // USAGE (Joystick)
  0xa1, 0x01,                    // COLLECTION (Application)
  0x09, 0x01,                    //   USAGE (Pointer)
  0xa1, 0x00,                    //   COLLECTION (Physical)
  0x05, 0x01,                    //     USAGE_PAGE (Generic Desktop)
  0x09, 0x30,                    //     USAGE (X)
  0x09, 0x31,                    //     USAGE (Y)
  0x15, 0x00,                    //     LOGICAL_MINIMUM (0)
  0x26, 0xff, 0x00,              //     LOGICAL_MAXIMUM (255)
  0x75, 0x08,                    //     REPORT_SIZE (8)
  0x95, 0x02,                    //     REPORT_COUNT (2)
  0x81, 0x02,                    //     INPUT (Data,Var,Abs)
  0xc0,                          //   END_COLLECTION
  0x05, 0x09,                    //   USAGE_PAGE (Button)
  0x19, 0x01,                    //   USAGE_MINIMUM (Button 1)
  0x29, 0x08,                    //   USAGE_MAXIMUM (Button 8)
  0x15, 0x00,                    //   LOGICAL_MINIMUM (0)
  0x25, 0x01,                    //   LOGICAL_MAXIMUM (1)
  0x75, 0x01,                    //   REPORT_SIZE (1)
  0x95, 0x08,                    //   REPORT_COUNT (8)
  0x81, 0x02,                    //   INPUT (Data,Var,Abs)
  0xc0                           // END_COLLECTION
};



void init(void);
void en_a(void);
void dis_a(void);
uint16_t brea_a(uint8_t mux);
unsigned char val;

static uint8_t idlerate = 0;
char *logbuf = "**\r";


static uchar reportBuffer[3];

uchar getReport(unsigned char *buf)
{
  uint16_t hat;
  uint8_t buttons = 0;
  en_a();
  brea_a(0);
  
  /* set first three buttons */
  buttons = (PINC >> 3) & 7;
  buttons = buttons << 1;
  /* set last button */
  buttons |= ((PINB >> 1) & 1);
  buttons = ~buttons & 0xf;
  buttons = buttons << 4;
  hat = brea_a(1);
  /* up */
  if(hat > 900)
    buttons |= (1 << 0);
  /* right */
  else if (hat > 650)
    buttons |= (1 << 1);
  /* down */
  else if (hat > 435)
    buttons |= (1 << 2);
    /* left */
  else if (hat > 350)
    buttons |= (1 << 3);
  
    
  buf[0] = -(brea_a(2) >> 2);
  buf[1] = -(brea_a(0) >> 2);
  buf[2] = buttons;
  
  return 3;
}

uchar usbFunctionSetup(uchar data[8])
{
  usbRequest_t *rq = (void*)data;
  usbMsgPtr = reportBuffer;
  /* if they want a class report */
  if((rq->bmRequestType & USBRQ_TYPE_MASK) == USBRQ_TYPE_CLASS){
    if(rq->bRequest == USBRQ_HID_GET_REPORT){
      usbMsgPtr = reportBuffer;
      return getReport(reportBuffer);
      
    }
    else if (rq->bRequest == USBRQ_HID_GET_IDLE){
      usbMsgPtr = &idlerate;
      return 1;
    }
    else if (rq->bRequest == USBRQ_HID_SET_IDLE){
      idlerate = rq->wValue.bytes[1];
    }
  }
  /* if we have gotten here, we don't care about the rest of the cases */
  return 0;
}

int main (void)
{
  init();
  usbInit();
  sei();
  for(;;)
    {
      usbPoll();
      if(usbInterruptIsReady())
	{
	  PORTB ^= 1;
	  getReport(reportBuffer);
	  usbSetInterrupt(reportBuffer, sizeof(reportBuffer));
	}
    }
}

void init(void)
{
  //disable watchdog if it has not already been disabled.
  MCUCSR = 0; 
  wdt_disable();
  /* enable tx as output */
  DDRD |= (1 << 1) | 1;
  /* enable led as output */
  DDRB |= 1 << 0;
  PORTB |=  1 << 1;
  PORTC |= (1 << 3) | (1 << 4) | (1 << 5);
  /* set the prescaler */
  ADCSR |= ADPS_BITS << ADPS0;
  init_usart(UBRR);
  sei();  
  pgm_uout(PSTR("Initializing...\r\n"));
}

/* enable analog port */
void en_a(void)
{
  ADCSR |= 1 << ADEN;
}

/* disable analog port */
void dis_a(void)
{
  ADCSR &= ~(1 << ADEN);
}

/* do a blocking read of the analog port */
uint16_t brea_a(uint8_t mux)
{
  uint16_t result = 0;
  /* we can just set which input we want directly, since we know the
     ref is AREF (REFS = 00) and we aren't shifting the value (ADLAR = 0) */
  ADMUX = mux;
  
  /* start a conversion */
  ADCSR |= 0x40;
  
  /* loop until adcsr is no longer set. */
  while(ADCSR & (1 << ADSC))
    {};

  /* set the value to result */
  result = ADCL;
  result |= ADCH << 8;

  return result;
}
