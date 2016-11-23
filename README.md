# copyBlaze
a from-scratch synthesizable &amp; behavioral VHDL clone of Ken Chapman's popular 8bit PicoBlaze embedded microcontroller.


Description

copyBlaze is a from-scratch synthesizable & behavioral VHDL clone of Ken Chapman's popular 8bit PicoBlaze embedded microcontroller.
It support wishbone interface.
Assembler and C Compiler are used in the developpement.
STATUS

The developpement is still in progress.
* All the PicoBlaze III instructions have been tested.
* Actually the wishbone instructions are in test validation
* PBCC Compiler is in test.
Features

copyBalze have the followings features:

'''SET INSTRUCTION'''
* picoblaze III instruction compatible + specific wishbone instructions
* 1k x 18bits code ROM capability
* portable (no vendor specifique optimisation)

'''I/O INTERFACE'''
* picoblaze III compatible
* + wishbone I/O
* + sleep input signal I

'''CONFIGURATION'''
* ScratchPad size
* Stack size
* Interrupt Vector address
* Data width size (8bit default. not tested with others values)

'''WISHBONE (Not finished yet)'''
* only 8bit single Read/Write capability is supported
* two new instructions have been added to support wishbone
* wait states is integrated
Design

The design of copyBlaze is based on this documents:
* [[http://www.xilinx.com/support/documentation/ip_documentation/ug129.pdf | PicoBlaze™ 8-bit Embedded Microcontroller User Guide]]
* ieee.numeric_std library
Wishbone

The principe of the wishbone copyBlaze interface is :
* develop a hardware wishbone compatible interface
* develop 2 instructions for acsess the wishbone interface from copyBlaze.
* wait states is supported (but need more tests)

Actually only two instructions have been added to the copyBlaze instructions (picoblaze III instruction set).
Theese two instruction can perform a "single 8 bit Read/Write"

* WBWRSING sX, (sY); 8 bit Single Write : DAT_O = sX, ADR_O = sY
* WBRDSING sX, (sY); 8 bit Single Read : sX = DAT_I, ADR_O = sY

futur wishbone Burst access can be developped for copyBlaze ScrachPad access.

the wishbone interface have been tested with the followings wishbone cores:
* wb_gpio
* wb_timer (with interrupt)
* wb_uart (with interrupt)
Software Dev

'''ASSEMBLER'''
* [[http://code.google.com/p/pblazasm | pBlazeASM]] from mediatronix (modified for specific wishbone instructions)
* KCPASM3.EXE

'''COMPILER'''
* [[http://www.fit.vutbr.cz/~meduna/work/doku.php?id=projects:vlam:pbcc:pbcc | "PicoBlaze C Compiler (PBCC)"]]
* the PBCC version 2011-10-24 have been updated to be based on sdcc-src-3.1.0 release
* the port for picoblaze processor is organised as a patch : sdcc-3.1.0-pblaze_[-NaurbB].patch

* complete tool chain is used to generate VHDL code ROM from *.c file
* the process is : *.c => (PBCC) => *.psm => (pBlazASM) => *.hex => (cpBlazeMRG) *.vhd

'''ENVIRONEMENT'''
* cygwin
* makefiles for assembler
* automatically VHDL synthetisable Code ROM.
Test

'''VALIDATION'''
* all the UG129 doc instruction have been tested ok
* the wishbone instruction are still in developpement
Integration

'''SYNTHESE'''
- Actel
* Target : ProASIC3 A3P250_VQFP100_Std
* Tools : Libero v9.1 SP3
* result : Estimated Frequency : 32.4 MHz | Core Cells :2653

- Other
* other vendor integration are encouraged
TODO

'''WISHBONE'''
* finish the wishbone bus integration (single Octet Read/Write)
* forbideen interruption during wait states

'''ALU'''
- change the carry ahead adder

'''DOCUMENTATION'''
* commentaire
* documentation
* results of synthese
Futur Evolution

* Picoblaze-6 core compatibility
* Hardware debug tools

