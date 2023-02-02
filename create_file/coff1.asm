; coff1.fasm
; C:\Users\U5353\Downloads\fasmw17330\FASM.EXE coff1.asm build/coff1.obj

; 32 bit
;format MS COFF
; 64 bit
format MS64 COFF

         ; 32 bit
         ;include 'win32w.inc'
         ;include "Win32AX.Inc"
        
         ; 64 bit
         include 'win64a.inc'
         ;include 'win64ax.inc'

; 32 bit
;.code
; 64 bit
section '.text' code readable executable

public  _msg
extrn   "__imp__MessageBoxA@16" as MessageBox: dword
proc _msg c lpText: dword, lpCaption: dword
   invoke  MessageBox, HWND_DESKTOP, [lpText], [lpCaption], MB_OK
      ret
endp



public  _msg2
extrn   "__imp__MessageBoxA@16" as MessageBox2: dword
proc _msg2 c lpText: dword, lpCaption: dword
   invoke  MessageBox, HWND_DESKTOP, [lpText], [lpCaption], MB_OK
      ret
endp