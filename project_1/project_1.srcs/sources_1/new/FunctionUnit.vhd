----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.02.2026 16:11:56
-- Design Name: 
-- Module Name: FunctionUnit - Behavioral
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

entity FunctionUnit is
    Port ( A,B : in STD_LOGIC_VECTOR (7 downto 0);
           FS3,FS2,FS1,FS0 : in STD_LOGIC;
           V,C,N,Z : out STD_LOGIC;
           F : out STD_LOGIC_VECTOR (0 downto 0));
end FunctionUnit;

architecture Behavioral of FunctionUnit is

begin


end Behavioral;
