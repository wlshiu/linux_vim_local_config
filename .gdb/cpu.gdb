source ~/.gdb/cpu-arm.gdb
source ~/.gdb/cpu-riscv32.gdb
source ~/.gdb/cpu-riscv32_n1xx.gdb
source ~/.gdb/cpu-riscv32_n2xx.gdb

define z_reg_gprs

    if ($RV32 == 1)
        reg_rv32gprs
    else
        if ($RV32_N1xx == 1)
            reg_rv32N1_gpr16
        else
            if ($RV32_N2xx == 1)
               reg_rv32N2_gpr16
            else
                if ($ARM == 1)
                    regarm
                else
                    printf "\nUnknown CPU !!!\n"
                end
            end
        end
    end

end
document z_reg_gprs
Print General-purpose registers of CPU.
end


define z_reg_csrs

    if ($RV32_N1xx == 1)
        reg_rv32N1_csrs
    else
        if ($RV32_N2xx == 1)
           reg_rv32N2_csrs
        else
            if ($RV32 == 1)
                printf "\nNot Support\n"
            else
                printf "\nNot Support\n"
            end
        end
    end

end
document z_reg_csrs
Syntax: z_reg_csrs
| Display basic CSRs of RISC-V
end


define z_core_uid

    if ($RV32_N1xx == 1)
        reg_rv32N1_core_uid
    else
        if ($RV32_N2xx == 1)
           reg_rv32N2_core_uid
        else
            if ($RV32 == 1)
                printf "\nNot Support\n"
            else
                printf "\nNot Support\n"
            end
        end
    end

end
document z_core_uid
Syntax: z_core_uid
| Auxiliary function to display UID info of RV32
end


define z_csr_mstatus

    if ($RV32_N1xx == 1)
        reg_rv32N1_mstatus
    else
        if ($RV32_N2xx == 1)
           reg_rv32N2_mstatus
        else
            if ($RV32 == 1)
                printf "\nNot Support\n"
            else
                printf "\nNot Support\n"
            end
        end
    end

end
document z_csr_mstatus
Syntax: z_csr_mstatus
| Auxiliary function to display mstatus fields of RV32
end


define z_csr_mcause

    if ($RV32_N1xx == 1)
        reg_rv32N1_mcause
    else
        if ($RV32_N2xx == 1)
           reg_rv32N2_mcause
        else
            if ($RV32 == 1)
                printf "\nNot Support\n"
            else
                printf "\nNot Support\n"
            end
        end
    end

end
document z_csr_mcause
Syntax: z_csr_mcause
| Auxiliary function to display mcause fields of RV32
end


define z_csr_mtimer

    if ($RV32_N1xx == 1)
        reg_rv32N1_mtimer
    else
        printf "\nNot Support\n"
    end

end
document z_csr_mtimer
Syntax: z_csr_mtimer
| Auxiliary function to display mtimer of RV32
end
