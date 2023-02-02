; coff1.fasm
format MS COFF

include "WIN32AX.INC"

.code

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