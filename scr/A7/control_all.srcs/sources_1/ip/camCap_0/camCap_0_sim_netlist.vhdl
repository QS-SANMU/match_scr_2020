-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Sat Oct 24 14:17:30 2020
-- Host        : DESKTOP-6EMR18T running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim -rename_top camCap_0 -prefix
--               camCap_0_ camCap_0_sim_netlist.vhdl
-- Design      : camCap_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a35tcpg236-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity camCap_0_camCap is
  port (
    Q : out STD_LOGIC_VECTOR ( 16 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    we : out STD_LOGIC;
    vsync : in STD_LOGIC;
    pclk : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 7 downto 0 );
    href : in STD_LOGIC
  );
end camCap_0_camCap;

architecture STRUCTURE of camCap_0_camCap is
  signal \^q\ : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal \address[10]_i_1_n_0\ : STD_LOGIC;
  signal \address[11]_i_1_n_0\ : STD_LOGIC;
  signal \address[13]_i_1_n_0\ : STD_LOGIC;
  signal \address[15]_i_1_n_0\ : STD_LOGIC;
  signal \address[16]_i_1_n_0\ : STD_LOGIC;
  signal \address[16]_i_2_n_0\ : STD_LOGIC;
  signal \address_next[0]_i_2_n_0\ : STD_LOGIC;
  signal address_next_reg : STD_LOGIC_VECTOR ( 16 downto 0 );
  signal \address_next_reg[0]_i_1_n_0\ : STD_LOGIC;
  signal \address_next_reg[0]_i_1_n_1\ : STD_LOGIC;
  signal \address_next_reg[0]_i_1_n_2\ : STD_LOGIC;
  signal \address_next_reg[0]_i_1_n_3\ : STD_LOGIC;
  signal \address_next_reg[0]_i_1_n_4\ : STD_LOGIC;
  signal \address_next_reg[0]_i_1_n_5\ : STD_LOGIC;
  signal \address_next_reg[0]_i_1_n_6\ : STD_LOGIC;
  signal \address_next_reg[0]_i_1_n_7\ : STD_LOGIC;
  signal \address_next_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \address_next_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \address_next_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \address_next_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \address_next_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \address_next_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \address_next_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \address_next_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \address_next_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \address_next_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \address_next_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \address_next_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \address_next_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \address_next_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \address_next_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \address_next_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \address_next_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \address_next_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \address_next_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \address_next_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \address_next_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \address_next_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \address_next_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \address_next_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \address_next_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal d_latch : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal \dout[15]_i_1_n_0\ : STD_LOGIC;
  signal p_0_in1_in : STD_LOGIC;
  signal p_1_out : STD_LOGIC_VECTOR ( 0 to 0 );
  signal we_i_1_n_0 : STD_LOGIC;
  signal \wr_hold_reg_n_0_[0]\ : STD_LOGIC;
  signal \NLW_address_next_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_address_next_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
begin
  Q(16 downto 0) <= \^q\(16 downto 0);
\address[10]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEEEEEEE"
    )
        port map (
      I0 => address_next_reg(10),
      I1 => \address[16]_i_2_n_0\,
      I2 => \^q\(13),
      I3 => \^q\(16),
      I4 => \^q\(12),
      O => \address[10]_i_1_n_0\
    );
\address[11]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEEEEEEE"
    )
        port map (
      I0 => address_next_reg(11),
      I1 => \address[16]_i_2_n_0\,
      I2 => \^q\(13),
      I3 => \^q\(16),
      I4 => \^q\(12),
      O => \address[11]_i_1_n_0\
    );
\address[13]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEEEEEEE"
    )
        port map (
      I0 => address_next_reg(13),
      I1 => \address[16]_i_2_n_0\,
      I2 => \^q\(13),
      I3 => \^q\(16),
      I4 => \^q\(12),
      O => \address[13]_i_1_n_0\
    );
\address[15]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEEEEEEE"
    )
        port map (
      I0 => vsync,
      I1 => \address[16]_i_2_n_0\,
      I2 => \^q\(13),
      I3 => \^q\(16),
      I4 => \^q\(12),
      O => \address[15]_i_1_n_0\
    );
\address[16]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FEEEEEEE"
    )
        port map (
      I0 => address_next_reg(16),
      I1 => \address[16]_i_2_n_0\,
      I2 => \^q\(13),
      I3 => \^q\(16),
      I4 => \^q\(12),
      O => \address[16]_i_1_n_0\
    );
\address[16]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF8000000000"
    )
        port map (
      I0 => \^q\(13),
      I1 => \^q\(10),
      I2 => \^q\(11),
      I3 => \^q\(15),
      I4 => \^q\(14),
      I5 => \^q\(16),
      O => \address[16]_i_2_n_0\
    );
\address_next[0]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => address_next_reg(0),
      O => \address_next[0]_i_2_n_0\
    );
\address_next_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => p_0_in1_in,
      D => \address_next_reg[0]_i_1_n_7\,
      Q => address_next_reg(0),
      R => vsync
    );
\address_next_reg[0]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \address_next_reg[0]_i_1_n_0\,
      CO(2) => \address_next_reg[0]_i_1_n_1\,
      CO(1) => \address_next_reg[0]_i_1_n_2\,
      CO(0) => \address_next_reg[0]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0001",
      O(3) => \address_next_reg[0]_i_1_n_4\,
      O(2) => \address_next_reg[0]_i_1_n_5\,
      O(1) => \address_next_reg[0]_i_1_n_6\,
      O(0) => \address_next_reg[0]_i_1_n_7\,
      S(3 downto 1) => address_next_reg(3 downto 1),
      S(0) => \address_next[0]_i_2_n_0\
    );
\address_next_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => p_0_in1_in,
      D => \address_next_reg[8]_i_1_n_5\,
      Q => address_next_reg(10),
      R => vsync
    );
\address_next_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => p_0_in1_in,
      D => \address_next_reg[8]_i_1_n_4\,
      Q => address_next_reg(11),
      R => vsync
    );
\address_next_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => p_0_in1_in,
      D => \address_next_reg[12]_i_1_n_7\,
      Q => address_next_reg(12),
      R => vsync
    );
\address_next_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \address_next_reg[8]_i_1_n_0\,
      CO(3) => \address_next_reg[12]_i_1_n_0\,
      CO(2) => \address_next_reg[12]_i_1_n_1\,
      CO(1) => \address_next_reg[12]_i_1_n_2\,
      CO(0) => \address_next_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \address_next_reg[12]_i_1_n_4\,
      O(2) => \address_next_reg[12]_i_1_n_5\,
      O(1) => \address_next_reg[12]_i_1_n_6\,
      O(0) => \address_next_reg[12]_i_1_n_7\,
      S(3 downto 0) => address_next_reg(15 downto 12)
    );
\address_next_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => p_0_in1_in,
      D => \address_next_reg[12]_i_1_n_6\,
      Q => address_next_reg(13),
      R => vsync
    );
\address_next_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => p_0_in1_in,
      D => \address_next_reg[12]_i_1_n_5\,
      Q => address_next_reg(14),
      R => vsync
    );
\address_next_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => p_0_in1_in,
      D => \address_next_reg[12]_i_1_n_4\,
      Q => address_next_reg(15),
      R => vsync
    );
\address_next_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => p_0_in1_in,
      D => \address_next_reg[16]_i_1_n_7\,
      Q => address_next_reg(16),
      R => vsync
    );
\address_next_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \address_next_reg[12]_i_1_n_0\,
      CO(3 downto 0) => \NLW_address_next_reg[16]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 1) => \NLW_address_next_reg[16]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \address_next_reg[16]_i_1_n_7\,
      S(3 downto 1) => B"000",
      S(0) => address_next_reg(16)
    );
\address_next_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => p_0_in1_in,
      D => \address_next_reg[0]_i_1_n_6\,
      Q => address_next_reg(1),
      R => vsync
    );
\address_next_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => p_0_in1_in,
      D => \address_next_reg[0]_i_1_n_5\,
      Q => address_next_reg(2),
      R => vsync
    );
\address_next_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => p_0_in1_in,
      D => \address_next_reg[0]_i_1_n_4\,
      Q => address_next_reg(3),
      R => vsync
    );
\address_next_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => p_0_in1_in,
      D => \address_next_reg[4]_i_1_n_7\,
      Q => address_next_reg(4),
      R => vsync
    );
\address_next_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \address_next_reg[0]_i_1_n_0\,
      CO(3) => \address_next_reg[4]_i_1_n_0\,
      CO(2) => \address_next_reg[4]_i_1_n_1\,
      CO(1) => \address_next_reg[4]_i_1_n_2\,
      CO(0) => \address_next_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \address_next_reg[4]_i_1_n_4\,
      O(2) => \address_next_reg[4]_i_1_n_5\,
      O(1) => \address_next_reg[4]_i_1_n_6\,
      O(0) => \address_next_reg[4]_i_1_n_7\,
      S(3 downto 0) => address_next_reg(7 downto 4)
    );
\address_next_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => p_0_in1_in,
      D => \address_next_reg[4]_i_1_n_6\,
      Q => address_next_reg(5),
      R => vsync
    );
\address_next_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => p_0_in1_in,
      D => \address_next_reg[4]_i_1_n_5\,
      Q => address_next_reg(6),
      R => vsync
    );
\address_next_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => p_0_in1_in,
      D => \address_next_reg[4]_i_1_n_4\,
      Q => address_next_reg(7),
      R => vsync
    );
\address_next_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => p_0_in1_in,
      D => \address_next_reg[8]_i_1_n_7\,
      Q => address_next_reg(8),
      R => vsync
    );
\address_next_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \address_next_reg[4]_i_1_n_0\,
      CO(3) => \address_next_reg[8]_i_1_n_0\,
      CO(2) => \address_next_reg[8]_i_1_n_1\,
      CO(1) => \address_next_reg[8]_i_1_n_2\,
      CO(0) => \address_next_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \address_next_reg[8]_i_1_n_4\,
      O(2) => \address_next_reg[8]_i_1_n_5\,
      O(1) => \address_next_reg[8]_i_1_n_6\,
      O(0) => \address_next_reg[8]_i_1_n_7\,
      S(3 downto 0) => address_next_reg(11 downto 8)
    );
\address_next_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => p_0_in1_in,
      D => \address_next_reg[8]_i_1_n_6\,
      Q => address_next_reg(9),
      R => vsync
    );
\address_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => address_next_reg(0),
      Q => \^q\(0),
      R => \address[15]_i_1_n_0\
    );
\address_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => \address[10]_i_1_n_0\,
      Q => \^q\(10),
      R => vsync
    );
\address_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => \address[11]_i_1_n_0\,
      Q => \^q\(11),
      R => vsync
    );
\address_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => address_next_reg(12),
      Q => \^q\(12),
      R => \address[15]_i_1_n_0\
    );
\address_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => \address[13]_i_1_n_0\,
      Q => \^q\(13),
      R => vsync
    );
\address_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => address_next_reg(14),
      Q => \^q\(14),
      R => \address[15]_i_1_n_0\
    );
\address_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => address_next_reg(15),
      Q => \^q\(15),
      R => \address[15]_i_1_n_0\
    );
\address_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => \address[16]_i_1_n_0\,
      Q => \^q\(16),
      R => vsync
    );
\address_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => address_next_reg(1),
      Q => \^q\(1),
      R => \address[15]_i_1_n_0\
    );
\address_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => address_next_reg(2),
      Q => \^q\(2),
      R => \address[15]_i_1_n_0\
    );
\address_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => address_next_reg(3),
      Q => \^q\(3),
      R => \address[15]_i_1_n_0\
    );
\address_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => address_next_reg(4),
      Q => \^q\(4),
      R => \address[15]_i_1_n_0\
    );
\address_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => address_next_reg(5),
      Q => \^q\(5),
      R => \address[15]_i_1_n_0\
    );
\address_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => address_next_reg(6),
      Q => \^q\(6),
      R => \address[15]_i_1_n_0\
    );
\address_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => address_next_reg(7),
      Q => \^q\(7),
      R => \address[15]_i_1_n_0\
    );
\address_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => address_next_reg(8),
      Q => \^q\(8),
      R => \address[15]_i_1_n_0\
    );
\address_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => address_next_reg(9),
      Q => \^q\(9),
      R => \address[15]_i_1_n_0\
    );
\d_latch_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => we_i_1_n_0,
      D => d(0),
      Q => d_latch(0),
      R => '0'
    );
\d_latch_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => we_i_1_n_0,
      D => d_latch(2),
      Q => d_latch(10),
      R => '0'
    );
\d_latch_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => we_i_1_n_0,
      D => d_latch(3),
      Q => d_latch(11),
      R => '0'
    );
\d_latch_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => we_i_1_n_0,
      D => d_latch(4),
      Q => d_latch(12),
      R => '0'
    );
\d_latch_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => we_i_1_n_0,
      D => d_latch(5),
      Q => d_latch(13),
      R => '0'
    );
\d_latch_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => we_i_1_n_0,
      D => d_latch(6),
      Q => d_latch(14),
      R => '0'
    );
\d_latch_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => we_i_1_n_0,
      D => d_latch(7),
      Q => d_latch(15),
      R => '0'
    );
\d_latch_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => we_i_1_n_0,
      D => d(1),
      Q => d_latch(1),
      R => '0'
    );
\d_latch_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => we_i_1_n_0,
      D => d(2),
      Q => d_latch(2),
      R => '0'
    );
\d_latch_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => we_i_1_n_0,
      D => d(3),
      Q => d_latch(3),
      R => '0'
    );
\d_latch_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => we_i_1_n_0,
      D => d(4),
      Q => d_latch(4),
      R => '0'
    );
\d_latch_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => we_i_1_n_0,
      D => d(5),
      Q => d_latch(5),
      R => '0'
    );
\d_latch_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => we_i_1_n_0,
      D => d(6),
      Q => d_latch(6),
      R => '0'
    );
\d_latch_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => we_i_1_n_0,
      D => d(7),
      Q => d_latch(7),
      R => '0'
    );
\d_latch_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => we_i_1_n_0,
      D => d_latch(0),
      Q => d_latch(8),
      R => '0'
    );
\d_latch_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => we_i_1_n_0,
      D => d_latch(1),
      Q => d_latch(9),
      R => '0'
    );
\dout[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => p_0_in1_in,
      I1 => vsync,
      O => \dout[15]_i_1_n_0\
    );
\dout_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => pclk,
      CE => \dout[15]_i_1_n_0\,
      D => d_latch(0),
      Q => dout(0),
      R => '0'
    );
\dout_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => pclk,
      CE => \dout[15]_i_1_n_0\,
      D => d_latch(10),
      Q => dout(10),
      R => '0'
    );
\dout_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => pclk,
      CE => \dout[15]_i_1_n_0\,
      D => d_latch(11),
      Q => dout(11),
      R => '0'
    );
\dout_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => pclk,
      CE => \dout[15]_i_1_n_0\,
      D => d_latch(12),
      Q => dout(12),
      R => '0'
    );
\dout_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => pclk,
      CE => \dout[15]_i_1_n_0\,
      D => d_latch(13),
      Q => dout(13),
      R => '0'
    );
\dout_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => pclk,
      CE => \dout[15]_i_1_n_0\,
      D => d_latch(14),
      Q => dout(14),
      R => '0'
    );
\dout_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => pclk,
      CE => \dout[15]_i_1_n_0\,
      D => d_latch(15),
      Q => dout(15),
      R => '0'
    );
\dout_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => pclk,
      CE => \dout[15]_i_1_n_0\,
      D => d_latch(1),
      Q => dout(1),
      R => '0'
    );
\dout_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => pclk,
      CE => \dout[15]_i_1_n_0\,
      D => d_latch(2),
      Q => dout(2),
      R => '0'
    );
\dout_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => pclk,
      CE => \dout[15]_i_1_n_0\,
      D => d_latch(3),
      Q => dout(3),
      R => '0'
    );
\dout_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => pclk,
      CE => \dout[15]_i_1_n_0\,
      D => d_latch(4),
      Q => dout(4),
      R => '0'
    );
\dout_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => pclk,
      CE => \dout[15]_i_1_n_0\,
      D => d_latch(5),
      Q => dout(5),
      R => '0'
    );
\dout_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => pclk,
      CE => \dout[15]_i_1_n_0\,
      D => d_latch(6),
      Q => dout(6),
      R => '0'
    );
\dout_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => pclk,
      CE => \dout[15]_i_1_n_0\,
      D => d_latch(7),
      Q => dout(7),
      R => '0'
    );
\dout_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => pclk,
      CE => \dout[15]_i_1_n_0\,
      D => d_latch(8),
      Q => dout(8),
      R => '0'
    );
\dout_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => pclk,
      CE => \dout[15]_i_1_n_0\,
      D => d_latch(9),
      Q => dout(9),
      R => '0'
    );
we_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => vsync,
      O => we_i_1_n_0
    );
we_reg: unisim.vcomponents.FDRE
     port map (
      C => pclk,
      CE => we_i_1_n_0,
      D => p_0_in1_in,
      Q => we,
      R => '0'
    );
\wr_hold[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => href,
      I1 => \wr_hold_reg_n_0_[0]\,
      O => p_1_out(0)
    );
\wr_hold_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => p_1_out(0),
      Q => \wr_hold_reg_n_0_[0]\,
      R => vsync
    );
\wr_hold_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => pclk,
      CE => '1',
      D => \wr_hold_reg_n_0_[0]\,
      Q => p_0_in1_in,
      R => vsync
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity camCap_0 is
  port (
    pclk : in STD_LOGIC;
    vsync : in STD_LOGIC;
    href : in STD_LOGIC;
    d : in STD_LOGIC_VECTOR ( 7 downto 0 );
    addr : out STD_LOGIC_VECTOR ( 16 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 15 downto 0 );
    we : out STD_LOGIC;
    wclk : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of camCap_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of camCap_0 : entity is "camCap_0,camCap,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of camCap_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of camCap_0 : entity is "camCap,Vivado 2017.1";
end camCap_0;

architecture STRUCTURE of camCap_0 is
  signal \^pclk\ : STD_LOGIC;
begin
  \^pclk\ <= pclk;
  wclk <= \^pclk\;
inst: entity work.camCap_0_camCap
     port map (
      Q(16 downto 0) => addr(16 downto 0),
      d(7 downto 0) => d(7 downto 0),
      dout(15 downto 0) => dout(15 downto 0),
      href => href,
      pclk => \^pclk\,
      vsync => vsync,
      we => we
    );
end STRUCTURE;
