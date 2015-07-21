CC=/usr/bin/avr-gcc
CFLAGS=-g -Os -Wall -mcall-prologues -mmcu=atmega32
OBJ2HEX=/usr/bin/avr-objcopy
AVRDUDE=/usr/bin/avrdude
TARGET=lighthouse

program : $(TARGET).hex
	$(AVRDUDE) -c avrispmkII  -p m32 -U flash:w:$(TARGET).hex 
%.obj : %.o
	$(CC) $(CFLAGS) $< -o $@

%.hex : %.obj
	$(OBJ2HEX) -R .eeprom -O ihex $< $@

clean : 
	rm -f *.hex *.obj *.o
