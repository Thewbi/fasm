 ; C:\Users\U5353\Downloads\fasmw17330\FASM.EXE coff1.asm build/coff1.obj
 
 format MS64 COFF 
     public aFunction
     
     section '.data' data readable writeable align 16
     the_x dq -0.1756522 
     fmt db '%f',0 
     msg db 'Hello World',0ah,0 
     
     section '.code' code readable executable ;align 16
     extrn 'printf' as _printf
                                        aFunction:

                                                  sub     rsp,32
                                                  mov     rcx,msg 
                                                  call    _printf
                                                  movq    xmm0, [the_x] 
                                                  mov     rcx, fmt ; rcx returned value
                                                  call    _printf
                                                  add     rsp,32 
                                                  ret           