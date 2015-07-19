CC=/usr/bin/avr-gcc
CFLAGS=-g -Os -Wall -mcall-prologues -mmcu=atmega32
OBJ2HEX=/usr/bin/avr-objcopy
AVRDUDE=/usr/bin/avrdude
TARGET=lighthouse

program : $(TARGET).hex
	$(AVRDUDE) -p m1
	$(AVRDUDE) -dprog=stk500 -dserial=/dev/ttyS1 --upload -dpart=atmega32
		if=$(TARGET).hex -v=2
%.obj : %.o
	$(CC) $(CFLAGS) $< -o $@

%.hex : %.obj
	$(OBJ2HEX) -R .eeprom -O ihex $< $@

clean : 
	rm -f *.hex *.obj *.o
