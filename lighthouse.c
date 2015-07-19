/*
 * lighthouse.c
 * PWM-driven LED that simulates a lighthouse light.
 *
 *
 */

#include <avr/io.h>
#include <util/delay.h>
#include "lighthouse.h"

// Initialize Atmega32 to fast PWM mode
void InitPWM()
{
  TCCR0|=(1<WGM00)|(1<<WGM01)|(1<<COM01)|(1<<CS00);
  DDRB|=(1<<PB3);
}

void SetPWMOutput(uint8_t duty)
{
  OCR0=duty;
}

void Wait()
{
  _delay_loop_2(3200);
}

int main()
{
  //uint8_t brightness;
  unsigned int bright_index;
  
  //Initialize PWM Channel 0
  InitPWM();

  while(1)
    {
      // Loop increasing brightness
      for(bright_index=0; bright_index<512; bright_index++)
        {
          SetPWMOutput(bright_curve[bright_index]);
          Wait();
        }
      
    }

  return 0;
}
