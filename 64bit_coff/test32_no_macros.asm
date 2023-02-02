; example of making Win32 COFF object file
; C:\Users\U5353\Downloads\fasmw17330\FASM.EXE test32_no_macros.asm build/test32_no_macros.obj
; C:\Users\U5353\Downloads\Golink\GoLink.exe -fo build/test32_no_macros.exe build/test32_no_macros.obj kernel32.dll user32.dll
; build\test32_no_macros.exe
; rm -f build\test32_no_macros.exe build\test32_no_macros.obj

format MS COFF

extrn '__imp__MessageBoxA@16' as MessageBox:dword

section '.text' code readable executable

 public _demo as "Start"

 _demo:
        push    0
        push    _caption
        push    _message
        push    0
        call    [MessageBox]
        ret

section '.data' data readable writeable

 _caption db 'Win32 assembly',0
 _message db 'No Macros!',0