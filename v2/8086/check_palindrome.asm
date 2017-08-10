
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here
mov AX,1000h
mov DX,100Fh
mov CL,09h
L2: dec CL
jz L3
mov BX,AX
mov CH,[BX]
mov BX,DX
cmp CH,[BX]
jnz L1
inc AX
dec DX
jmp L2



L1:mov CL,01h



L3: ret




;CL-0 palindrome

;CL-1 not a palindrome