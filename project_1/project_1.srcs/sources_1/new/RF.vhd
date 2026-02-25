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
        A_Data, B_data : out std_logic_vector(7 downto 0)
    );
end RegisterFile;

architecture Behavioral of RegisterFile is

signal Load: std_logic_vector(15 downto 0);
signal R0,R1,R2,R3,R4,R5,R6,R7: std_logic_vector(7 downto 0);
signal R8,R9,R10,R11,R12,R13,R14,R15: std_logic_vector(7 downto 0);

begin
DD: entity work.DestinationDecoder port map(
    Write => RW, DA => DA, Load => Load);

REG: entity work.RegisterR16 port map(
    Reset => Reset, Clk => Clk, Load => Load, D_data => D_Data,R0=>R0,R1=>R1,R2=>R2,R3=>R3,R4=>R4,R5=>R5,
    R6=>R6,R7=>R7,R8=>R8,R9=>R9,R10=>R10,R11=>R11,R12=>R12,R13=>R13,R14=>R14,R15=>R15);

MUX_A: entity work.MUX16x1x8 port map(
    R0=>R0,R1=>R1,R2=>R2,R3=>R3,R4=>R4,R5=>R5,R6=>R6,R7=>R7,R8=>R8,R9=>R9,R10=>R10,R11=>R11,R12=>R12,
    R13=>R13,R14=>R14,R15=>R15,D_select => AA, Y_data => A_Data);

MUX_B: entity work.MUX16x1x8 port map(
    R0=>R0,R1=>R1,R2=>R2,R3=>R3,R4=>R4,R5=>R5,R6=>R6,R7=>R7,R8=>R8,R9=>R9,R10=>R10,R11=>R11,R12=>R12,R13=>R13,
    R14=>R14,R15=>R15,D_select => BA, Y_data => B_Data);

end Behavioral;