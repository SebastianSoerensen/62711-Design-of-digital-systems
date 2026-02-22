----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.02.2026 16:11:56
-- Design Name: 
-- Module Name: NegZero - Behavioral
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

entity NegZero is
    Port ( MUXF : in STD_LOGIC_VECTOR (7 downto 0);
           N,Z : out STD_LOGIC);
end NegZero;

architecture Behavioral of NegZero is

begin

Z <= not (MUXF(0) or MUXF(1) or MUXF(2) or MUXF(3) or MUXF(4) or MUXF(5) or MUXF(6) or MUXF(7)); -- If sum of all of MUXF is zero, Z goes high
N <= MUXF(7); -- If MSB is high, it is negative in 2's complement

end Behavioral;
