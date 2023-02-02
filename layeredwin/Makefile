binary = layeredwin.exe
fasm_folder = C:\Users\U5353\Downloads\fasmw17330

$(binary): layeredwin.asm
	set include=$(fasm_folder)\INCLUDE
	$(fasm_folder)\FASM.EXE layeredwin.asm $(binary)
	
.PHONY: clean
clean:
	rm -f $(binary)
	
run: $(binary)
	start $(binary)