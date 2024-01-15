
LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY datapath_5_2 IS 
	PORT
	(
		TEMP :  IN  STD_LOGIC;
		LOAD :  IN  STD_LOGIC;
		CLOCK :  IN  STD_LOGIC;
		RESET :  IN  STD_LOGIC;
		ALU :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		YA :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		YB :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		COUT :  OUT  STD_LOGIC;
		Z :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END datapath_5_2;

ARCHITECTURE bdf_type OF datapath_5_2 IS 

COMPONENT alu_8bits_oss1
	PORT(A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 SEL : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 Z : OUT STD_LOGIC;
		 Cout : OUT STD_LOGIC;
		 R : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux2x1_8bit
	PORT(S : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT register_8bits
	PORT(Load : IN STD_LOGIC;
		 Clock : IN STD_LOGIC;
		 Reset : IN STD_LOGIC;
		 D : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 
Z <= SYNTHESIZED_WIRE_0;



b2v_inst : alu_8bits_oss1
PORT MAP(A => SYNTHESIZED_WIRE_0,
		 B => SYNTHESIZED_WIRE_1,
		 SEL => ALU,
		 Cout => COUT,
		 R => SYNTHESIZED_WIRE_2);


b2v_inst2 : mux2x1_8bit
PORT MAP(S => TEMP,
		 A => YA,
		 B => YB,
		 Y => SYNTHESIZED_WIRE_1);


b2v_inst3 : register_8bits
PORT MAP(Load => LOAD,
		 Clock => CLOCK,
		 Reset => RESET,
		 D => SYNTHESIZED_WIRE_2,
		 Q => SYNTHESIZED_WIRE_0);


END bdf_type;