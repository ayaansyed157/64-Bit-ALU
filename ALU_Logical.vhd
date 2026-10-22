----------------------------------------------------------------------------------- 

-- Company:  
-- Engineer:  
--  
-- Create Date: 07/01/2025 01:16:09 PM 
-- Design Name:  
-- Module Name: ALU_Logical - Behavioral 

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


entity ALU_Logical is 

    Port ( Reg_A : in std_logic_vector(63 downto 0); 
        Reg_B : in std_logic_vector(63 downto 0); 
        Op_Sel : in std_logic_vector(3 downto 0); 
        ALU_Out : out STD_LOGIC_Vector(63 downto 0)); 

end ALU_Logical; 

architecture Behavioral of ALU_Logical is 

begin process(Op_Sel, Reg_A, Reg_B) 

begin 
--NOT A
if Op_Sel = "0100" then 
    ALU_Out <= NOT Reg_A; 

 
--AND A B
elsif Op_Sel = "0101" then 

    ALU_Out <= Reg_A AND Reg_B; 

elsif Op_Sel = "0110" then 

ALU_Out <=Reg_A OR Reg_B; 

elsif Op_Sel = "0111" then 

ALU_Out <=Reg_A XOR Reg_B; 

 else
    ALU_Out <= (others => '0');

end if; 

end process; 

end Behavioral; 
