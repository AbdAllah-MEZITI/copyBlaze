# path to tools
#DRIVE=E:
DRIVE=/cygdrive/e
TOPPATH=../../..
TOOLPATH=$(TOPPATH)/tools/asm

AS=$(TOOLPATH)/KCPSM3/kcpsm6.exe
#MG=$(TOOLPATH)/pBlazASM/pBlazMRG/pBlazMRG.exe
MG=$(TOOLPATH)/pBlazASM/cpBlazeMRG/cpBlazeMRG.exe

DIROUT=$(TOPPATH)/../rtl/vhdl/ip/rom

RM = rm -f -v
CP = cp

# List of PSM Files
#ASM_SRC = Mnemonic.psm
ASM_SRC = *.psm
#AFLAGS = -l -m
#AFLAGS = -l -x
AFLAGS = -c1024
MGFLAGS =
TEMPLATE = ../template2
ENTITY = ROM_Code

.SUFFIXES : .psm .mem .vhd .psh

# assemble and merge
all:    $(ENTITY).vhd

# assemble #
$(ENTITY).mem:  $(ASM_SRC)
	$(AS) $(AFLAGS) $(ASM_SRC)
#	$(CP) *.mem $(ENTITY).mem
	$(CP) *.hex $(ENTITY).hex

# merge #
#$(ENTITY).vhd:  $(ENTITY).mem $(TEMPLATE).vhd
$(ENTITY).vhd:  $(ENTITY).mem
#	$(MG) $(MGFLAGS) -e$(ENTITY) $(ENTITY).mem $(TEMPLATE).vhd $(ENTITY).vhd 
	$(MG) $(MGFLAGS) $(ENTITY).hex
	$(CP) $(ENTITY).vhd $(DIROUT)/$(ENTITY).vhd

# clean outputs
clean:
#	$(RM) $(ENTITY).lst
	$(RM) *.lst
#	$(RM) $(ENTITY).mem
	$(RM) *.mem
#	$(RM) $(ENTITY).vhd
	$(RM) *.hex
	$(RM) *.log
#	$(RM) *.vhd
	$(RM) *.bin
#
	$(RM) CONSTANT.TXT
	$(RM) LABELS.TXT
	$(RM) *.DAT
	$(CP) $(ENTITY).VHD
	
