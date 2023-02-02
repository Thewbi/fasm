binary = exit_process.exe
fasm_folder = C:\Users\U5353\Downloads\fasmw17330

$(binary): exit_process.asm
	set include=$(fasm_folder)\INCLUDE
	$(fasm_folder)\FASM.EXE exit_process.asm $(binary)
	
.PHONY: clean
clean:
	rm -f $(binary)
	
run: $(binary)
	start $(binary)