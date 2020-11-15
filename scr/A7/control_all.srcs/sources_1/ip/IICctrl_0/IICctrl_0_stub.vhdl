-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Sat Oct 24 14:17:21 2020
-- Host        : DESKTOP-6EMR18T running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top IICctrl_0 -prefix
--               IICctrl_0_ IICctrl_0_stub.vhdl
-- Design      : IICctrl_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IICctrl_0 is
  Port ( 
    iCLK : in STD_LOGIC;
    I2C_SCLK : out STD_LOGIC;
    I2C_SDAT : inout STD_LOGIC
  );

end IICctrl_0;

architecture stub of IICctrl_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "iCLK,I2C_SCLK,I2C_SDAT";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "IICctrl,Vivado 2017.1";
begin
end;
