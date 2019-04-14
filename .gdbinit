set disassembly-flavor intel
set disassemble-next-line on
layout asm 
layout regs
focus cmd 

define hook-nexti
refresh
end

define hook-stepi
refresh
end

define hook-next
refresh
end

define hook-step
refresh
end
