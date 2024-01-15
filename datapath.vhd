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
-- CREATED		"Thu Sep 17 18:10:09 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY datapath IS 
	PORT
	(
		TEMP :  IN  STD_LOGIC;
		S4 :  IN  STD_LOGIC;
		S3 :  IN  STD_LOGIC;
		S2 :  IN  STD_LOGIC;
		S1 :  IN  STD_LOGIC;
		S0 :  IN  STD_LOGIC;
		CLK :  IN  STD_LOGIC;
		CE :  IN  STD_LOGIC;
		CLR :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		Cout :  OUT  STD_LOGIC;
		Z :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END datapath;

ARCHITECTURE bdf_type OF datapath IS 

COMPONENT alu
	PORT(S4 : IN STD_LOGIC;
		 S3 : IN STD_LOGIC;
		 S2 : IN STD_LOGIC;
		 S1 : IN STD_LOGIC;
		 S0 : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Cout : OUT STD_LOGIC;
		 Z : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT mux2x1_8bit
	PORT(SEL : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Z : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT register_8
	PORT(D0 : IN STD_LOGIC;
		 D1 : IN STD_LOGIC;
		 D2 : IN STD_LOGIC;
		 D3 : IN STD_LOGIC;
		 D4 : IN STD_LOGIC;
		 D5 : IN STD_LOGIC;
		 D6 : IN STD_LOGIC;
		 D7 : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 CE : IN STD_LOGIC;
		 CLR : IN STD_LOGIC;
		 Q0 : OUT STD_LOGIC;
		 Q1 : OUT STD_LOGIC;
		 Q2 : OUT STD_LOGIC;
		 Q3 : OUT STD_LOGIC;
		 Q4 : OUT STD_LOGIC;
		 Q5 : OUT STD_LOGIC;
		 Q6 : OUT STD_LOGIC;
		 Q7 : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	X :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	Z_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_inst : alu
PORT MAP(S4 => S4,
		 S3 => S3,
		 S2 => S2,
		 S1 => S1,
		 S0 => S0,
		 A => Z_ALTERA_SYNTHESIZED,
		 B => SYNTHESIZED_WIRE_0,
		 Cout => Cout,
		 Z => X);


b2v_inst2 : mux2x1_8bit
PORT MAP(SEL => TEMP,
		 A => A,
		 B => B,
		 Z => SYNTHESIZED_WIRE_0);


b2v_inst3 : register_8
PORT MAP(D0 => X(0),
		 D1 => X(1),
		 D2 => X(2),
		 D3 => X(3),
		 D4 => X(4),
		 D5 => X(5),
		 D6 => X(6),
		 D7 => X(7),
		 CLK => CLK,
		 CE => CE,
		 CLR => CLR,
		 Q0 => Z_ALTERA_SYNTHESIZED(0),
		 Q1 => Z_ALTERA_SYNTHESIZED(1),
		 Q2 => Z_ALTERA_SYNTHESIZED(2),
		 Q3 => Z_ALTERA_SYNTHESIZED(3),
		 Q4 => Z_ALTERA_SYNTHESIZED(4),
		 Q5 => Z_ALTERA_SYNTHESIZED(5),
		 Q6 => Z_ALTERA_SYNTHESIZED(6),
		 Q7 => Z_ALTERA_SYNTHESIZED(7));

Z <= Z_ALTERA_SYNTHESIZED;

END bdf_type;