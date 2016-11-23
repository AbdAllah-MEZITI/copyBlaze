quietly set ACTELLIBNAME proasic3
do PATH.do

if {[file exists presynth/_info]} {
   echo "INFO: Simulation library presynth already exists"
} else {
   vlib presynth
}
#vmap presynth presynth
#vmap proasic3 "C:/Actel/Libero_v9.1/Designer/lib/modelsim/precompiled/vhdl/proasic3"

vcom -93 -explicit -work presynth "${PROJECT_DIR}/rtl/vhdl/cpu/cp_Usefull_Pkg.vhd"
vcom -93 -explicit -work presynth "${PROJECT_DIR}/rtl/vhdl/cpu/cp_Toggle.vhd"
vcom -93 -explicit -work presynth "${PROJECT_DIR}/rtl/vhdl/cpu/cp_Interrupt.vhd"
vcom -93 -explicit -work presynth "${PROJECT_DIR}/rtl/vhdl/cpu/cp_ProgramCounter.vhd"
vcom -93 -explicit -work presynth "${PROJECT_DIR}/rtl/vhdl/cpu/cp_Stack.vhd"
vcom -93 -explicit -work presynth "${PROJECT_DIR}/rtl/vhdl/cpu/cp_ProgramFlowControl.vhd"
vcom -93 -explicit -work presynth "${PROJECT_DIR}/rtl/vhdl/cpu/cp_DecodeControl.vhd"
vcom -93 -explicit -work presynth "${PROJECT_DIR}/rtl/vhdl/cpu/cp_FullAdder.vhd"
vcom -93 -explicit -work presynth "${PROJECT_DIR}/rtl/vhdl/cpu/cp_CLAAdder.vhd"
vcom -93 -explicit -work presynth "${PROJECT_DIR}/rtl/vhdl/cpu/cp_ALU.vhd"
vcom -93 -explicit -work presynth "${PROJECT_DIR}/rtl/vhdl/cpu/cp_Flags.vhd"
vcom -93 -explicit -work presynth "${PROJECT_DIR}/rtl/vhdl/cpu/cp_BancRegister.vhd"
vcom -93 -explicit -work presynth "${PROJECT_DIR}/rtl/vhdl/cpu/cp_ScratchPad.vhd"
vcom -93 -explicit -work presynth "${PROJECT_DIR}/rtl/vhdl/cpu/cp_copyBlaze.vhd"

vcom -93 -explicit -work presynth "${PROJECT_DIR}/rtl/vhdl/ip/rom/ROM_Code.vhd"

vcom -93 -explicit -work presynth "${PROJECT_DIR}/rtl/vhdl/ip/wb_gpio/WBOPRT08.vhd"

vcom -93 -explicit -work presynth "${PROJECT_DIR}/rtl/vhdl/soc/cp_copyBlaze_ecoSystem.vhd"


vcom -93 -explicit -work presynth "${PROJECT_DIR}/bench/vhdl/tb_copyBlaze_ecoSystem.vhd"

vsim -L proasic3 -L presynth  -t 1ps presynth.tb_copyBlaze_ecoSystem
# The following lines are commented because no testbench is associated with the project
# add wave /tb_copyBlaze_ecoSystem/*
# run 1000ns

radix hexadecimal
do tb_copyBlaze_ecoSystem_wave.do

run -all
