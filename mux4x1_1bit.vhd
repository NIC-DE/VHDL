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
-- CREATED		"Sat Jun 06 10:34:39 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY mux4x1_1bit IS 
	PORT
	(
		A :  IN  STD_LOGIC;
		B :  IN  STD_LOGIC;
		C :  IN  STD_LOGIC;
		D :  IN  STD_LOGIC;
		SEL0 :  IN  STD_LOGIC;
		SEL1 :  IN  STD_LOGIC;
		Z :  OUT  STD_LOGIC
	);
END mux4x1_1bit;

ARCHITECTURE bdf_type OF mux4x1_1bit IS 

COMPONENT mux2x1_1bit
	PORT(A : IN STD_LOGIC;
		 SEL : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 Z : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;


BEGIN 



b2v_inst : mux2x1_1bit
PORT MAP(A => A,
		 SEL => SEL0,
		 B => B,
		 Z => SYNTHESIZED_WIRE_0);


b2v_inst1 : mux2x1_1bit
PORT MAP(A => C,
		 SEL => SEL0,
		 B => D,
		 Z => SYNTHESIZED_WIRE_1);


b2v_inst2 : mux2x1_1bit
PORT MAP(A => SYNTHESIZED_WIRE_0,
		 SEL => SEL1,
		 B => SYNTHESIZED_WIRE_1,
		 Z => Z);


END bdf_type;