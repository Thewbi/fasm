; source: https://board.flatassembler.net/topic.php?p=24917
;
; C:\Users\U5353\Downloads\fasmw17330\FASM.EXE test64.asm build/test64.obj
; C:\Users\U5353\Downloads\Golink\GoLink.exe -fo build/test64.exe build/test64.obj kernel32.dll user32.dll
; build\test64.exe
; rm -f build\test64.exe build\test64.obj

format MS64 COFF

include 'macro/proc64.inc'

extrn '__imp__MessageBoxA@16' as MessageBox:dword

section '.text' code readable executable

public Start

Start:
        ;stdcall MessageBox, 0, caption, message, 0
        ret

section '.data' data readable writeable

caption db 'Win32 assembly', 0
message db 'Coffee time!', 0  