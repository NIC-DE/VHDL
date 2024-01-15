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
-- CREATED		"Sat Dec 09 23:40:05 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY D_flip_flop_CE_AC IS 
	PORT
	(
		clr :  IN  STD_LOGIC;
		ce :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		D :  IN  STD_LOGIC;
		Q :  OUT  STD_LOGIC
	);
END D_flip_flop_CE_AC;

ARCHITECTURE bdf_type OF D_flip_flop_CE_AC IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;


BEGIN 



SYNTHESIZED_WIRE_0 <= NOT(clr);



PROCESS(clk,SYNTHESIZED_WIRE_0)
BEGIN
IF (SYNTHESIZED_WIRE_0 = '0') THEN
	Q <= '0';
ELSIF (RISING_EDGE(clk)) THEN
	IF (ce = '1') THEN
	Q <= D;
	END IF;
END IF;
END PROCESS;


END bdf_type;