----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.02.2026 16:11:56
-- Design Name: 
-- Module Name: ALU - Behavioral
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

entity ALU is
    Port ( A,B : in STD_LOGIC_VECTOR (7 downto 0);
           J_Select : in STD_LOGIC_VECTOR (3 downto 0);
           V,C : out STD_LOGIC;
           J : out STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is

-- Decoder signals
signal Decoder_EN : std_logic;
signal EN : std_logic_vector(3 downto 0);
signal Function_EN : std_logic_vector(15 downto 0);

-- Arithmetic signals
signal arith_C, arith_V, Plus_one: std_logic; -- result, carry, overflow
signal S_arith : std_logic_vector(1 downto 0); -- select
signal arith_res : std_logic_vector(7 downto 0);

-- Logic results signals
signal or_res, and_res, xor_res, not_res, logic_res : std_logic_vector(7 downto 0);

begin

Decoder_EN <= '1';

-- First 2 bits (J_Select(1) , J_Select(0))
Decoder_FS: entity work.Decoder_2to4_Enable port map(EN => Decoder_EN, S => J_Select(1 downto 0), D => EN );

-- Enables a decoder on upper 2 bits (J_select(3 downto 2))
GEN_DEC : for i in 0 to 3 generate
    DEC: entity work.Decoder_2to4_Enable port map(EN => EN(i) , S => J_Select(3 downto 2), D => Function_EN(4*i+3 downto 4*i));
end generate;

-- Arithmetic logic
Plus_One <= J_Select(0);
S_arith <= J_Select(2 downto 1);

ARITH: entity work.Arith_Circ port map(C_in => Plus_One, S => S_arith, A => A, B => B, G => arith_res, C_out => arith_C, Overflow => arith_V);
        
-- Logic operations
GEN_LOGIC: for i in 0 to 7 generate
    or_res(i) <= A(i) or B(i);
    and_res(i) <= A(i) and B(i);
    xor_res(i) <= A(i) xor B(i);
    not_res(i) <= not A(i);
end generate;

-- Select function
GEN_OUT_S: for i in 0 to 7 generate
    logic_res(i) <= (or_res(i) and (Function_EN(8) or Function_EN(12))) 
    or (and_res(i) and (Function_EN(9) or Function_EN(13))) 
    or (xor_res(i) and (Function_EN(10) or Function_EN(14))) 
    or (not_res(i) and (Function_EN(11) or Function_EN(15)));
end generate;

-- Either logic or arith depending on J_Select(3)
GEN_OUT: for i in 0 to 7 generate
    J(i) <= arith_res(i) when J_Select(3) = '0' else
    logic_res(i);
end generate;

-- Overflow and Carry-out are only relevant when using the fulladders in Arith_Circ
V <= arith_V when J_Select(3) = '0' else '0'; 
C <= arith_C when J_Select(3) = '0' else '0';

end Behavioral;
