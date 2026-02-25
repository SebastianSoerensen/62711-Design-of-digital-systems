library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port ( A,B : in  STD_LOGIC_VECTOR (7 downto 0);
           J_Select : in  STD_LOGIC_VECTOR (3 downto 0);
           V,C : out STD_LOGIC;
           J : out STD_LOGIC_VECTOR (7 downto 0));
end ALU;

architecture Behavioral of ALU is

signal arith_C, arith_V, Plus_One : std_logic;
signal S_arith : std_logic_vector(1 downto 0);
signal Function_EN : std_logic_vector(3 downto 0);
signal arith_res: std_logic_vector(7 downto 0);

begin
Decoder_FS: entity work.Decoder_2to4_Enable port map(
	EN => J_Select(3), S => J_Select(1 downto 0), D => Function_EN);

Plus_One <= J_Select(0);
S_arith <= J_Select(2 downto 1);

ARITH: entity work.Arith_Circ port map(
	C_in => Plus_One, S => S_arith, A => A, B => B, G => arith_res, C_out => arith_C, Overflow => arith_V);

GEN_OUT: for i in 0 to 7 generate
    J(i) <= arith_res(i) when J_Select(3) = '0'
        else ((A(i) or  B(i)) and Function_EN(1))
        or ((A(i) and B(i)) and Function_EN(0))
        or ((A(i) xor B(i)) and Function_EN(2))
        or ((not A(i)) and Function_EN(3));
end generate;

-- Flags only relevant for arithmetic because of full adder
V <= arith_V when J_Select(3) = '0' else '0';	
C <= arith_C when J_Select(3) = '0' else '0';

end Behavioral;