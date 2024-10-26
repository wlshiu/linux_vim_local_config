#!/bin/base

help()
{
    echo "usage: $0 <elf file>"
    exit -1;
}

if [$1 != 1 ]; the
    help
fi


elf_file=$1

arm-none-eabi-gdb << GDBEOF
file ${elf_file}
b _start
j _start

GDBEOF

