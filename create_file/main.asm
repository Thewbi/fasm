;format PE64 NX GUI 6.0
format MS COFF

;entry start
public start

        ; 32 bit
        ;include 'win32w.inc'
        ;include "Win32AX.Inc"
        
        ; 64 bit
        include 'win64a.inc'
        ;include 'win64ax.inc'

section '.text' code readable executable
;.code

; 32 bit
;public  _msg
;extrn   "__imp__MessageBoxA@16" as MessageBox: dword
;proc _msg c lpText: dword, lpCaption: dword
;   invoke  MessageBox, HWND_DESKTOP, [lpText], [lpCaption], MB_OK
;      ret
;endp

public  _msg
extrn   "__imp__MessageBoxA" as MessageBox: dword
proc _msg c lpText: dword, lpCaption: dword
   invoke  MessageBox, HWND_DESKTOP, [lpText], [lpCaption], MB_OK
      ret
endp

start:

        ; The first and only argument is the return code - passed in rcx
        ;xor rcx, rcx
        ;call [ExitProcess]
        ret


;section '.idata' import data readable writeable
;        library kernel32,'KERNEL32.DLL',\
;                user32,'USER32.DLL'
;
;        include 'api\kernel32.inc'
;        include 'api\user32.inc'

.data
;FilePath db 'C:\Test.txt', 0
;hFile dd 0
;BytesRead dd 0
;BytesWritten dd 0
;Buffer rb 256
;Buffer.size equ ($ - Buffer) ; Calculates the size at compile time
;NULL equ 0