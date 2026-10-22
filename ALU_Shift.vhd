--------------------------------------------------------------------------------- 

-- Company:  
-- Engineer:  
--  
-- Create Date: 06/30/2025 12:59:33 PM 

-- Design Name:  
-- Module Name: ALU_Shift - Behavioral 
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

 

entity ALU_Shift is 

    Port ( Reg_A : in std_logic_vector(63 downto 0); 
    Reg_B : in std_logic_vector(63 downto 0); 
    Op_Sel : in std_logic_vector(3 downto 0); 
    ALU_Out : out std_logic_vector(63 downto 0) 
    ); 

end ALU_Shift; 

architecture Behavioral of ALU_Shift is  

begin process(Op_Sel, Reg_A, Reg_B) 
begin 
--Arithmetic shift left
if Op_Sel = "1000" then 
    ALU_Out <= Std_logic_vector(shift_left(signed(Reg_A), TO_INTEGER(unsigned(Reg_B(5 downto 0))))); 

     

     

    elsif Op_Sel = "1001" then -- arithmetic shift right 
    ALU_Out <= Std_logic_vector(shift_right(signed(Reg_A), TO_INTEGER(unsigned(Reg_B(5 downto 0))))); 

     
--logical shift left
    elsif Op_Sel = "1010" then 
    ALU_Out <= Std_logic_vector(shift_left(unsigned(Reg_A), TO_INTEGER(unsigned(Reg_B(5 downto 0))))); 

     
--logical shift right
    elsif Op_Sel = "1101" then 
    ALU_Out <= Std_logic_vector(shift_right(unsigned(Reg_A), TO_INTEGER(unsigned(Reg_B(5 downto 0))))); 

    else
    ALU_Out <= (others => '0');
    end if; 


end process; 

end Behavioral; 
