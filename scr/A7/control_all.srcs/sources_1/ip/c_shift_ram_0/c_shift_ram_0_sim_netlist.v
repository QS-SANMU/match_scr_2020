// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Sat Oct 24 17:22:28 2020
// Host        : DESKTOP-6EMR18T running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/86183/Desktop/OV_800X600_SRAM/project_1.srcs/sources_1/ip/c_shift_ram_0/c_shift_ram_0_sim_netlist.v
// Design      : c_shift_ram_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "c_shift_ram_0,c_shift_ram_v12_0_12,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_shift_ram_v12_0_12,Vivado 2018.2" *) 
(* NotValidForBitStream *)
module c_shift_ram_0
   (D,
    CLK,
    CE,
    Q);
  (* x_interface_info = "xilinx.com:signal:data:1.0 d_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME d_intf, LAYERED_METADATA undef" *) input [0:0]D;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF q_intf:sinit_intf:sset_intf:d_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:clockenable:1.0 ce_intf CE" *) (* x_interface_parameter = "XIL_INTERFACENAME ce_intf, POLARITY ACTIVE_LOW" *) input CE;
  (* x_interface_info = "xilinx.com:signal:data:1.0 q_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME q_intf, LAYERED_METADATA undef" *) output [0:0]Q;

  wire CE;
  wire CLK;
  wire [0:0]D;
  wire [0:0]Q;

  (* c_addr_width = "4" *) 
  (* c_ainit_val = "0" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "320" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_has_ce = "1" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_sinit_val = "0" *) 
  (* c_sync_enable = "0" *) 
  (* c_sync_priority = "1" *) 
  (* c_verbosity = "0" *) 
  (* c_width = "1" *) 
  (* c_xdevicefamily = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_shift_ram_0_c_shift_ram_v12_0_12 U0
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(CE),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADDR_WIDTH = "4" *) (* C_AINIT_VAL = "0" *) (* C_DEFAULT_DATA = "0" *) 
(* C_DEPTH = "320" *) (* C_ELABORATION_DIR = "./" *) (* C_HAS_A = "0" *) 
(* C_HAS_CE = "1" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_MEM_INIT_FILE = "no_coe_file_loaded" *) (* C_OPT_GOAL = "0" *) 
(* C_PARSER_TYPE = "0" *) (* C_READ_MIF = "0" *) (* C_REG_LAST_BIT = "1" *) 
(* C_SHIFT_TYPE = "0" *) (* C_SINIT_VAL = "0" *) (* C_SYNC_ENABLE = "0" *) 
(* C_SYNC_PRIORITY = "1" *) (* C_VERBOSITY = "0" *) (* C_WIDTH = "1" *) 
(* C_XDEVICEFAMILY = "artix7" *) (* ORIG_REF_NAME = "c_shift_ram_v12_0_12" *) (* downgradeipidentifiedwarnings = "yes" *) 
module c_shift_ram_0_c_shift_ram_v12_0_12
   (A,
    D,
    CLK,
    CE,
    SCLR,
    SSET,
    SINIT,
    Q);
  input [3:0]A;
  input [0:0]D;
  input CLK;
  input CE;
  input SCLR;
  input SSET;
  input SINIT;
  output [0:0]Q;

  wire CE;
  wire CLK;
  wire [0:0]D;
  wire [0:0]Q;

  (* c_addr_width = "4" *) 
  (* c_ainit_val = "0" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "320" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_a = "0" *) 
  (* c_has_ce = "1" *) 
  (* c_has_sclr = "0" *) 
  (* c_has_sinit = "0" *) 
  (* c_has_sset = "0" *) 
  (* c_mem_init_file = "no_coe_file_loaded" *) 
  (* c_opt_goal = "0" *) 
  (* c_parser_type = "0" *) 
  (* c_read_mif = "0" *) 
  (* c_reg_last_bit = "1" *) 
  (* c_shift_type = "0" *) 
  (* c_sinit_val = "0" *) 
  (* c_sync_enable = "0" *) 
  (* c_sync_priority = "1" *) 
  (* c_verbosity = "0" *) 
  (* c_width = "1" *) 
  (* c_xdevicefamily = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  c_shift_ram_0_c_shift_ram_v12_0_12_viv i_synth
       (.A({1'b0,1'b0,1'b0,1'b0}),
        .CE(CE),
        .CLK(CLK),
        .D(D),
        .Q(Q),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
gewdhL/w1TouB0JjuZHJxluLgazZ0MDhwTiI0DySlF2H3xd6FRSfzLr57O3qUZ5eGvZn9G1HUOcz
yxVE1Ft6ug==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
kNkvEiBddZ56G5aF+XS7ob2Nhv2j+6nmCRkSoQq0oirSRWu0r3CeEeHNjMTnlz141inTsI0Z6BWi
mSQVN+vnta1jke0Bk4Stt+1AehqmzqWBhIHNifuASwGS7djtqVZP4SiTYyIWLtw2ytc2NIoTTIPD
p8KuPz5sCnz/rVbTGrU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PQCKWrqcONejuC35aWg8w9DioCraSLD3jpWb1GhpUCgcaZ0iGFYF6zyTQ9UbFoUruOqUsK4NCVSk
hplF/dXRzE4vE39sCsuYrnlvsXoMvw5omH6qSVsPw0ouHfl9A2UJZkAWOT/cmxzDUB2Nwx6oDebh
LR1vONCseE7uyR5RxjiK0JeDjP0hoBNJoC8RfEDbHpmrb9nOAmibt1Ub/3ax1qZCSXM9KLwO8O6m
3xVW+RxfWvYY4vl1SaNWMWCqoW8nl6bPZ2E3eaXRj1MmReX5VOJjdR+D+uJyoaWNDJWHitCvsaop
vIHRQS6GhW6gQDoyFrOee9vd8Mk5vO4zHSkoCQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
EnheuADwC+rXRbRg9Il4ySLQns8VKTnppIVWIV7/j1q3n5T9ImVRYukn1hvdbcKoYxtL+2UcCg96
5OeU5Cmw2OktWg+nXUEQsGpMI/HtDbo51bYU08HKrrfZfLFzJht2bJQKefep8XtA+PBarinw89ic
y5pRbW5e+RK1wq2fpuZ/aad4nPvIc4RQLnDGpE3/KsO8mmLVobPkafsCgRcjsOloyEh2SIKI0L3S
bM1yoTNj3PBKHQ+Fg5c57g4tgtPWlOZoENX18yDgBTaLFQz2pRFtbb1TFYKxNIWOk5nYHwQhWhGV
7FfMa5zdnsgLXGK6/E4ssQcSyIcY1ZJqqeKUWw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
w+as5hQm6N6F6rMbvXzBeWbsgKQk/heHkIxjXuTz4RzbjzgbTltcE8Flz3fkoKf5N7ML5dxsjo9D
ssHdLG4rf7XR8V4jTftZ++etToKtPnQBCB9DKi1yN533S5ArNcUfnE3UNrkiVdemu8VNDcPhkNGG
T6L1X+PWyuW9l0Qj2VQM4rosaZCg7fijmq6q9IbXnhPGGcvP+YH+yhPpUX2y8PH6GVZMCdpdUpkd
gEm8oLFSJ28Q7zZvqQZsrdEIlThY2i1c8NDuhS8NDtOmlumPhbPr7rKYBAwl6DCIXO+CqE2a8X/c
qpIBWTRvLyaD7BcA7XDCyMfCZy/mq8fZ6rIrOQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
ebIGhwOoK6b2Regd2ZidBmefLC1qWrjb2ixldIHZBv9r8mN994nK0bA5i2yPW5FfOgPszrabIv2T
d9dzSTELNwamhC6udZmN9sBwlaEVqro7zC0hwc9PBph7uwSv+FXYBFkXpe9DnpJTZbUvUeThstgk
RdebU+EnQryZ0UpzZ2A=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XnwajLd9gtUhj/hQ3dArVFrFrrTuWhrvu+kPxwrOfm2NgABPJQFBXwBwCw2jjlhA7jCVcZI4CRq8
GHr5uL3LcoFEL49z34pdL9z8W+zlAFZZl/rnslm3zKW6HpX5Z9zjmS0PThKZoMBpBHWSEKjmXjSE
t+thGVHHTSqS9h2Uo8qpx2g2fY7ITBA2F2G3aajNf+o5hHTA5QnC/87hlfZzNl7Redk6aQRYCgB8
LIJBeO59sYe3aKg/vswdYeXiRdd8b45eVOvTT4iKpa1ExnseAad7tGfp2qVyT4QrHVx9jSYd05Mu
8Dlg+1UQcbk2h4Q0cJ7WGdpp1ljWsx8j2GPrQw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
glDSH/sLi00Gpz5vCRbWdFwRAfq/8QYrda3MSGXNsRCPTstje9TfMMeZmSQfxBKY5be167zPRerM
+DHA7BvZdLB/OOQBlSLULSHCz8K+AuCO9vYTYE8cYyvQAEiSidZDAWGsqxZKGEhp15nieOMyHiLO
PMyFEHRa9kM6jTfsru2hZGCQ/EkrwH26ZTRbNxLKtq6SctIAI+qQjVBO0V9TCm0zsrl6G7zjhQJx
TKJT/t0EefBdhwegmEx1N4oVCKvkfdqTaQTCOFlpKoEMeZKqTENhajj6242sa0bZDy37hi2CZJHt
/o5PY90yTOT2SczQaWwsdBsh37gfEzpWwyjwUw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
NAbLdTevFlf2nVwpXa+9fr6qu0NsLSnQ/JliZFxdiVMf+9aw0b6InZ6tTXknbGCMgiiRbDmY2AQp
f/n0I6aUa9dMVwOHyP39Ql9m84eEoD9Jy+XZp8KmPQo+oROi81bLpZjEiCeQrDuzmKyyzU7qY/sl
P8HGbWq8SFAVfkCmVIZw8YarqXsalQyc+pNmdtI2ZrWHSUaAm2QZnrP1PtX0N5YvzZtTOlYm29rM
D06SCcZjStJTNblXh/JaWwA0VTmtdVjDw5z7jpih/qZ4xMY7v6eDULHTFvkA+y/FYTlD2yhPXbz+
1k4TSc9P2INnLx8a4fPLx21RVsoTuvkLubVRMA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12512)
`pragma protect data_block
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
HY1lPlXPaOoF1v4flnFT3D5JQxnRFwuDal/A91c=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
