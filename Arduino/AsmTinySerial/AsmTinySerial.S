//
// --------------------------------------------------------------------
//
// FILE: AsmTinySerial.S
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

#include <avr/io.h>

; Define configuration for UART
#define UART_PORT		(PORTB - __SFR_OFFSET)
#define UART_PORT_DIR	(DDRB  - __SFR_OFFSET)

; Define internal registers used by the program
#define TX_BITS_NBR_TMP		r18
#define WAIT_NBR_TMP		r19

; First argument which is the byte to transmit is passed trought register 24
#define BYTE_TO_TRANSMIT	r24
; Second argument which is the number of wait is passed trought register 22
#define WAIT_NBR			r22

; Transmit on PB0
.global SerialAsmTx_0
SerialAsmTx_0:
	cli								; Disable interrupts
	sbi UART_PORT_DIR, PB0			; Set Tx line to output
	ldi TX_BITS_NBR_TMP, 10			; Set number of bits to transmit: 1 start + 8 bit + 1 stop
	com BYTE_TO_TRANSMIT			; Invert and set carry
TxLoop_0:
        brcc Tx1_0					; Jump to label Tx1_0 if carry cleared
        cbi UART_PORT, PB0			; PB0 set to 0
Tx1_0:
        brcs TxDone_0				; Jump to label TxDone_0 if carry set
        sbi UART_PORT, PB0			; PB0 set to 1
TxDone_0:
        mov WAIT_NBR_TMP, WAIT_NBR	; Load wait number
TxDelay_0:
        dec WAIT_NBR_TMP			; Decrement WAIT_NBR_TMP
        brne TxDelay_0				; Jump to label TxDelay_0 if WAIT_NBR_TMP not equal to 0
        lsr BYTE_TO_TRANSMIT		; Shift right byte to transmit <=> manage new bit to transmit
        dec TX_BITS_NBR_TMP			; Update number of bits to transmit
        brne TxLoop_0				; Jump to label TxLoop_0 if TX_BITS_NBR_TMP not equal to 0
		reti						; return and enable interrupts

; Transmit on PB1
.global SerialAsmTx_1
SerialAsmTx_1:
	cli
	sbi UART_PORT_DIR, PB1
	ldi TX_BITS_NBR_TMP, 10
	com BYTE_TO_TRANSMIT
TxLoop_1:
        brcc Tx1_1
        cbi UART_PORT, PB1
Tx1_1:
        brcs TxDone_1
        sbi UART_PORT, PB1
TxDone_1:
        mov WAIT_NBR_TMP, WAIT_NBR
TxDelay_1:
        dec WAIT_NBR_TMP
        brne TxDelay_1
        lsr BYTE_TO_TRANSMIT
        dec TX_BITS_NBR_TMP
        brne TxLoop_1
		reti

; Transmit on PB2
.global SerialAsmTx_2
SerialAsmTx_2:
	cli
	sbi UART_PORT_DIR, PB2
	ldi TX_BITS_NBR_TMP, 10
	com BYTE_TO_TRANSMIT
TxLoop_2:
        brcc Tx1_2
        cbi UART_PORT, PB2
Tx1_2:
        brcs TxDone_2
        sbi UART_PORT, PB2
TxDone_2:
        mov WAIT_NBR_TMP, WAIT_NBR
TxDelay_2:
        dec WAIT_NBR_TMP
        brne TxDelay_2
        lsr BYTE_TO_TRANSMIT
        dec TX_BITS_NBR_TMP
        brne TxLoop_2
		reti

; Transmit on PB3
.global SerialAsmTx_3
SerialAsmTx_3:
	cli
	sbi UART_PORT_DIR, PB3
	ldi TX_BITS_NBR_TMP, 10
	com BYTE_TO_TRANSMIT
TxLoop_3:
        brcc Tx1_3
        cbi UART_PORT, PB3
Tx1_3:
        brcs TxDone_3
        sbi UART_PORT, PB3
TxDone_3:
        mov WAIT_NBR_TMP, WAIT_NBR
TxDelay_3:
        dec WAIT_NBR_TMP
        brne TxDelay_3
        lsr BYTE_TO_TRANSMIT
        dec TX_BITS_NBR_TMP
        brne TxLoop_3
		reti

; Transmit on PB4
.global SerialAsmTx_4
SerialAsmTx_4:
	cli
	sbi UART_PORT_DIR, PB4
	ldi TX_BITS_NBR_TMP, 10
	com BYTE_TO_TRANSMIT
TxLoop_4:
        brcc Tx1_4
        cbi UART_PORT, PB4
Tx1_4:
        brcs TxDone_4
        sbi UART_PORT, PB4
TxDone_4:
        mov WAIT_NBR_TMP, WAIT_NBR
TxDelay_4:
        dec WAIT_NBR_TMP
        brne TxDelay_4
        lsr BYTE_TO_TRANSMIT
        dec TX_BITS_NBR_TMP
        brne TxLoop_4
		reti

; Transmit on PB5
.global SerialAsmTx_5
SerialAsmTx_5:
	cli
	sbi UART_PORT_DIR, PB5
	ldi TX_BITS_NBR_TMP, 10
	com BYTE_TO_TRANSMIT
TxLoop_5:
        brcc Tx1_5
        cbi UART_PORT, PB5
Tx1_5:
        brcs TxDone_5
        sbi UART_PORT, PB5
TxDone_5:
        mov WAIT_NBR_TMP, WAIT_NBR
TxDelay_5:
        dec WAIT_NBR_TMP
        brne TxDelay_5
        lsr BYTE_TO_TRANSMIT
        dec TX_BITS_NBR_TMP
        brne TxLoop_5
		reti

