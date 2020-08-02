-makelib ies_lib/xil_defaultlib -sv \
  "F:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "F:/Xilinx/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../uart.srcs/sources_1/ip/Clk_Division_0/sim/Clk_Division.v" \
  "../../../../uart.srcs/sources_1/ip/Clk_Division_0/sim/Clk_Division_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

