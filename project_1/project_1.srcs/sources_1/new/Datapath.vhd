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
signal B_Data, D_Data, MUXF : std_logic_vector(7 downto 0);
signal A_out_sig, D_out_sig  : std_logic_vector(7 downto 0);
begin

MUXB: entity work.MUX2x1x8 port map(R => ConstantIn, S => B_Data, MUX_Select => MB, Y => D_out_sig);
MUXD: entity work.MUX2x1x8 port map(R => DataIn, S => MUXF, MUX_Select => MD, Y => D_Data);
FU: entity work.FunctionUnit port map(A => A_out_sig, B => D_out_sig, FS3 => FS3, FS2 => FS2, FS1 => FS1, FS0 => FS0, V => V, C => C, N => N, Z => Z, F => MUXF);
RF: entity work.RegisterFile port map(Reset => Reset, Clk => Clk, RW => RW, DA => DA, AA => AA, BA => BA, D_Data => D_Data, A_Data => A_out_sig, B_Data => B_Data);
Address_Out <= A_out_sig;
Data_Out    <= D_out_sig;

end Behavioral;
