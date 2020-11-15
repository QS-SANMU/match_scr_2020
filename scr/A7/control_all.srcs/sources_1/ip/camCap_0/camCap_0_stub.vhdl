-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Sat Oct 24 14:17:21 2020
-- Host        : DESKTOP-6EMR18T running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top camCap_0 -prefix
--               camCap_0_ camCap_0_stub.vhdl
-- Design      : camCap_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity camCap_0 is
  Port ( 
    pclk : in STD_LOGIC;
    vsync : in STD_LOGIC;
    href : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 7 downto 0 );
    addr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    we : out STD_LOGIC;
    wclk : out STD_LOGIC
  );

end camCap_0;

architecture stub of camCap_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "pclk,vsync,href,d[7:0],addr[16:0],dout[15:0],we,wclk";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "camCap,Vivado 2017.1";
begin
end;
