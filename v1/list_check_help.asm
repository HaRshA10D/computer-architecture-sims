org 100h   
MOV SI,0h;
a DB 100 DUP(00h) ; 
MOV SI,0h;
MOV SI,0h; 
l DB 100 DUP(00h) ;
MOV SI,0h;

;l DB 'Rahul;Ram;Rupesh;aravid;',0
MOV SI,0h;

input: mov ah,1h;
int 21h;
mov l[si],al;
inc si;
cmp al,2eh;
jnz input;
;mov cx,si;
MOV SI,0h;

MOV dl, 10
MOV ah, 02h
INT 21h

input1: mov ah,1h;
int 21h;
mov a[si],al;
inc si;
cmp al,3bh;
jnz input1;
mov cx,si;
         
MOV SI,0h;

MOV AL,00H; 

loop1: mov al,a[si];
mov ah,l[bp];
cmp al,ah;
jnz not_equal1;
jz equal;
not_equal1: mov si,00h;
jmp not_equal; 
not_equal: mov dl,l[bp];
inc bp;
cmp dl,3bh;
jz loop1;
jmp check_not;

check_not: ;mov dl,l[bp];
cmp dl,2eh;
jz end_fail;
jmp not_equal;

end_fail: mov dx,0002h;
hlt;

equal:  inc si;
inc bp; 
cmp al,3bh;
jnz loop1;
mov dx,0103h;
hlt;

