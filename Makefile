# AVR-GCC Makefile
PROJECT=usbtogameport
SOURCES=usart.c usart.h main.c usbdrv.c usbdrvasm.S oddebug.c
CC=avr-gcc -std=c99 -g
OBJCOPY=avr-objcopy
MMCU=atmega8
 
CFLAGS=-mmcu=$(MMCU) -Wall
 
$(PROJECT).hex: $(PROJECT).out
	$(OBJCOPY) -O ihex $(PROJECT).out $(PROJECT).hex
 
$(PROJECT).out: $(SOURCES)
	$(CC) $(CFLAGS) -I./ -o $(PROJECT).out $(SOURCES) -Wl,-Map=$(PROJECT).mp
 
program: $(PROJECT).hex
	avrdude -p m8 -c avrispmkii -P usb  -U flash:w:$(PROJECT).hex
clean:
	rm -f $(PROJECT).out
	rm -f $(PROJECT).hex
