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

component DestinationDecoder is
    Port (
        Write : in std_logic;
        DA : in std_logic_vector(3 downto 0);
        Load : out std_logic_vector(15 downto 0);
    );
end component;

component RegisterR16 is
generic (n: integer := 16; width: integer:=8);
  Port ( 
    Reset: in std_logic;
    Clk : in std_logic;
    Load : in std_logic_vector(n-1 downto 0);
    D_data : in std_logic_vector(width-1 downto 0);
    R0,R1,R2,R3,R4,R5,R6,R7: out std_logic_vector(width-1 downto 0);
    R8,R9,R10,R11,R12,R13,R14,R15: out std_logic_vector(width-1 downto 0);
  );
end component;

component MUX16x1x8 is
    Port (
        R0,R1,R2,R3,R4,R5,R6,R7 : in std_logic_vector(7 downto 0);
        R8,R9,R10,R11,R12,R13,R14,R15 : in std_logic_vector(7 downto 0);
        D_select : in std_logic_vector(3 downto 0);
        Y_data : out std_logic_vector(7 downto 0);
    );
end component;

signal Load: std_logic_vector(15 downto 0);
signal R0,R1,R2,R3,R4,R5,R6,R7,R8,R9,R10,R11,R12,R13,R14,R15: std_logic_vector(15 downto 0);

begin




MUX: MUX16x1x8 port map(R0=>R0,R1=>R1,R2=>R2,R3=>R3,R4=>R4,R5=>R5,R6=>R6,R7=>R7,R8=>R8,R9=>R9,R10=>R10,R11=>R11,R12=>R12,R13=>R13,R14=>R14,R15=>R15);
DD: DestinationDecoder port map(Write => RW, DA => DA, Load => Load);
REG: RegisterR16 port map(Reset => Reset, Clk => Clk, Load => Load, D_data => D_data,R0=>R0,R1=>R1,R2=>R2,R3=>R3,R4=>R4,R5=>R5,R6=>R6,R7=>R7,R8=>R8,R9=>R9,R10=>R10,R11=>R11,R12=>R12,R13=>R13,R14=>R14,R15=>R15);



end Behavioral;
