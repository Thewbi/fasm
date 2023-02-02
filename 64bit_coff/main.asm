 ; https://stackoverflow.com/questions/5612684/external-procedure-in-fasm
 ;
 ; set include=C:\Users\U5353\Downloads\fasmw17330\INCLUDE
 ; rm -f build/main.obj build/main.exe
 ; C:\Users\U5353\Downloads\fasmw17330\FASM.EXE main.asm build/main.obj
 ; C:\Users\U5353\Downloads\Golink\GoLink.exe -mix -fo build/main.exe build/main.obj kernel32.dll user32.dll
 ; start build/main.exe
 ;
 ; cd C:\dev\fasm\64bit_coff
 ; main.exe
 
 format MS64 COFF
 
 ;include 'win64a.inc'
 include 'macro/PROC64.INC'
 ;include "Win32AX.Inc"

     ;extrn   aFunction
     ;extrn   ExitProcess
     
;extrn   "__imp__ExitProcess@4" as ExitProcess:dword
;extrn   "__imp__ExitProcess@4" as _ExitProcess: dword
;extrn   "__imp__ExitProcess" as ExitProcess: dword
;extrn   "_ExitProcess" as ExitProcess: dword
;extrn   "_ExitProcess" as ExitProcess

;extrn   "__imp__MessageBoxA@16" as MessageBox: dword
extrn '__imp__MessageBoxA@16' as MessageBox:dword
     
section '.text' code readable executable

public Start
Start:
        ;push    0
        ;push    _caption
        ;push    _message
        ;push    0
        ;call    MessageBox
        
        ;mov     ecx, eax
        ;call    ExitProcess
        
        ;call    [ExitProcess]
        ;call    _ExitProcess
        ;invoke [ExitProcess]
        
        invoke MessageBox, 0, caption, message, 0
        ret

section '.data' data readable writeable

caption db 'Win32 assembly', 0
message db 'Coffee time!', 0         
        
;section '.data' data readable writeable
;_message  db      "Hello, world!", 0
;_caption db     "extrn/public", 0
        
;section '.idata' import data readable writeable
;
;  library kernel32,'KERNEL32.DLL',\
;          user32,'USER32.DLL'
;
;  include 'api\kernel32.inc'
;  include 'api\user32.inc'