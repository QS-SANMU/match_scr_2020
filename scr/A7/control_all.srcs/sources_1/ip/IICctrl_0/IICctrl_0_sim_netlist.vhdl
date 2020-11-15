-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Sat Oct 24 14:17:30 2020
-- Host        : DESKTOP-6EMR18T running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top IICctrl_0 -prefix
--               IICctrl_0_ IICctrl_0_sim_netlist.vhdl
-- Design      : IICctrl_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity IICctrl_0_I2C_Controller is
  port (
    D : out STD_LOGIC_VECTOR ( 2 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    I2C_SCLK : out STD_LOGIC;
    I2C_SDAT : inout STD_LOGIC;
    iCLK : in STD_LOGIC;
    mI2C_WR_reg : in STD_LOGIC;
    \out\ : in STD_LOGIC_VECTOR ( 2 downto 0 );
    i2c_en_r0 : in STD_LOGIC;
    i2c_en_r1 : in STD_LOGIC;
    mI2C_GO_reg : in STD_LOGIC;
    DOADO : in STD_LOGIC_VECTOR ( 15 downto 0 );
    mI2C_CTRL_CLK : in STD_LOGIC
  );
end IICctrl_0_I2C_Controller;

architecture STRUCTURE of IICctrl_0_I2C_Controller is
  signal \ACK0__1\ : STD_LOGIC;
  signal ACKR13_out : STD_LOGIC;
  signal ACKR1_i_1_n_0 : STD_LOGIC;
  signal ACKR1_i_3_n_0 : STD_LOGIC;
  signal ACKR1_reg_n_0 : STD_LOGIC;
  signal ACKR25_out : STD_LOGIC;
  signal ACKR2_i_1_n_0 : STD_LOGIC;
  signal ACKR2_i_3_n_0 : STD_LOGIC;
  signal ACKR2_i_4_n_0 : STD_LOGIC;
  signal ACKR2_reg_n_0 : STD_LOGIC;
  signal ACKR34_out : STD_LOGIC;
  signal ACKR3_i_1_n_0 : STD_LOGIC;
  signal ACKR3_i_2_n_0 : STD_LOGIC;
  signal ACKR3_i_4_n_0 : STD_LOGIC;
  signal ACKR3_reg_n_0 : STD_LOGIC;
  signal ACKW10_out : STD_LOGIC;
  signal ACKW1_i_1_n_0 : STD_LOGIC;
  signal ACKW1_reg_n_0 : STD_LOGIC;
  signal ACKW22_out : STD_LOGIC;
  signal ACKW2_i_1_n_0 : STD_LOGIC;
  signal ACKW2_i_3_n_0 : STD_LOGIC;
  signal ACKW2_reg_n_0 : STD_LOGIC;
  signal ACKW3_i_1_n_0 : STD_LOGIC;
  signal ACKW3_i_2_n_0 : STD_LOGIC;
  signal ACKW3_i_3_n_0 : STD_LOGIC;
  signal ACKW3_reg_n_0 : STD_LOGIC;
  signal END10_out : STD_LOGIC;
  signal END_i_1_n_0 : STD_LOGIC;
  signal END_i_3_n_0 : STD_LOGIC;
  signal END_i_4_n_0 : STD_LOGIC;
  signal I2C_BIT6_out : STD_LOGIC;
  signal \I2C_BIT__29\ : STD_LOGIC;
  signal I2C_BIT_i_10_n_0 : STD_LOGIC;
  signal I2C_BIT_i_11_n_0 : STD_LOGIC;
  signal I2C_BIT_i_13_n_0 : STD_LOGIC;
  signal I2C_BIT_i_15_n_0 : STD_LOGIC;
  signal I2C_BIT_i_16_n_0 : STD_LOGIC;
  signal I2C_BIT_i_17_n_0 : STD_LOGIC;
  signal I2C_BIT_i_18_n_0 : STD_LOGIC;
  signal I2C_BIT_i_19_n_0 : STD_LOGIC;
  signal I2C_BIT_i_1_n_0 : STD_LOGIC;
  signal I2C_BIT_i_20_n_0 : STD_LOGIC;
  signal I2C_BIT_i_21_n_0 : STD_LOGIC;
  signal I2C_BIT_i_22_n_0 : STD_LOGIC;
  signal I2C_BIT_i_23_n_0 : STD_LOGIC;
  signal I2C_BIT_i_24_n_0 : STD_LOGIC;
  signal I2C_BIT_i_3_n_0 : STD_LOGIC;
  signal I2C_BIT_i_5_n_0 : STD_LOGIC;
  signal I2C_BIT_i_6_n_0 : STD_LOGIC;
  signal I2C_BIT_i_7_n_0 : STD_LOGIC;
  signal I2C_BIT_i_8_n_0 : STD_LOGIC;
  signal I2C_BIT_i_9_n_0 : STD_LOGIC;
  signal I2C_BIT_reg_i_12_n_0 : STD_LOGIC;
  signal I2C_BIT_reg_i_14_n_0 : STD_LOGIC;
  signal I2C_BIT_reg_n_0 : STD_LOGIC;
  signal I2C_SCLK12 : STD_LOGIC;
  signal I2C_SCLK1612_in : STD_LOGIC;
  signal I2C_SCLK22 : STD_LOGIC;
  signal I2C_SDAT_INST_0_i_2_n_0 : STD_LOGIC;
  signal I2C_SDAT_INST_0_i_3_n_0 : STD_LOGIC;
  signal SCLK_i_10_n_0 : STD_LOGIC;
  signal SCLK_i_11_n_0 : STD_LOGIC;
  signal SCLK_i_12_n_0 : STD_LOGIC;
  signal SCLK_i_1_n_0 : STD_LOGIC;
  signal SCLK_i_2_n_0 : STD_LOGIC;
  signal SCLK_i_4_n_0 : STD_LOGIC;
  signal SCLK_i_5_n_0 : STD_LOGIC;
  signal SCLK_i_6_n_0 : STD_LOGIC;
  signal SCLK_i_7_n_0 : STD_LOGIC;
  signal SCLK_i_8_n_0 : STD_LOGIC;
  signal SCLK_i_9_n_0 : STD_LOGIC;
  signal SCLK_reg_n_0 : STD_LOGIC;
  signal SDO : STD_LOGIC;
  signal SD_COUNTER : STD_LOGIC;
  signal SD_COUNTER0 : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \SD_COUNTER[5]_i_1_n_0\ : STD_LOGIC;
  signal \SD_COUNTER[5]_i_4_n_0\ : STD_LOGIC;
  signal \SD_COUNTER_reg__0\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal g0_b0_n_0 : STD_LOGIC;
  signal \i2c_negclk__0\ : STD_LOGIC;
  signal mI2C_ACK : STD_LOGIC;
  signal mI2C_END : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of ACKR2_i_5 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of ACKW3_i_3 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of END_i_1 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \FSM_onehot_mSetup_ST[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \FSM_onehot_mSetup_ST[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of I2C_BIT_i_11 : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of I2C_BIT_i_15 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of I2C_BIT_i_24 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of SCLK_i_10 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of SCLK_i_12 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of SCLK_i_6 : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of SCLK_i_8 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of SCLK_i_9 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \SD_COUNTER[0]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \SD_COUNTER[1]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \SD_COUNTER[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \SD_COUNTER[3]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \SD_COUNTER[4]_i_1\ : label is "soft_lutpair2";
begin
ACKR1_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFFFFFFFDFF0000"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(3),
      I1 => I2C_SDAT,
      I2 => mI2C_WR_reg,
      I3 => mI2C_GO_reg,
      I4 => ACKR13_out,
      I5 => ACKR1_reg_n_0,
      O => ACKR1_i_1_n_0
    );
ACKR1_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4404440444044444"
    )
        port map (
      I0 => i2c_en_r0,
      I1 => i2c_en_r1,
      I2 => mI2C_GO_reg,
      I3 => ACKR2_i_3_n_0,
      I4 => ACKR1_i_3_n_0,
      I5 => mI2C_WR_reg,
      O => ACKR13_out
    );
ACKR1_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFFFEFFFFFFFE"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(5),
      I1 => \SD_COUNTER_reg__0\(1),
      I2 => \SD_COUNTER_reg__0\(4),
      I3 => \SD_COUNTER_reg__0\(3),
      I4 => \SD_COUNTER_reg__0\(2),
      I5 => \SD_COUNTER_reg__0\(0),
      O => ACKR1_i_3_n_0
    );
ACKR1_reg: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => ACKR1_i_1_n_0,
      Q => ACKR1_reg_n_0,
      R => '0'
    );
ACKR2_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FDFFFFFFFDFF0000"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(4),
      I1 => I2C_SDAT,
      I2 => mI2C_WR_reg,
      I3 => mI2C_GO_reg,
      I4 => ACKR25_out,
      I5 => ACKR2_reg_n_0,
      O => ACKR2_i_1_n_0
    );
ACKR2_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4404440444044444"
    )
        port map (
      I0 => i2c_en_r0,
      I1 => i2c_en_r1,
      I2 => mI2C_GO_reg,
      I3 => ACKR2_i_3_n_0,
      I4 => ACKR2_i_4_n_0,
      I5 => mI2C_WR_reg,
      O => ACKR25_out
    );
ACKR2_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => mI2C_WR_reg,
      I1 => \SD_COUNTER_reg__0\(0),
      I2 => \SD_COUNTER_reg__0\(1),
      I3 => \SD_COUNTER_reg__0\(3),
      I4 => \SD_COUNTER_reg__0\(2),
      I5 => I2C_SCLK1612_in,
      O => ACKR2_i_3_n_0
    );
ACKR2_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFE6"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(4),
      I1 => \SD_COUNTER_reg__0\(3),
      I2 => \SD_COUNTER_reg__0\(0),
      I3 => \SD_COUNTER_reg__0\(5),
      I4 => \SD_COUNTER_reg__0\(1),
      I5 => \SD_COUNTER_reg__0\(2),
      O => ACKR2_i_4_n_0
    );
ACKR2_i_5: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(4),
      I1 => \SD_COUNTER_reg__0\(5),
      O => I2C_SCLK1612_in
    );
ACKR2_reg: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => ACKR2_i_1_n_0,
      Q => ACKR2_reg_n_0,
      R => '0'
    );
ACKR3_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EFFFEF00"
    )
        port map (
      I0 => ACKR3_i_2_n_0,
      I1 => mI2C_WR_reg,
      I2 => mI2C_GO_reg,
      I3 => ACKR34_out,
      I4 => ACKR3_reg_n_0,
      O => ACKR3_i_1_n_0
    );
ACKR3_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"D"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(5),
      I1 => I2C_SDAT,
      O => ACKR3_i_2_n_0
    );
ACKR3_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4404440444044444"
    )
        port map (
      I0 => i2c_en_r0,
      I1 => i2c_en_r1,
      I2 => mI2C_GO_reg,
      I3 => ACKR2_i_3_n_0,
      I4 => ACKR3_i_4_n_0,
      I5 => mI2C_WR_reg,
      O => ACKR34_out
    );
ACKR3_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEFFFFFEFFFFFFFE"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(4),
      I1 => \SD_COUNTER_reg__0\(1),
      I2 => \SD_COUNTER_reg__0\(2),
      I3 => \SD_COUNTER_reg__0\(5),
      I4 => \SD_COUNTER_reg__0\(3),
      I5 => \SD_COUNTER_reg__0\(0),
      O => ACKR3_i_4_n_0
    );
ACKR3_reg: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => ACKR3_i_1_n_0,
      Q => ACKR3_reg_n_0,
      R => '0'
    );
ACKW1_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFFFFFFFDFFF0000"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(3),
      I1 => I2C_SDAT,
      I2 => mI2C_WR_reg,
      I3 => mI2C_GO_reg,
      I4 => ACKW10_out,
      I5 => ACKW1_reg_n_0,
      O => ACKW1_i_1_n_0
    );
ACKW1_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4404444444044404"
    )
        port map (
      I0 => i2c_en_r0,
      I1 => i2c_en_r1,
      I2 => mI2C_GO_reg,
      I3 => ACKW2_i_3_n_0,
      I4 => ACKR1_i_3_n_0,
      I5 => mI2C_WR_reg,
      O => ACKW10_out
    );
ACKW1_reg: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => ACKW1_i_1_n_0,
      Q => ACKW1_reg_n_0,
      R => '0'
    );
ACKW2_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFFFFFFFDFFF0000"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(4),
      I1 => I2C_SDAT,
      I2 => mI2C_WR_reg,
      I3 => mI2C_GO_reg,
      I4 => ACKW22_out,
      I5 => ACKW2_reg_n_0,
      O => ACKW2_i_1_n_0
    );
ACKW2_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4404444444044404"
    )
        port map (
      I0 => i2c_en_r0,
      I1 => i2c_en_r1,
      I2 => mI2C_GO_reg,
      I3 => ACKW2_i_3_n_0,
      I4 => ACKR2_i_4_n_0,
      I5 => mI2C_WR_reg,
      O => ACKW22_out
    );
ACKW2_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000001"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(0),
      I1 => \SD_COUNTER_reg__0\(1),
      I2 => \SD_COUNTER_reg__0\(3),
      I3 => \SD_COUNTER_reg__0\(2),
      I4 => I2C_SCLK1612_in,
      I5 => mI2C_WR_reg,
      O => ACKW2_i_3_n_0
    );
ACKW2_reg: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => ACKW2_i_1_n_0,
      Q => ACKW2_reg_n_0,
      R => '0'
    );
ACKW3_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"DFFFFFFFD0F000F0"
    )
        port map (
      I0 => mI2C_WR_reg,
      I1 => ACKR3_i_2_n_0,
      I2 => \i2c_negclk__0\,
      I3 => mI2C_GO_reg,
      I4 => ACKW3_i_2_n_0,
      I5 => ACKW3_reg_n_0,
      O => ACKW3_i_1_n_0
    );
ACKW3_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BAABAAABAAAAAAAA"
    )
        port map (
      I0 => ACKW2_i_3_n_0,
      I1 => ACKW3_i_3_n_0,
      I2 => \SD_COUNTER_reg__0\(5),
      I3 => \SD_COUNTER_reg__0\(1),
      I4 => \SD_COUNTER_reg__0\(0),
      I5 => mI2C_WR_reg,
      O => ACKW3_i_2_n_0
    );
ACKW3_i_3: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(3),
      I1 => \SD_COUNTER_reg__0\(2),
      I2 => \SD_COUNTER_reg__0\(4),
      O => ACKW3_i_3_n_0
    );
ACKW3_reg: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => ACKW3_i_1_n_0,
      Q => ACKW3_reg_n_0,
      R => '0'
    );
END_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8F80"
    )
        port map (
      I0 => mI2C_GO_reg,
      I1 => \SD_COUNTER_reg__0\(5),
      I2 => END10_out,
      I3 => mI2C_END,
      O => END_i_1_n_0
    );
END_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4404440404044444"
    )
        port map (
      I0 => i2c_en_r0,
      I1 => i2c_en_r1,
      I2 => mI2C_GO_reg,
      I3 => END_i_3_n_0,
      I4 => END_i_4_n_0,
      I5 => mI2C_WR_reg,
      O => END10_out
    );
END_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0400000100000001"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(4),
      I1 => \SD_COUNTER_reg__0\(5),
      I2 => \SD_COUNTER_reg__0\(3),
      I3 => \SD_COUNTER_reg__0\(2),
      I4 => \SD_COUNTER_reg__0\(1),
      I5 => \SD_COUNTER_reg__0\(0),
      O => END_i_3_n_0
    );
END_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FBFFFFFEFFFFFFFE"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(1),
      I1 => \SD_COUNTER_reg__0\(5),
      I2 => \SD_COUNTER_reg__0\(2),
      I3 => \SD_COUNTER_reg__0\(4),
      I4 => \SD_COUNTER_reg__0\(3),
      I5 => \SD_COUNTER_reg__0\(0),
      O => END_i_4_n_0
    );
END_reg: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => END_i_1_n_0,
      Q => mI2C_END,
      R => '0'
    );
\FSM_onehot_mSetup_ST[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFEAEAEA"
    )
        port map (
      I0 => \out\(2),
      I1 => \out\(0),
      I2 => mI2C_END,
      I3 => \out\(1),
      I4 => mI2C_ACK,
      O => D(0)
    );
\FSM_onehot_mSetup_ST[0]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEFFFE00"
    )
        port map (
      I0 => ACKW1_reg_n_0,
      I1 => ACKW2_reg_n_0,
      I2 => ACKW3_reg_n_0,
      I3 => mI2C_WR_reg,
      I4 => \ACK0__1\,
      O => mI2C_ACK
    );
\FSM_onehot_mSetup_ST[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \out\(0),
      I1 => mI2C_END,
      O => D(1)
    );
\FSM_onehot_mSetup_ST[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444444444404040"
    )
        port map (
      I0 => i2c_en_r0,
      I1 => i2c_en_r1,
      I2 => \out\(2),
      I3 => mI2C_END,
      I4 => \out\(1),
      I5 => \out\(0),
      O => E(0)
    );
\FSM_onehot_mSetup_ST[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"02020202020202A2"
    )
        port map (
      I0 => \out\(1),
      I1 => \ACK0__1\,
      I2 => mI2C_WR_reg,
      I3 => ACKW3_reg_n_0,
      I4 => ACKW2_reg_n_0,
      I5 => ACKW1_reg_n_0,
      O => D(2)
    );
\FSM_onehot_mSetup_ST[2]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => ACKR1_reg_n_0,
      I1 => ACKR2_reg_n_0,
      I2 => ACKR3_reg_n_0,
      O => \ACK0__1\
    );
I2C_BIT_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"E2FFFFFFE2FF0000"
    )
        port map (
      I0 => \I2C_BIT__29\,
      I1 => mI2C_WR_reg,
      I2 => I2C_BIT_i_3_n_0,
      I3 => mI2C_GO_reg,
      I4 => I2C_BIT6_out,
      I5 => I2C_BIT_reg_n_0,
      O => I2C_BIT_i_1_n_0
    );
I2C_BIT_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => DOADO(0),
      I1 => DOADO(1),
      I2 => I2C_BIT_i_17_n_0,
      I3 => DOADO(2),
      I4 => I2C_BIT_i_18_n_0,
      I5 => DOADO(3),
      O => I2C_BIT_i_10_n_0
    );
I2C_BIT_i_11: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00800100"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(2),
      I1 => \SD_COUNTER_reg__0\(1),
      I2 => \SD_COUNTER_reg__0\(4),
      I3 => \SD_COUNTER_reg__0\(5),
      I4 => \SD_COUNTER_reg__0\(3),
      O => I2C_BIT_i_11_n_0
    );
I2C_BIT_i_13: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0404044040404040"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(5),
      I1 => \SD_COUNTER_reg__0\(4),
      I2 => \SD_COUNTER_reg__0\(2),
      I3 => \SD_COUNTER_reg__0\(3),
      I4 => \SD_COUNTER_reg__0\(0),
      I5 => \SD_COUNTER_reg__0\(1),
      O => I2C_BIT_i_13_n_0
    );
I2C_BIT_i_15: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFAEFBE"
    )
        port map (
      I0 => I2C_BIT_i_24_n_0,
      I1 => \SD_COUNTER_reg__0\(2),
      I2 => \SD_COUNTER_reg__0\(3),
      I3 => \SD_COUNTER_reg__0\(4),
      I4 => \SD_COUNTER_reg__0\(5),
      O => I2C_BIT_i_15_n_0
    );
I2C_BIT_i_16: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF3FCAC2AD55182B"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(0),
      I1 => \SD_COUNTER_reg__0\(2),
      I2 => \SD_COUNTER_reg__0\(1),
      I3 => \SD_COUNTER_reg__0\(3),
      I4 => \SD_COUNTER_reg__0\(4),
      I5 => \SD_COUNTER_reg__0\(5),
      O => I2C_BIT_i_16_n_0
    );
I2C_BIT_i_17: unisim.vcomponents.LUT6
    generic map(
      INIT => X"051317151E1E1B1A"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(3),
      I1 => \SD_COUNTER_reg__0\(4),
      I2 => \SD_COUNTER_reg__0\(5),
      I3 => \SD_COUNTER_reg__0\(2),
      I4 => \SD_COUNTER_reg__0\(0),
      I5 => \SD_COUNTER_reg__0\(1),
      O => I2C_BIT_i_17_n_0
    );
I2C_BIT_i_18: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEFFFEAB81506AB"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(4),
      I1 => \SD_COUNTER_reg__0\(1),
      I2 => \SD_COUNTER_reg__0\(2),
      I3 => \SD_COUNTER_reg__0\(3),
      I4 => \SD_COUNTER_reg__0\(0),
      I5 => \SD_COUNTER_reg__0\(5),
      O => I2C_BIT_i_18_n_0
    );
I2C_BIT_i_19: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1400400404044004"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(5),
      I1 => \SD_COUNTER_reg__0\(4),
      I2 => \SD_COUNTER_reg__0\(2),
      I3 => \SD_COUNTER_reg__0\(3),
      I4 => \SD_COUNTER_reg__0\(1),
      I5 => \SD_COUNTER_reg__0\(0),
      O => I2C_BIT_i_19_n_0
    );
I2C_BIT_i_2: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAC0AACF"
    )
        port map (
      I0 => I2C_BIT_i_5_n_0,
      I1 => I2C_BIT_i_6_n_0,
      I2 => I2C_BIT_i_7_n_0,
      I3 => I2C_BIT_i_8_n_0,
      I4 => I2C_BIT_i_9_n_0,
      O => \I2C_BIT__29\
    );
I2C_BIT_i_20: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => DOADO(8),
      I1 => DOADO(9),
      I2 => I2C_BIT_i_17_n_0,
      I3 => DOADO(10),
      I4 => I2C_BIT_i_18_n_0,
      I5 => DOADO(11),
      O => I2C_BIT_i_20_n_0
    );
I2C_BIT_i_21: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => DOADO(4),
      I1 => DOADO(5),
      I2 => I2C_BIT_i_17_n_0,
      I3 => DOADO(6),
      I4 => I2C_BIT_i_18_n_0,
      I5 => DOADO(7),
      O => I2C_BIT_i_21_n_0
    );
I2C_BIT_i_22: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFAAFF82FF198045"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(1),
      I1 => \SD_COUNTER_reg__0\(0),
      I2 => \SD_COUNTER_reg__0\(2),
      I3 => \SD_COUNTER_reg__0\(5),
      I4 => \SD_COUNTER_reg__0\(4),
      I5 => \SD_COUNTER_reg__0\(3),
      O => I2C_BIT_i_22_n_0
    );
I2C_BIT_i_23: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => DOADO(12),
      I1 => DOADO(13),
      I2 => I2C_BIT_i_17_n_0,
      I3 => DOADO(14),
      I4 => I2C_BIT_i_18_n_0,
      I5 => DOADO(15),
      O => I2C_BIT_i_23_n_0
    );
I2C_BIT_i_24: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F7BFBFF7"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(3),
      I1 => mI2C_WR_reg,
      I2 => \SD_COUNTER_reg__0\(1),
      I3 => \SD_COUNTER_reg__0\(2),
      I4 => \SD_COUNTER_reg__0\(0),
      O => I2C_BIT_i_24_n_0
    );
I2C_BIT_i_3: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => I2C_BIT_i_10_n_0,
      I1 => I2C_BIT_i_11_n_0,
      I2 => I2C_BIT_reg_i_12_n_0,
      I3 => I2C_BIT_i_13_n_0,
      I4 => I2C_BIT_reg_i_14_n_0,
      O => I2C_BIT_i_3_n_0
    );
I2C_BIT_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444440404040404"
    )
        port map (
      I0 => i2c_en_r0,
      I1 => i2c_en_r1,
      I2 => mI2C_GO_reg,
      I3 => g0_b0_n_0,
      I4 => mI2C_WR_reg,
      I5 => I2C_BIT_i_15_n_0,
      O => I2C_BIT6_out
    );
I2C_BIT_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => DOADO(8),
      I1 => DOADO(9),
      I2 => I2C_BIT_i_9_n_0,
      I3 => DOADO(10),
      I4 => I2C_BIT_i_16_n_0,
      I5 => DOADO(11),
      O => I2C_BIT_i_5_n_0
    );
I2C_BIT_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => DOADO(12),
      I1 => DOADO(13),
      I2 => I2C_BIT_i_9_n_0,
      I3 => DOADO(14),
      I4 => I2C_BIT_i_16_n_0,
      I5 => DOADO(15),
      O => I2C_BIT_i_6_n_0
    );
I2C_BIT_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1000000400040004"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(5),
      I1 => \SD_COUNTER_reg__0\(4),
      I2 => \SD_COUNTER_reg__0\(3),
      I3 => \SD_COUNTER_reg__0\(2),
      I4 => \SD_COUNTER_reg__0\(1),
      I5 => \SD_COUNTER_reg__0\(0),
      O => I2C_BIT_i_7_n_0
    );
I2C_BIT_i_8: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0010100010001000"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(5),
      I1 => \SD_COUNTER_reg__0\(3),
      I2 => \SD_COUNTER_reg__0\(4),
      I3 => \SD_COUNTER_reg__0\(2),
      I4 => \SD_COUNTER_reg__0\(0),
      I5 => \SD_COUNTER_reg__0\(1),
      O => I2C_BIT_i_8_n_0
    );
I2C_BIT_i_9: unisim.vcomponents.LUT6
    generic map(
      INIT => X"01F7FF3DF3DA6FF4"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(0),
      I1 => \SD_COUNTER_reg__0\(2),
      I2 => \SD_COUNTER_reg__0\(1),
      I3 => \SD_COUNTER_reg__0\(3),
      I4 => \SD_COUNTER_reg__0\(4),
      I5 => \SD_COUNTER_reg__0\(5),
      O => I2C_BIT_i_9_n_0
    );
I2C_BIT_reg: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => I2C_BIT_i_1_n_0,
      Q => I2C_BIT_reg_n_0,
      R => '0'
    );
I2C_BIT_reg_i_12: unisim.vcomponents.MUXF7
     port map (
      I0 => I2C_BIT_i_20_n_0,
      I1 => I2C_BIT_i_21_n_0,
      O => I2C_BIT_reg_i_12_n_0,
      S => I2C_BIT_i_19_n_0
    );
I2C_BIT_reg_i_14: unisim.vcomponents.MUXF7
     port map (
      I0 => I2C_BIT_i_22_n_0,
      I1 => I2C_BIT_i_23_n_0,
      O => I2C_BIT_reg_i_14_n_0,
      S => I2C_BIT_i_19_n_0
    );
I2C_SCLK_INST_0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F4FFF7FFB0008000"
    )
        port map (
      I0 => I2C_SCLK12,
      I1 => mI2C_WR_reg,
      I2 => mI2C_CTRL_CLK,
      I3 => mI2C_GO_reg,
      I4 => I2C_SCLK22,
      I5 => SCLK_reg_n_0,
      O => I2C_SCLK
    );
I2C_SCLK_INST_0_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"3333313112163666"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(3),
      I1 => \SD_COUNTER_reg__0\(5),
      I2 => \SD_COUNTER_reg__0\(2),
      I3 => \SD_COUNTER_reg__0\(1),
      I4 => \SD_COUNTER_reg__0\(0),
      I5 => \SD_COUNTER_reg__0\(4),
      O => I2C_SCLK12
    );
I2C_SCLK_INST_0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"540505755FFEFEAA"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(4),
      I1 => \SD_COUNTER_reg__0\(1),
      I2 => \SD_COUNTER_reg__0\(0),
      I3 => \SD_COUNTER_reg__0\(2),
      I4 => \SD_COUNTER_reg__0\(5),
      I5 => \SD_COUNTER_reg__0\(3),
      O => I2C_SCLK22
    );
I2C_SDAT_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => I2C_BIT_reg_n_0,
      I1 => SDO,
      O => I2C_SDAT
    );
I2C_SDAT_INST_0_i_1: unisim.vcomponents.MUXF7
     port map (
      I0 => I2C_SDAT_INST_0_i_2_n_0,
      I1 => I2C_SDAT_INST_0_i_3_n_0,
      O => SDO,
      S => mI2C_WR_reg
    );
I2C_SDAT_INST_0_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7DFF397F3D7D79F"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(5),
      I1 => \SD_COUNTER_reg__0\(3),
      I2 => \SD_COUNTER_reg__0\(4),
      I3 => \SD_COUNTER_reg__0\(2),
      I4 => \SD_COUNTER_reg__0\(1),
      I5 => \SD_COUNTER_reg__0\(0),
      O => I2C_SDAT_INST_0_i_2_n_0
    );
I2C_SDAT_INST_0_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFDFFFDFBDFDFBF"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(3),
      I1 => \SD_COUNTER_reg__0\(5),
      I2 => \SD_COUNTER_reg__0\(2),
      I3 => \SD_COUNTER_reg__0\(1),
      I4 => \SD_COUNTER_reg__0\(0),
      I5 => \SD_COUNTER_reg__0\(4),
      O => I2C_SDAT_INST_0_i_3_n_0
    );
SCLK_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BFBFBFFF8C8C8C0C"
    )
        port map (
      I0 => SCLK_i_2_n_0,
      I1 => \i2c_negclk__0\,
      I2 => mI2C_GO_reg,
      I3 => SCLK_i_4_n_0,
      I4 => SCLK_i_5_n_0,
      I5 => SCLK_reg_n_0,
      O => SCLK_i_1_n_0
    );
SCLK_i_10: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(3),
      I1 => \SD_COUNTER_reg__0\(4),
      O => SCLK_i_10_n_0
    );
SCLK_i_11: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1010100000001000"
    )
        port map (
      I0 => SCLK_i_12_n_0,
      I1 => mI2C_WR_reg,
      I2 => \SD_COUNTER_reg__0\(4),
      I3 => \SD_COUNTER_reg__0\(3),
      I4 => \SD_COUNTER_reg__0\(2),
      I5 => \SD_COUNTER_reg__0\(0),
      O => SCLK_i_11_n_0
    );
SCLK_i_12: unisim.vcomponents.LUT3
    generic map(
      INIT => X"57"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(1),
      I1 => \SD_COUNTER_reg__0\(3),
      I2 => \SD_COUNTER_reg__0\(5),
      O => SCLK_i_12_n_0
    );
SCLK_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFEBFFFFFFEB0000"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(3),
      I1 => \SD_COUNTER_reg__0\(1),
      I2 => \SD_COUNTER_reg__0\(2),
      I3 => \SD_COUNTER_reg__0\(4),
      I4 => mI2C_WR_reg,
      I5 => SCLK_i_6_n_0,
      O => SCLK_i_2_n_0
    );
SCLK_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => i2c_en_r1,
      I1 => i2c_en_r0,
      O => \i2c_negclk__0\
    );
SCLK_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA00000030"
    )
        port map (
      I0 => SCLK_i_7_n_0,
      I1 => \SD_COUNTER_reg__0\(2),
      I2 => SCLK_i_8_n_0,
      I3 => SCLK_i_9_n_0,
      I4 => \SD_COUNTER_reg__0\(4),
      I5 => mI2C_WR_reg,
      O => SCLK_i_4_n_0
    );
SCLK_i_5: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF0000B800"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(2),
      I1 => \SD_COUNTER_reg__0\(0),
      I2 => \SD_COUNTER_reg__0\(5),
      I3 => SCLK_i_10_n_0,
      I4 => mI2C_WR_reg,
      I5 => SCLK_i_11_n_0,
      O => SCLK_i_5_n_0
    );
SCLK_i_6: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CC08FFFF"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(0),
      I1 => \SD_COUNTER_reg__0\(3),
      I2 => \SD_COUNTER_reg__0\(2),
      I3 => \SD_COUNTER_reg__0\(5),
      I4 => \SD_COUNTER_reg__0\(1),
      O => SCLK_i_6_n_0
    );
SCLK_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"EFFEEEEE00001011"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(4),
      I1 => \SD_COUNTER_reg__0\(3),
      I2 => \SD_COUNTER_reg__0\(0),
      I3 => \SD_COUNTER_reg__0\(1),
      I4 => \SD_COUNTER_reg__0\(2),
      I5 => \SD_COUNTER_reg__0\(5),
      O => SCLK_i_7_n_0
    );
SCLK_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(0),
      I1 => \SD_COUNTER_reg__0\(1),
      O => SCLK_i_8_n_0
    );
SCLK_i_9: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(5),
      I1 => \SD_COUNTER_reg__0\(3),
      O => SCLK_i_9_n_0
    );
SCLK_reg: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => SCLK_i_1_n_0,
      Q => SCLK_reg_n_0,
      R => '0'
    );
\SD_COUNTER[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(0),
      O => SD_COUNTER0(0)
    );
\SD_COUNTER[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(0),
      I1 => \SD_COUNTER_reg__0\(1),
      O => SD_COUNTER0(1)
    );
\SD_COUNTER[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(0),
      I1 => \SD_COUNTER_reg__0\(1),
      I2 => \SD_COUNTER_reg__0\(2),
      O => SD_COUNTER0(2)
    );
\SD_COUNTER[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(1),
      I1 => \SD_COUNTER_reg__0\(0),
      I2 => \SD_COUNTER_reg__0\(2),
      I3 => \SD_COUNTER_reg__0\(3),
      O => SD_COUNTER0(3)
    );
\SD_COUNTER[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(2),
      I1 => \SD_COUNTER_reg__0\(0),
      I2 => \SD_COUNTER_reg__0\(1),
      I3 => \SD_COUNTER_reg__0\(3),
      I4 => \SD_COUNTER_reg__0\(4),
      O => SD_COUNTER0(4)
    );
\SD_COUNTER[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"4044"
    )
        port map (
      I0 => i2c_en_r0,
      I1 => i2c_en_r1,
      I2 => mI2C_END,
      I3 => mI2C_GO_reg,
      O => \SD_COUNTER[5]_i_1_n_0\
    );
\SD_COUNTER[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44404444"
    )
        port map (
      I0 => i2c_en_r0,
      I1 => i2c_en_r1,
      I2 => \SD_COUNTER[5]_i_4_n_0\,
      I3 => mI2C_END,
      I4 => mI2C_GO_reg,
      O => SD_COUNTER
    );
\SD_COUNTER[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(3),
      I1 => \SD_COUNTER_reg__0\(1),
      I2 => \SD_COUNTER_reg__0\(0),
      I3 => \SD_COUNTER_reg__0\(2),
      I4 => \SD_COUNTER_reg__0\(4),
      I5 => \SD_COUNTER_reg__0\(5),
      O => SD_COUNTER0(5)
    );
\SD_COUNTER[5]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(0),
      I1 => \SD_COUNTER_reg__0\(1),
      I2 => \SD_COUNTER_reg__0\(2),
      I3 => \SD_COUNTER_reg__0\(3),
      I4 => \SD_COUNTER_reg__0\(5),
      I5 => \SD_COUNTER_reg__0\(4),
      O => \SD_COUNTER[5]_i_4_n_0\
    );
\SD_COUNTER_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => SD_COUNTER,
      D => SD_COUNTER0(0),
      Q => \SD_COUNTER_reg__0\(0),
      R => \SD_COUNTER[5]_i_1_n_0\
    );
\SD_COUNTER_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => SD_COUNTER,
      D => SD_COUNTER0(1),
      Q => \SD_COUNTER_reg__0\(1),
      R => \SD_COUNTER[5]_i_1_n_0\
    );
\SD_COUNTER_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => SD_COUNTER,
      D => SD_COUNTER0(2),
      Q => \SD_COUNTER_reg__0\(2),
      R => \SD_COUNTER[5]_i_1_n_0\
    );
\SD_COUNTER_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => SD_COUNTER,
      D => SD_COUNTER0(3),
      Q => \SD_COUNTER_reg__0\(3),
      R => \SD_COUNTER[5]_i_1_n_0\
    );
\SD_COUNTER_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => SD_COUNTER,
      D => SD_COUNTER0(4),
      Q => \SD_COUNTER_reg__0\(4),
      R => \SD_COUNTER[5]_i_1_n_0\
    );
\SD_COUNTER_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => SD_COUNTER,
      D => SD_COUNTER0(5),
      Q => \SD_COUNTER_reg__0\(5),
      R => \SD_COUNTER[5]_i_1_n_0\
    );
g0_b0: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FEE01DFF76FFDFF7"
    )
        port map (
      I0 => \SD_COUNTER_reg__0\(0),
      I1 => \SD_COUNTER_reg__0\(1),
      I2 => \SD_COUNTER_reg__0\(2),
      I3 => \SD_COUNTER_reg__0\(3),
      I4 => \SD_COUNTER_reg__0\(4),
      I5 => \SD_COUNTER_reg__0\(5),
      O => g0_b0_n_0
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity IICctrl_0_IICctrl is
  port (
    I2C_SCLK : out STD_LOGIC;
    I2C_SDAT : inout STD_LOGIC;
    iCLK : in STD_LOGIC
  );
end IICctrl_0_IICctrl;

architecture STRUCTURE of IICctrl_0_IICctrl is
  signal \FSM_onehot_mSetup_ST[2]_i_1_n_0\ : STD_LOGIC;
  signal \FSM_onehot_mSetup_ST[2]_i_4_n_0\ : STD_LOGIC;
  signal \FSM_onehot_mSetup_ST_reg_n_0_[1]\ : STD_LOGIC;
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of \FSM_onehot_mSetup_ST_reg_n_0_[1]\ : signal is "yes";
  signal LUT_INDEX : STD_LOGIC;
  attribute RTL_KEEP of LUT_INDEX : signal is "yes";
  signal \LUT_INDEX_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal LUT_INDEX_reg_rep_i_10_n_0 : STD_LOGIC;
  signal LUT_INDEX_reg_rep_i_1_n_0 : STD_LOGIC;
  signal LUT_INDEX_reg_rep_n_15 : STD_LOGIC;
  signal clear : STD_LOGIC;
  signal data10 : STD_LOGIC;
  signal data11 : STD_LOGIC;
  signal data12 : STD_LOGIC;
  signal data13 : STD_LOGIC;
  signal data14 : STD_LOGIC;
  signal data15 : STD_LOGIC;
  signal data16 : STD_LOGIC;
  signal data17 : STD_LOGIC;
  signal data18 : STD_LOGIC;
  signal data19 : STD_LOGIC;
  signal data20 : STD_LOGIC;
  signal data21 : STD_LOGIC;
  signal data22 : STD_LOGIC;
  signal data8 : STD_LOGIC;
  signal data9 : STD_LOGIC;
  signal i2c_en_r0 : STD_LOGIC;
  signal i2c_en_r1 : STD_LOGIC;
  signal \mI2C_CLK_DIV[10]_i_3_n_0\ : STD_LOGIC;
  signal \mI2C_CLK_DIV[10]_i_4_n_0\ : STD_LOGIC;
  signal \mI2C_CLK_DIV_reg__0\ : STD_LOGIC_VECTOR ( 10 downto 1 );
  signal \mI2C_CLK_DIV_reg_n_0_[0]\ : STD_LOGIC;
  signal mI2C_CTRL_CLK : STD_LOGIC;
  signal mI2C_CTRL_CLK_i_1_n_0 : STD_LOGIC;
  signal mI2C_GO : STD_LOGIC;
  attribute RTL_KEEP of mI2C_GO : signal is "yes";
  signal mI2C_GO2_out : STD_LOGIC;
  signal mI2C_GO_reg_n_0 : STD_LOGIC;
  signal mI2C_WR : STD_LOGIC;
  signal mI2C_WR_i_2_n_0 : STD_LOGIC;
  signal mI2C_WR_reg_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \p_0_in__0\ : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal u_I2C_Controller_n_0 : STD_LOGIC;
  signal u_I2C_Controller_n_1 : STD_LOGIC;
  signal u_I2C_Controller_n_2 : STD_LOGIC;
  signal NLW_LUT_INDEX_reg_rep_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_LUT_INDEX_reg_rep_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_LUT_INDEX_reg_rep_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_onehot_mSetup_ST_reg[0]\ : label is "iSTATE:010,iSTATE0:001,iSTATE1:100";
  attribute KEEP : string;
  attribute KEEP of \FSM_onehot_mSetup_ST_reg[0]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_mSetup_ST_reg[1]\ : label is "iSTATE:010,iSTATE0:001,iSTATE1:100";
  attribute KEEP of \FSM_onehot_mSetup_ST_reg[1]\ : label is "yes";
  attribute FSM_ENCODED_STATES of \FSM_onehot_mSetup_ST_reg[2]\ : label is "iSTATE:010,iSTATE0:001,iSTATE1:100";
  attribute KEEP of \FSM_onehot_mSetup_ST_reg[2]\ : label is "yes";
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of LUT_INDEX_reg_rep : label is "p0_d16";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of LUT_INDEX_reg_rep : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of LUT_INDEX_reg_rep : label is 4096;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of LUT_INDEX_reg_rep : label is "inst/LUT_INDEX";
  attribute bram_addr_begin : integer;
  attribute bram_addr_begin of LUT_INDEX_reg_rep : label is 0;
  attribute bram_addr_end : integer;
  attribute bram_addr_end of LUT_INDEX_reg_rep : label is 1023;
  attribute bram_slice_begin : integer;
  attribute bram_slice_begin of LUT_INDEX_reg_rep : label is 0;
  attribute bram_slice_end : integer;
  attribute bram_slice_end of LUT_INDEX_reg_rep : label is 15;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \mI2C_CLK_DIV[1]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \mI2C_CLK_DIV[2]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \mI2C_CLK_DIV[3]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \mI2C_CLK_DIV[4]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \mI2C_CLK_DIV[6]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \mI2C_CLK_DIV[7]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \mI2C_CLK_DIV[8]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \mI2C_CLK_DIV[9]_i_1\ : label is "soft_lutpair10";
begin
\FSM_onehot_mSetup_ST[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40000000"
    )
        port map (
      I0 => i2c_en_r0,
      I1 => i2c_en_r1,
      I2 => \FSM_onehot_mSetup_ST[2]_i_4_n_0\,
      I3 => \LUT_INDEX_reg__0\(7),
      I4 => \LUT_INDEX_reg__0\(6),
      O => \FSM_onehot_mSetup_ST[2]_i_1_n_0\
    );
\FSM_onehot_mSetup_ST[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \LUT_INDEX_reg__0\(2),
      I1 => \LUT_INDEX_reg__0\(0),
      I2 => \LUT_INDEX_reg__0\(1),
      I3 => \LUT_INDEX_reg__0\(4),
      I4 => \LUT_INDEX_reg__0\(3),
      I5 => \LUT_INDEX_reg__0\(5),
      O => \FSM_onehot_mSetup_ST[2]_i_4_n_0\
    );
\FSM_onehot_mSetup_ST_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => iCLK,
      CE => mI2C_GO2_out,
      D => u_I2C_Controller_n_2,
      Q => mI2C_GO,
      S => \FSM_onehot_mSetup_ST[2]_i_1_n_0\
    );
\FSM_onehot_mSetup_ST_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => iCLK,
      CE => mI2C_GO2_out,
      D => u_I2C_Controller_n_1,
      Q => \FSM_onehot_mSetup_ST_reg_n_0_[1]\,
      R => \FSM_onehot_mSetup_ST[2]_i_1_n_0\
    );
\FSM_onehot_mSetup_ST_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => iCLK,
      CE => mI2C_GO2_out,
      D => u_I2C_Controller_n_0,
      Q => LUT_INDEX,
      R => \FSM_onehot_mSetup_ST[2]_i_1_n_0\
    );
\LUT_INDEX_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => LUT_INDEX_reg_rep_i_1_n_0,
      D => p_0_in(0),
      Q => \LUT_INDEX_reg__0\(0),
      R => '0'
    );
\LUT_INDEX_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => LUT_INDEX_reg_rep_i_1_n_0,
      D => p_0_in(1),
      Q => \LUT_INDEX_reg__0\(1),
      R => '0'
    );
\LUT_INDEX_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => LUT_INDEX_reg_rep_i_1_n_0,
      D => p_0_in(2),
      Q => \LUT_INDEX_reg__0\(2),
      R => '0'
    );
\LUT_INDEX_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => LUT_INDEX_reg_rep_i_1_n_0,
      D => p_0_in(3),
      Q => \LUT_INDEX_reg__0\(3),
      R => '0'
    );
\LUT_INDEX_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => LUT_INDEX_reg_rep_i_1_n_0,
      D => p_0_in(4),
      Q => \LUT_INDEX_reg__0\(4),
      R => '0'
    );
\LUT_INDEX_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => LUT_INDEX_reg_rep_i_1_n_0,
      D => p_0_in(5),
      Q => \LUT_INDEX_reg__0\(5),
      R => '0'
    );
\LUT_INDEX_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => LUT_INDEX_reg_rep_i_1_n_0,
      D => p_0_in(6),
      Q => \LUT_INDEX_reg__0\(6),
      R => '0'
    );
\LUT_INDEX_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => LUT_INDEX_reg_rep_i_1_n_0,
      D => p_0_in(7),
      Q => \LUT_INDEX_reg__0\(7),
      R => '0'
    );
LUT_INDEX_reg_rep: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"3E000C00030A1A7A19021801171332B66B001E313DC83A0440D0121400000000",
      INIT_01 => X"838F8288818080767F687E557D3C7C287B1C7A201180A2027300721171007000",
      INIT_02 => X"26A525632475AB07A50514280D001000000013E089E888D787C486AF85A38496",
      INIT_03 => X"330B29072291210216020F4B0E6113EFAA94A990A8F0A7DFA6DFA103A0689F78",
      INIT_04 => X"96009200910090008F008E008D4F741969004E204D403C78392A3871371D350B",
      INIT_05 => X"5C675B445A885988483A47284658453444F04314B80AB382B20EB10CB0849A80",
      INIT_06 => X"150013E7024001406A406F9F6E116D556C0A950894046605652064045E0E5D49",
      INIT_07 => X"4138C9F04B0977014C0076E175053F004108589E5480535E5222510050804F80",
      INIT_08 => X"C8F0790178049E3F9D4C9C039B299A849930982097309600A4893B0234115640",
      INIT_09 => X"C8C07902C8807909C820790DC80F790CC801790BC880790AC87E7910C800790F",
      INIT_0A => X"0000000000000000000000000000000000003B4209037926C8307905C8407903",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"00000",
      INIT_B => X"00000",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "PERFORMANCE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 0,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 0
    )
        port map (
      ADDRARDADDR(13 downto 12) => B"00",
      ADDRARDADDR(11 downto 4) => p_0_in(7 downto 0),
      ADDRARDADDR(3 downto 0) => B"0000",
      ADDRBWRADDR(13 downto 0) => B"11111111111111",
      CLKARDCLK => iCLK,
      CLKBWRCLK => '0',
      DIADI(15 downto 0) => B"1111111111111111",
      DIBDI(15 downto 0) => B"1111111111111111",
      DIPADIP(1 downto 0) => B"00",
      DIPBDIP(1 downto 0) => B"11",
      DOADO(15) => data8,
      DOADO(14) => data9,
      DOADO(13) => data10,
      DOADO(12) => data11,
      DOADO(11) => data12,
      DOADO(10) => data13,
      DOADO(9) => data14,
      DOADO(8) => data15,
      DOADO(7) => data16,
      DOADO(6) => data17,
      DOADO(5) => data18,
      DOADO(4) => data19,
      DOADO(3) => data20,
      DOADO(2) => data21,
      DOADO(1) => data22,
      DOADO(0) => LUT_INDEX_reg_rep_n_15,
      DOBDO(15 downto 0) => NLW_LUT_INDEX_reg_rep_DOBDO_UNCONNECTED(15 downto 0),
      DOPADOP(1 downto 0) => NLW_LUT_INDEX_reg_rep_DOPADOP_UNCONNECTED(1 downto 0),
      DOPBDOP(1 downto 0) => NLW_LUT_INDEX_reg_rep_DOPBDOP_UNCONNECTED(1 downto 0),
      ENARDEN => LUT_INDEX_reg_rep_i_1_n_0,
      ENBWREN => '0',
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      WEA(1 downto 0) => B"00",
      WEBWE(3 downto 0) => B"0000"
    );
LUT_INDEX_reg_rep_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0040404040404040"
    )
        port map (
      I0 => i2c_en_r0,
      I1 => i2c_en_r1,
      I2 => LUT_INDEX,
      I3 => \LUT_INDEX_reg__0\(6),
      I4 => \LUT_INDEX_reg__0\(7),
      I5 => \FSM_onehot_mSetup_ST[2]_i_4_n_0\,
      O => LUT_INDEX_reg_rep_i_1_n_0
    );
LUT_INDEX_reg_rep_i_10: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \LUT_INDEX_reg__0\(5),
      I1 => \LUT_INDEX_reg__0\(3),
      I2 => \LUT_INDEX_reg__0\(1),
      I3 => \LUT_INDEX_reg__0\(0),
      I4 => \LUT_INDEX_reg__0\(2),
      I5 => \LUT_INDEX_reg__0\(4),
      O => LUT_INDEX_reg_rep_i_10_n_0
    );
LUT_INDEX_reg_rep_i_2: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => LUT_INDEX_reg_rep_i_10_n_0,
      I1 => \LUT_INDEX_reg__0\(6),
      I2 => \LUT_INDEX_reg__0\(7),
      O => p_0_in(7)
    );
LUT_INDEX_reg_rep_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => LUT_INDEX_reg_rep_i_10_n_0,
      I1 => \LUT_INDEX_reg__0\(6),
      O => p_0_in(6)
    );
LUT_INDEX_reg_rep_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \LUT_INDEX_reg__0\(3),
      I1 => \LUT_INDEX_reg__0\(1),
      I2 => \LUT_INDEX_reg__0\(0),
      I3 => \LUT_INDEX_reg__0\(2),
      I4 => \LUT_INDEX_reg__0\(4),
      I5 => \LUT_INDEX_reg__0\(5),
      O => p_0_in(5)
    );
LUT_INDEX_reg_rep_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \LUT_INDEX_reg__0\(2),
      I1 => \LUT_INDEX_reg__0\(0),
      I2 => \LUT_INDEX_reg__0\(1),
      I3 => \LUT_INDEX_reg__0\(3),
      I4 => \LUT_INDEX_reg__0\(4),
      O => p_0_in(4)
    );
LUT_INDEX_reg_rep_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \LUT_INDEX_reg__0\(1),
      I1 => \LUT_INDEX_reg__0\(0),
      I2 => \LUT_INDEX_reg__0\(2),
      I3 => \LUT_INDEX_reg__0\(3),
      O => p_0_in(3)
    );
LUT_INDEX_reg_rep_i_7: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \LUT_INDEX_reg__0\(0),
      I1 => \LUT_INDEX_reg__0\(1),
      I2 => \LUT_INDEX_reg__0\(2),
      O => p_0_in(2)
    );
LUT_INDEX_reg_rep_i_8: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \LUT_INDEX_reg__0\(0),
      I1 => \LUT_INDEX_reg__0\(1),
      O => p_0_in(1)
    );
LUT_INDEX_reg_rep_i_9: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \LUT_INDEX_reg__0\(0),
      O => p_0_in(0)
    );
i2c_en_r0_reg: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => mI2C_CTRL_CLK,
      Q => i2c_en_r0,
      R => '0'
    );
i2c_en_r1_reg: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => i2c_en_r0,
      Q => i2c_en_r1,
      R => '0'
    );
\mI2C_CLK_DIV[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \mI2C_CLK_DIV_reg_n_0_[0]\,
      O => \p_0_in__0\(0)
    );
\mI2C_CLK_DIV[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAA0080"
    )
        port map (
      I0 => \mI2C_CLK_DIV_reg__0\(10),
      I1 => \mI2C_CLK_DIV_reg__0\(7),
      I2 => \mI2C_CLK_DIV_reg__0\(6),
      I3 => \mI2C_CLK_DIV[10]_i_3_n_0\,
      I4 => \mI2C_CLK_DIV_reg__0\(8),
      I5 => \mI2C_CLK_DIV_reg__0\(9),
      O => clear
    );
\mI2C_CLK_DIV[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \mI2C_CLK_DIV_reg__0\(8),
      I1 => \mI2C_CLK_DIV_reg__0\(6),
      I2 => \mI2C_CLK_DIV[10]_i_4_n_0\,
      I3 => \mI2C_CLK_DIV_reg__0\(7),
      I4 => \mI2C_CLK_DIV_reg__0\(9),
      I5 => \mI2C_CLK_DIV_reg__0\(10),
      O => \p_0_in__0\(10)
    );
\mI2C_CLK_DIV[10]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"55555557"
    )
        port map (
      I0 => \mI2C_CLK_DIV_reg__0\(5),
      I1 => \mI2C_CLK_DIV_reg__0\(2),
      I2 => \mI2C_CLK_DIV_reg__0\(1),
      I3 => \mI2C_CLK_DIV_reg__0\(3),
      I4 => \mI2C_CLK_DIV_reg__0\(4),
      O => \mI2C_CLK_DIV[10]_i_3_n_0\
    );
\mI2C_CLK_DIV[10]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"8000000000000000"
    )
        port map (
      I0 => \mI2C_CLK_DIV_reg__0\(5),
      I1 => \mI2C_CLK_DIV_reg__0\(3),
      I2 => \mI2C_CLK_DIV_reg__0\(1),
      I3 => \mI2C_CLK_DIV_reg_n_0_[0]\,
      I4 => \mI2C_CLK_DIV_reg__0\(2),
      I5 => \mI2C_CLK_DIV_reg__0\(4),
      O => \mI2C_CLK_DIV[10]_i_4_n_0\
    );
\mI2C_CLK_DIV[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \mI2C_CLK_DIV_reg_n_0_[0]\,
      I1 => \mI2C_CLK_DIV_reg__0\(1),
      O => \p_0_in__0\(1)
    );
\mI2C_CLK_DIV[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \mI2C_CLK_DIV_reg_n_0_[0]\,
      I1 => \mI2C_CLK_DIV_reg__0\(1),
      I2 => \mI2C_CLK_DIV_reg__0\(2),
      O => \p_0_in__0\(2)
    );
\mI2C_CLK_DIV[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \mI2C_CLK_DIV_reg__0\(1),
      I1 => \mI2C_CLK_DIV_reg_n_0_[0]\,
      I2 => \mI2C_CLK_DIV_reg__0\(2),
      I3 => \mI2C_CLK_DIV_reg__0\(3),
      O => \p_0_in__0\(3)
    );
\mI2C_CLK_DIV[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \mI2C_CLK_DIV_reg__0\(2),
      I1 => \mI2C_CLK_DIV_reg_n_0_[0]\,
      I2 => \mI2C_CLK_DIV_reg__0\(1),
      I3 => \mI2C_CLK_DIV_reg__0\(3),
      I4 => \mI2C_CLK_DIV_reg__0\(4),
      O => \p_0_in__0\(4)
    );
\mI2C_CLK_DIV[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \mI2C_CLK_DIV_reg__0\(3),
      I1 => \mI2C_CLK_DIV_reg__0\(1),
      I2 => \mI2C_CLK_DIV_reg_n_0_[0]\,
      I3 => \mI2C_CLK_DIV_reg__0\(2),
      I4 => \mI2C_CLK_DIV_reg__0\(4),
      I5 => \mI2C_CLK_DIV_reg__0\(5),
      O => \p_0_in__0\(5)
    );
\mI2C_CLK_DIV[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \mI2C_CLK_DIV[10]_i_4_n_0\,
      I1 => \mI2C_CLK_DIV_reg__0\(6),
      O => \p_0_in__0\(6)
    );
\mI2C_CLK_DIV[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \mI2C_CLK_DIV[10]_i_4_n_0\,
      I1 => \mI2C_CLK_DIV_reg__0\(6),
      I2 => \mI2C_CLK_DIV_reg__0\(7),
      O => \p_0_in__0\(7)
    );
\mI2C_CLK_DIV[8]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \mI2C_CLK_DIV_reg__0\(6),
      I1 => \mI2C_CLK_DIV[10]_i_4_n_0\,
      I2 => \mI2C_CLK_DIV_reg__0\(7),
      I3 => \mI2C_CLK_DIV_reg__0\(8),
      O => \p_0_in__0\(8)
    );
\mI2C_CLK_DIV[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \mI2C_CLK_DIV_reg__0\(7),
      I1 => \mI2C_CLK_DIV[10]_i_4_n_0\,
      I2 => \mI2C_CLK_DIV_reg__0\(6),
      I3 => \mI2C_CLK_DIV_reg__0\(8),
      I4 => \mI2C_CLK_DIV_reg__0\(9),
      O => \p_0_in__0\(9)
    );
\mI2C_CLK_DIV_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => \p_0_in__0\(0),
      Q => \mI2C_CLK_DIV_reg_n_0_[0]\,
      R => clear
    );
\mI2C_CLK_DIV_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => \p_0_in__0\(10),
      Q => \mI2C_CLK_DIV_reg__0\(10),
      R => clear
    );
\mI2C_CLK_DIV_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => \p_0_in__0\(1),
      Q => \mI2C_CLK_DIV_reg__0\(1),
      R => clear
    );
\mI2C_CLK_DIV_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => \p_0_in__0\(2),
      Q => \mI2C_CLK_DIV_reg__0\(2),
      R => clear
    );
\mI2C_CLK_DIV_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => \p_0_in__0\(3),
      Q => \mI2C_CLK_DIV_reg__0\(3),
      R => clear
    );
\mI2C_CLK_DIV_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => \p_0_in__0\(4),
      Q => \mI2C_CLK_DIV_reg__0\(4),
      R => clear
    );
\mI2C_CLK_DIV_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => \p_0_in__0\(5),
      Q => \mI2C_CLK_DIV_reg__0\(5),
      R => clear
    );
\mI2C_CLK_DIV_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => \p_0_in__0\(6),
      Q => \mI2C_CLK_DIV_reg__0\(6),
      R => clear
    );
\mI2C_CLK_DIV_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => \p_0_in__0\(7),
      Q => \mI2C_CLK_DIV_reg__0\(7),
      R => clear
    );
\mI2C_CLK_DIV_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => \p_0_in__0\(8),
      Q => \mI2C_CLK_DIV_reg__0\(8),
      R => clear
    );
\mI2C_CLK_DIV_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => \p_0_in__0\(9),
      Q => \mI2C_CLK_DIV_reg__0\(9),
      R => clear
    );
mI2C_CTRL_CLK_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => clear,
      I1 => mI2C_CTRL_CLK,
      O => mI2C_CTRL_CLK_i_1_n_0
    );
mI2C_CTRL_CLK_reg: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => '1',
      D => mI2C_CTRL_CLK_i_1_n_0,
      Q => mI2C_CTRL_CLK,
      R => '0'
    );
mI2C_GO_reg: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => mI2C_GO2_out,
      D => mI2C_GO,
      Q => mI2C_GO_reg_n_0,
      R => \FSM_onehot_mSetup_ST[2]_i_1_n_0\
    );
mI2C_WR_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAAAAA8"
    )
        port map (
      I0 => mI2C_GO,
      I1 => mI2C_WR_i_2_n_0,
      I2 => \LUT_INDEX_reg__0\(6),
      I3 => \LUT_INDEX_reg__0\(5),
      I4 => \LUT_INDEX_reg__0\(7),
      O => mI2C_WR
    );
mI2C_WR_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \LUT_INDEX_reg__0\(3),
      I1 => \LUT_INDEX_reg__0\(4),
      I2 => \LUT_INDEX_reg__0\(1),
      I3 => \LUT_INDEX_reg__0\(2),
      O => mI2C_WR_i_2_n_0
    );
mI2C_WR_reg: unisim.vcomponents.FDRE
     port map (
      C => iCLK,
      CE => mI2C_GO2_out,
      D => mI2C_WR,
      Q => mI2C_WR_reg_n_0,
      R => \FSM_onehot_mSetup_ST[2]_i_1_n_0\
    );
u_I2C_Controller: entity work.IICctrl_0_I2C_Controller
     port map (
      D(2) => u_I2C_Controller_n_0,
      D(1) => u_I2C_Controller_n_1,
      D(0) => u_I2C_Controller_n_2,
      DOADO(15) => data8,
      DOADO(14) => data9,
      DOADO(13) => data10,
      DOADO(12) => data11,
      DOADO(11) => data12,
      DOADO(10) => data13,
      DOADO(9) => data14,
      DOADO(8) => data15,
      DOADO(7) => data16,
      DOADO(6) => data17,
      DOADO(5) => data18,
      DOADO(4) => data19,
      DOADO(3) => data20,
      DOADO(2) => data21,
      DOADO(1) => data22,
      DOADO(0) => LUT_INDEX_reg_rep_n_15,
      E(0) => mI2C_GO2_out,
      I2C_SCLK => I2C_SCLK,
      I2C_SDAT => I2C_SDAT,
      i2c_en_r0 => i2c_en_r0,
      i2c_en_r1 => i2c_en_r1,
      iCLK => iCLK,
      mI2C_CTRL_CLK => mI2C_CTRL_CLK,
      mI2C_GO_reg => mI2C_GO_reg_n_0,
      mI2C_WR_reg => mI2C_WR_reg_n_0,
      \out\(2) => LUT_INDEX,
      \out\(1) => \FSM_onehot_mSetup_ST_reg_n_0_[1]\,
      \out\(0) => mI2C_GO
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity IICctrl_0 is
  port (
    iCLK : in STD_LOGIC;
    I2C_SCLK : out STD_LOGIC;
    I2C_SDAT : inout STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of IICctrl_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of IICctrl_0 : entity is "IICctrl_0,IICctrl,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of IICctrl_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of IICctrl_0 : entity is "IICctrl,Vivado 2017.1";
end IICctrl_0;

architecture STRUCTURE of IICctrl_0 is
begin
inst: entity work.IICctrl_0_IICctrl
     port map (
      I2C_SCLK => I2C_SCLK,
      I2C_SDAT => I2C_SDAT,
      iCLK => iCLK
    );
end STRUCTURE;
