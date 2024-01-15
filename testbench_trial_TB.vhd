
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY adder32ALU_new_TB IS  
END adder32ALU_new_TB;


ARCHITECTURE  adder32ALUTB OF adder32ALU_new_TB IS



 COMPONENT adder32ALU_new IS
 PORT (
        A,B: in std_logic_vector(N-1 downto 0);
        M0,M1: in std_logic;
        S: out std_logic_vector(N-1 downto 0);
        Cout: out std_logic  
        );
 END COMPONENT;
 
 
 SIGNAL A_signal, B_signal, S_signal: std_logic_vector(31 DOWNTO 0);
 SIGNAL M0_signal, M1_signal, Cout_signal: std_logic;
 
 begin 
 
 CUT: adder32ALU_new PORT MAP(A,B,M0,M1,S,Cout);
 
 A<=11111111110000000001111100000001;
 B<=11000000000001111110000011110001;
 
 M0<='0','1' AFTER 15ns,'0'AFTER 30ns,'1' AFTER  45ns;
 M1<='0','1' AFTER 15ns,'0'AFTER 30ns,'1' AFTER  45ns;
 
 END adder32ALUTB
 
 
