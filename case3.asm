.model small
.stack 100
.data 
	m db 10,13,'$'
	m1 db "enter the string",10,13,'$'
	string db 100
		   db 0
		   db 99 dup(0)

.code
	mov ax,@data
	mov ds,ax                        ;intialize the data segment
	mov es,ax			;ES and DS point to same segment
	
	mov ah,9
	lea dx,m1      		;display m1
	int 21h
	
	mov ah,0ah
	lea dx,string		          ;read the string
	int 21h
    
	mov ch,0
	mov cl,string+1		;load the number of characters of the entered string
	mov al,'+'
	lea di,string+2		;di point to the start of the string
	
    cld
	l1:
	scasb				;test if the current char. is 'B'
	je found
	cnt:
	loop l1


	lea dx,m
	mov ah,9			;print new line
	int 21h

	;mov dl,'N'			;this section is executed only
	;mov ah,2			;if the string does not contain "BUG"
	;int 21h			;and print 'N'
	;jmp endd

	found:		         ;if 'B' is found the following section executed

	cmp byte ptr[di] , '-'         ;compare the char. after 'B'
	jne cnt
	;cmp byte ptr[di+1] , 'G'    ;compare the second char. after 'B'
	;jne cnt

	lea dx,m
	mov ah,9
	int 21h

	mov dl,'n'			 ;print 'Y'
	mov ah,2 
	int 21h

	endd:
	mov ah,4ch
	int 21h
end