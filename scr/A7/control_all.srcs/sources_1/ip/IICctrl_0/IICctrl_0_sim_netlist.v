// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Sat Oct 24 14:17:21 2020
// Host        : DESKTOP-6EMR18T running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top IICctrl_0 -prefix
//               IICctrl_0_ IICctrl_0_sim_netlist.v
// Design      : IICctrl_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module IICctrl_0_I2C_Controller
   (D,
    E,
    I2C_SCLK,
    I2C_SDAT,
    iCLK,
    mI2C_WR_reg,
    out,
    i2c_en_r0,
    i2c_en_r1,
    mI2C_GO_reg,
    DOADO,
    mI2C_CTRL_CLK);
  output [2:0]D;
  output [0:0]E;
  output I2C_SCLK;
  inout I2C_SDAT;
  input iCLK;
  input mI2C_WR_reg;
  input [2:0]out;
  input i2c_en_r0;
  input i2c_en_r1;
  input mI2C_GO_reg;
  input [15:0]DOADO;
  input mI2C_CTRL_CLK;

  wire ACK0__1;
  wire ACKR13_out;
  wire ACKR1_i_1_n_0;
  wire ACKR1_i_3_n_0;
  wire ACKR1_reg_n_0;
  wire ACKR25_out;
  wire ACKR2_i_1_n_0;
  wire ACKR2_i_3_n_0;
  wire ACKR2_i_4_n_0;
  wire ACKR2_reg_n_0;
  wire ACKR34_out;
  wire ACKR3_i_1_n_0;
  wire ACKR3_i_2_n_0;
  wire ACKR3_i_4_n_0;
  wire ACKR3_reg_n_0;
  wire ACKW10_out;
  wire ACKW1_i_1_n_0;
  wire ACKW1_reg_n_0;
  wire ACKW22_out;
  wire ACKW2_i_1_n_0;
  wire ACKW2_i_3_n_0;
  wire ACKW2_reg_n_0;
  wire ACKW3_i_1_n_0;
  wire ACKW3_i_2_n_0;
  wire ACKW3_i_3_n_0;
  wire ACKW3_reg_n_0;
  wire [2:0]D;
  wire [15:0]DOADO;
  wire [0:0]E;
  wire END10_out;
  wire END_i_1_n_0;
  wire END_i_3_n_0;
  wire END_i_4_n_0;
  wire I2C_BIT6_out;
  wire I2C_BIT__29;
  wire I2C_BIT_i_10_n_0;
  wire I2C_BIT_i_11_n_0;
  wire I2C_BIT_i_13_n_0;
  wire I2C_BIT_i_15_n_0;
  wire I2C_BIT_i_16_n_0;
  wire I2C_BIT_i_17_n_0;
  wire I2C_BIT_i_18_n_0;
  wire I2C_BIT_i_19_n_0;
  wire I2C_BIT_i_1_n_0;
  wire I2C_BIT_i_20_n_0;
  wire I2C_BIT_i_21_n_0;
  wire I2C_BIT_i_22_n_0;
  wire I2C_BIT_i_23_n_0;
  wire I2C_BIT_i_24_n_0;
  wire I2C_BIT_i_3_n_0;
  wire I2C_BIT_i_5_n_0;
  wire I2C_BIT_i_6_n_0;
  wire I2C_BIT_i_7_n_0;
  wire I2C_BIT_i_8_n_0;
  wire I2C_BIT_i_9_n_0;
  wire I2C_BIT_reg_i_12_n_0;
  wire I2C_BIT_reg_i_14_n_0;
  wire I2C_BIT_reg_n_0;
  wire I2C_SCLK;
  wire I2C_SCLK12;
  wire I2C_SCLK1612_in;
  wire I2C_SCLK22;
  wire I2C_SDAT;
  wire I2C_SDAT_INST_0_i_2_n_0;
  wire I2C_SDAT_INST_0_i_3_n_0;
  wire SCLK_i_10_n_0;
  wire SCLK_i_11_n_0;
  wire SCLK_i_12_n_0;
  wire SCLK_i_1_n_0;
  wire SCLK_i_2_n_0;
  wire SCLK_i_4_n_0;
  wire SCLK_i_5_n_0;
  wire SCLK_i_6_n_0;
  wire SCLK_i_7_n_0;
  wire SCLK_i_8_n_0;
  wire SCLK_i_9_n_0;
  wire SCLK_reg_n_0;
  wire SDO;
  wire SD_COUNTER;
  wire [5:0]SD_COUNTER0;
  wire \SD_COUNTER[5]_i_1_n_0 ;
  wire \SD_COUNTER[5]_i_4_n_0 ;
  wire [5:0]SD_COUNTER_reg__0;
  wire g0_b0_n_0;
  wire i2c_en_r0;
  wire i2c_en_r1;
  wire i2c_negclk__0;
  wire iCLK;
  wire mI2C_ACK;
  wire mI2C_CTRL_CLK;
  wire mI2C_END;
  wire mI2C_GO_reg;
  wire mI2C_WR_reg;
  wire [2:0]out;

  LUT6 #(
    .INIT(64'hFDFFFFFFFDFF0000)) 
    ACKR1_i_1
       (.I0(SD_COUNTER_reg__0[3]),
        .I1(I2C_SDAT),
        .I2(mI2C_WR_reg),
        .I3(mI2C_GO_reg),
        .I4(ACKR13_out),
        .I5(ACKR1_reg_n_0),
        .O(ACKR1_i_1_n_0));
  LUT6 #(
    .INIT(64'h4404440444044444)) 
    ACKR1_i_2
       (.I0(i2c_en_r0),
        .I1(i2c_en_r1),
        .I2(mI2C_GO_reg),
        .I3(ACKR2_i_3_n_0),
        .I4(ACKR1_i_3_n_0),
        .I5(mI2C_WR_reg),
        .O(ACKR13_out));
  LUT6 #(
    .INIT(64'hFEFFFFFEFFFFFFFE)) 
    ACKR1_i_3
       (.I0(SD_COUNTER_reg__0[5]),
        .I1(SD_COUNTER_reg__0[1]),
        .I2(SD_COUNTER_reg__0[4]),
        .I3(SD_COUNTER_reg__0[3]),
        .I4(SD_COUNTER_reg__0[2]),
        .I5(SD_COUNTER_reg__0[0]),
        .O(ACKR1_i_3_n_0));
  FDRE ACKR1_reg
       (.C(iCLK),
        .CE(1'b1),
        .D(ACKR1_i_1_n_0),
        .Q(ACKR1_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFDFFFFFFFDFF0000)) 
    ACKR2_i_1
       (.I0(SD_COUNTER_reg__0[4]),
        .I1(I2C_SDAT),
        .I2(mI2C_WR_reg),
        .I3(mI2C_GO_reg),
        .I4(ACKR25_out),
        .I5(ACKR2_reg_n_0),
        .O(ACKR2_i_1_n_0));
  LUT6 #(
    .INIT(64'h4404440444044444)) 
    ACKR2_i_2
       (.I0(i2c_en_r0),
        .I1(i2c_en_r1),
        .I2(mI2C_GO_reg),
        .I3(ACKR2_i_3_n_0),
        .I4(ACKR2_i_4_n_0),
        .I5(mI2C_WR_reg),
        .O(ACKR25_out));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    ACKR2_i_3
       (.I0(mI2C_WR_reg),
        .I1(SD_COUNTER_reg__0[0]),
        .I2(SD_COUNTER_reg__0[1]),
        .I3(SD_COUNTER_reg__0[3]),
        .I4(SD_COUNTER_reg__0[2]),
        .I5(I2C_SCLK1612_in),
        .O(ACKR2_i_3_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFE6)) 
    ACKR2_i_4
       (.I0(SD_COUNTER_reg__0[4]),
        .I1(SD_COUNTER_reg__0[3]),
        .I2(SD_COUNTER_reg__0[0]),
        .I3(SD_COUNTER_reg__0[5]),
        .I4(SD_COUNTER_reg__0[1]),
        .I5(SD_COUNTER_reg__0[2]),
        .O(ACKR2_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT2 #(
    .INIT(4'hE)) 
    ACKR2_i_5
       (.I0(SD_COUNTER_reg__0[4]),
        .I1(SD_COUNTER_reg__0[5]),
        .O(I2C_SCLK1612_in));
  FDRE ACKR2_reg
       (.C(iCLK),
        .CE(1'b1),
        .D(ACKR2_i_1_n_0),
        .Q(ACKR2_reg_n_0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hEFFFEF00)) 
    ACKR3_i_1
       (.I0(ACKR3_i_2_n_0),
        .I1(mI2C_WR_reg),
        .I2(mI2C_GO_reg),
        .I3(ACKR34_out),
        .I4(ACKR3_reg_n_0),
        .O(ACKR3_i_1_n_0));
  LUT2 #(
    .INIT(4'hD)) 
    ACKR3_i_2
       (.I0(SD_COUNTER_reg__0[5]),
        .I1(I2C_SDAT),
        .O(ACKR3_i_2_n_0));
  LUT6 #(
    .INIT(64'h4404440444044444)) 
    ACKR3_i_3
       (.I0(i2c_en_r0),
        .I1(i2c_en_r1),
        .I2(mI2C_GO_reg),
        .I3(ACKR2_i_3_n_0),
        .I4(ACKR3_i_4_n_0),
        .I5(mI2C_WR_reg),
        .O(ACKR34_out));
  LUT6 #(
    .INIT(64'hFEFFFFFEFFFFFFFE)) 
    ACKR3_i_4
       (.I0(SD_COUNTER_reg__0[4]),
        .I1(SD_COUNTER_reg__0[1]),
        .I2(SD_COUNTER_reg__0[2]),
        .I3(SD_COUNTER_reg__0[5]),
        .I4(SD_COUNTER_reg__0[3]),
        .I5(SD_COUNTER_reg__0[0]),
        .O(ACKR3_i_4_n_0));
  FDRE ACKR3_reg
       (.C(iCLK),
        .CE(1'b1),
        .D(ACKR3_i_1_n_0),
        .Q(ACKR3_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hDFFFFFFFDFFF0000)) 
    ACKW1_i_1
       (.I0(SD_COUNTER_reg__0[3]),
        .I1(I2C_SDAT),
        .I2(mI2C_WR_reg),
        .I3(mI2C_GO_reg),
        .I4(ACKW10_out),
        .I5(ACKW1_reg_n_0),
        .O(ACKW1_i_1_n_0));
  LUT6 #(
    .INIT(64'h4404444444044404)) 
    ACKW1_i_2
       (.I0(i2c_en_r0),
        .I1(i2c_en_r1),
        .I2(mI2C_GO_reg),
        .I3(ACKW2_i_3_n_0),
        .I4(ACKR1_i_3_n_0),
        .I5(mI2C_WR_reg),
        .O(ACKW10_out));
  FDRE ACKW1_reg
       (.C(iCLK),
        .CE(1'b1),
        .D(ACKW1_i_1_n_0),
        .Q(ACKW1_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hDFFFFFFFDFFF0000)) 
    ACKW2_i_1
       (.I0(SD_COUNTER_reg__0[4]),
        .I1(I2C_SDAT),
        .I2(mI2C_WR_reg),
        .I3(mI2C_GO_reg),
        .I4(ACKW22_out),
        .I5(ACKW2_reg_n_0),
        .O(ACKW2_i_1_n_0));
  LUT6 #(
    .INIT(64'h4404444444044404)) 
    ACKW2_i_2
       (.I0(i2c_en_r0),
        .I1(i2c_en_r1),
        .I2(mI2C_GO_reg),
        .I3(ACKW2_i_3_n_0),
        .I4(ACKR2_i_4_n_0),
        .I5(mI2C_WR_reg),
        .O(ACKW22_out));
  LUT6 #(
    .INIT(64'h0000000000000001)) 
    ACKW2_i_3
       (.I0(SD_COUNTER_reg__0[0]),
        .I1(SD_COUNTER_reg__0[1]),
        .I2(SD_COUNTER_reg__0[3]),
        .I3(SD_COUNTER_reg__0[2]),
        .I4(I2C_SCLK1612_in),
        .I5(mI2C_WR_reg),
        .O(ACKW2_i_3_n_0));
  FDRE ACKW2_reg
       (.C(iCLK),
        .CE(1'b1),
        .D(ACKW2_i_1_n_0),
        .Q(ACKW2_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hDFFFFFFFD0F000F0)) 
    ACKW3_i_1
       (.I0(mI2C_WR_reg),
        .I1(ACKR3_i_2_n_0),
        .I2(i2c_negclk__0),
        .I3(mI2C_GO_reg),
        .I4(ACKW3_i_2_n_0),
        .I5(ACKW3_reg_n_0),
        .O(ACKW3_i_1_n_0));
  LUT6 #(
    .INIT(64'hBAABAAABAAAAAAAA)) 
    ACKW3_i_2
       (.I0(ACKW2_i_3_n_0),
        .I1(ACKW3_i_3_n_0),
        .I2(SD_COUNTER_reg__0[5]),
        .I3(SD_COUNTER_reg__0[1]),
        .I4(SD_COUNTER_reg__0[0]),
        .I5(mI2C_WR_reg),
        .O(ACKW3_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    ACKW3_i_3
       (.I0(SD_COUNTER_reg__0[3]),
        .I1(SD_COUNTER_reg__0[2]),
        .I2(SD_COUNTER_reg__0[4]),
        .O(ACKW3_i_3_n_0));
  FDRE ACKW3_reg
       (.C(iCLK),
        .CE(1'b1),
        .D(ACKW3_i_1_n_0),
        .Q(ACKW3_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    END_i_1
       (.I0(mI2C_GO_reg),
        .I1(SD_COUNTER_reg__0[5]),
        .I2(END10_out),
        .I3(mI2C_END),
        .O(END_i_1_n_0));
  LUT6 #(
    .INIT(64'h4404440404044444)) 
    END_i_2
       (.I0(i2c_en_r0),
        .I1(i2c_en_r1),
        .I2(mI2C_GO_reg),
        .I3(END_i_3_n_0),
        .I4(END_i_4_n_0),
        .I5(mI2C_WR_reg),
        .O(END10_out));
  LUT6 #(
    .INIT(64'h0400000100000001)) 
    END_i_3
       (.I0(SD_COUNTER_reg__0[4]),
        .I1(SD_COUNTER_reg__0[5]),
        .I2(SD_COUNTER_reg__0[3]),
        .I3(SD_COUNTER_reg__0[2]),
        .I4(SD_COUNTER_reg__0[1]),
        .I5(SD_COUNTER_reg__0[0]),
        .O(END_i_3_n_0));
  LUT6 #(
    .INIT(64'hFBFFFFFEFFFFFFFE)) 
    END_i_4
       (.I0(SD_COUNTER_reg__0[1]),
        .I1(SD_COUNTER_reg__0[5]),
        .I2(SD_COUNTER_reg__0[2]),
        .I3(SD_COUNTER_reg__0[4]),
        .I4(SD_COUNTER_reg__0[3]),
        .I5(SD_COUNTER_reg__0[0]),
        .O(END_i_4_n_0));
  FDRE END_reg
       (.C(iCLK),
        .CE(1'b1),
        .D(END_i_1_n_0),
        .Q(mI2C_END),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFFEAEAEA)) 
    \FSM_onehot_mSetup_ST[0]_i_1 
       (.I0(out[2]),
        .I1(out[0]),
        .I2(mI2C_END),
        .I3(out[1]),
        .I4(mI2C_ACK),
        .O(D[0]));
  LUT5 #(
    .INIT(32'hFEFFFE00)) 
    \FSM_onehot_mSetup_ST[0]_i_2 
       (.I0(ACKW1_reg_n_0),
        .I1(ACKW2_reg_n_0),
        .I2(ACKW3_reg_n_0),
        .I3(mI2C_WR_reg),
        .I4(ACK0__1),
        .O(mI2C_ACK));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \FSM_onehot_mSetup_ST[1]_i_1 
       (.I0(out[0]),
        .I1(mI2C_END),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h4444444444404040)) 
    \FSM_onehot_mSetup_ST[2]_i_2 
       (.I0(i2c_en_r0),
        .I1(i2c_en_r1),
        .I2(out[2]),
        .I3(mI2C_END),
        .I4(out[1]),
        .I5(out[0]),
        .O(E));
  LUT6 #(
    .INIT(64'h02020202020202A2)) 
    \FSM_onehot_mSetup_ST[2]_i_3 
       (.I0(out[1]),
        .I1(ACK0__1),
        .I2(mI2C_WR_reg),
        .I3(ACKW3_reg_n_0),
        .I4(ACKW2_reg_n_0),
        .I5(ACKW1_reg_n_0),
        .O(D[2]));
  LUT3 #(
    .INIT(8'hFE)) 
    \FSM_onehot_mSetup_ST[2]_i_5 
       (.I0(ACKR1_reg_n_0),
        .I1(ACKR2_reg_n_0),
        .I2(ACKR3_reg_n_0),
        .O(ACK0__1));
  LUT6 #(
    .INIT(64'hE2FFFFFFE2FF0000)) 
    I2C_BIT_i_1
       (.I0(I2C_BIT__29),
        .I1(mI2C_WR_reg),
        .I2(I2C_BIT_i_3_n_0),
        .I3(mI2C_GO_reg),
        .I4(I2C_BIT6_out),
        .I5(I2C_BIT_reg_n_0),
        .O(I2C_BIT_i_1_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    I2C_BIT_i_10
       (.I0(DOADO[0]),
        .I1(DOADO[1]),
        .I2(I2C_BIT_i_17_n_0),
        .I3(DOADO[2]),
        .I4(I2C_BIT_i_18_n_0),
        .I5(DOADO[3]),
        .O(I2C_BIT_i_10_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h00800100)) 
    I2C_BIT_i_11
       (.I0(SD_COUNTER_reg__0[2]),
        .I1(SD_COUNTER_reg__0[1]),
        .I2(SD_COUNTER_reg__0[4]),
        .I3(SD_COUNTER_reg__0[5]),
        .I4(SD_COUNTER_reg__0[3]),
        .O(I2C_BIT_i_11_n_0));
  LUT6 #(
    .INIT(64'h0404044040404040)) 
    I2C_BIT_i_13
       (.I0(SD_COUNTER_reg__0[5]),
        .I1(SD_COUNTER_reg__0[4]),
        .I2(SD_COUNTER_reg__0[2]),
        .I3(SD_COUNTER_reg__0[3]),
        .I4(SD_COUNTER_reg__0[0]),
        .I5(SD_COUNTER_reg__0[1]),
        .O(I2C_BIT_i_13_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFFFAEFBE)) 
    I2C_BIT_i_15
       (.I0(I2C_BIT_i_24_n_0),
        .I1(SD_COUNTER_reg__0[2]),
        .I2(SD_COUNTER_reg__0[3]),
        .I3(SD_COUNTER_reg__0[4]),
        .I4(SD_COUNTER_reg__0[5]),
        .O(I2C_BIT_i_15_n_0));
  LUT6 #(
    .INIT(64'hFF3FCAC2AD55182B)) 
    I2C_BIT_i_16
       (.I0(SD_COUNTER_reg__0[0]),
        .I1(SD_COUNTER_reg__0[2]),
        .I2(SD_COUNTER_reg__0[1]),
        .I3(SD_COUNTER_reg__0[3]),
        .I4(SD_COUNTER_reg__0[4]),
        .I5(SD_COUNTER_reg__0[5]),
        .O(I2C_BIT_i_16_n_0));
  LUT6 #(
    .INIT(64'h051317151E1E1B1A)) 
    I2C_BIT_i_17
       (.I0(SD_COUNTER_reg__0[3]),
        .I1(SD_COUNTER_reg__0[4]),
        .I2(SD_COUNTER_reg__0[5]),
        .I3(SD_COUNTER_reg__0[2]),
        .I4(SD_COUNTER_reg__0[0]),
        .I5(SD_COUNTER_reg__0[1]),
        .O(I2C_BIT_i_17_n_0));
  LUT6 #(
    .INIT(64'hFFEFFFEAB81506AB)) 
    I2C_BIT_i_18
       (.I0(SD_COUNTER_reg__0[4]),
        .I1(SD_COUNTER_reg__0[1]),
        .I2(SD_COUNTER_reg__0[2]),
        .I3(SD_COUNTER_reg__0[3]),
        .I4(SD_COUNTER_reg__0[0]),
        .I5(SD_COUNTER_reg__0[5]),
        .O(I2C_BIT_i_18_n_0));
  LUT6 #(
    .INIT(64'h1400400404044004)) 
    I2C_BIT_i_19
       (.I0(SD_COUNTER_reg__0[5]),
        .I1(SD_COUNTER_reg__0[4]),
        .I2(SD_COUNTER_reg__0[2]),
        .I3(SD_COUNTER_reg__0[3]),
        .I4(SD_COUNTER_reg__0[1]),
        .I5(SD_COUNTER_reg__0[0]),
        .O(I2C_BIT_i_19_n_0));
  LUT5 #(
    .INIT(32'hAAC0AACF)) 
    I2C_BIT_i_2
       (.I0(I2C_BIT_i_5_n_0),
        .I1(I2C_BIT_i_6_n_0),
        .I2(I2C_BIT_i_7_n_0),
        .I3(I2C_BIT_i_8_n_0),
        .I4(I2C_BIT_i_9_n_0),
        .O(I2C_BIT__29));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    I2C_BIT_i_20
       (.I0(DOADO[8]),
        .I1(DOADO[9]),
        .I2(I2C_BIT_i_17_n_0),
        .I3(DOADO[10]),
        .I4(I2C_BIT_i_18_n_0),
        .I5(DOADO[11]),
        .O(I2C_BIT_i_20_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    I2C_BIT_i_21
       (.I0(DOADO[4]),
        .I1(DOADO[5]),
        .I2(I2C_BIT_i_17_n_0),
        .I3(DOADO[6]),
        .I4(I2C_BIT_i_18_n_0),
        .I5(DOADO[7]),
        .O(I2C_BIT_i_21_n_0));
  LUT6 #(
    .INIT(64'hFFAAFF82FF198045)) 
    I2C_BIT_i_22
       (.I0(SD_COUNTER_reg__0[1]),
        .I1(SD_COUNTER_reg__0[0]),
        .I2(SD_COUNTER_reg__0[2]),
        .I3(SD_COUNTER_reg__0[5]),
        .I4(SD_COUNTER_reg__0[4]),
        .I5(SD_COUNTER_reg__0[3]),
        .O(I2C_BIT_i_22_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    I2C_BIT_i_23
       (.I0(DOADO[12]),
        .I1(DOADO[13]),
        .I2(I2C_BIT_i_17_n_0),
        .I3(DOADO[14]),
        .I4(I2C_BIT_i_18_n_0),
        .I5(DOADO[15]),
        .O(I2C_BIT_i_23_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hF7BFBFF7)) 
    I2C_BIT_i_24
       (.I0(SD_COUNTER_reg__0[3]),
        .I1(mI2C_WR_reg),
        .I2(SD_COUNTER_reg__0[1]),
        .I3(SD_COUNTER_reg__0[2]),
        .I4(SD_COUNTER_reg__0[0]),
        .O(I2C_BIT_i_24_n_0));
  LUT5 #(
    .INIT(32'hB8BBB888)) 
    I2C_BIT_i_3
       (.I0(I2C_BIT_i_10_n_0),
        .I1(I2C_BIT_i_11_n_0),
        .I2(I2C_BIT_reg_i_12_n_0),
        .I3(I2C_BIT_i_13_n_0),
        .I4(I2C_BIT_reg_i_14_n_0),
        .O(I2C_BIT_i_3_n_0));
  LUT6 #(
    .INIT(64'h4444440404040404)) 
    I2C_BIT_i_4
       (.I0(i2c_en_r0),
        .I1(i2c_en_r1),
        .I2(mI2C_GO_reg),
        .I3(g0_b0_n_0),
        .I4(mI2C_WR_reg),
        .I5(I2C_BIT_i_15_n_0),
        .O(I2C_BIT6_out));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    I2C_BIT_i_5
       (.I0(DOADO[8]),
        .I1(DOADO[9]),
        .I2(I2C_BIT_i_9_n_0),
        .I3(DOADO[10]),
        .I4(I2C_BIT_i_16_n_0),
        .I5(DOADO[11]),
        .O(I2C_BIT_i_5_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    I2C_BIT_i_6
       (.I0(DOADO[12]),
        .I1(DOADO[13]),
        .I2(I2C_BIT_i_9_n_0),
        .I3(DOADO[14]),
        .I4(I2C_BIT_i_16_n_0),
        .I5(DOADO[15]),
        .O(I2C_BIT_i_6_n_0));
  LUT6 #(
    .INIT(64'h1000000400040004)) 
    I2C_BIT_i_7
       (.I0(SD_COUNTER_reg__0[5]),
        .I1(SD_COUNTER_reg__0[4]),
        .I2(SD_COUNTER_reg__0[3]),
        .I3(SD_COUNTER_reg__0[2]),
        .I4(SD_COUNTER_reg__0[1]),
        .I5(SD_COUNTER_reg__0[0]),
        .O(I2C_BIT_i_7_n_0));
  LUT6 #(
    .INIT(64'h0010100010001000)) 
    I2C_BIT_i_8
       (.I0(SD_COUNTER_reg__0[5]),
        .I1(SD_COUNTER_reg__0[3]),
        .I2(SD_COUNTER_reg__0[4]),
        .I3(SD_COUNTER_reg__0[2]),
        .I4(SD_COUNTER_reg__0[0]),
        .I5(SD_COUNTER_reg__0[1]),
        .O(I2C_BIT_i_8_n_0));
  LUT6 #(
    .INIT(64'h01F7FF3DF3DA6FF4)) 
    I2C_BIT_i_9
       (.I0(SD_COUNTER_reg__0[0]),
        .I1(SD_COUNTER_reg__0[2]),
        .I2(SD_COUNTER_reg__0[1]),
        .I3(SD_COUNTER_reg__0[3]),
        .I4(SD_COUNTER_reg__0[4]),
        .I5(SD_COUNTER_reg__0[5]),
        .O(I2C_BIT_i_9_n_0));
  FDRE I2C_BIT_reg
       (.C(iCLK),
        .CE(1'b1),
        .D(I2C_BIT_i_1_n_0),
        .Q(I2C_BIT_reg_n_0),
        .R(1'b0));
  MUXF7 I2C_BIT_reg_i_12
       (.I0(I2C_BIT_i_20_n_0),
        .I1(I2C_BIT_i_21_n_0),
        .O(I2C_BIT_reg_i_12_n_0),
        .S(I2C_BIT_i_19_n_0));
  MUXF7 I2C_BIT_reg_i_14
       (.I0(I2C_BIT_i_22_n_0),
        .I1(I2C_BIT_i_23_n_0),
        .O(I2C_BIT_reg_i_14_n_0),
        .S(I2C_BIT_i_19_n_0));
  LUT6 #(
    .INIT(64'hF4FFF7FFB0008000)) 
    I2C_SCLK_INST_0
       (.I0(I2C_SCLK12),
        .I1(mI2C_WR_reg),
        .I2(mI2C_CTRL_CLK),
        .I3(mI2C_GO_reg),
        .I4(I2C_SCLK22),
        .I5(SCLK_reg_n_0),
        .O(I2C_SCLK));
  LUT6 #(
    .INIT(64'h3333313112163666)) 
    I2C_SCLK_INST_0_i_1
       (.I0(SD_COUNTER_reg__0[3]),
        .I1(SD_COUNTER_reg__0[5]),
        .I2(SD_COUNTER_reg__0[2]),
        .I3(SD_COUNTER_reg__0[1]),
        .I4(SD_COUNTER_reg__0[0]),
        .I5(SD_COUNTER_reg__0[4]),
        .O(I2C_SCLK12));
  LUT6 #(
    .INIT(64'h540505755FFEFEAA)) 
    I2C_SCLK_INST_0_i_2
       (.I0(SD_COUNTER_reg__0[4]),
        .I1(SD_COUNTER_reg__0[1]),
        .I2(SD_COUNTER_reg__0[0]),
        .I3(SD_COUNTER_reg__0[2]),
        .I4(SD_COUNTER_reg__0[5]),
        .I5(SD_COUNTER_reg__0[3]),
        .O(I2C_SCLK22));
  LUT2 #(
    .INIT(4'h8)) 
    I2C_SDAT_INST_0
       (.I0(I2C_BIT_reg_n_0),
        .I1(SDO),
        .O(I2C_SDAT));
  MUXF7 I2C_SDAT_INST_0_i_1
       (.I0(I2C_SDAT_INST_0_i_2_n_0),
        .I1(I2C_SDAT_INST_0_i_3_n_0),
        .O(SDO),
        .S(mI2C_WR_reg));
  LUT6 #(
    .INIT(64'hF7DFF397F3D7D79F)) 
    I2C_SDAT_INST_0_i_2
       (.I0(SD_COUNTER_reg__0[5]),
        .I1(SD_COUNTER_reg__0[3]),
        .I2(SD_COUNTER_reg__0[4]),
        .I3(SD_COUNTER_reg__0[2]),
        .I4(SD_COUNTER_reg__0[1]),
        .I5(SD_COUNTER_reg__0[0]),
        .O(I2C_SDAT_INST_0_i_2_n_0));
  LUT6 #(
    .INIT(64'hFFFDFFFDFBDFDFBF)) 
    I2C_SDAT_INST_0_i_3
       (.I0(SD_COUNTER_reg__0[3]),
        .I1(SD_COUNTER_reg__0[5]),
        .I2(SD_COUNTER_reg__0[2]),
        .I3(SD_COUNTER_reg__0[1]),
        .I4(SD_COUNTER_reg__0[0]),
        .I5(SD_COUNTER_reg__0[4]),
        .O(I2C_SDAT_INST_0_i_3_n_0));
  LUT6 #(
    .INIT(64'hBFBFBFFF8C8C8C0C)) 
    SCLK_i_1
       (.I0(SCLK_i_2_n_0),
        .I1(i2c_negclk__0),
        .I2(mI2C_GO_reg),
        .I3(SCLK_i_4_n_0),
        .I4(SCLK_i_5_n_0),
        .I5(SCLK_reg_n_0),
        .O(SCLK_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h8)) 
    SCLK_i_10
       (.I0(SD_COUNTER_reg__0[3]),
        .I1(SD_COUNTER_reg__0[4]),
        .O(SCLK_i_10_n_0));
  LUT6 #(
    .INIT(64'h1010100000001000)) 
    SCLK_i_11
       (.I0(SCLK_i_12_n_0),
        .I1(mI2C_WR_reg),
        .I2(SD_COUNTER_reg__0[4]),
        .I3(SD_COUNTER_reg__0[3]),
        .I4(SD_COUNTER_reg__0[2]),
        .I5(SD_COUNTER_reg__0[0]),
        .O(SCLK_i_11_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h57)) 
    SCLK_i_12
       (.I0(SD_COUNTER_reg__0[1]),
        .I1(SD_COUNTER_reg__0[3]),
        .I2(SD_COUNTER_reg__0[5]),
        .O(SCLK_i_12_n_0));
  LUT6 #(
    .INIT(64'hFFEBFFFFFFEB0000)) 
    SCLK_i_2
       (.I0(SD_COUNTER_reg__0[3]),
        .I1(SD_COUNTER_reg__0[1]),
        .I2(SD_COUNTER_reg__0[2]),
        .I3(SD_COUNTER_reg__0[4]),
        .I4(mI2C_WR_reg),
        .I5(SCLK_i_6_n_0),
        .O(SCLK_i_2_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    SCLK_i_3
       (.I0(i2c_en_r1),
        .I1(i2c_en_r0),
        .O(i2c_negclk__0));
  LUT6 #(
    .INIT(64'hAAAAAAAA00000030)) 
    SCLK_i_4
       (.I0(SCLK_i_7_n_0),
        .I1(SD_COUNTER_reg__0[2]),
        .I2(SCLK_i_8_n_0),
        .I3(SCLK_i_9_n_0),
        .I4(SD_COUNTER_reg__0[4]),
        .I5(mI2C_WR_reg),
        .O(SCLK_i_4_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFF0000B800)) 
    SCLK_i_5
       (.I0(SD_COUNTER_reg__0[2]),
        .I1(SD_COUNTER_reg__0[0]),
        .I2(SD_COUNTER_reg__0[5]),
        .I3(SCLK_i_10_n_0),
        .I4(mI2C_WR_reg),
        .I5(SCLK_i_11_n_0),
        .O(SCLK_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hCC08FFFF)) 
    SCLK_i_6
       (.I0(SD_COUNTER_reg__0[0]),
        .I1(SD_COUNTER_reg__0[3]),
        .I2(SD_COUNTER_reg__0[2]),
        .I3(SD_COUNTER_reg__0[5]),
        .I4(SD_COUNTER_reg__0[1]),
        .O(SCLK_i_6_n_0));
  LUT6 #(
    .INIT(64'hEFFEEEEE00001011)) 
    SCLK_i_7
       (.I0(SD_COUNTER_reg__0[4]),
        .I1(SD_COUNTER_reg__0[3]),
        .I2(SD_COUNTER_reg__0[0]),
        .I3(SD_COUNTER_reg__0[1]),
        .I4(SD_COUNTER_reg__0[2]),
        .I5(SD_COUNTER_reg__0[5]),
        .O(SCLK_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'hB)) 
    SCLK_i_8
       (.I0(SD_COUNTER_reg__0[0]),
        .I1(SD_COUNTER_reg__0[1]),
        .O(SCLK_i_8_n_0));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'hE)) 
    SCLK_i_9
       (.I0(SD_COUNTER_reg__0[5]),
        .I1(SD_COUNTER_reg__0[3]),
        .O(SCLK_i_9_n_0));
  FDRE SCLK_reg
       (.C(iCLK),
        .CE(1'b1),
        .D(SCLK_i_1_n_0),
        .Q(SCLK_reg_n_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \SD_COUNTER[0]_i_1 
       (.I0(SD_COUNTER_reg__0[0]),
        .O(SD_COUNTER0[0]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \SD_COUNTER[1]_i_1 
       (.I0(SD_COUNTER_reg__0[0]),
        .I1(SD_COUNTER_reg__0[1]),
        .O(SD_COUNTER0[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \SD_COUNTER[2]_i_1 
       (.I0(SD_COUNTER_reg__0[0]),
        .I1(SD_COUNTER_reg__0[1]),
        .I2(SD_COUNTER_reg__0[2]),
        .O(SD_COUNTER0[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \SD_COUNTER[3]_i_1 
       (.I0(SD_COUNTER_reg__0[1]),
        .I1(SD_COUNTER_reg__0[0]),
        .I2(SD_COUNTER_reg__0[2]),
        .I3(SD_COUNTER_reg__0[3]),
        .O(SD_COUNTER0[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \SD_COUNTER[4]_i_1 
       (.I0(SD_COUNTER_reg__0[2]),
        .I1(SD_COUNTER_reg__0[0]),
        .I2(SD_COUNTER_reg__0[1]),
        .I3(SD_COUNTER_reg__0[3]),
        .I4(SD_COUNTER_reg__0[4]),
        .O(SD_COUNTER0[4]));
  LUT4 #(
    .INIT(16'h4044)) 
    \SD_COUNTER[5]_i_1 
       (.I0(i2c_en_r0),
        .I1(i2c_en_r1),
        .I2(mI2C_END),
        .I3(mI2C_GO_reg),
        .O(\SD_COUNTER[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h44404444)) 
    \SD_COUNTER[5]_i_2 
       (.I0(i2c_en_r0),
        .I1(i2c_en_r1),
        .I2(\SD_COUNTER[5]_i_4_n_0 ),
        .I3(mI2C_END),
        .I4(mI2C_GO_reg),
        .O(SD_COUNTER));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \SD_COUNTER[5]_i_3 
       (.I0(SD_COUNTER_reg__0[3]),
        .I1(SD_COUNTER_reg__0[1]),
        .I2(SD_COUNTER_reg__0[0]),
        .I3(SD_COUNTER_reg__0[2]),
        .I4(SD_COUNTER_reg__0[4]),
        .I5(SD_COUNTER_reg__0[5]),
        .O(SD_COUNTER0[5]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \SD_COUNTER[5]_i_4 
       (.I0(SD_COUNTER_reg__0[0]),
        .I1(SD_COUNTER_reg__0[1]),
        .I2(SD_COUNTER_reg__0[2]),
        .I3(SD_COUNTER_reg__0[3]),
        .I4(SD_COUNTER_reg__0[5]),
        .I5(SD_COUNTER_reg__0[4]),
        .O(\SD_COUNTER[5]_i_4_n_0 ));
  FDRE \SD_COUNTER_reg[0] 
       (.C(iCLK),
        .CE(SD_COUNTER),
        .D(SD_COUNTER0[0]),
        .Q(SD_COUNTER_reg__0[0]),
        .R(\SD_COUNTER[5]_i_1_n_0 ));
  FDRE \SD_COUNTER_reg[1] 
       (.C(iCLK),
        .CE(SD_COUNTER),
        .D(SD_COUNTER0[1]),
        .Q(SD_COUNTER_reg__0[1]),
        .R(\SD_COUNTER[5]_i_1_n_0 ));
  FDRE \SD_COUNTER_reg[2] 
       (.C(iCLK),
        .CE(SD_COUNTER),
        .D(SD_COUNTER0[2]),
        .Q(SD_COUNTER_reg__0[2]),
        .R(\SD_COUNTER[5]_i_1_n_0 ));
  FDRE \SD_COUNTER_reg[3] 
       (.C(iCLK),
        .CE(SD_COUNTER),
        .D(SD_COUNTER0[3]),
        .Q(SD_COUNTER_reg__0[3]),
        .R(\SD_COUNTER[5]_i_1_n_0 ));
  FDRE \SD_COUNTER_reg[4] 
       (.C(iCLK),
        .CE(SD_COUNTER),
        .D(SD_COUNTER0[4]),
        .Q(SD_COUNTER_reg__0[4]),
        .R(\SD_COUNTER[5]_i_1_n_0 ));
  FDRE \SD_COUNTER_reg[5] 
       (.C(iCLK),
        .CE(SD_COUNTER),
        .D(SD_COUNTER0[5]),
        .Q(SD_COUNTER_reg__0[5]),
        .R(\SD_COUNTER[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFEE01DFF76FFDFF7)) 
    g0_b0
       (.I0(SD_COUNTER_reg__0[0]),
        .I1(SD_COUNTER_reg__0[1]),
        .I2(SD_COUNTER_reg__0[2]),
        .I3(SD_COUNTER_reg__0[3]),
        .I4(SD_COUNTER_reg__0[4]),
        .I5(SD_COUNTER_reg__0[5]),
        .O(g0_b0_n_0));
endmodule

module IICctrl_0_IICctrl
   (I2C_SCLK,
    I2C_SDAT,
    iCLK);
  output I2C_SCLK;
  inout I2C_SDAT;
  input iCLK;

  wire \FSM_onehot_mSetup_ST[2]_i_1_n_0 ;
  wire \FSM_onehot_mSetup_ST[2]_i_4_n_0 ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_mSetup_ST_reg_n_0_[1] ;
  wire I2C_SCLK;
  wire I2C_SDAT;
  (* RTL_KEEP = "yes" *) wire LUT_INDEX;
  wire [7:0]LUT_INDEX_reg__0;
  wire LUT_INDEX_reg_rep_i_10_n_0;
  wire LUT_INDEX_reg_rep_i_1_n_0;
  wire LUT_INDEX_reg_rep_n_15;
  wire clear;
  wire data10;
  wire data11;
  wire data12;
  wire data13;
  wire data14;
  wire data15;
  wire data16;
  wire data17;
  wire data18;
  wire data19;
  wire data20;
  wire data21;
  wire data22;
  wire data8;
  wire data9;
  wire i2c_en_r0;
  wire i2c_en_r1;
  wire iCLK;
  wire \mI2C_CLK_DIV[10]_i_3_n_0 ;
  wire \mI2C_CLK_DIV[10]_i_4_n_0 ;
  wire [10:1]mI2C_CLK_DIV_reg__0;
  wire \mI2C_CLK_DIV_reg_n_0_[0] ;
  wire mI2C_CTRL_CLK;
  wire mI2C_CTRL_CLK_i_1_n_0;
  (* RTL_KEEP = "yes" *) wire mI2C_GO;
  wire mI2C_GO2_out;
  wire mI2C_GO_reg_n_0;
  wire mI2C_WR;
  wire mI2C_WR_i_2_n_0;
  wire mI2C_WR_reg_n_0;
  wire [7:0]p_0_in;
  wire [10:0]p_0_in__0;
  wire u_I2C_Controller_n_0;
  wire u_I2C_Controller_n_1;
  wire u_I2C_Controller_n_2;
  wire [15:0]NLW_LUT_INDEX_reg_rep_DOBDO_UNCONNECTED;
  wire [1:0]NLW_LUT_INDEX_reg_rep_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_LUT_INDEX_reg_rep_DOPBDOP_UNCONNECTED;

  LUT5 #(
    .INIT(32'h40000000)) 
    \FSM_onehot_mSetup_ST[2]_i_1 
       (.I0(i2c_en_r0),
        .I1(i2c_en_r1),
        .I2(\FSM_onehot_mSetup_ST[2]_i_4_n_0 ),
        .I3(LUT_INDEX_reg__0[7]),
        .I4(LUT_INDEX_reg__0[6]),
        .O(\FSM_onehot_mSetup_ST[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \FSM_onehot_mSetup_ST[2]_i_4 
       (.I0(LUT_INDEX_reg__0[2]),
        .I1(LUT_INDEX_reg__0[0]),
        .I2(LUT_INDEX_reg__0[1]),
        .I3(LUT_INDEX_reg__0[4]),
        .I4(LUT_INDEX_reg__0[3]),
        .I5(LUT_INDEX_reg__0[5]),
        .O(\FSM_onehot_mSetup_ST[2]_i_4_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:010,iSTATE0:001,iSTATE1:100" *) 
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_mSetup_ST_reg[0] 
       (.C(iCLK),
        .CE(mI2C_GO2_out),
        .D(u_I2C_Controller_n_2),
        .Q(mI2C_GO),
        .S(\FSM_onehot_mSetup_ST[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:010,iSTATE0:001,iSTATE1:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_mSetup_ST_reg[1] 
       (.C(iCLK),
        .CE(mI2C_GO2_out),
        .D(u_I2C_Controller_n_1),
        .Q(\FSM_onehot_mSetup_ST_reg_n_0_[1] ),
        .R(\FSM_onehot_mSetup_ST[2]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:010,iSTATE0:001,iSTATE1:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_mSetup_ST_reg[2] 
       (.C(iCLK),
        .CE(mI2C_GO2_out),
        .D(u_I2C_Controller_n_0),
        .Q(LUT_INDEX),
        .R(\FSM_onehot_mSetup_ST[2]_i_1_n_0 ));
  FDRE \LUT_INDEX_reg[0] 
       (.C(iCLK),
        .CE(LUT_INDEX_reg_rep_i_1_n_0),
        .D(p_0_in[0]),
        .Q(LUT_INDEX_reg__0[0]),
        .R(1'b0));
  FDRE \LUT_INDEX_reg[1] 
       (.C(iCLK),
        .CE(LUT_INDEX_reg_rep_i_1_n_0),
        .D(p_0_in[1]),
        .Q(LUT_INDEX_reg__0[1]),
        .R(1'b0));
  FDRE \LUT_INDEX_reg[2] 
       (.C(iCLK),
        .CE(LUT_INDEX_reg_rep_i_1_n_0),
        .D(p_0_in[2]),
        .Q(LUT_INDEX_reg__0[2]),
        .R(1'b0));
  FDRE \LUT_INDEX_reg[3] 
       (.C(iCLK),
        .CE(LUT_INDEX_reg_rep_i_1_n_0),
        .D(p_0_in[3]),
        .Q(LUT_INDEX_reg__0[3]),
        .R(1'b0));
  FDRE \LUT_INDEX_reg[4] 
       (.C(iCLK),
        .CE(LUT_INDEX_reg_rep_i_1_n_0),
        .D(p_0_in[4]),
        .Q(LUT_INDEX_reg__0[4]),
        .R(1'b0));
  FDRE \LUT_INDEX_reg[5] 
       (.C(iCLK),
        .CE(LUT_INDEX_reg_rep_i_1_n_0),
        .D(p_0_in[5]),
        .Q(LUT_INDEX_reg__0[5]),
        .R(1'b0));
  FDRE \LUT_INDEX_reg[6] 
       (.C(iCLK),
        .CE(LUT_INDEX_reg_rep_i_1_n_0),
        .D(p_0_in[6]),
        .Q(LUT_INDEX_reg__0[6]),
        .R(1'b0));
  FDRE \LUT_INDEX_reg[7] 
       (.C(iCLK),
        .CE(LUT_INDEX_reg_rep_i_1_n_0),
        .D(p_0_in[7]),
        .Q(LUT_INDEX_reg__0[7]),
        .R(1'b0));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d16" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "4096" *) 
  (* RTL_RAM_NAME = "inst/LUT_INDEX" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "1023" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "15" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h3E000C00030A1A7A19021801171332B66B001E313DC83A0440D0121400000000),
    .INIT_01(256'h838F8288818080767F687E557D3C7C287B1C7A201180A2027300721171007000),
    .INIT_02(256'h26A525632475AB07A50514280D001000000013E089E888D787C486AF85A38496),
    .INIT_03(256'h330B29072291210216020F4B0E6113EFAA94A990A8F0A7DFA6DFA103A0689F78),
    .INIT_04(256'h96009200910090008F008E008D4F741969004E204D403C78392A3871371D350B),
    .INIT_05(256'h5C675B445A885988483A47284658453444F04314B80AB382B20EB10CB0849A80),
    .INIT_06(256'h150013E7024001406A406F9F6E116D556C0A950894046605652064045E0E5D49),
    .INIT_07(256'h4138C9F04B0977014C0076E175053F004108589E5480535E5222510050804F80),
    .INIT_08(256'hC8F0790178049E3F9D4C9C039B299A849930982097309600A4893B0234115640),
    .INIT_09(256'hC8C07902C8807909C820790DC80F790CC801790BC880790AC87E7910C800790F),
    .INIT_0A(256'h0000000000000000000000000000000000003B4209037926C8307905C8407903),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("PERFORMANCE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(0),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("WRITE_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(0)) 
    LUT_INDEX_reg_rep
       (.ADDRARDADDR({1'b0,1'b0,p_0_in,1'b0,1'b0,1'b0,1'b0}),
        .ADDRBWRADDR({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(iCLK),
        .CLKBWRCLK(1'b0),
        .DIADI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIBDI({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b1,1'b1}),
        .DOADO({data8,data9,data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21,data22,LUT_INDEX_reg_rep_n_15}),
        .DOBDO(NLW_LUT_INDEX_reg_rep_DOBDO_UNCONNECTED[15:0]),
        .DOPADOP(NLW_LUT_INDEX_reg_rep_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_LUT_INDEX_reg_rep_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(LUT_INDEX_reg_rep_i_1_n_0),
        .ENBWREN(1'b0),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b0,1'b0}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
  LUT6 #(
    .INIT(64'h0040404040404040)) 
    LUT_INDEX_reg_rep_i_1
       (.I0(i2c_en_r0),
        .I1(i2c_en_r1),
        .I2(LUT_INDEX),
        .I3(LUT_INDEX_reg__0[6]),
        .I4(LUT_INDEX_reg__0[7]),
        .I5(\FSM_onehot_mSetup_ST[2]_i_4_n_0 ),
        .O(LUT_INDEX_reg_rep_i_1_n_0));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    LUT_INDEX_reg_rep_i_10
       (.I0(LUT_INDEX_reg__0[5]),
        .I1(LUT_INDEX_reg__0[3]),
        .I2(LUT_INDEX_reg__0[1]),
        .I3(LUT_INDEX_reg__0[0]),
        .I4(LUT_INDEX_reg__0[2]),
        .I5(LUT_INDEX_reg__0[4]),
        .O(LUT_INDEX_reg_rep_i_10_n_0));
  LUT3 #(
    .INIT(8'h78)) 
    LUT_INDEX_reg_rep_i_2
       (.I0(LUT_INDEX_reg_rep_i_10_n_0),
        .I1(LUT_INDEX_reg__0[6]),
        .I2(LUT_INDEX_reg__0[7]),
        .O(p_0_in[7]));
  LUT2 #(
    .INIT(4'h6)) 
    LUT_INDEX_reg_rep_i_3
       (.I0(LUT_INDEX_reg_rep_i_10_n_0),
        .I1(LUT_INDEX_reg__0[6]),
        .O(p_0_in[6]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    LUT_INDEX_reg_rep_i_4
       (.I0(LUT_INDEX_reg__0[3]),
        .I1(LUT_INDEX_reg__0[1]),
        .I2(LUT_INDEX_reg__0[0]),
        .I3(LUT_INDEX_reg__0[2]),
        .I4(LUT_INDEX_reg__0[4]),
        .I5(LUT_INDEX_reg__0[5]),
        .O(p_0_in[5]));
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    LUT_INDEX_reg_rep_i_5
       (.I0(LUT_INDEX_reg__0[2]),
        .I1(LUT_INDEX_reg__0[0]),
        .I2(LUT_INDEX_reg__0[1]),
        .I3(LUT_INDEX_reg__0[3]),
        .I4(LUT_INDEX_reg__0[4]),
        .O(p_0_in[4]));
  LUT4 #(
    .INIT(16'h7F80)) 
    LUT_INDEX_reg_rep_i_6
       (.I0(LUT_INDEX_reg__0[1]),
        .I1(LUT_INDEX_reg__0[0]),
        .I2(LUT_INDEX_reg__0[2]),
        .I3(LUT_INDEX_reg__0[3]),
        .O(p_0_in[3]));
  LUT3 #(
    .INIT(8'h78)) 
    LUT_INDEX_reg_rep_i_7
       (.I0(LUT_INDEX_reg__0[0]),
        .I1(LUT_INDEX_reg__0[1]),
        .I2(LUT_INDEX_reg__0[2]),
        .O(p_0_in[2]));
  LUT2 #(
    .INIT(4'h6)) 
    LUT_INDEX_reg_rep_i_8
       (.I0(LUT_INDEX_reg__0[0]),
        .I1(LUT_INDEX_reg__0[1]),
        .O(p_0_in[1]));
  LUT1 #(
    .INIT(2'h1)) 
    LUT_INDEX_reg_rep_i_9
       (.I0(LUT_INDEX_reg__0[0]),
        .O(p_0_in[0]));
  FDRE i2c_en_r0_reg
       (.C(iCLK),
        .CE(1'b1),
        .D(mI2C_CTRL_CLK),
        .Q(i2c_en_r0),
        .R(1'b0));
  FDRE i2c_en_r1_reg
       (.C(iCLK),
        .CE(1'b1),
        .D(i2c_en_r0),
        .Q(i2c_en_r1),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \mI2C_CLK_DIV[0]_i_1 
       (.I0(\mI2C_CLK_DIV_reg_n_0_[0] ),
        .O(p_0_in__0[0]));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAA0080)) 
    \mI2C_CLK_DIV[10]_i_1 
       (.I0(mI2C_CLK_DIV_reg__0[10]),
        .I1(mI2C_CLK_DIV_reg__0[7]),
        .I2(mI2C_CLK_DIV_reg__0[6]),
        .I3(\mI2C_CLK_DIV[10]_i_3_n_0 ),
        .I4(mI2C_CLK_DIV_reg__0[8]),
        .I5(mI2C_CLK_DIV_reg__0[9]),
        .O(clear));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \mI2C_CLK_DIV[10]_i_2 
       (.I0(mI2C_CLK_DIV_reg__0[8]),
        .I1(mI2C_CLK_DIV_reg__0[6]),
        .I2(\mI2C_CLK_DIV[10]_i_4_n_0 ),
        .I3(mI2C_CLK_DIV_reg__0[7]),
        .I4(mI2C_CLK_DIV_reg__0[9]),
        .I5(mI2C_CLK_DIV_reg__0[10]),
        .O(p_0_in__0[10]));
  LUT5 #(
    .INIT(32'h55555557)) 
    \mI2C_CLK_DIV[10]_i_3 
       (.I0(mI2C_CLK_DIV_reg__0[5]),
        .I1(mI2C_CLK_DIV_reg__0[2]),
        .I2(mI2C_CLK_DIV_reg__0[1]),
        .I3(mI2C_CLK_DIV_reg__0[3]),
        .I4(mI2C_CLK_DIV_reg__0[4]),
        .O(\mI2C_CLK_DIV[10]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h8000000000000000)) 
    \mI2C_CLK_DIV[10]_i_4 
       (.I0(mI2C_CLK_DIV_reg__0[5]),
        .I1(mI2C_CLK_DIV_reg__0[3]),
        .I2(mI2C_CLK_DIV_reg__0[1]),
        .I3(\mI2C_CLK_DIV_reg_n_0_[0] ),
        .I4(mI2C_CLK_DIV_reg__0[2]),
        .I5(mI2C_CLK_DIV_reg__0[4]),
        .O(\mI2C_CLK_DIV[10]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \mI2C_CLK_DIV[1]_i_1 
       (.I0(\mI2C_CLK_DIV_reg_n_0_[0] ),
        .I1(mI2C_CLK_DIV_reg__0[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \mI2C_CLK_DIV[2]_i_1 
       (.I0(\mI2C_CLK_DIV_reg_n_0_[0] ),
        .I1(mI2C_CLK_DIV_reg__0[1]),
        .I2(mI2C_CLK_DIV_reg__0[2]),
        .O(p_0_in__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \mI2C_CLK_DIV[3]_i_1 
       (.I0(mI2C_CLK_DIV_reg__0[1]),
        .I1(\mI2C_CLK_DIV_reg_n_0_[0] ),
        .I2(mI2C_CLK_DIV_reg__0[2]),
        .I3(mI2C_CLK_DIV_reg__0[3]),
        .O(p_0_in__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \mI2C_CLK_DIV[4]_i_1 
       (.I0(mI2C_CLK_DIV_reg__0[2]),
        .I1(\mI2C_CLK_DIV_reg_n_0_[0] ),
        .I2(mI2C_CLK_DIV_reg__0[1]),
        .I3(mI2C_CLK_DIV_reg__0[3]),
        .I4(mI2C_CLK_DIV_reg__0[4]),
        .O(p_0_in__0[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \mI2C_CLK_DIV[5]_i_1 
       (.I0(mI2C_CLK_DIV_reg__0[3]),
        .I1(mI2C_CLK_DIV_reg__0[1]),
        .I2(\mI2C_CLK_DIV_reg_n_0_[0] ),
        .I3(mI2C_CLK_DIV_reg__0[2]),
        .I4(mI2C_CLK_DIV_reg__0[4]),
        .I5(mI2C_CLK_DIV_reg__0[5]),
        .O(p_0_in__0[5]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \mI2C_CLK_DIV[6]_i_1 
       (.I0(\mI2C_CLK_DIV[10]_i_4_n_0 ),
        .I1(mI2C_CLK_DIV_reg__0[6]),
        .O(p_0_in__0[6]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \mI2C_CLK_DIV[7]_i_1 
       (.I0(\mI2C_CLK_DIV[10]_i_4_n_0 ),
        .I1(mI2C_CLK_DIV_reg__0[6]),
        .I2(mI2C_CLK_DIV_reg__0[7]),
        .O(p_0_in__0[7]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \mI2C_CLK_DIV[8]_i_1 
       (.I0(mI2C_CLK_DIV_reg__0[6]),
        .I1(\mI2C_CLK_DIV[10]_i_4_n_0 ),
        .I2(mI2C_CLK_DIV_reg__0[7]),
        .I3(mI2C_CLK_DIV_reg__0[8]),
        .O(p_0_in__0[8]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \mI2C_CLK_DIV[9]_i_1 
       (.I0(mI2C_CLK_DIV_reg__0[7]),
        .I1(\mI2C_CLK_DIV[10]_i_4_n_0 ),
        .I2(mI2C_CLK_DIV_reg__0[6]),
        .I3(mI2C_CLK_DIV_reg__0[8]),
        .I4(mI2C_CLK_DIV_reg__0[9]),
        .O(p_0_in__0[9]));
  FDRE \mI2C_CLK_DIV_reg[0] 
       (.C(iCLK),
        .CE(1'b1),
        .D(p_0_in__0[0]),
        .Q(\mI2C_CLK_DIV_reg_n_0_[0] ),
        .R(clear));
  FDRE \mI2C_CLK_DIV_reg[10] 
       (.C(iCLK),
        .CE(1'b1),
        .D(p_0_in__0[10]),
        .Q(mI2C_CLK_DIV_reg__0[10]),
        .R(clear));
  FDRE \mI2C_CLK_DIV_reg[1] 
       (.C(iCLK),
        .CE(1'b1),
        .D(p_0_in__0[1]),
        .Q(mI2C_CLK_DIV_reg__0[1]),
        .R(clear));
  FDRE \mI2C_CLK_DIV_reg[2] 
       (.C(iCLK),
        .CE(1'b1),
        .D(p_0_in__0[2]),
        .Q(mI2C_CLK_DIV_reg__0[2]),
        .R(clear));
  FDRE \mI2C_CLK_DIV_reg[3] 
       (.C(iCLK),
        .CE(1'b1),
        .D(p_0_in__0[3]),
        .Q(mI2C_CLK_DIV_reg__0[3]),
        .R(clear));
  FDRE \mI2C_CLK_DIV_reg[4] 
       (.C(iCLK),
        .CE(1'b1),
        .D(p_0_in__0[4]),
        .Q(mI2C_CLK_DIV_reg__0[4]),
        .R(clear));
  FDRE \mI2C_CLK_DIV_reg[5] 
       (.C(iCLK),
        .CE(1'b1),
        .D(p_0_in__0[5]),
        .Q(mI2C_CLK_DIV_reg__0[5]),
        .R(clear));
  FDRE \mI2C_CLK_DIV_reg[6] 
       (.C(iCLK),
        .CE(1'b1),
        .D(p_0_in__0[6]),
        .Q(mI2C_CLK_DIV_reg__0[6]),
        .R(clear));
  FDRE \mI2C_CLK_DIV_reg[7] 
       (.C(iCLK),
        .CE(1'b1),
        .D(p_0_in__0[7]),
        .Q(mI2C_CLK_DIV_reg__0[7]),
        .R(clear));
  FDRE \mI2C_CLK_DIV_reg[8] 
       (.C(iCLK),
        .CE(1'b1),
        .D(p_0_in__0[8]),
        .Q(mI2C_CLK_DIV_reg__0[8]),
        .R(clear));
  FDRE \mI2C_CLK_DIV_reg[9] 
       (.C(iCLK),
        .CE(1'b1),
        .D(p_0_in__0[9]),
        .Q(mI2C_CLK_DIV_reg__0[9]),
        .R(clear));
  LUT2 #(
    .INIT(4'h6)) 
    mI2C_CTRL_CLK_i_1
       (.I0(clear),
        .I1(mI2C_CTRL_CLK),
        .O(mI2C_CTRL_CLK_i_1_n_0));
  FDRE mI2C_CTRL_CLK_reg
       (.C(iCLK),
        .CE(1'b1),
        .D(mI2C_CTRL_CLK_i_1_n_0),
        .Q(mI2C_CTRL_CLK),
        .R(1'b0));
  FDRE mI2C_GO_reg
       (.C(iCLK),
        .CE(mI2C_GO2_out),
        .D(mI2C_GO),
        .Q(mI2C_GO_reg_n_0),
        .R(\FSM_onehot_mSetup_ST[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hAAAAAAA8)) 
    mI2C_WR_i_1
       (.I0(mI2C_GO),
        .I1(mI2C_WR_i_2_n_0),
        .I2(LUT_INDEX_reg__0[6]),
        .I3(LUT_INDEX_reg__0[5]),
        .I4(LUT_INDEX_reg__0[7]),
        .O(mI2C_WR));
  LUT4 #(
    .INIT(16'hFFFE)) 
    mI2C_WR_i_2
       (.I0(LUT_INDEX_reg__0[3]),
        .I1(LUT_INDEX_reg__0[4]),
        .I2(LUT_INDEX_reg__0[1]),
        .I3(LUT_INDEX_reg__0[2]),
        .O(mI2C_WR_i_2_n_0));
  FDRE mI2C_WR_reg
       (.C(iCLK),
        .CE(mI2C_GO2_out),
        .D(mI2C_WR),
        .Q(mI2C_WR_reg_n_0),
        .R(\FSM_onehot_mSetup_ST[2]_i_1_n_0 ));
  IICctrl_0_I2C_Controller u_I2C_Controller
       (.D({u_I2C_Controller_n_0,u_I2C_Controller_n_1,u_I2C_Controller_n_2}),
        .DOADO({data8,data9,data10,data11,data12,data13,data14,data15,data16,data17,data18,data19,data20,data21,data22,LUT_INDEX_reg_rep_n_15}),
        .E(mI2C_GO2_out),
        .I2C_SCLK(I2C_SCLK),
        .I2C_SDAT(I2C_SDAT),
        .i2c_en_r0(i2c_en_r0),
        .i2c_en_r1(i2c_en_r1),
        .iCLK(iCLK),
        .mI2C_CTRL_CLK(mI2C_CTRL_CLK),
        .mI2C_GO_reg(mI2C_GO_reg_n_0),
        .mI2C_WR_reg(mI2C_WR_reg_n_0),
        .out({LUT_INDEX,\FSM_onehot_mSetup_ST_reg_n_0_[1] ,mI2C_GO}));
endmodule

(* CHECK_LICENSE_TYPE = "IICctrl_0,IICctrl,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "IICctrl,Vivado 2017.1" *) 
(* NotValidForBitStream *)
module IICctrl_0
   (iCLK,
    I2C_SCLK,
    I2C_SDAT);
  input iCLK;
  output I2C_SCLK;
  inout I2C_SDAT;

  wire I2C_SCLK;
  wire I2C_SDAT;
  wire iCLK;

  IICctrl_0_IICctrl inst
       (.I2C_SCLK(I2C_SCLK),
        .I2C_SDAT(I2C_SDAT),
        .iCLK(iCLK));
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
