----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.02.2026 10:25:08
-- Design Name: 
-- Module Name: RegisterR16 - Behavioral
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

entity RegisterR16 is
generic (n: integer := 16; width: integer:=8);
  Port ( 
    Reset: in std_logic;
    Clk : in std_logic;
    Load : in std_logic_vector(n-1 downto 0);
    D_data : in std_logic_vector(width-1 downto 0);
    R0,R1,R2,R3,R4,R5,R6,R7: out std_logic_vector(width-1 downto 0);
    R8,R9,R10,R11,R12,R13,R14,R15: out std_logic_vector(width-1 downto 0)
  );
end RegisterR16;

architecture Behavioral of RegisterR16 is

type reg_array is array (0 to n-1) of std_logic_vector(width-1 downto 0);
signal R : reg_array;

component DFF is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Load : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC
    );
end component;

begin
-- Creates 16 8-bit D-flipflops from a 2D-array
GEN_REGS : for j in 0 to n-1 generate -- From 0 to 15 (16 DFF components of 8 bits each)
    GEN_BITS : for i in 0 to width-1 generate -- From 0 to 7 (8 bits)
        UREG : DFF port map(Clk => Clk, Reset => Reset, Load => Load(j), D => D_data(i), Q => R(j)(i));
    end generate;
end generate;
R0 <= R(0);
R1 <= R(1);
R2 <= R(2);
R3 <= R(3);
R4 <= R(4);
R5 <= R(5);
R6 <= R(6);
R7 <= R(7);
R8 <= R(8);
R9 <= R(9);
R10 <= R(10);
R11 <= R(11);
R12 <= R(12);
R13 <= R(13);
R14 <= R(14);
R15 <= R(15);
end Behavioral;
