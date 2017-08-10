
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here


mov AX,1000h
mov DX,2000h
mov CH,09h
L2: dec CH
jz L1                    


mov BX,AX
mov CL,[BX]
mov BX,DX     
mov [BX],CL
inc AX
inc DX
jmp L2

   
L1: ret




