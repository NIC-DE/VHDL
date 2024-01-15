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
-- CREATED		"Thu Sep 17 20:39:39 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY jump_detector_FF IS 
	PORT
	(
		JUMPZ :  IN  STD_LOGIC;
		JUMPNZ :  IN  STD_LOGIC;
		JUMPC :  IN  STD_LOGIC;
		JUMPNC :  IN  STD_LOGIC;
		JUMP :  IN  STD_LOGIC;
		CARRY_REG :  IN  STD_LOGIC;
		EXECUTE :  IN  STD_LOGIC;
		INCREMENT :  IN  STD_LOGIC;
		CLK :  IN  STD_LOGIC;
		CLR :  IN  STD_LOGIC;
		ZERO_REG :  IN  STD_LOGIC;
		EN_PC :  OUT  STD_LOGIC;
		jump_not_taken :  OUT  STD_LOGIC
	);
END jump_detector_FF;

ARCHITECTURE bdf_type OF jump_detector_FF IS 

COMPONENT d_flip_flop_ac
	PORT(D : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 CLR : IN STD_LOGIC;
		 Q : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;


BEGIN 
jump_not_taken <= SYNTHESIZED_WIRE_5;
SYNTHESIZED_WIRE_11 <= '0';



SYNTHESIZED_WIRE_3 <= NOT(ZERO_REG);



SYNTHESIZED_WIRE_4 <= NOT(CARRY_REG);



SYNTHESIZED_WIRE_2 <= NOT(SYNTHESIZED_WIRE_14);


EN_PC <= SYNTHESIZED_WIRE_1;




b2v_inst15 : d_flip_flop_ac
PORT MAP(D => SYNTHESIZED_WIRE_2,
		 CLK => CLK,
		 CLR => CLR,
		 Q => SYNTHESIZED_WIRE_5);


SYNTHESIZED_WIRE_7 <= JUMPZ AND ZERO_REG;


SYNTHESIZED_WIRE_9 <= JUMPNZ AND SYNTHESIZED_WIRE_3;


SYNTHESIZED_WIRE_8 <= JUMPC AND CARRY_REG;


SYNTHESIZED_WIRE_10 <= JUMPNC AND SYNTHESIZED_WIRE_4;


SYNTHESIZED_WIRE_13 <= INCREMENT AND SYNTHESIZED_WIRE_5;


SYNTHESIZED_WIRE_12 <= EXECUTE AND SYNTHESIZED_WIRE_14;


SYNTHESIZED_WIRE_14 <= SYNTHESIZED_WIRE_7 OR SYNTHESIZED_WIRE_8 OR SYNTHESIZED_WIRE_9 OR SYNTHESIZED_WIRE_10 OR JUMP OR SYNTHESIZED_WIRE_11;


SYNTHESIZED_WIRE_1 <= SYNTHESIZED_WIRE_12 OR SYNTHESIZED_WIRE_13;


END bdf_type;