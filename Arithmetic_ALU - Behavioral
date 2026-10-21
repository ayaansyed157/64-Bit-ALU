---------------------------------------------------------------------------------- 

-- Company:  
-- Engineer:  
--  
-- Create Date: 06/30/2025 02:01:16 PM 
-- Design Name:  
-- Module Name: Arithmetic_ALU - Behavioral 

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

use IEEE.NUMERIC_STD.ALL; 
-- Uncomment the following library declaration if instantiating 
-- any Xilinx leaf cells in this code. 
--library UNISIM; 
--use UNISIM.VComponents.all; 


entity Arithmetic_ALU is 

    Port ( Reg_A : in std_logic_vector(63 downto 0); 
        Reg_B : in std_logic_vector(63 downto 0); 
        Op_Sel : in std_logic_vector(3 downto 0); 
           Carry_In : in STD_LOGIC; 
           Carry_Out : out STD_LOGIC; 
           ALU_Out : out STD_LOGIC_Vector(63 downto 0)); 

end Arithmetic_ALU; 

 
architecture Behavioral of Arithmetic_ALU is 
signal result: unsigned(63 downto 0);
signal temp: unsigned(64 downto 0);
signal A, B : unsigned(63 downto 0);



begin 
A<=unsigned(Reg_A);
B<=unsigned(Reg_B);
process(Op_Sel, Carry_In, A,B) 

begin 
 
-- Transfer Reg_A
Carry_Out <= '0';
if Op_Sel = "0000" then 

    ALU_Out <= std_logic_vector(A);
    Carry_Out <= '0';

 --Increment 1 to Reg_A
elsif Op_Sel = "0001" then 
    
    ALU_Out <= std_logic_vector(A + 1);
    Carry_Out <= '0';
 
--decrement 1 to reg_A

elsif Op_Sel = "0010" then 

ALU_Out <= std_logic_vector(A-1);
Carry_Out <= '0';
 
--Addition
elsif Op_Sel = "0011" then 

-- A + B + Carry_IN;
temp <= ('0' & A) + ('0' & B) + to_unsigned(to_integer(unsigned'("0" & Carry_In)), 65);
ALU_Out<= std_logic_vector(temp(63 downto 0));
Carry_Out <= temp(64);

else
    ALU_Out <= (others => '0');
    Carry_Out <= '0';
end if; 

end process; 

 
end Behavioral; 
