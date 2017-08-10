
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

arr DB 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
mov BL,00
mov AL,27
mov DI,00
L1: dec AL
jz stop
mov DL,arr[DI]
cmp DL,'A'
jz L3
cmp DL,'E'
jz L3
cmp DL,'I'
jz L3
cmp DL,'O'
jz L3
cmp DL,'U' 
jz L3
inc DI
jmp L1


L3: inc BL
inc DI
jmp L1

stop: hlt
ret




