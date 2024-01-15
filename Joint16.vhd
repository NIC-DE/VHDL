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
-- CREATED		"Thu Sep 17 22:44:18 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Joint16 IS 
	PORT
	(
		High :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		Low :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		Z :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END Joint16;

ARCHITECTURE bdf_type OF Joint16 IS 

SIGNAL	Z_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(15 DOWNTO 0);


BEGIN 


Z_ALTERA_SYNTHESIZED(15) <= High(7);


Z_ALTERA_SYNTHESIZED(14) <= High(6);


Z_ALTERA_SYNTHESIZED(5) <= Low(5);


Z_ALTERA_SYNTHESIZED(4) <= Low(4);


Z_ALTERA_SYNTHESIZED(3) <= Low(3);


Z_ALTERA_SYNTHESIZED(2) <= Low(2);


Z_ALTERA_SYNTHESIZED(1) <= Low(1);


Z_ALTERA_SYNTHESIZED(0) <= Low(0);


Z_ALTERA_SYNTHESIZED(13) <= High(5);


Z_ALTERA_SYNTHESIZED(12) <= High(4);


Z_ALTERA_SYNTHESIZED(11) <= High(3);


Z_ALTERA_SYNTHESIZED(10) <= High(2);


Z_ALTERA_SYNTHESIZED(9) <= High(1);


Z_ALTERA_SYNTHESIZED(8) <= High(0);


Z_ALTERA_SYNTHESIZED(7) <= Low(7);


Z_ALTERA_SYNTHESIZED(6) <= Low(6);


Z <= Z_ALTERA_SYNTHESIZED;

END bdf_type;