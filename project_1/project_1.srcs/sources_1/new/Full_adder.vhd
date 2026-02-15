----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.02.2026 09:36:59
-- Design Name: 
-- Module Name: Full_adder - Behavioral
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

entity Full_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S : out STD_LOGIC);
end Full_adder;

architecture Structural of Full_adder is

component Half_adder is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S : out STD_LOGIC);
end component;

signal Carry_HA1, Carry_HA2,S1: std_logic;

begin

C_out <= Carry_HA1 or Carry_HA2;

U1: Half_adder port map(A => A, B => B, C_out => Carry_HA1,S => S1 );
U2: Half_adder port map(A => S1, B => C_in, S => S, C_out => Carry_HA2);

end Structural;
