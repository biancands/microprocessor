	.cdecls "msp430.h"
	.global main
	
	.text

main:
	mov.w	#(WDTPW|WDTHOLD), &WDTCTL

	mov.w 	#3, R4		; Inicializa R4 = -1
	mov.w 	#4, R5		; Inicializa R5 = 0x4321
	clr		R6			; Decrementa 1 e R5

main_loop:
	call	#acumula
	dec 	R4
	jnz 	main_loop

	jmp 	$
	nop

acumula:
	add 	R5, R6
	ret
