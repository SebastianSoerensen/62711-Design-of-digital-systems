----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.02.2026 11:06:11
-- Design Name: 
-- Module Name: Decoder_2to4_Enable - Behavioral
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

entity Decoder_2to4_Enable is
    Port ( EN : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR (1 downto 0);
           D : out STD_LOGIC_VECTOR (3 downto 0));
end Decoder_2to4_Enable;

architecture Behavioral of Decoder_2to4_Enable is
component Decoder_2to4 is
    Port ( S : in STD_LOGIC_VECTOR (1 downto 0);
           D : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal D_out: std_logic_vector(3 downto 0);

begin
D(0) <= EN and D_out(0);
D(1) <= EN and D_out(1);
D(2) <= EN and D_out(2);
D(3) <= EN and D_out(3);

U1: Decoder_2to4 port map (S => S, D => D_out);


end Behavioral;
