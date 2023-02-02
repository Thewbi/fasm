; source: https://board.flatassembler.net/topic.php?p=24917
;
; C:\Users\U5353\Downloads\fasmw17330\FASM.EXE create_file_64.asm build/create_file_64.obj
; C:\Users\U5353\Downloads\Golink\GoLink.exe -fo build/create_file_64.exe build/create_file_64.obj kernel32.dll user32.dll
; build\create_file_64.exe
; rm -f build\create_file_64.exe build\create_file_64.obj

format MS64 COFF

extrn CreateFileA
extrn WriteFile
extrn CloseHandle
extrn ExitProcess

section '.data' data readable writeable

 phy1ename   db 'Rambo.txt', 0
 stryng      db 'Rambo - First Blood, Part II :', 0Dh,0Ah
             db 'For our country love us, as much as we love it!'
 stryng_syze = $ - stryng

 BytezWrytten dq ?

section '.text' code readable executable

 public Start

 Start:

        sub     rsp,7*8 ; reserve stack space for up to 7 arguments
                        ;  (you may expand this allocation if you need
                        ;  to call procedures that take more than 7 arguments)
                        ;  and restore the stack frame only at the end of your routine.

        mov     qword [rsp+6*8],0   ; store 7th argument
        mov     dword [rsp+5*8],80h ; store 6th argument
        mov     dword [rsp+4*8],2   ; store 5th argument

        xor     r9,r9           ; the first four argument are passed in registers,
        xor     r8d,r8d         ;  but stack space is still reserved for them,
        mov     edx,40000000h   ;  the called routine may want to spill them there
        lea     rcx,[phy1ename]
        call    CreateFileA

        xchg    rbx,rax         ; store result in the register that is preserved by calls

        mov     qword [rsp+4*8],0   ; store 5th argument

        lea     r9,[BytezWrytten]
        mov     r8d,stryng_syze
        lea     rdx,[stryng]
        mov     rcx,rbx
        call    WriteFile

        mov     rcx,rbx         ; not that this call does not need any arguments on stack,
        call    CloseHandle     ;  but the stack space should be reserved for the arguments passed
                                ;  in registers to be fully compliant with calling convention

        xor     rcx,rcx         ; restoring stack frame is not needed at all in this case, if
        call    ExitProcess     ;  this was the end of procedure, you would have to do it before returning.    