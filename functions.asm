print_string:
	_loop:
		lodsb 
		cmp al, 0
		je _end ; if we've reached the end of our string, designated by the null terminator 0, jump to the end of this function.
		mov ah, 0x0e ; teletype
		int 0x10
		jmp _loop ; print the next character
		
	_end:
		ret ; return
