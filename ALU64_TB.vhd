----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/05/2025 03:12:35 AM
-- Design Name: 
-- Module Name: ALU64_TB - Behavioral
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

entity ALU64_TB is
--  Port ( );
end ALU64_TB;

architecture Behavioral of ALU64_TB is

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
component ALU_Control is
 Port (Reg_A : in std_logic_vector(63 downto 0);

Reg_B : in std_logic_vector(63 downto 0);

Op_Sel : in std_logic_vector(3 downto 0);

Carry_In : in STD_LOGIC;

Carry_Out : out STD_LOGIC;

ALU_Out : out STD_LOGIC_Vector(63 downto 0) );
end component;

signal CA, CB, CALU_Out: std_logic_vector(63 downto 0);
signal COp_Sel: std_logic_vector(3 downto 0);
signal cCarry_In, cCarry_Out: std_logic;
begin

UUT: ALU_Control port map(Reg_A => CA, Reg_B => CB, ALU_Out => cALU_Out, Op_Sel => cOp_Sel, Carry_In => cCarry_in, Carry_Out => cCarry_Out);
process
begin

--transfer from Reg_A
CA <= X"0000000002122797"; CB <=x"0000000000000001";cOp_Sel <= "0000";wait for 10ns;

--increment Reg_A
CA <= X"0000000002122797"; CB <=x"0000000000000001";cOp_Sel <= "0001";wait for 10ns;

-- decrement Reg_A 
CA <= X"0000000002122797"; CB <=x"0000000000000000";cOp_Sel <= "0010";wait for 10ns;

-- Addition of Reg_A + Reg_B + Carry_In
cCarry_In <= '1';CA <= X"0000000002122797"; CB <=x"0000000000000000";cOp_Sel <= "0011";wait for 10ns;

--logical operations cases
CA <= X"0000000002122797"; CB <=x"0000000000000001";cOp_Sel <= "0100";wait for 10ns;
CA <= X"0000000002122797"; CB <=x"0000000000000001";cOp_Sel <= "0101";wait for 10ns;
CA <= X"0000000002122797"; CB <=x"0000000000000001";cOp_Sel <= "0110";wait for 10ns;
CA <= X"0000000002122797"; CB <=x"0000000000000001";cOp_Sel <= "0111";wait for 10ns;
--shift operations cases
CA <= X"0000000002122797"; CB <=x"0000000000000001";cOp_Sel <= "1000";wait for 10ns;
CA <= X"0000000002122797"; CB <=x"0000000000000001";cOp_Sel <= "1001";wait for 10ns;
CA <= X"0000000002122797"; CB <=x"0000000000000001";cOp_Sel <= "1010";wait for 10ns;
CA <= X"0000000002122797"; CB <=x"0000000000000001";cOp_Sel <= "1101";wait for 10ns;
wait;

end process;
end Behavioral;
