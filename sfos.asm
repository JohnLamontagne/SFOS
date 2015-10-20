bits 16 ; 16-bit Real Mode
org 0x7c00 ; BIOS boot origin 

main:
	cli ; Clear interrupts 
	; Setup stack segments 
	mov ax,cs              
	mov ds,ax   
	mov es,ax               
	mov ss,ax                
	sti ; Enable interrupts 
	
	mov si, greeting
	call print_string
	
	%include "functions.asm"
	
	jmp $ ; halt execution.
	
	greeting db "Welcome! Now Booting SFOS (Simply Fast Operating System)...", 0x0
	
	times 510 - ($-$$) db 0
	dw 0xAA55 ; Our boot signature