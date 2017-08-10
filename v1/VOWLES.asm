org 100h   
MOV SI,0h;
a DB 100 DUP(00h) ;
MOV SI,0h;

input: mov ah,1h;
int 21h;
mov a[si],al;
inc si;
cmp al,3bh;
jnz input;
mov cx,si;

MOV dl, 10
MOV ah, 02h
INT 21h
         
MOV SI,0h;

MOV AL,00H; 

loop1:mov ch,a[si]; 

cmp ch,41h; 
jz V;
 
cmp ch,45h; 
jz V;   
 
cmp ch,49h; 
jz V;

cmp ch,4Fh; 
jz V;

cmp ch,55h; 
jz V;     

cmp ch,61h; 
jz V;
 
cmp ch,65h; 
jz V;   
 
cmp ch,69h; 
jz V;

cmp ch,6Fh; 
jz V;

cmp ch,75h; 
jz V;
 
CNT:INC SI; 
DEC CL;
JZ END;
JMP LOOP1;

V:INC AL;
JMP CNT; 

END: ;mov dl,Al;
;mov ah, 2h; 
;int 21h
mov dl, AL

; load address of data table in bx, for xlat instruction:
lea bx, table  

; xlat does the following:
; al = ds:[bx + unsigned al]

mov al, dl
shr al, 4    ; leave high part only.
xlat         ; get hex digit. 
mov ah, 0eh  ; teletype sub-function.
int 10h


mov al, dl
and al, 0fh  ; leave low part only.
xlat         ; get hex digit.     
mov ah, 0eh  ; teletype sub-function.
int 10h

; wait for any key press:
;mov ah, 0
;int 16h

ret

table db '0123456789abcdef'
