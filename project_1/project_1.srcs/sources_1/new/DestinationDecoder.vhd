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

entity DestinationDecoder is
    Port (
        Write : in std_logic;
        DA : in std_logic_vector(3 downto 0);
        Load : out std_logic_vector(15 downto 0);
    );
end DestinationDecoder;

architecture Behavioral of DestinationDecoder is

signal EN: std_logic_vector(3 downto 0);


begin

entity Decoder_2to4_Enable is
    Port ( EN : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR (1 downto 0);
           D : out STD_LOGIC_VECTOR (3 downto 0));
end Decoder_2to4_Enable;

GEN_REGS : for j in 0 to n-1 generate -- From 0 to 15 (16 DFF components of 8 bits each)
    GEN_BITS : for i in 0 to width-1 generate -- From 0 to 7 (8 bits)
        UREG : DFF port map(Clk => Clk, Reset => Reset, Load => Load(j), D => D_data(i), Q => R(j)(i));
    end generate;
end generate;

Decoder_In: entity work.Decoder_2to4_Enable port map(EN => Write, S => DA(1 downto 0), D(0) => EN(0), D(1) => EN(1), D(2) => EN(2), D(3) => EN(3) );
GEN_DEC : for i in 0 to 3 generate
    DEC: entity work.Decoder_2to4_Enable port map();
end generate;
end Behavioral;
