----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.02.2026 10:42:53
-- Design Name: 
-- Module Name: 4_to_1_MUX - Behavioral
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

entity MUX_4to1 is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           S : in std_logic_vector(1 downto 0);
           Y : out STD_LOGIC);
end MUX_4to1;

architecture Behavioral of MUX_4to1 is
component Decoder_2to4 is
    Port ( S : in STD_LOGIC_VECTOR (1 downto 0);
           D : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal D: std_logic_vector(3 downto 0);
signal D2: std_logic_vector(3 downto 0);

begin
D2 <= D and I;
Y <= D2(0) or D2(1) or D2(2) or D2(3);

U2: Decoder_2to4 port map (S => S, D => D );

end Behavioral;
