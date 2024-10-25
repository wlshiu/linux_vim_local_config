source ~/.gdb/cpu-arm.gdb
source ~/.gdb/cpu-riscv32.gdb

define z_reg_gprs
    if ($ARM == 1)
        regarm
    else
        if ($RV32 == 1)
            reg_rv32gprs
        end
    end
end
document z_reg_gprs
Print General-purpose registers of CPU.
end





