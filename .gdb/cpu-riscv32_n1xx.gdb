# ------------------------------------------------
# Generic GDB script
# Copyright (c) 2024, All Rights Reserved.
# @file    GDB script
# @author  Wei-Lun Hsu
# @version 1.0
# ------------------------------------------------

#
# Nuclei N1xx RISC-V Core
#

define reg_rv32N1_gpr16
    printf "\n"

    # pc
	printf "pc = x%08X\n", $pc

	# ra, sp, gp, tp
	printf "ra (x1 ) = x%08X, sp (x2 ) = x%08X, gp (x3 ) = x%08X, tp (x4 ) = x%08X\n", $ra, $sp, $gp, $tp

	#-------func_argv----------
	# a1 ~ a3
	printf "a0 (x10) = x%08X, a1 (x11) = x%08X, a2 (x12) = x%08X, a3 (x13) = x%08X\n", $a0, $a1, $a2, $a3

	# a4 ~ a5
	printf "a4 (x14) = x%08X, a5 (x15) = x%08X\n", $a4, $a5

	# s0 ~ s1
	printf "s0 (x8 ) = x%08X, s1 (x9 ) = x%08X\n", $s0, $s1
	# t0 ~ t2
	printf "t0 (x5 ) = x%08X, t1 (x6 ) = x%08X\n, t2 (x7 ) = x%08X", $t0, $t1, $t2

end
document reg_rv32N1_gpr16
Syntax: reg_rv32N1_gpr16
| Auxiliary function to display GPRs of Nuclei N100 E extension.
end


define reg_rv32N1_csrs
    printf "\n"

    # verctor basea
	printf "mtvec= x%08X, mtvt= x%08X\n", $mtvec, $mtvt

	# trap: mcause, mepc, mstatus
	printf "mcause= x%08X, mepc= x%08X, mstatus= x%08X\n", $mcause, $mepc, $mstatus



end
document reg_rv32N1_csrs
Syntax: reg_rv32N1_csrs
| Auxiliary function to display basic CSRs of Nuclei N100 E extension.
end


define reg_rv32N1_core_uid
    printf "\n"

    # mvendorid
	printf "Vendor ID       = x%08X\n", $mvendorid

	# marchid
	printf "Architecture ID = x%08X\n", $marchid

	# mimpid
	printf "Implementation ID = x%08X\n", $mimpid



end
document reg_rv32N1_core_uid
Syntax: reg_rv32N1_core_uid
| Auxiliary function to display UID info of Nuclei N1xx
end


define reg_rv32N1_mstatus

    printf "\n"
    printf "mstatus: MIE= x%X, MPIE= x%X\n", \
        (($mstatus >> 3) & 0x1), (($mstatus >> 7) & 0x1)


end
document reg_rv32N1_mstatus
Syntax: reg_rv32N1_mstatus
| Auxiliary function to display mstatus fields of Nuclei N1xx
end


define reg_rv32N1_mcause

    printf "\n"
    printf "mcause: INTERRUPT= x%X, EXCCODE= x%X\n", \
        (($mcause >> 31) & 0x1), ($mcause & 0xFFF)
    printf "        MPP= x%X, MPIE= x%X, MPIL= x%X\n", \
        (($mcause >> 28) & 0x3), (($mcause >> 27) & 0x1), (($mcause >> 16) & 0xFF)


end
document reg_rv32N1_mcause
Syntax: reg_rv32N1_mcause
| Auxiliary function to display mcause fields of Nuclei N1xx
end


define reg_rv32N1_mtimer

    printf "\n"
    printf "msip: x%X, mstop: x%X\n", \
        (($msip) & 0x1), ($mstop & 0x1)
    printf "mtimecmp= x%X, mtime= x%X\n", \
        ($mtimecmp & 0xFFFFFF), $mtime


end
document reg_rv32N1_mtime
Syntax: reg_rv32N1_mtimer
| Auxiliary function to display mtimer of Nuclei N1xx
end
