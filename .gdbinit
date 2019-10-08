set disassembly-flavor intel
set disassemble-next-line on
layout regs
focus cmd 
########## Refresh Screen -- important for tui mode ########
#### NOTE: autorefreshing gdb causes the output to be removed from stdout #####
python
import gdb 
def prompt(current):
    gdb.execute("refresh")
    return current
gdb.prompt_hook = prompt
end
