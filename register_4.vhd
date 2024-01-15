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
-- CREATED		"Fri Sep 04 14:19:31 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY register_4 IS 
	PORT
	(
		CLR :  IN  STD_LOGIC;
		CE :  IN  STD_LOGIC;
		CLK :  IN  STD_LOGIC;
		D0 :  IN  STD_LOGIC;
		D1 :  IN  STD_LOGIC;
		D2 :  IN  STD_LOGIC;
		D3 :  IN  STD_LOGIC;
		Q0 :  OUT  STD_LOGIC;
		Q1 :  OUT  STD_LOGIC;
		Q2 :  OUT  STD_LOGIC;
		Q3 :  OUT  STD_LOGIC
	);
END register_4;

ARCHITECTURE bdf_type OF register_4 IS 

COMPONENT d_flip_flop_ce_ac
	PORT(D : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 CE : IN STD_LOGIC;
		 CLR : IN STD_LOGIC;
		 Q : OUT STD_LOGIC
	);
END COMPONENT;



BEGIN 



b2v_inst : d_flip_flop_ce_ac
PORT MAP(D => D0,
		 CLK => CLK,
		 CE => CE,
		 CLR => CLR,
		 Q => Q0);


b2v_inst2 : d_flip_flop_ce_ac
PORT MAP(D => D1,
		 CLK => CLK,
		 CE => CE,
		 CLR => CLR,
		 Q => Q1);


b2v_inst3 : d_flip_flop_ce_ac
PORT MAP(D => D2,
		 CLK => CLK,
		 CE => CE,
		 CLR => CLR,
		 Q => Q2);


b2v_inst4 : d_flip_flop_ce_ac
PORT MAP(D => D3,
		 CLK => CLK,
		 CE => CE,
		 CLR => CLR,
		 Q => Q3);


END bdf_type;