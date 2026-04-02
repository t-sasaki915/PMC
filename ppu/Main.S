#include <avr/io.h>

.section .vectors
.org 0x0000
    RJMP MAIN

.section .text
    MAIN:
        LDI R16, lo8(RAMEND)
        OUT _SFR_IO_ADDR(SPL), R16
        LDI R16, hi8(RAMEND)
        OUT _SFR_IO_ADDR(SPH), R16

        LDI  R16, 0b00000010                     ; R16 = 0b00000010.

        OUT  _SFR_IO_ADDR(DDRB), R16             ; DDRB = R16.
        OUT  _SFR_IO_ADDR(PORTB), R16            ; DDRB = R16.
    LOOP:
        RJMP LOOP
