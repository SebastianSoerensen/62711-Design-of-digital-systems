----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.02.2026 16:11:56
-- Design Name: 
-- Module Name: Shifter - Behavioral
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

entity Shifter is
    Port ( B : in STD_LOGIC_VECTOR (7 downto 0);
           H_Select : in STD_LOGIC_VECTOR (1 downto 0);
           H : out STD_LOGIC_VECTOR (7 downto 0));
end Shifter;

architecture Behavioral of Shifter is

signal HS: std_logic_vector(1 downto 0);

begin
HS <= H_Select;

U0: entity work.MUX_4to1 port map(I(0) => B(0), I(1) => B(1), I(2) => '0' , I(3) => B(0), S => HS, Y => H(0));
U1: entity work.MUX_4to1 port map(I(0) => B(1), I(1) => B(2), I(2) => B(0), I(3) => B(1), S => HS, Y => H(1));
U2: entity work.MUX_4to1 port map(I(0) => B(2), I(1) => B(3), I(2) => B(1), I(3) => B(2), S => HS, Y => H(2));
U3: entity work.MUX_4to1 port map(I(0) => B(3), I(1) => B(4), I(2) => B(2), I(3) => B(3), S => HS, Y => H(3));
U4: entity work.MUX_4to1 port map(I(0) => B(4), I(1) => B(5), I(2) => B(3), I(3) => B(4), S => HS, Y => H(4));
U5: entity work.MUX_4to1 port map(I(0) => B(5), I(1) => B(6), I(2) => B(4), I(3) => B(5), S => HS, Y => H(5));
U6: entity work.MUX_4to1 port map(I(0) => B(6), I(1) => B(7), I(2) => B(5), I(3) => B(6), S => HS, Y => H(6));
U7: entity work.MUX_4to1 port map(I(0) => B(7), I(1) => '0' , I(2) => B(6), I(3) => B(7), S => HS, Y => H(7));

end Behavioral;
