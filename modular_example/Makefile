# https://board.flatassembler.net/topic.php?t=11520

binary = modular.exe
build = build

run: $(build)/$(binary)
	start $(build)/$(binary)

# link object files into binary
$(build)/$(binary): init $(build)/coff1.obj $(build)/coff2.obj
	C:\Users\U5353\Downloads\Golink\GoLink.exe -fo $(build)/$(binary) $(build)/coff1.obj $(build)/coff2.obj user32.dll 
	
$(build)/coff1.obj: init coff1.asm
	C:\Users\U5353\Downloads\fasmw17330\FASM.EXE coff1.asm $(build)/coff1.obj

$(build)/coff2.obj: init coff2.asm
	C:\Users\U5353\Downloads\fasmw17330\FASM.EXE coff2.asm $(build)/coff2.obj
	
.PHONY: init
init:
	set include=C:\Users\U5353\Downloads\fasmw17330\INCLUDE
	@echo include: $(include)
	mkdir -p build

.PHONY: clean
clean:
	rm -f $(build)/$(binary) $(build)/coff1.obj $(build)/coff2.obj
	
