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
-- CREATED		"Fri Jun 05 13:55:34 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY mux2x1_8bit IS 
	PORT
	(
		SEL :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		Z :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END mux2x1_8bit;

ARCHITECTURE bdf_type OF mux2x1_8bit IS 

COMPONENT mux2x1_1bit
	PORT(A : IN STD_LOGIC;
		 SEL : IN STD_LOGIC;
		 B : IN STD_LOGIC;
		 Z : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	Z_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_inst : mux2x1_1bit
PORT MAP(A => A(0),
		 SEL => SEL,
		 B => B(0),
		 Z => Z_ALTERA_SYNTHESIZED(0));


b2v_inst1 : mux2x1_1bit
PORT MAP(A => A(1),
		 SEL => SEL,
		 B => B(1),
		 Z => Z_ALTERA_SYNTHESIZED(1));


b2v_inst2 : mux2x1_1bit
PORT MAP(A => A(2),
		 SEL => SEL,
		 B => B(2),
		 Z => Z_ALTERA_SYNTHESIZED(2));


b2v_inst3 : mux2x1_1bit
PORT MAP(A => A(3),
		 SEL => SEL,
		 B => B(3),
		 Z => Z_ALTERA_SYNTHESIZED(3));


b2v_inst4 : mux2x1_1bit
PORT MAP(A => A(4),
		 SEL => SEL,
		 B => B(4),
		 Z => Z_ALTERA_SYNTHESIZED(4));


b2v_inst5 : mux2x1_1bit
PORT MAP(A => A(5),
		 SEL => SEL,
		 B => B(5),
		 Z => Z_ALTERA_SYNTHESIZED(5));


b2v_inst6 : mux2x1_1bit
PORT MAP(A => A(6),
		 SEL => SEL,
		 B => B(6),
		 Z => Z_ALTERA_SYNTHESIZED(6));


b2v_inst7 : mux2x1_1bit
PORT MAP(A => A(7),
		 SEL => SEL,
		 B => B(7),
		 Z => Z_ALTERA_SYNTHESIZED(7));

Z <= Z_ALTERA_SYNTHESIZED;

END bdf_type;