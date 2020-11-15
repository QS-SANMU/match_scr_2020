// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Sat Oct 24 14:17:21 2020
// Host        : DESKTOP-6EMR18T running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top camCap_0 -prefix
//               camCap_0_ camCap_0_stub.v
// Design      : camCap_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "camCap,Vivado 2017.1" *)
module camCap_0(pclk, vsync, href, d, addr, dout, we, wclk)
/* synthesis syn_black_box black_box_pad_pin="pclk,vsync,href,d[7:0],addr[16:0],dout[15:0],we,wclk" */;
  input pclk;
  input vsync;
  input href;
  input [7:0]d;
  output [16:0]addr;
  output [15:0]dout;
  output we;
  output wclk;
endmodule
