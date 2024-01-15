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
-- CREATED		"Fri Sep 18 13:09:49 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY constant_ram IS 
	PORT
	(
		Low :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		Z :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END constant_ram;

ARCHITECTURE bdf_type OF constant_ram IS 

COMPONENT replicate
	PORT(A : IN STD_LOGIC;
		 Z : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT joint16
	PORT(High : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Low : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Z : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 
SYNTHESIZED_WIRE_0 <= '0';



b2v_inst : replicate
PORT MAP(A => SYNTHESIZED_WIRE_0,
		 Z => SYNTHESIZED_WIRE_1);


b2v_inst7 : joint16
PORT MAP(High => SYNTHESIZED_WIRE_1,
		 Low => Low,
		 Z => Z);



END bdf_type;