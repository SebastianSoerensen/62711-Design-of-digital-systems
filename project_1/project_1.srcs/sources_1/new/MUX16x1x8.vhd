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

entity MUX16x1x8 is
    Port (
        R0,R1,R2,R3,R4,R5,R6,R7 : in std_logic_vector(7 downto 0);
        R8,R9,R10,R11,R12,R13,R14,R15 : in std_logic_vector(7 downto 0);
        D_select : in std_logic_vector(3 downto 0);
        Y_data : out std_logic_vector(7 downto 0);
    );
end MUX16x1x8;

architecture Behavioral of MUX16x1x8 is

signal Y0,Y1,Y2,Y3: std_logic_vector(7 downto 0);
signal D_Select: std_logic_vector(3 downto 0);

begin

MUX1: entity work.MUX_4to1 port map(I(0) => R0, I(1) => R1, I(2) => R2, I(3) => R3, S => D_select(1 downto 0), Y => Y0);
MUX2: entity work.MUX_4to1 port map(I(0) => R4, I(1) => R5, I(2) => R6, I(3) => R7, S => D_Select(1 downto 0), Y => Y1);
MUX3: entity work.MUX_4to1 port map(I(0) => R8, I(1) => R9, I(2) => R10, I(3) => R11, S => D_Select(1 downto 0), Y => Y2);
MUX4: entity work.MUX_4to1 port map(I(0) => R12, I(1) => R13, I(2) => R14, I(3) => R15, S => D_Select(1 downto 0), Y => Y3);
MUX_OUT: entity work.MUX_4to1 port map(I(0) => Y0, I(1) => Y1, I(2) => Y2, I(3) => Y3, S => D_Select(3 downto 2), Y => Y_Data);
end Behavioral;
