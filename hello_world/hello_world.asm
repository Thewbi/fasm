; https://gpfault.net/posts/asm-tut-0.txt.html
;
; C:\Users\U5353\Downloads\fasmw17330\FASMW.EXE
; FASMW is downloaded from here: http://flatassembler.net/download.php
; It is a graphical IDE and it is used to compile the .asm file
;
; https://apps.microsoft.com/store/detail/windbg-preview/9PGJGD53TN86?hl=en-us&gl=us&activetab=pivot%3Aoverviewtab
;
; 1. Installing WinDbg: https://github.com/microsoftfeedback/WinDbg-Feedback/issues/19
; 2. Go to: https://store.rg-adguard.net/
; 3. Choose productId from the drop down, then input the store product id of WinDbg which is 9pgjgd53tn86
; 4. Click on the tick button and give it a few seconds
; 5. The website should display direct download links (check that links are pointing to Microsoft servers just to be sure)
; 6. Download the appx file (should be the last one on the list)
; 7. DO NOT try to install it by running the appx file, instead, just unzip it to a folder and voilà! your portable version of WinDbg is ready to be used.

format PE64 NX GUI 6.0

entry start

section '.text' code readable executable
start:
        int3
        ret