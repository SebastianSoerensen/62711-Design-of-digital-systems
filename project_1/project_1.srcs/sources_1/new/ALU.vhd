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
signal Plus_One: std_logic; -- C_in of first full adder
signal Decoder_EN: std_logic;
signal Function_EN: std_logic_vector(15 downto 0);
signal EN: std_logic_vector(3 downto 0);
begin

Decoder_EN <= '1';

ARITH: entity work.Arith_Circ port map(C_in => Plus_One , S => , A => , B => , G => , C_out => C , Overflow => V);


Decoder_FS: entity work.Decoder_2to4_Enable port map(EN => Decoder_EN, S => J_Select(1 downto 0),D => EN );
GEN_DEC : for i in 0 to 3 generate
    DEC: entity work.Decoder_2to4_Enable port map(EN => EN(i) , S => J_Select(3 downto 2), D => Function_EN(4*i+3 downto 4*i));
end generate;

end Behavioral;
