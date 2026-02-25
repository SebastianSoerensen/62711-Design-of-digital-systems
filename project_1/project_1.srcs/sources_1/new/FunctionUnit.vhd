----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.02.2026 16:11:56
-- Design Name: 
-- Module Name: FunctionUnit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FunctionUnit is
    Port ( A,B : in STD_LOGIC_VECTOR (7 downto 0);
           FS3,FS2,FS1,FS0 : in STD_LOGIC;
           V,C,N,Z : out STD_LOGIC;
           F : out STD_LOGIC_VECTOR (7 downto 0));
end FunctionUnit;

architecture Behavioral of FunctionUnit is

signal J_out,H_out,MUXF_sig: std_logic_vector(7 downto 0);
signal Fsel: std_logic;

begin

ALU: entity work.ALU port map(J_Select(0) => FS0, J_Select(1) => FS1, J_Select(2) => FS2,J_Select(3) => FS3,A => A, B => B,V => V, C => C,J => J_out);
SHIFT: entity work.Shifter port map(B => B,H => H_out,H_Select(0) => FS0, H_Select(1) => FS1);
MUXF: entity work.MUX2x1x8 port map(R => J_out, S => H_out, MUX_Select => Fsel, Y => MUXF_sig);
FS: entity work.FunctionSelect port map(FS3 => FS3, FS2 => FS2, MF => Fsel);
NegZ: entity work.NegZero port map(MUXF => MUXF_sig, N => N, Z => Z);

F <= MUXF_sig;
end Behavioral;
