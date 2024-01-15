library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FA_4bit is 
	port (
	A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);
	Cin: in std_logic;
	Sout: out std_logic_vector(3 downto 0);
	Cout: out std_logic);
end entity FA_4bit;

architecture rtl of FA_4bit is

component FA is
    port (
        A,B,Cin : in std_logic;
        S,Cout : out std_logic
    );
end component FA;
signal tmp_Cout:std_logic_vector (2 downto 0);


begin
b0:FA port map (A=>A(0),B=>B(0),Cin=>Cin, S=>Sout(0), Cout=>tmp_Cout(0));
b1:FA port map (A=>A(1),B=>B(1),Cin=>tmp_Cout(0), S=>Sout(1), Cout=>tmp_Cout(1));
b2:FA port map (A=>A(2),B=>B(2),Cin=>tmp_Cout(1), S=>Sout(2), Cout=>tmp_Cout(2));
b3:FA port map (A=>A(3),B=>B(3),Cin=>tmp_Cout(2), S=>Sout(3), Cout=>Cout);

end architecture rtl;
	
	
	