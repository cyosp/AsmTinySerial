//
// --------------------------------------------------------------------
//
// FILE: AsmTinySerial.h
// AUTHOR: CYOSP
// VERSION: 1.0.0
// PURPOSE: Serial assembler library with a C interface for AVR ATtiny
//          Designed to be used in Arduino IDE 
//
// -------------------------------------------------------------------
//
// V 1.0.0	2016-05-17
//  - First release
//

#ifndef __ASM_TINY_SERIAL_H__
#define __ASM_TINY_SERIAL_H__

// Functions implemented in assembler
extern "C"
{
	void SerialAsmTx_0(char, char);
	void SerialAsmTx_1(char, char);
	void SerialAsmTx_2(char, char);
	void SerialAsmTx_3(char, char);
	void SerialAsmTx_4(char, char);
	void SerialAsmTx_5(char, char);
}

// Function pointer on one previously defined
void (*SerialAsmTx)(char, char);

// Delay to wait in assembler code
uint8_t TX_DELAY = 0;

// Initialize UART
//  - txPin: Transmission pin
//           Value between 0 and 5
//  - baudRate : Transmission speed in Baud
//               Typically: 115200
void SerialInit( uint8_t txPin , unsigned long baudRate )
{
	// Initialize the delay
	TX_DELAY = (F_CPU / baudRate - 9) / 3;

	// Initialize the function pointer
	switch( txPin )
	{
		case 0 : SerialAsmTx = &SerialAsmTx_0;
		         break;
		case 1 : SerialAsmTx = &SerialAsmTx_1;
		         break;
		case 2 : SerialAsmTx = &SerialAsmTx_2;
		         break;
		case 3 : SerialAsmTx = &SerialAsmTx_3;
		         break;
		case 4 : SerialAsmTx = &SerialAsmTx_4;
		         break;
		case 5 : SerialAsmTx = &SerialAsmTx_5;
		         break;
	}
}

// Function used to transmit a string
//  - str: A pointer to a character array
void SerialTx( const char * str )
{
   while( *str ) SerialAsmTx( *str++ , TX_DELAY );
}

#endif
