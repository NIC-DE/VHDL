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
-- CREATED		"Fri Sep 04 16:38:30 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY register_8 IS 
	PORT
	(
		CLR :  IN  STD_LOGIC;
		CE :  IN  STD_LOGIC;
		CLK :  IN  STD_LOGIC;
		D7 :  IN  STD_LOGIC;
		D6 :  IN  STD_LOGIC;
		D5 :  IN  STD_LOGIC;
		D4 :  IN  STD_LOGIC;
		D0 :  IN  STD_LOGIC;
		D1 :  IN  STD_LOGIC;
		D2 :  IN  STD_LOGIC;
		D3 :  IN  STD_LOGIC;
		Q1 :  OUT  STD_LOGIC;
		Q0 :  OUT  STD_LOGIC;
		Q2 :  OUT  STD_LOGIC;
		Q3 :  OUT  STD_LOGIC;
		Q4 :  OUT  STD_LOGIC;
		Q5 :  OUT  STD_LOGIC;
		Q6 :  OUT  STD_LOGIC;
		Q7 :  OUT  STD_LOGIC
	);
END register_8;

ARCHITECTURE bdf_type OF register_8 IS 

COMPONENT register_4
	PORT(D0 : IN STD_LOGIC;
		 D1 : IN STD_LOGIC;
		 D2 : IN STD_LOGIC;
		 D3 : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 CE : IN STD_LOGIC;
		 CLR : IN STD_LOGIC;
		 Q0 : OUT STD_LOGIC;
		 Q1 : OUT STD_LOGIC;
		 Q2 : OUT STD_LOGIC;
		 Q3 : OUT STD_LOGIC
	);
END COMPONENT;



BEGIN 



b2v_inst : register_4
PORT MAP(D0 => D0,
		 D1 => D1,
		 D2 => D2,
		 D3 => D3,
		 CLK => CLK,
		 CE => CE,
		 CLR => CLR,
		 Q0 => Q0,
		 Q1 => Q1,
		 Q2 => Q2,
		 Q3 => Q3);


b2v_inst1 : register_4
PORT MAP(D0 => D4,
		 D1 => D5,
		 D2 => D6,
		 D3 => D7,
		 CLK => CLK,
		 CE => CE,
		 CLR => CLR,
		 Q0 => Q4,
		 Q1 => Q5,
		 Q2 => Q6,
		 Q3 => Q7);


END bdf_type;