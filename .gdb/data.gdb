
# __________hex/ascii dump an address_________
define ascii_char
    if $argc != 1
        help ascii_char
    else
        # thanks elaine :)
        set $_c = *(unsigned char *)($arg0)
        if ($_c < 0x20 || $_c > 0x7E)
            printf "."
        else
            printf "%c", $_c
        end
    end
end
document ascii_char
Syntax: ascii_char <ADDR>
| Print ASCII value of byte at address ADDR.
| Print "." if the value is unprintable.
end


define hex_quad
    if $argc != 1
        help hex_quad
    else
        printf "%02X %02X %02X %02X %02X %02X %02X %02X", \
               *(unsigned char*)($arg0), *(unsigned char*)($arg0 + 1),     \
               *(unsigned char*)($arg0 + 2), *(unsigned char*)($arg0 + 3), \
               *(unsigned char*)($arg0 + 4), *(unsigned char*)($arg0 + 5), \
               *(unsigned char*)($arg0 + 6), *(unsigned char*)($arg0 + 7)
    end
end
document hex_quad
Syntax: hex_quad <ADDR>
| Print eight hexadecimal bytes starting at address ADDR.
end

define hexdump_aux
    if $argc != 1
        help hexdump_aux
    else
        color_bold
        printf "0x%08X : ", $arg0
        color_reset

        hex_quad $arg0
        color_bold
        printf " - "
        color_reset
        hex_quad $arg0+8
        printf " "
        color_bold
        ascii_char $arg0+0x0
        ascii_char $arg0+0x1
        ascii_char $arg0+0x2
        ascii_char $arg0+0x3
        ascii_char $arg0+0x4
        ascii_char $arg0+0x5
        ascii_char $arg0+0x6
        ascii_char $arg0+0x7
        ascii_char $arg0+0x8
        ascii_char $arg0+0x9
        ascii_char $arg0+0xA
        ascii_char $arg0+0xB
        ascii_char $arg0+0xC
        ascii_char $arg0+0xD
        ascii_char $arg0+0xE
        ascii_char $arg0+0xF
        color_reset
        printf "\n"
    end
end
document hexdump_aux
Syntax: hexdump_aux <ADDR>
| Display a 16-byte hex/ASCII dump of memory at address ADDR.
end

define hexdump
    printf "\n"

    if $argc == 1
        hexdump_aux $arg0
    else
        if $argc == 2
            set $_count = 0
            while ($_count < $arg1)
                set $_i = ($_count * 0x10)
                hexdump_aux $arg0+$_i
                set $_count++
            end
        else
            if $argc == 3
                set $_count = 0
                while ($_count < $arg1)
                    set $_i = ($_count * 0x10)

                    color_bold
                    printf "0x%08X: ", $arg0+$_i
                    color_reset

                    printf "%08X %08X %08X %08X\n", \
                            *(unsigned int*)($arg0+$_i+0x0), \
                            *(unsigned int*)($arg0+$_i+0x4), \
                            *(unsigned int*)($arg0+$_i+0x8), \
                            *(unsigned int*)($arg0+$_i+0xC)
                    set $_count++
                end
            else
                help hexdump
            end
        end
    end

    printf "\n"
end
document hexdump
Syntax: hexdump <ADDR> [NR_LINES] [Is_Byte_Layout]
| Display a 16-byte hex/ASCII dump of memory starting at address ADDR.
| Optional parameter is the number of lines to display if you want more than one.
end

define z_memdump
    if $argc == 1
        hexdump $arg0
    else
        if $argc == 2
            hexdump $arg0 $arg1
        else
            if $argc == 3
                hexdump $arg0 $arg1 $arg2
            else
                help z_memdump
            end
        end
    end
end
document z_memdump
Syntax: z_memdump <ADDR> [NR_LINES] [Is_Byte_Layout]
| Display a 16-byte hex/ASCII dump of memory starting at address ADDR.
| Optional parameter is the number of lines to display if you want more than one.
end
