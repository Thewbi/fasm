; coff2.fasm
; C:\Users\U5353\Downloads\fasmw17330\FASM.EXE coff2.asm build/coff2.obj
format MS COFF
     
include "Win32AX.Inc"

.code

public  start

start:
extrn   _msg
extrn   _msg2
      
ccall   _msg, _text, _caption
ret




.data
_text  db      "Hello, world!", 0
_caption db     "extrn/public", 0