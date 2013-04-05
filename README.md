cksel = 0111
sut = 11

total lfuse:
0b11101111

To set up an analog port
Select the right endpoint using MUX bits of ADMUX
enable adc using ADEN of ADCSRA
read result from ADCL then ADCH
to do a single conversion, write to 1 to ADSC of ADCSRA, when conversion completes, it becomes a 0 automagically.
if you wanna free run, write 1 to ADFR of ADCSRA, and then 1 to ADSC to start

set prescale to between 50k and 200k by setting ADPS bits of adcsra, afreq = xtal/(2^adps), or xtal/afreq = 2^adps


up  > 900
down 435 < 550
left 350 < 435
right > 650 < 900



how usb works
3 data structures passed around

usbDeviceDescriptor tells usb bus you are an HID

usbHidReportDescriptor tells usb bus what inputs your device supports (1 axis, 2 buttons, etc)


another type of report descriptor 

descriptor: 

