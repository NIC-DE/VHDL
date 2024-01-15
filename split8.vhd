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
-- CREATED		"Thu Sep 17 23:04:34 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY split8 IS 
	PORT
	(
		A :  IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
		High :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		Low :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END split8;

ARCHITECTURE bdf_type OF split8 IS 

SIGNAL	High_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	Low_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 


High_ALTERA_SYNTHESIZED(7) <= A(15);


High_ALTERA_SYNTHESIZED(6) <= A(14);


Low_ALTERA_SYNTHESIZED(5) <= A(5);


Low_ALTERA_SYNTHESIZED(4) <= A(4);


Low_ALTERA_SYNTHESIZED(3) <= A(3);


Low_ALTERA_SYNTHESIZED(2) <= A(2);


Low_ALTERA_SYNTHESIZED(1) <= A(1);


Low_ALTERA_SYNTHESIZED(0) <= A(0);


High_ALTERA_SYNTHESIZED(5) <= A(13);


High_ALTERA_SYNTHESIZED(4) <= A(12);


High_ALTERA_SYNTHESIZED(3) <= A(11);


High_ALTERA_SYNTHESIZED(2) <= A(10);


High_ALTERA_SYNTHESIZED(1) <= A(9);


High_ALTERA_SYNTHESIZED(0) <= A(8);


Low_ALTERA_SYNTHESIZED(7) <= A(7);


Low_ALTERA_SYNTHESIZED(6) <= A(6);


High <= High_ALTERA_SYNTHESIZED;
Low <= Low_ALTERA_SYNTHESIZED;

END bdf_type;