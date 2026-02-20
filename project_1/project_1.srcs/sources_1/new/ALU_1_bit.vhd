----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.02.2026 12:49:12
-- Design Name: 
-- Module Name: ALU_1_bit - Behavioral
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

entity ALU_1_bit is
    Port ( C_in : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_out : out STD_LOGIC;
           G : out STD_LOGIC);
end ALU_1_bit;

architecture Behavioral of ALU_1_bit is
signal Y: std_logic;

begin
Y <= (not B and S1) or (B and S0);


FA: entity work.Full_adder port map(A => A, B => Y, C_in => C_in, S => G, C_out => C_out);

end Behavioral;
