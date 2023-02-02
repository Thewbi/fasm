; https://stackoverflow.com/questions/37671413/push-pop-eax-gives-me-illegal-instruction-at-compile-time

format PE64 GUI

include 'win64a.inc'

entry start

section '.text' code readable executable

start:
        ; reserve stack for API use and make stack dqword aligned
        sub     rsp, 8*5

        ; use rbx as counter as it is preserved across windows API calls
        mov     rbx, 10

.for_loop_check:

        cmp     rbx, 0
        je      .exit_for_loop

        mov     r9d, 0
        lea     r8, [_caption]
        lea     rdx, [_message]
        mov     rcx, 0
        call    [MessageBoxA]

        ; no more pushing and poping to the stack required
        ; rbx is guaranteed to be unmodified by the windows API

        dec rbx
        jmp .for_loop_check

.exit_for_loop:

        mov     ecx, eax
        call    [ExitProcess]

section '.data' data readable writeable

  _caption db 'Win64 assembly program', 0
  _message db 'Hello World!', 0

section '.idata' import data readable writeable

  library kernel32,'KERNEL32.DLL',\
          user32,'USER32.DLL'

  include 'api\kernel32.inc'
  include 'api\user32.inc'