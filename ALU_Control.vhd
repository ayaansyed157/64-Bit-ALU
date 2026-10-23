----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/02/2025 02:16:32 PM
-- Design Name: 
-- Module Name: ALU_Control - Behavioral
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

entity ALU_Control is
 Port (Reg_A : in std_logic_vector(63 downto 0);

Reg_B : in std_logic_vector(63 downto 0);

Op_Sel : in std_logic_vector(3 downto 0);

Carry_In : in STD_LOGIC;

Carry_Out : out STD_LOGIC;

ALU_Out : out STD_LOGIC_Vector(63 downto 0) );
end ALU_Control;



architecture Behavioral of ALU_Control is
component Arithmetic_ALU is 

    Port ( Reg_A : in std_logic_vector(63 downto 0); 

        Reg_B : in std_logic_vector(63 downto 0); 
        Op_Sel : in std_logic_vector(3 downto 0); 
         Carry_In : in STD_LOGIC; 
         Carry_Out : out STD_LOGIC; 
         ALU_Out : out STD_LOGIC_Vector(63 downto 0)); 

end component;

component ALU_Logical is 

    Port ( Reg_A : in std_logic_vector(63 downto 0); 

        Reg_B : in std_logic_vector(63 downto 0); 

        Op_Sel : in std_logic_vector(3 downto 0); 

        ALU_Out : out STD_LOGIC_Vector(63 downto 0)); 

end component;

component ALU_Shift is 

    Port ( Reg_A : in std_logic_vector(63 downto 0); 

    Reg_B : in std_logic_vector(63 downto 0); 

    Op_Sel : in std_logic_vector(3 downto 0); 

    ALU_Out : out std_logic_vector(63 downto 0) 

    ); 

end component;
signal arith_out, logic_out, shift_out : std_logic_vector(63 downto 0);
signal arith_carry : std_logic;



begin
--ALU units port maps
fa: Arithmetic_ALU port map(
Reg_A => Reg_A, Reg_B => Reg_B, Op_Sel => Op_Sel, Carry_In => Carry_In, ALU_Out => arith_out, Carry_Out => arith_carry);

fa2: ALU_Logical port map(
Reg_A => Reg_A, Reg_B => Reg_B, Op_Sel => Op_Sel,  ALU_Out => logic_out);

fa3: ALU_Shift port map(
Reg_A => Reg_A, Reg_B => Reg_B, Op_Sel => Op_Sel, ALU_Out => shift_out);

process(Op_Sel, arith_out, arith_carry)
begin
-- Unit Selection
case Op_Sel is

--arithmetic
when "0000" | "0001" | "0010" | "0011" =>
    ALU_Out <= arith_out;
    Carry_Out <= arith_carry;
--logical 
when "0100" | "0101" | "0110" | "0111" =>
    ALU_Out <= logic_out;
    Carry_Out <= '0';
--shift unit
when "1000" | "1001" | "1010" | "1101" =>
    ALU_Out <= shift_out;
    Carry_Out <= '0';

when others =>
    ALU_Out <= (others => '0');
    Carry_Out <= '0';
end case;
end process;

end Behavioral;
