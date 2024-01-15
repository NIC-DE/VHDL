-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
-- CREATED		"Fri Sep 04 18:51:46 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY ripple_adder_8bit IS 
	PORT
	(
		Cin :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		Cout :  OUT  STD_LOGIC;
		Sum :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END ripple_adder_8bit;

ARCHITECTURE bdf_type OF ripple_adder_8bit IS 

COMPONENT full_adder
	PORT(A : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 Cin : IN STD_LOGIC;
		 Cout : OUT STD_LOGIC;
		 Sum : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	Sum_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;


BEGIN 



b2v_inst : full_adder
PORT MAP(A => A(0),
		 B => B(0),
		 Cin => Cin,
		 Cout => SYNTHESIZED_WIRE_0,
		 Sum => Sum_ALTERA_SYNTHESIZED(0));


b2v_inst1 : full_adder
PORT MAP(A => A(1),
		 B => B(1),
		 Cin => SYNTHESIZED_WIRE_0,
		 Cout => SYNTHESIZED_WIRE_1,
		 Sum => Sum_ALTERA_SYNTHESIZED(1));


b2v_inst2 : full_adder
PORT MAP(A => A(2),
		 B => B(2),
		 Cin => SYNTHESIZED_WIRE_1,
		 Cout => SYNTHESIZED_WIRE_2,
		 Sum => Sum_ALTERA_SYNTHESIZED(2));


b2v_inst3 : full_adder
PORT MAP(A => A(3),
		 B => B(3),
		 Cin => SYNTHESIZED_WIRE_2,
		 Cout => SYNTHESIZED_WIRE_3,
		 Sum => Sum_ALTERA_SYNTHESIZED(3));


b2v_inst4 : full_adder
PORT MAP(A => A(4),
		 B => B(4),
		 Cin => SYNTHESIZED_WIRE_3,
		 Cout => SYNTHESIZED_WIRE_4,
		 Sum => Sum_ALTERA_SYNTHESIZED(4));


b2v_inst5 : full_adder
PORT MAP(A => A(5),
		 B => B(5),
		 Cin => SYNTHESIZED_WIRE_4,
		 Cout => SYNTHESIZED_WIRE_5,
		 Sum => Sum_ALTERA_SYNTHESIZED(5));


b2v_inst6 : full_adder
PORT MAP(A => A(6),
		 B => B(6),
		 Cin => SYNTHESIZED_WIRE_5,
		 Cout => SYNTHESIZED_WIRE_6,
		 Sum => Sum_ALTERA_SYNTHESIZED(6));


b2v_inst7 : full_adder
PORT MAP(A => A(7),
		 B => B(7),
		 Cin => SYNTHESIZED_WIRE_6,
		 Cout => Cout,
		 Sum => Sum_ALTERA_SYNTHESIZED(7));

Sum <= Sum_ALTERA_SYNTHESIZED;

END bdf_type;