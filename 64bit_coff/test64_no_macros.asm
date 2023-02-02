; source: https://board.flatassembler.net/topic.php?p=24917
;
; C:\Users\U5353\Downloads\fasmw17330\FASM.EXE test64_no_macros.asm build/test64_no_macros.obj
; C:\Users\U5353\Downloads\Golink\GoLink.exe -fo build/test64_no_macros.exe build/test64_no_macros.obj kernel32.dll user32.dll
; build\test64_no_macros.exe
; rm -f build\test64_no_macros.exe build\test64_no_macros.obj

format MS64 COFF

;include '%fasminc%\win64ax.inc'

extrn MessageBoxA
extrn ExitProcess

section '.text' code readable executable

 public Start

 Start:
        push    rbp                     ; align stack
        sub     rsp, 8 * 4              ; shadow space
        mov     r9d,0
        lea     r8,[_caption]
        lea     rdx,[_message]
        mov     rcx,0
        call    MessageBoxA
        
        ;push    0
        ;push    _caption
        ;push    _message
        ;push    0
        ;call    MessageBoxA
        
        mov     ecx, eax
        call    ExitProcess


section '.data' data readable writeable

 _caption db 'Win64 assembly',0
 _message db 'Coffee time!',0    