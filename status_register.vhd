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
-- CREATED		"Sat Sep 12 21:08:47 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY status_register IS 
	PORT
	(
		Carry :  IN  STD_LOGIC;
		Zero :  IN  STD_LOGIC;
		CLK :  IN  STD_LOGIC;
		CLR :  IN  STD_LOGIC;
		ADD :  IN  STD_LOGIC;
		SUB :  IN  STD_LOGIC;
		BITAND :  IN  STD_LOGIC;
		CARRY_REG :  OUT  STD_LOGIC;
		ZERO_REG :  OUT  STD_LOGIC
	);
END status_register;

ARCHITECTURE bdf_type OF status_register IS 

COMPONENT d_flip_flop_ce_ac
	PORT(D : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 CE : IN STD_LOGIC;
		 CLR : IN STD_LOGIC;
		 Q : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;


BEGIN 



b2v_inst : d_flip_flop_ce_ac
PORT MAP(D => Carry,
		 CLK => CLK,
		 CE => SYNTHESIZED_WIRE_2,
		 CLR => CLR,
		 Q => CARRY_REG);


b2v_inst1 : d_flip_flop_ce_ac
PORT MAP(D => Zero,
		 CLK => CLK,
		 CE => SYNTHESIZED_WIRE_2,
		 CLR => CLR,
		 Q => ZERO_REG);


SYNTHESIZED_WIRE_2 <= SUB OR BITAND OR ADD;


END bdf_type;