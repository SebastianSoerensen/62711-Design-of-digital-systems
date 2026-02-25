----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.02.2026 10:42:53
-- Design Name: 
-- Module Name: 2_to_4_Decoder - Behavioral
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

entity Decoder_2to4 is
    Port ( S : in STD_LOGIC_VECTOR (1 downto 0);
           D : out STD_LOGIC_VECTOR (3 downto 0));
end Decoder_2to4;

architecture Behavioral of Decoder_2to4 is
signal S0_not: std_logic;
signal S1_not: std_logic;

begin

S0_not <= not S(0);
S1_not <= not S(1);
D(0) <= S0_not and S1_not;
D(1) <= S(0) and S1_not;
D(2) <= S0_not and S(1);
D(3) <= S(0) and S(1);

end Behavioral;
