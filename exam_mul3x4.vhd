library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity mul is 
	port (
	A: in std_logic_vector(2 downto 0);
	B: in std_logic_vector(3 downto 0);
	MUL_Cout: out std_logic_vector(6 downto 0)
	);
	
end entity mul;

architecture rtl of mul is

component FA_4bit is 
	port (
	A: in std_logic_vector(3 downto 0);
	B: in std_logic_vector(3 downto 0);
	Cin: in std_logic;
	Sout: out std_logic_vector(3 downto 0);
	Cout: out std_logic);
end component FA_4bit;

signal X,Y,XX,YY: std_logic_vector(3 downto 0);
signal Sout_A: std_logic_vector(3 downto 0);
signal Sout_B: std_logic_vector(3 downto 0);
signal Cout_A: std_logic;

begin

	
--	Y(0)<=A(0) and B(1);
--	Y(1)<=A(0) and B(2);
--	Y(2)<=A(0) and B(3);
--	Y(3)<='0';	
	YFor: for i in 0 to 2 generate
		Y(i)<=A(0) and B(i+1);
	end generate YFor;
	Y(3)<='0';

--	X(0)<=A(1) and B(0);
--	X(1)<=A(1) and B(1);
--	X(2)<=A(1) and B(2);
--	X(3)<=A(1) and B(3);
	
	XFor: for i in 0 to 3 generate
		X(i)<=A(1) and B(i);
	end generate XFor;
	
--	XX(0)<=A(2) and B(0);
--	XX(1)<=A(2) and B(1);
--	XX(2)<=A(2) and B(2);
--	XX(3)<=A(2) and B(3);

	XXFor: for i in 0 to 3 generate
		XX(i)<=A(2) and B(i);
	end generate XXFor;
	

--	YY(0)<=Sout_A(1);
--	YY(1)<=Sout_A(2);
--	YY(2)<=Sout_A(3);
--	YY(3)<=Cout_A;

	YYFor: for i in 0 to 2 generate
		YY(i)<=Sout_A(i+1);
	end generate YYFor;
	YY(3)<=Cout_A;
	

	FA1:FA_4bit port map (A=>Y,B=>X,Cin=>'0',Sout=> Sout_A,Cout=>Cout_A);
	FA2:FA_4bit port map (A=>YY,B=>XX,Cin=>'0',Sout=> Sout_B,Cout=>MUL_Cout(6));

	gFor: for i in 0 to 3 generate
		MUL_Cout(i+2)<=Sout_B(i);	
	end generate gFor;

	MUL_Cout(0)<=A(0) and B(0);
	MUL_Cout(1)<=Sout_A(0);

end architecture;
