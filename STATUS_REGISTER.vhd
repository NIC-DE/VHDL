-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
-- CREATED		"Sat Dec 09 22:16:10 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY STATUS_REGISTER IS 
	PORT
	(
		CARRY :  IN  STD_LOGIC;
		CLOCK :  IN  STD_LOGIC;
		CLR :  IN  STD_LOGIC;
		ZERO :  IN  STD_LOGIC;
		ADD :  IN  STD_LOGIC;
		SUB :  IN  STD_LOGIC;
		BITAND :  IN  STD_LOGIC;
		CARRY_REG :  OUT  STD_LOGIC;
		ZERO_REG :  OUT  STD_LOGIC
	);
END STATUS_REGISTER;

ARCHITECTURE bdf_type OF STATUS_REGISTER IS 

COMPONENT d_flip_flop_ce_ac
	PORT(D : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 ce : IN STD_LOGIC;
		 clr : IN STD_LOGIC;
		 Q : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;


BEGIN 



b2v_inst : d_flip_flop_ce_ac
PORT MAP(D => ZERO,
		 clk => CLOCK,
		 ce => SYNTHESIZED_WIRE_2,
		 clr => CLR,
		 Q => ZERO_REG);


b2v_inst1 : d_flip_flop_ce_ac
PORT MAP(D => CARRY,
		 clk => CLOCK,
		 ce => SYNTHESIZED_WIRE_2,
		 clr => CLR,
		 Q => CARRY_REG);


SYNTHESIZED_WIRE_2 <= SUB OR BITAND OR ADD;


END bdf_type;