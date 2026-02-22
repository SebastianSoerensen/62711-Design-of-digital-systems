----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.02.2026 09:56:33
-- Design Name: 
-- Module Name: Arith_Circ - Behavioral
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

entity Arith_Circ is
    Port ( C_in : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR (1 downto 0);
           A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           G : out STD_LOGIC_VECTOR (7 downto 0);
           Overflow: out std_logic;
           C_out : out STD_LOGIC);
end Arith_Circ;

architecture Behavioral of Arith_Circ is

signal Y: std_logic_vector(7 downto 0);
signal C_in: std_logic_vector(8 downto 0);

begin
GEN_LOGIC: for i in 0 to 7 generate
    Y(i) <= (not B(i) and S(1)) or (B(i) and S(0));
end generate;
GEN_FA: for i in 0 to 7 generate
    FA : entity work.Full_adder port map(A => A(i), B => Y(i), C_in => C_in(i), S => J(i), C_out => C_in(i+1));
end generate;
C <= C_in(8); -- Carry out
Overflow <= C_in(8) xor C_in(7);

end Behavioral;
