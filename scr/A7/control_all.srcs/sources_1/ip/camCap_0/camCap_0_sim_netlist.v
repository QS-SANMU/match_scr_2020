// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Sat Oct 24 14:17:21 2020
// Host        : DESKTOP-6EMR18T running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top camCap_0 -prefix
//               camCap_0_ camCap_0_sim_netlist.v
// Design      : camCap_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module camCap_0_camCap
   (Q,
    dout,
    we,
    vsync,
    pclk,
    d,
    href);
  output [16:0]Q;
  output [15:0]dout;
  output we;
  input vsync;
  input pclk;
  input [7:0]d;
  input href;

  wire [16:0]Q;
  wire \address[10]_i_1_n_0 ;
  wire \address[11]_i_1_n_0 ;
  wire \address[13]_i_1_n_0 ;
  wire \address[15]_i_1_n_0 ;
  wire \address[16]_i_1_n_0 ;
  wire \address[16]_i_2_n_0 ;
  wire \address_next[0]_i_2_n_0 ;
  wire [16:0]address_next_reg;
  wire \address_next_reg[0]_i_1_n_0 ;
  wire \address_next_reg[0]_i_1_n_1 ;
  wire \address_next_reg[0]_i_1_n_2 ;
  wire \address_next_reg[0]_i_1_n_3 ;
  wire \address_next_reg[0]_i_1_n_4 ;
  wire \address_next_reg[0]_i_1_n_5 ;
  wire \address_next_reg[0]_i_1_n_6 ;
  wire \address_next_reg[0]_i_1_n_7 ;
  wire \address_next_reg[12]_i_1_n_0 ;
  wire \address_next_reg[12]_i_1_n_1 ;
  wire \address_next_reg[12]_i_1_n_2 ;
  wire \address_next_reg[12]_i_1_n_3 ;
  wire \address_next_reg[12]_i_1_n_4 ;
  wire \address_next_reg[12]_i_1_n_5 ;
  wire \address_next_reg[12]_i_1_n_6 ;
  wire \address_next_reg[12]_i_1_n_7 ;
  wire \address_next_reg[16]_i_1_n_7 ;
  wire \address_next_reg[4]_i_1_n_0 ;
  wire \address_next_reg[4]_i_1_n_1 ;
  wire \address_next_reg[4]_i_1_n_2 ;
  wire \address_next_reg[4]_i_1_n_3 ;
  wire \address_next_reg[4]_i_1_n_4 ;
  wire \address_next_reg[4]_i_1_n_5 ;
  wire \address_next_reg[4]_i_1_n_6 ;
  wire \address_next_reg[4]_i_1_n_7 ;
  wire \address_next_reg[8]_i_1_n_0 ;
  wire \address_next_reg[8]_i_1_n_1 ;
  wire \address_next_reg[8]_i_1_n_2 ;
  wire \address_next_reg[8]_i_1_n_3 ;
  wire \address_next_reg[8]_i_1_n_4 ;
  wire \address_next_reg[8]_i_1_n_5 ;
  wire \address_next_reg[8]_i_1_n_6 ;
  wire \address_next_reg[8]_i_1_n_7 ;
  wire [7:0]d;
  wire [15:0]d_latch;
  wire [15:0]dout;
  wire \dout[15]_i_1_n_0 ;
  wire href;
  wire p_0_in1_in;
  wire [0:0]p_1_out;
  wire pclk;
  wire vsync;
  wire we;
  wire we_i_1_n_0;
  wire \wr_hold_reg_n_0_[0] ;
  wire [3:0]\NLW_address_next_reg[16]_i_1_CO_UNCONNECTED ;
  wire [3:1]\NLW_address_next_reg[16]_i_1_O_UNCONNECTED ;

  LUT5 #(
    .INIT(32'hFEEEEEEE)) 
    \address[10]_i_1 
       (.I0(address_next_reg[10]),
        .I1(\address[16]_i_2_n_0 ),
        .I2(Q[13]),
        .I3(Q[16]),
        .I4(Q[12]),
        .O(\address[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFEEEEEEE)) 
    \address[11]_i_1 
       (.I0(address_next_reg[11]),
        .I1(\address[16]_i_2_n_0 ),
        .I2(Q[13]),
        .I3(Q[16]),
        .I4(Q[12]),
        .O(\address[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFEEEEEEE)) 
    \address[13]_i_1 
       (.I0(address_next_reg[13]),
        .I1(\address[16]_i_2_n_0 ),
        .I2(Q[13]),
        .I3(Q[16]),
        .I4(Q[12]),
        .O(\address[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFEEEEEEE)) 
    \address[15]_i_1 
       (.I0(vsync),
        .I1(\address[16]_i_2_n_0 ),
        .I2(Q[13]),
        .I3(Q[16]),
        .I4(Q[12]),
        .O(\address[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFEEEEEEE)) 
    \address[16]_i_1 
       (.I0(address_next_reg[16]),
        .I1(\address[16]_i_2_n_0 ),
        .I2(Q[13]),
        .I3(Q[16]),
        .I4(Q[12]),
        .O(\address[16]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFF8000000000)) 
    \address[16]_i_2 
       (.I0(Q[13]),
        .I1(Q[10]),
        .I2(Q[11]),
        .I3(Q[15]),
        .I4(Q[14]),
        .I5(Q[16]),
        .O(\address[16]_i_2_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \address_next[0]_i_2 
       (.I0(address_next_reg[0]),
        .O(\address_next[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_next_reg[0] 
       (.C(pclk),
        .CE(p_0_in1_in),
        .D(\address_next_reg[0]_i_1_n_7 ),
        .Q(address_next_reg[0]),
        .R(vsync));
  CARRY4 \address_next_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\address_next_reg[0]_i_1_n_0 ,\address_next_reg[0]_i_1_n_1 ,\address_next_reg[0]_i_1_n_2 ,\address_next_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\address_next_reg[0]_i_1_n_4 ,\address_next_reg[0]_i_1_n_5 ,\address_next_reg[0]_i_1_n_6 ,\address_next_reg[0]_i_1_n_7 }),
        .S({address_next_reg[3:1],\address_next[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \address_next_reg[10] 
       (.C(pclk),
        .CE(p_0_in1_in),
        .D(\address_next_reg[8]_i_1_n_5 ),
        .Q(address_next_reg[10]),
        .R(vsync));
  FDRE #(
    .INIT(1'b0)) 
    \address_next_reg[11] 
       (.C(pclk),
        .CE(p_0_in1_in),
        .D(\address_next_reg[8]_i_1_n_4 ),
        .Q(address_next_reg[11]),
        .R(vsync));
  FDRE #(
    .INIT(1'b0)) 
    \address_next_reg[12] 
       (.C(pclk),
        .CE(p_0_in1_in),
        .D(\address_next_reg[12]_i_1_n_7 ),
        .Q(address_next_reg[12]),
        .R(vsync));
  CARRY4 \address_next_reg[12]_i_1 
       (.CI(\address_next_reg[8]_i_1_n_0 ),
        .CO({\address_next_reg[12]_i_1_n_0 ,\address_next_reg[12]_i_1_n_1 ,\address_next_reg[12]_i_1_n_2 ,\address_next_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\address_next_reg[12]_i_1_n_4 ,\address_next_reg[12]_i_1_n_5 ,\address_next_reg[12]_i_1_n_6 ,\address_next_reg[12]_i_1_n_7 }),
        .S(address_next_reg[15:12]));
  FDRE #(
    .INIT(1'b0)) 
    \address_next_reg[13] 
       (.C(pclk),
        .CE(p_0_in1_in),
        .D(\address_next_reg[12]_i_1_n_6 ),
        .Q(address_next_reg[13]),
        .R(vsync));
  FDRE #(
    .INIT(1'b0)) 
    \address_next_reg[14] 
       (.C(pclk),
        .CE(p_0_in1_in),
        .D(\address_next_reg[12]_i_1_n_5 ),
        .Q(address_next_reg[14]),
        .R(vsync));
  FDRE #(
    .INIT(1'b0)) 
    \address_next_reg[15] 
       (.C(pclk),
        .CE(p_0_in1_in),
        .D(\address_next_reg[12]_i_1_n_4 ),
        .Q(address_next_reg[15]),
        .R(vsync));
  FDRE #(
    .INIT(1'b0)) 
    \address_next_reg[16] 
       (.C(pclk),
        .CE(p_0_in1_in),
        .D(\address_next_reg[16]_i_1_n_7 ),
        .Q(address_next_reg[16]),
        .R(vsync));
  CARRY4 \address_next_reg[16]_i_1 
       (.CI(\address_next_reg[12]_i_1_n_0 ),
        .CO(\NLW_address_next_reg[16]_i_1_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_address_next_reg[16]_i_1_O_UNCONNECTED [3:1],\address_next_reg[16]_i_1_n_7 }),
        .S({1'b0,1'b0,1'b0,address_next_reg[16]}));
  FDRE #(
    .INIT(1'b0)) 
    \address_next_reg[1] 
       (.C(pclk),
        .CE(p_0_in1_in),
        .D(\address_next_reg[0]_i_1_n_6 ),
        .Q(address_next_reg[1]),
        .R(vsync));
  FDRE #(
    .INIT(1'b0)) 
    \address_next_reg[2] 
       (.C(pclk),
        .CE(p_0_in1_in),
        .D(\address_next_reg[0]_i_1_n_5 ),
        .Q(address_next_reg[2]),
        .R(vsync));
  FDRE #(
    .INIT(1'b0)) 
    \address_next_reg[3] 
       (.C(pclk),
        .CE(p_0_in1_in),
        .D(\address_next_reg[0]_i_1_n_4 ),
        .Q(address_next_reg[3]),
        .R(vsync));
  FDRE #(
    .INIT(1'b0)) 
    \address_next_reg[4] 
       (.C(pclk),
        .CE(p_0_in1_in),
        .D(\address_next_reg[4]_i_1_n_7 ),
        .Q(address_next_reg[4]),
        .R(vsync));
  CARRY4 \address_next_reg[4]_i_1 
       (.CI(\address_next_reg[0]_i_1_n_0 ),
        .CO({\address_next_reg[4]_i_1_n_0 ,\address_next_reg[4]_i_1_n_1 ,\address_next_reg[4]_i_1_n_2 ,\address_next_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\address_next_reg[4]_i_1_n_4 ,\address_next_reg[4]_i_1_n_5 ,\address_next_reg[4]_i_1_n_6 ,\address_next_reg[4]_i_1_n_7 }),
        .S(address_next_reg[7:4]));
  FDRE #(
    .INIT(1'b0)) 
    \address_next_reg[5] 
       (.C(pclk),
        .CE(p_0_in1_in),
        .D(\address_next_reg[4]_i_1_n_6 ),
        .Q(address_next_reg[5]),
        .R(vsync));
  FDRE #(
    .INIT(1'b0)) 
    \address_next_reg[6] 
       (.C(pclk),
        .CE(p_0_in1_in),
        .D(\address_next_reg[4]_i_1_n_5 ),
        .Q(address_next_reg[6]),
        .R(vsync));
  FDRE #(
    .INIT(1'b0)) 
    \address_next_reg[7] 
       (.C(pclk),
        .CE(p_0_in1_in),
        .D(\address_next_reg[4]_i_1_n_4 ),
        .Q(address_next_reg[7]),
        .R(vsync));
  FDRE #(
    .INIT(1'b0)) 
    \address_next_reg[8] 
       (.C(pclk),
        .CE(p_0_in1_in),
        .D(\address_next_reg[8]_i_1_n_7 ),
        .Q(address_next_reg[8]),
        .R(vsync));
  CARRY4 \address_next_reg[8]_i_1 
       (.CI(\address_next_reg[4]_i_1_n_0 ),
        .CO({\address_next_reg[8]_i_1_n_0 ,\address_next_reg[8]_i_1_n_1 ,\address_next_reg[8]_i_1_n_2 ,\address_next_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\address_next_reg[8]_i_1_n_4 ,\address_next_reg[8]_i_1_n_5 ,\address_next_reg[8]_i_1_n_6 ,\address_next_reg[8]_i_1_n_7 }),
        .S(address_next_reg[11:8]));
  FDRE #(
    .INIT(1'b0)) 
    \address_next_reg[9] 
       (.C(pclk),
        .CE(p_0_in1_in),
        .D(\address_next_reg[8]_i_1_n_6 ),
        .Q(address_next_reg[9]),
        .R(vsync));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[0] 
       (.C(pclk),
        .CE(1'b1),
        .D(address_next_reg[0]),
        .Q(Q[0]),
        .R(\address[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[10] 
       (.C(pclk),
        .CE(1'b1),
        .D(\address[10]_i_1_n_0 ),
        .Q(Q[10]),
        .R(vsync));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[11] 
       (.C(pclk),
        .CE(1'b1),
        .D(\address[11]_i_1_n_0 ),
        .Q(Q[11]),
        .R(vsync));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[12] 
       (.C(pclk),
        .CE(1'b1),
        .D(address_next_reg[12]),
        .Q(Q[12]),
        .R(\address[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[13] 
       (.C(pclk),
        .CE(1'b1),
        .D(\address[13]_i_1_n_0 ),
        .Q(Q[13]),
        .R(vsync));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[14] 
       (.C(pclk),
        .CE(1'b1),
        .D(address_next_reg[14]),
        .Q(Q[14]),
        .R(\address[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[15] 
       (.C(pclk),
        .CE(1'b1),
        .D(address_next_reg[15]),
        .Q(Q[15]),
        .R(\address[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[16] 
       (.C(pclk),
        .CE(1'b1),
        .D(\address[16]_i_1_n_0 ),
        .Q(Q[16]),
        .R(vsync));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[1] 
       (.C(pclk),
        .CE(1'b1),
        .D(address_next_reg[1]),
        .Q(Q[1]),
        .R(\address[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[2] 
       (.C(pclk),
        .CE(1'b1),
        .D(address_next_reg[2]),
        .Q(Q[2]),
        .R(\address[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[3] 
       (.C(pclk),
        .CE(1'b1),
        .D(address_next_reg[3]),
        .Q(Q[3]),
        .R(\address[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[4] 
       (.C(pclk),
        .CE(1'b1),
        .D(address_next_reg[4]),
        .Q(Q[4]),
        .R(\address[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[5] 
       (.C(pclk),
        .CE(1'b1),
        .D(address_next_reg[5]),
        .Q(Q[5]),
        .R(\address[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[6] 
       (.C(pclk),
        .CE(1'b1),
        .D(address_next_reg[6]),
        .Q(Q[6]),
        .R(\address[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[7] 
       (.C(pclk),
        .CE(1'b1),
        .D(address_next_reg[7]),
        .Q(Q[7]),
        .R(\address[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[8] 
       (.C(pclk),
        .CE(1'b1),
        .D(address_next_reg[8]),
        .Q(Q[8]),
        .R(\address[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[9] 
       (.C(pclk),
        .CE(1'b1),
        .D(address_next_reg[9]),
        .Q(Q[9]),
        .R(\address[15]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \d_latch_reg[0] 
       (.C(pclk),
        .CE(we_i_1_n_0),
        .D(d[0]),
        .Q(d_latch[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_latch_reg[10] 
       (.C(pclk),
        .CE(we_i_1_n_0),
        .D(d_latch[2]),
        .Q(d_latch[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_latch_reg[11] 
       (.C(pclk),
        .CE(we_i_1_n_0),
        .D(d_latch[3]),
        .Q(d_latch[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_latch_reg[12] 
       (.C(pclk),
        .CE(we_i_1_n_0),
        .D(d_latch[4]),
        .Q(d_latch[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_latch_reg[13] 
       (.C(pclk),
        .CE(we_i_1_n_0),
        .D(d_latch[5]),
        .Q(d_latch[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_latch_reg[14] 
       (.C(pclk),
        .CE(we_i_1_n_0),
        .D(d_latch[6]),
        .Q(d_latch[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_latch_reg[15] 
       (.C(pclk),
        .CE(we_i_1_n_0),
        .D(d_latch[7]),
        .Q(d_latch[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_latch_reg[1] 
       (.C(pclk),
        .CE(we_i_1_n_0),
        .D(d[1]),
        .Q(d_latch[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_latch_reg[2] 
       (.C(pclk),
        .CE(we_i_1_n_0),
        .D(d[2]),
        .Q(d_latch[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_latch_reg[3] 
       (.C(pclk),
        .CE(we_i_1_n_0),
        .D(d[3]),
        .Q(d_latch[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_latch_reg[4] 
       (.C(pclk),
        .CE(we_i_1_n_0),
        .D(d[4]),
        .Q(d_latch[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_latch_reg[5] 
       (.C(pclk),
        .CE(we_i_1_n_0),
        .D(d[5]),
        .Q(d_latch[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_latch_reg[6] 
       (.C(pclk),
        .CE(we_i_1_n_0),
        .D(d[6]),
        .Q(d_latch[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_latch_reg[7] 
       (.C(pclk),
        .CE(we_i_1_n_0),
        .D(d[7]),
        .Q(d_latch[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_latch_reg[8] 
       (.C(pclk),
        .CE(we_i_1_n_0),
        .D(d_latch[0]),
        .Q(d_latch[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \d_latch_reg[9] 
       (.C(pclk),
        .CE(we_i_1_n_0),
        .D(d_latch[1]),
        .Q(d_latch[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \dout[15]_i_1 
       (.I0(p_0_in1_in),
        .I1(vsync),
        .O(\dout[15]_i_1_n_0 ));
  FDRE \dout_reg[0] 
       (.C(pclk),
        .CE(\dout[15]_i_1_n_0 ),
        .D(d_latch[0]),
        .Q(dout[0]),
        .R(1'b0));
  FDRE \dout_reg[10] 
       (.C(pclk),
        .CE(\dout[15]_i_1_n_0 ),
        .D(d_latch[10]),
        .Q(dout[10]),
        .R(1'b0));
  FDRE \dout_reg[11] 
       (.C(pclk),
        .CE(\dout[15]_i_1_n_0 ),
        .D(d_latch[11]),
        .Q(dout[11]),
        .R(1'b0));
  FDRE \dout_reg[12] 
       (.C(pclk),
        .CE(\dout[15]_i_1_n_0 ),
        .D(d_latch[12]),
        .Q(dout[12]),
        .R(1'b0));
  FDRE \dout_reg[13] 
       (.C(pclk),
        .CE(\dout[15]_i_1_n_0 ),
        .D(d_latch[13]),
        .Q(dout[13]),
        .R(1'b0));
  FDRE \dout_reg[14] 
       (.C(pclk),
        .CE(\dout[15]_i_1_n_0 ),
        .D(d_latch[14]),
        .Q(dout[14]),
        .R(1'b0));
  FDRE \dout_reg[15] 
       (.C(pclk),
        .CE(\dout[15]_i_1_n_0 ),
        .D(d_latch[15]),
        .Q(dout[15]),
        .R(1'b0));
  FDRE \dout_reg[1] 
       (.C(pclk),
        .CE(\dout[15]_i_1_n_0 ),
        .D(d_latch[1]),
        .Q(dout[1]),
        .R(1'b0));
  FDRE \dout_reg[2] 
       (.C(pclk),
        .CE(\dout[15]_i_1_n_0 ),
        .D(d_latch[2]),
        .Q(dout[2]),
        .R(1'b0));
  FDRE \dout_reg[3] 
       (.C(pclk),
        .CE(\dout[15]_i_1_n_0 ),
        .D(d_latch[3]),
        .Q(dout[3]),
        .R(1'b0));
  FDRE \dout_reg[4] 
       (.C(pclk),
        .CE(\dout[15]_i_1_n_0 ),
        .D(d_latch[4]),
        .Q(dout[4]),
        .R(1'b0));
  FDRE \dout_reg[5] 
       (.C(pclk),
        .CE(\dout[15]_i_1_n_0 ),
        .D(d_latch[5]),
        .Q(dout[5]),
        .R(1'b0));
  FDRE \dout_reg[6] 
       (.C(pclk),
        .CE(\dout[15]_i_1_n_0 ),
        .D(d_latch[6]),
        .Q(dout[6]),
        .R(1'b0));
  FDRE \dout_reg[7] 
       (.C(pclk),
        .CE(\dout[15]_i_1_n_0 ),
        .D(d_latch[7]),
        .Q(dout[7]),
        .R(1'b0));
  FDRE \dout_reg[8] 
       (.C(pclk),
        .CE(\dout[15]_i_1_n_0 ),
        .D(d_latch[8]),
        .Q(dout[8]),
        .R(1'b0));
  FDRE \dout_reg[9] 
       (.C(pclk),
        .CE(\dout[15]_i_1_n_0 ),
        .D(d_latch[9]),
        .Q(dout[9]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    we_i_1
       (.I0(vsync),
        .O(we_i_1_n_0));
  FDRE we_reg
       (.C(pclk),
        .CE(we_i_1_n_0),
        .D(p_0_in1_in),
        .Q(we),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \wr_hold[0]_i_1 
       (.I0(href),
        .I1(\wr_hold_reg_n_0_[0] ),
        .O(p_1_out));
  FDRE #(
    .INIT(1'b0)) 
    \wr_hold_reg[0] 
       (.C(pclk),
        .CE(1'b1),
        .D(p_1_out),
        .Q(\wr_hold_reg_n_0_[0] ),
        .R(vsync));
  FDRE #(
    .INIT(1'b0)) 
    \wr_hold_reg[1] 
       (.C(pclk),
        .CE(1'b1),
        .D(\wr_hold_reg_n_0_[0] ),
        .Q(p_0_in1_in),
        .R(vsync));
endmodule

(* CHECK_LICENSE_TYPE = "camCap_0,camCap,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "camCap,Vivado 2017.1" *) 
(* NotValidForBitStream *)
module camCap_0
   (pclk,
    vsync,
    href,
    d,
    addr,
    dout,
    we,
    wclk);
  input pclk;
  input vsync;
  input href;
  input [7:0]d;
  output [16:0]addr;
  output [15:0]dout;
  output we;
  output wclk;

  wire [16:0]addr;
  wire [7:0]d;
  wire [15:0]dout;
  wire href;
  wire pclk;
  wire vsync;
  wire we;

  assign wclk = pclk;
  camCap_0_camCap inst
       (.Q(addr),
        .d(d),
        .dout(dout),
        .href(href),
        .pclk(pclk),
        .vsync(vsync),
        .we(we));
endmodule
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
