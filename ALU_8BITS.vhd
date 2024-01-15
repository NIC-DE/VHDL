library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU is
    Port ( SEL : in STD_LOGIC_VECTOR(4 downto 0);
           A, B : in STD_LOGIC_VECTOR(7 downto 0);
		   Cout:out STD_LOGIC;
           Z : out STD_LOGIC_VECTOR(7 downto 0));
		  
end ALU;

architecture Behavioral of ALU is
begin
    process (SEL, A, B)
    begin
        case SEL(4 downto 0) is
            when "00000" =>
                Z <= A + B;
                
            when "00001" =>
                Z <= A and B;
                
            when "00010" =>
                Z <= A;
                
            when "00011" =>
                Z <= B;
                
            when "11111" =>
                Z <= A - B;
                
            when "10100" =>
                Z <= A + "00000001";
                
            when "10000" =>
                Z <= A;
                
            when "00100" =>
                Z <= A + B + "00000001";
                
            when "01000" =>
                Z <= A - B - "00000001";
                
            when others =>
                Z <= (others => '0');  -- Default to zero for undefined operations
        end case;
    end process;
end Behavioral;
