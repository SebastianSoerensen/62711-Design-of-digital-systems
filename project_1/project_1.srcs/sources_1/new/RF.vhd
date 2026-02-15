----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.02.2026 10:20:50
-- Design Name: 
-- Module Name: RF - Behavioral
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

entity RegisterFile is
    Port (
        Reset : in std_logic;
        Clk : in std_logic;
        RW : in std_logic;
        DA,AA,BA : in std_logic_vector(3 downto 0);
        D_Data : in std_logic_vector(7 downto 0);
        A_Data, B_data : out std_logic_vector(7 downto 0);
    );
end RegisterFile;

architecture Behavioral of RegisterFile is

component DFF is
    Port ( Clk : in STD_LOGIC;
               Reset : in STD_LOGIC;
               Load : in STD_LOGIC;
               D : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;

begin


end Behavioral;
