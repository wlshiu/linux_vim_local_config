## set remote target to QemuGDBServer on localhost port 23333
target remote localhost:23333

## log gdb process
set logging file ./gdb.log
set logging on

## no confirm when quit
#set confirm off

## configure some print formats
set print pretty on
set print array on

## print ARM core registers in all mode
monitor regs

# reset

## load sections from elf file
load

## show memory regions
info mem

## set break pointer
# b Reset_Handler
b main

## free run until a break pointer
c
