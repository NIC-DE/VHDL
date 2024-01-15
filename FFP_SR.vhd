
LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY flip_flop_SR IS 
	PORT
	(
		S :  IN  STD_LOGIC;
		CLK :  IN  STD_LOGIC;
		R :  IN  STD_LOGIC;
		CLEAR :  IN  STD_LOGIC;
		PRESET :  IN  STD_LOGIC;
		Q :  OUT  STD_LOGIC
	);
END flip_flop_SR;

ARCHITECTURE bdf_type OF flip_flop_SR IS 



BEGIN 



PROCESS(CLK,CLEAR,PRESET)
VARIABLE synthesized_var_for_Q : STD_LOGIC;
BEGIN
IF (CLEAR = '0') THEN
	synthesized_var_for_Q := '0';
ELSIF (PRESET = '0') THEN
	synthesized_var_for_Q := '1';
ELSIF (RISING_EDGE(CLK)) THEN
	synthesized_var_for_Q := (NOT(synthesized_var_for_Q) AND S) OR (synthesized_var_for_Q AND (NOT(R)));
END IF;
	Q <= synthesized_var_for_Q;
END PROCESS;


END bdf_type;