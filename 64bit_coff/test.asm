; C:\Users\U5353\Downloads\fasmw17330\FASM.EXE test.asm build/test.obj
; C:\Users\U5353\Downloads\Golink\GoLink.exe -fo build/test.exe build/test.obj kernel32.dll user32.dll
; build\test.exe
; rm -f build\test.exe build\test.obj

format MS COFF

include 'macro/proc32.inc'

extrn '__imp__MessageBoxA@16' as MessageBox:dword

section '.text' code readable executable

public Start

Start:
        invoke MessageBox, 0, caption, message, 0
        ret

section '.data' data readable writeable

caption db 'Win32 assembly', 0
message db 'Coffee time!', 0  