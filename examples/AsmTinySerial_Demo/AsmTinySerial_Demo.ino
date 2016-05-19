#include <AsmTinySerial.h>  

void setup()
{
  // Initialize the library
  // Transmit on pin 3 @ 115200 baud
  SerialInit( PB3  , 115200 );
  // Send Init string
  SerialTx( "Init\n" );
}

void loop()
{}

