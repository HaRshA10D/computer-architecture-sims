
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

 
;initializing destination array with X

arr DB 'A*B*C+D',0
barr DB 'XXXXXXX',0


mov AX,0000h
push AX

;CL = number of characters in the expression + 1
mov CL,08h  

mov DI,00h
mov SI,00h

L4: mov AL,arr[DI]

jmp L1





L1: cmp AL,'A'
jz L2
cmp AL,'B'
jz L2  
cmp AL,'C'
jz L2 
cmp AL,'D'
jz L2  
cmp arr[DI],00h
jz L5
jmp L3

      

L2: mov CH,arr[DI]
mov barr[SI],CH
inc DI
inc SI
jmp L4 

L3: mov DL,arr[DI]
push DX
inc DI
jmp L4

     
L5: pop DX
cmp DX,00h
jz L6
mov barr[SI],DL
inc SI
jmp L5


L6: mov BX,1000h
mov SI,0000h

L7: dec CL
jz L8
mov DL,barr[SI]
mov [BX],DL
inc SI
inc BX
jmp L7

L8: hlt
ret
    
     
     
     
     