; C:\Users\U5353\Downloads\fasmw17330\FASM.EXE fastcall_64bit.asm build/fastcall_64bit.obj
; C:\Users\U5353\Downloads\Golink\GoLink.exe -fo build/fastcall_64bit.exe build/fastcall_64bit.obj kernel32.dll user32.dll
; build\fastcall_64bit.exe
; rm -f build\fastcall_64bit.exe build\fastcall_64bit.obj

format MS64 COFF

extrn MessageBoxA qword
extrn ExitProcess qword

section '.text' code readable executable

 public Start

Start:
        push    rbp                     ; align stack
        sub     rsp, 8 * 4              ; shadow space
        xor     r9, r9
        lea     r8, [_caption]
        lea     rdx, [_message]
        xor     ecx, ecx
        call    [MessageBoxA]

        mov     ecx, eax
        call    [ExitProcess]

section '.data' data readable writeable

 _caption db 'Win64 assembly',0
 _message db 'Coffee time!',0    