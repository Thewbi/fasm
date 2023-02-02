format PE64 NX GUI 6.0

entry start




section '.text' code readable executable
start:
        int3
        sub rsp, 8 * 5  ; adjust stack ptr and allocate shadow space.
        
        ; call ExitProcess(0) which closes all threads and is very similar to return 0;
        ; The argument 0 goes into the rcx register
        ; An xor with a value and itself sets the value to 0
        xor rcx, rcx    ; The first and only argument is the return code - passed in rcx.
        call [ExitProcess]




section '.idata' import readable writeable

; This is a low-level example where everything is done from scratch
; Especially, no include 'win64a.inc' or any other include file is used!
; This means that the macro 'library' is not available and the code to
; use functions from a library such as the KERNEL32.DLL and USER32.DLL
; has to be written by hand! If you do not want to define the directory
; table yourself, include one of the support files (e.g. win64a.inc)
; and then use the predefined macros from the support file.
;
; When using library such as the KERNEL32.DLL and USER32.DLL a so called
; directory table has to be created. The directory table is an interface
; between the compiler and the linker. The compiler will generate code
; which calls functions from the library via a detour over the directory
; table. In other words, the addresses of the code for the functions from
; an external library are expected to be listed inside the directory table.
; When calling a function, the address from the directory table is used!
; In a first step, the assembler will produce the sceleton for the directory
; table but leave all addresses undefined since the assembler cannot determine
; the addresses of the functions.
;
; The linker's job is to generate a windows executable that has valid 
; addresses inside the directory table! It will manipulate the empty 
; sceleton provided by the assembler and insert addresses into the directory
; table. Then end result is a working executable file.
;
; import directory table starts here
; entry for KERNEL32.DLL
idt:    
        dd rva kernel32_iat
        dd 0
        dd 0
        dd rva kernel32_name
        dd rva kernel32_iat
        ; NULL entry - end of IDT
        dd 5 dup(0)
        
; hint/name table
name_table: 
        _ExitProcess_Name dw 0
                          db "ExitProcess", 0, 0

kernel32_name db "KERNEL32.DLL", 0

; import address table for KERNEL32.DLL
kernel32_iat: 
        ExitProcess dq rva _ExitProcess_Name
        dq 0 ; end of KERNEL32's IAT