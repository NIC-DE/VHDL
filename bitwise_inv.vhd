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
-- CREATED		"Fri Sep 04 20:12:10 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY bitwise_inv IS 
	PORT
	(
		EN :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		Z :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END bitwise_inv;

ARCHITECTURE bdf_type OF bitwise_inv IS 

SIGNAL	Z_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



Z_ALTERA_SYNTHESIZED(0) <= A(0) XOR EN;


Z_ALTERA_SYNTHESIZED(1) <= A(1) XOR EN;


Z_ALTERA_SYNTHESIZED(2) <= A(2) XOR EN;


Z_ALTERA_SYNTHESIZED(3) <= A(3) XOR EN;


Z_ALTERA_SYNTHESIZED(4) <= A(4) XOR EN;


Z_ALTERA_SYNTHESIZED(5) <= A(5) XOR EN;


Z_ALTERA_SYNTHESIZED(6) <= A(6) XOR EN;


Z_ALTERA_SYNTHESIZED(7) <= A(7) XOR EN;

Z <= Z_ALTERA_SYNTHESIZED;

END bdf_type;