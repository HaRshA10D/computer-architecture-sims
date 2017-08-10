mvi E,08h
lhld 1000h
mov B,H
mov C,L
mvi H,00h
mvi L,00h
lda 1002h
rar
jc mult
start: mov D,A
mov A,C
ral
mov C,A
mov A,B
ral
mov B,A
mov A,D
rar
jc mult
dcr E
jz end
jmp start

start1: dcr E
jz end
jmp start

mult: dad B
stc
cmc
jmp start1

end: shld 1004h
hlt