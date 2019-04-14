set disassembly-flavor intel
set disassemble-next-line on
layout asm 
layout regs
focus cmd 
########## Refresh Screen -- important for tui mode ########
python
import gdb 
def prompt(current):
    gdb.execute("refresh")
    return current
gdb.prompt_hook = prompt
end
