# AsmTinySerial

Serial assembler library for AVR ATtiny

![Stable version](https://img.shields.io/badge/stable-1.0.0-blue.svg)
[![BSD-3 license](https://img.shields.io/badge/license-BSD--3--Clause-428F7E.svg)](https://tldrlegal.com/license/bsd-3-clause-license-%28revised%29)

## Description

This serial library is written in assembly and is based on work done by [Ralph Doncaster](http://nerdralph.blogspot.fr/2013/12/writing-avr-assembler-code-with-arduino.html).

With a [C](https://en.wikipedia.org/wiki/C_%28programming_language%29) interface it has been written for microcontrollers [Atmel AVR Tiny](http://www.atmel.com/products/microcontrollers/avr/tinyavr.aspx) and [Arduino IDE](https://www.arduino.cc/).

At the end it has been tested on a [ATtiny85](http://www.atmel.com/devices/attiny85.aspx) and must be at least compatible with ATtinyX5 series.

Library is **only 260 Bytes**

## Arduino installation

To install the library in the [Arduino IDE](https://www.arduino.cc/) steps are:
 * Close your Arduino software if opened.
 * Copy the *Arduino/AsmTinySerial* folder in your Arduino *sketchbook/libraries* directory.
 * That's all, restart your Arduino software.

## How to use

Library provides two functions:
 * **void SerialInit( uint8_t , unsigned long )**

	It allows to configure transmission port thus baud rate:

	* The first parameter is the transmission port.

		Ports allowed are from *PB0* to *PB5*.

	* The second one is the baud rate.

		Typically: 115200 Baud.

 * **void SerialTx( const char * )**

	It allows to send a string through a character array.

## Arduino sketch example

This sketch shows how to use the library:

```C
#include <AsmTinySerial.h>

void setup()
{
  // Initialize the library
  // Transmit on pin 3 @ 115200 baud
  SerialInit( PB3  , 115200 );
  // Send Init string
  SerialTx( "Init" );
}

void loop()
{}
```

## License

**[AsmTinySerial](https://github.com/cyosp/AsmTinySerial)** is released under the BSD 3-Clause License. See the bundled `LICENSE.md` for details.
