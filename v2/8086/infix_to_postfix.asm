org 100h
;1000 stack for symbols
;2000 stack for operators
a DB 'A+B*D' 
MOV BP,0h
MOV SI,0h ;symbols_stack pointer
MOV DI,0h ;operator_stack pointer  



loop:MOV AL,a[BP]
CMP AL,40h
JS operator_stack
MOV  BX,2000h
MOV [BX+SI],AL
INC SI
INC BP
CMP BP,05h
JZ  end
JMP loop



operator_stack: INC BP
                MOV BX, 1000h
                CMP DI,0h
                JZ first_time 
                DEC DI
                MOV AH,[BX+DI]
                INC DI
                CMP AH,AL
                JS  pop_till_positive
                MOV [BX+DI],AL
                INC DI
                JMP loop
                
                
      
      
first_time: MOV [BX],AL
            INC DI
            JMP loop
                
                 
                 
                 
                 
                 
pop_till_positive: DEC DI 
                   MOV BX,1000h
                   MOV AH,[BX+DI]
                   MOV BX,2000h
                   MOV [BX+SI],AH
                   INC SI
                   JMP pop_and_push
                   
pppp: MOV BX,1000h
      MOV [BX+DI],AL
      INC DI
      JMP loop

                
pop_and_push: CMP DI,0h
              JZ pppp
              MOV BX,1000h
              DEC DI
              MOV AH,[BX+DI]   ;pop next operator...  
              INC DI
              CMP AH,AL        
              JNS  pppp         ;if not negative goto loop
              MOV BX,2000h
              MOV [BX+SI],AH
              INC DI
              INC SI
              JMP pop_and_push   
              
              
              
              
              
end: CMP DI,0h
     JZ ext
     MOV BX,1000h
     DEC DI
     MOV AH,[BX+DI]
     MOV BX,2000h
     MOV [BX+SI],AH
     INC SI
     JMP end
              
                 
ext:hlt