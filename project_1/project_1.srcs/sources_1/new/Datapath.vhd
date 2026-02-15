----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.02.2026 16:11:56
-- Design Name: 
-- Module Name: Datapath - Behavioral
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

entity Datapath is
    Port ( Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           RW : in STD_LOGIC;
           DA,AA,BA : in STD_LOGIC_VECTOR (3 downto 0);
           ConstantIn : in STD_LOGIC_VECTOR (7 downto 0);
           MB : in STD_LOGIC;
           FS3,FS2,FS1,FS0 : in STD_LOGIC;
           DataIn : in STD_LOGIC_VECTOR (7 downto 0);
           MD : in STD_LOGIC;
           Address_Out : out STD_LOGIC_VECTOR (7 downto 0);
           Data_Out : out STD_LOGIC_VECTOR (7 downto 0);
           V,C,N,Z : out STD_LOGIC);
end Datapath;

architecture Behavioral of Datapath is

begin


end Behavioral;
