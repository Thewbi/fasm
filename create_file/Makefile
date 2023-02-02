# https://board.flatassembler.net/topic.php?t=11520

binary = main.exe
build = build

run: $(build)/$(binary)
	start $(build)/$(binary)

# link object files into binary
$(build)/$(binary): init $(build)/main.obj
	C:\Users\U5353\Downloads\Golink\GoLink.exe -fo $(build)/$(binary) $(build)/main.obj user32.dll 
	
$(build)/main.obj: init main.asm
	C:\Users\U5353\Downloads\fasmw17330\FASM.EXE main.asm $(build)/main.obj
	
.PHONY: init
init:
	set include=C:\Users\U5353\Downloads\fasmw17330\INCLUDE
	@echo include: $(include)
	mkdir -p build

.PHONY: clean
clean:
	rm -f $(build)/$(binary) $(build)/main.obj
	
