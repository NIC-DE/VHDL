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
-- CREATED		"Fri Sep 04 16:56:42 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY register_16 IS 
	PORT
	(
		CLR :  IN  STD_LOGIC;
		CE :  IN  STD_LOGIC;
		D0 :  IN  STD_LOGIC;
		D1 :  IN  STD_LOGIC;
		D2 :  IN  STD_LOGIC;
		D3 :  IN  STD_LOGIC;
		D4 :  IN  STD_LOGIC;
		D5 :  IN  STD_LOGIC;
		D6 :  IN  STD_LOGIC;
		D7 :  IN  STD_LOGIC;
		D8 :  IN  STD_LOGIC;
		D9 :  IN  STD_LOGIC;
		D10 :  IN  STD_LOGIC;
		D11 :  IN  STD_LOGIC;
		D12 :  IN  STD_LOGIC;
		D13 :  IN  STD_LOGIC;
		CLK :  IN  STD_LOGIC;
		D14 :  IN  STD_LOGIC;
		D15 :  IN  STD_LOGIC;
		Q0 :  OUT  STD_LOGIC;
		Q1 :  OUT  STD_LOGIC;
		Q2 :  OUT  STD_LOGIC;
		Q3 :  OUT  STD_LOGIC;
		Q4 :  OUT  STD_LOGIC;
		Q5 :  OUT  STD_LOGIC;
		Q6 :  OUT  STD_LOGIC;
		Q7 :  OUT  STD_LOGIC;
		Q8 :  OUT  STD_LOGIC;
		Q9 :  OUT  STD_LOGIC;
		Q10 :  OUT  STD_LOGIC;
		Q11 :  OUT  STD_LOGIC;
		Q12 :  OUT  STD_LOGIC;
		Q13 :  OUT  STD_LOGIC;
		Q14 :  OUT  STD_LOGIC;
		Q15 :  OUT  STD_LOGIC
	);
END register_16;

ARCHITECTURE bdf_type OF register_16 IS 

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



BEGIN 



b2v_inst : register_8
PORT MAP(D0 => D0,
		 D1 => D1,
		 D2 => D2,
		 D3 => D3,
		 D4 => D4,
		 D5 => D5,
		 D6 => D6,
		 D7 => D7,
		 CLK => CLK,
		 CE => CE,
		 CLR => CLR,
		 Q0 => Q0,
		 Q1 => Q1,
		 Q2 => Q2,
		 Q3 => Q3,
		 Q4 => Q4,
		 Q5 => Q5,
		 Q6 => Q6,
		 Q7 => Q7);


b2v_inst1 : register_8
PORT MAP(D0 => D8,
		 D1 => D9,
		 D2 => D10,
		 D3 => D11,
		 D4 => D12,
		 D5 => D13,
		 D6 => D14,
		 D7 => D15,
		 CLK => CLK,
		 CE => CE,
		 CLR => CLR,
		 Q0 => Q8,
		 Q1 => Q9,
		 Q2 => Q10,
		 Q3 => Q11,
		 Q4 => Q12,
		 Q5 => Q13,
		 Q6 => Q14,
		 Q7 => Q15);


END bdf_type;