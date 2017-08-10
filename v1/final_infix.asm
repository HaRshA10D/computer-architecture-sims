org 100h   
MOV SI,0h;
a DB 50 DUP(00h) ;
MOV SI,0h;

mov ah, 1h;
int 21h;
mov cl, al;
mov ch, al; 

sub cl,30h;
sub ch,30h;

MOV dl, 10
MOV ah, 02h
INT 21h

input: mov ah,1h;
int 21h;
mov a[si],al;
inc si;
dec cl;
jnz input;

MOV dl, 10
MOV ah, 02h
INT 21h
         
MOV CL,CH;
MOV SI,0h;
push 0009h;    

loop: mov ch,a[si]; 
cmp ch,2Fh; 
jz DIVI;

mov ch,a[si]; 
cmp ch,2Ah; 
jz MULT;   

mov ch,a[si]; 
cmp ch,2Bh; 
jz PLUS;

mov ch,a[si]; 
cmp ch,2Dh; 
jz MINU; 

mov dl, a[si];
mov ah, 2h; 
int 21h;   

CONT: INC si;
dec cl;
jz end;                 
jmp loop; 

end: pop bx;
cmp bl,00h
jz e1111;
jmp print;
jmp end;

e1111: hlt;

DIVI: push 0001h;
jmp func;

MULT: push 0002h;
jmp func;  

PLUS: push 0003h;
jmp func;  
 
MINU: push 0004h;
jmp func; 

func: pop ax;
pop bx;
cmp bl,09h;  
jz CONT1;
cmp bl,al;
js pro; 
push bx;
push ax;
jmp CONT;

CONT1: push bx;
push ax;
jmp cont;

pro: push Ax;
jmp print;

print: cmp bl,01;
jz div_pri;
cmp bl,02;
jz mul_pri;
cmp bl,03;
jz sum_pri;
cmp bl,04;
jz sub_pri; 
abc: mov dl,bl;
mov ah, 2h; 
int 21h
cmp cl,00h;
jz end;
jmp func; 

div_pri:MOV bl,2Fh;
jmp abc;
mul_pri:MOV bl,2Ah; 
jmp abc;
sum_pri:MOV bl,2Bh; 
jmp abc;
sub_pri:MOV bl,2Dh; 
jmp abc;