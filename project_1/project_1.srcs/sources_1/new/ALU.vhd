----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.02.2026 16:11:56
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( A,B : in STD_LOGIC_VECTOR (7 downto 0);
           J_Select : in STD_LOGIC_VECTOR (3 downto 0);
           V,C : out STD_LOGIC;
           J : out STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is

signal Y: std_logic_vector(7 downto 0);
signal C_in: std_logic_vector(8 downto 0);

begin
C_in(0) <= '0'; -- No C_in for first Fulladder
GEN_LOGIC: for i in 0 to 3 generate
    Y(i) <= (not B(i) and J_Select(1)) or (B(i) and J_Select(0)); -- First 4 bits for J_Select(0) and J_Select(1)
    Y(i+4) <= (not B(i+4) and J_Select(3)) or (B(i+4) and J_Select(2)); -- Last 4 bits for J_Select(2) and J_Select(3) indexed from 
end generate;
GEN_FA: for i in 0 to 7 generate
    FA : entity work.Full_adder port map(A => A(i), B => Y(i), C_in => C_in(i), S => J(i), C_out => C_in(i+1));
end generate;
C <= C_in(8); -- Carry out
V <= C_in(7) xor C_in(8); -- Overflow detection
end Behavioral;
