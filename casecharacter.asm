.model small  

.stack 200h

.data
str db "2+1+2",'$'

.code

mov ax,@data
mov ds,ax
mov es,ax ; let es=ds
lea si,str  ;source address for str
lea di,str ;destination address for str
mov cx,6  ;6= number of bytes in str
mov bl,'A'
mov bh,'Z'
cld ; Set Auto-Increment mode
next: lodsb ;load al with a byte from str
cmp al,bh
jg L3 ; if the byte is not a character

cmp al,bl
jl L3 ;if the byte is not a character

jge L2 ;if the byte is an upper case letter



;L1: 
;STOSB  ;doesn't change the byte and stores it in str
;jmp L3 

L2: 
mov ah,2
mov dl,10
int 21h                       ;print new line
mov dl,13
int 21h
 
mov dl,'N' ;NOT VALID
mov ah,2
int 21h  
jmp endd

;add al,20h ;converts the letter to lower case
;stosb ;stores it in str
;jmp L3

L3:
loop next    

endd:  
mov ah,2
mov dl,10
int 21h                       ;print new line
mov dl,13
int 21h

mov ah,09h
lea dx,str
int 21h

end
