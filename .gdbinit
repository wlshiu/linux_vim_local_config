
# __________________global variables_________________
set $ARM = 0
set $RV32 = 0
set $RV32_N1xx = 0
set $RV32_N2xx = 0

set $SHOW_CONTEXT = 0
set $SHOW_NEST_INSN = 0

set $CONTEXTSIZE_STACK = 6
set $CONTEXTSIZE_DATA  = 8
set $CONTEXTSIZE_CODE  = 8





# __________________cofigurations_________________

set auto-load local-gdbinit on

set confirm off
# set architecture riscv:rv32

set disassemble-next-line auto

set style address background white
set style address intensity bold

# set style sources on
# set style tui-current-position on

# show style sources
# show style tui-current-position


## configure some print formats
set print pretty on
set print array on


set prompt \033[0;33mgdb>>> \033[0m

# aliases
alias -- it = info threads
alias -- ib = info breakpoints
alias -- ia = info args
alias -- ir = info registers
alias -- il = info locals
alias -- all = thread apply all


# __________________color functions_________________
# color codes
set $BLACK = 0
set $RED = 1
set $GREEN = 2
set $YELLOW = 3
set $BLUE = 4
set $MAGENTA = 5
set $CYAN = 6
set $WHITE = 7

set $COLOR_REGNAME = $GREEN
set $COLOR_REGVAL = $BLACK
set $COLOR_REGVAL_MODIFIED = $RED

define color
    # BLACK
    if $arg0 == 0
        echo \033[0;30m
    else
        # RED
        if $arg0 == 1
            echo \033[0;31m
        else
            # GREEN
            if $arg0 == 2
                echo \033[0;32m
            else
                # YELLOW
                if $arg0 == 3
                    echo \033[0;33m
                else
                    # BLUE
                    if $arg0 == 4
                        echo \033[0;34m
                    else
                        # MAGENTA
                        if $arg0 == 5
                            echo \033[0;35m
                        else
                            # CYAN
                            if $arg0 == 6
                                echo \033[0;36m
                            else
                                # WHITE
                                if $arg0 == 7
                                    echo \033[0;37m
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

define color_reset
    echo \033[0;0m
end

define color_bold
    echo \033[0;1m
   #echo \[\e[1m\]
end

define color_underline
    echo \033[0;4m
end

# __________________macros_________________

define z_arm
    set $64BITS = 0

    set $ARM = 1
    set $RV32 = 0
    set $RV32_N1xx = 0
    set $RV32_N2xx = 0
end
document z_arm
Set gdb to work with ARM binaries.
end

define z_rv32
    set $64BITS = 0

    set $ARM = 0
    set $RV32 = 1
    set $RV32_N1xx = 0
    set $RV32_N2xx = 0
end
document z_rv32
Set gdb to work with RISC-V 32-bits binaries.
end

define z_rv32_n1xx
    set $64BITS = 0

    set $ARM = 0
    set $RV32 = 0
    set $RV32_N1xx = 1
    set $RV32_N2xx = 0
end
document z_rv32_n1xx
Set gdb to work with RISC-V Nuclei N1xx.
end

define z_rv32_n2xx
    set $64BITS = 0

    set $ARM = 0
    set $RV32 = 0
    set $RV32_N1xx = 0
    set $RV32_N2xx = 1
end
document z_rv32_n2xx
Set gdb to work with RISC-V Nuclei N2xx.
end


source ~/.gdb/cpu.gdb
source ~/.gdb/data.gdb
source ~/.gdb/window.gdb
