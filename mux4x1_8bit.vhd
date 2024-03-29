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
-- CREATED		"Sat Jun 06 10:46:24 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY mux4x1_8bit IS 
	PORT
	(
		SEL0 :  IN  STD_LOGIC;
		SEL1 :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		C :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		D :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		Z :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END mux4x1_8bit;

ARCHITECTURE bdf_type OF mux4x1_8bit IS 

COMPONENT mux2x1_8bit
	PORT(SEL : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Z : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_inst : mux2x1_8bit
PORT MAP(SEL => SEL0,
		 A => A,
		 B => B,
		 Z => SYNTHESIZED_WIRE_0);


b2v_inst1 : mux2x1_8bit
PORT MAP(SEL => SEL0,
		 A => C,
		 B => D,
		 Z => SYNTHESIZED_WIRE_1);


b2v_inst2 : mux2x1_8bit
PORT MAP(SEL => SEL1,
		 A => SYNTHESIZED_WIRE_0,
		 B => SYNTHESIZED_WIRE_1,
		 Z => Z);


END bdf_type;