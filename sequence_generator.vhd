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
-- CREATED		"Sat Sep 12 23:45:40 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY sequence_generator IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		CE :  IN  STD_LOGIC;
		CLR :  IN  STD_LOGIC;
		INCREMENT :  OUT  STD_LOGIC;
		FETCH :  OUT  STD_LOGIC;
		DECODE :  OUT  STD_LOGIC;
		EXECUTE :  OUT  STD_LOGIC
	);
END sequence_generator;

ARCHITECTURE bdf_type OF sequence_generator IS 

COMPONENT d_flip_flop_ce_ac
	PORT(D : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 CE : IN STD_LOGIC;
		 CLR : IN STD_LOGIC;
		 Q : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	DFFE_inst1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;


BEGIN 
INCREMENT <= SYNTHESIZED_WIRE_1;
FETCH <= DFFE_inst1;
DECODE <= SYNTHESIZED_WIRE_2;
EXECUTE <= SYNTHESIZED_WIRE_3;



PROCESS(CLK,SYNTHESIZED_WIRE_0)
BEGIN
IF (SYNTHESIZED_WIRE_0 = '0') THEN
	DFFE_inst1 <= '1';
ELSIF (RISING_EDGE(CLK)) THEN
	IF (CE = '1') THEN
	DFFE_inst1 <= SYNTHESIZED_WIRE_1;
	END IF;
END IF;
END PROCESS;


b2v_inst2 : d_flip_flop_ce_ac
PORT MAP(D => DFFE_inst1,
		 CLK => CLK,
		 CE => CE,
		 CLR => CLR,
		 Q => SYNTHESIZED_WIRE_2);


b2v_inst3 : d_flip_flop_ce_ac
PORT MAP(D => SYNTHESIZED_WIRE_2,
		 CLK => CLK,
		 CE => CE,
		 CLR => CLR,
		 Q => SYNTHESIZED_WIRE_3);


b2v_inst4 : d_flip_flop_ce_ac
PORT MAP(D => SYNTHESIZED_WIRE_3,
		 CLK => CLK,
		 CE => CE,
		 CLR => CLR,
		 Q => SYNTHESIZED_WIRE_1);


SYNTHESIZED_WIRE_0 <= NOT(CLR);



END bdf_type;