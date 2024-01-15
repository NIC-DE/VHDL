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
-- VERSION		"Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"
-- CREATED		"Fri Dec 11 13:12:34 2020"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY simple_CPU IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		CLR :  IN  STD_LOGIC;
		ACC :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		dout :  OUT  STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END simple_CPU;

ARCHITECTURE bdf_type OF simple_CPU IS 

COMPONENT mux2x1_8bit
	PORT(SEL : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Z : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

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

COMPONENT zero_detector
	PORT(A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 zero_det : OUT STD_LOGIC
	);
END COMPONENT;

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

COMPONENT decoder
	PORT(CLK : IN STD_LOGIC;
		 CE : IN STD_LOGIC;
		 CLR : IN STD_LOGIC;
		 Carry : IN STD_LOGIC;
		 Zero : IN STD_LOGIC;
		 IR : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 RAM : OUT STD_LOGIC;
		 ALU_S0 : OUT STD_LOGIC;
		 ALU_S1 : OUT STD_LOGIC;
		 ALU_S2 : OUT STD_LOGIC;
		 ALU_S3 : OUT STD_LOGIC;
		 ALU_S4 : OUT STD_LOGIC;
		 MUXA : OUT STD_LOGIC;
		 MUXB : OUT STD_LOGIC;
		 MUXC : OUT STD_LOGIC;
		 EN_IN : OUT STD_LOGIC;
		 EN_DA : OUT STD_LOGIC;
		 EN_PC : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT ram
	PORT(we : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 addr : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

COMPONENT register_16
	PORT(D0 : IN STD_LOGIC;
		 D1 : IN STD_LOGIC;
		 D2 : IN STD_LOGIC;
		 D3 : IN STD_LOGIC;
		 D4 : IN STD_LOGIC;
		 D5 : IN STD_LOGIC;
		 D6 : IN STD_LOGIC;
		 D7 : IN STD_LOGIC;
		 D8 : IN STD_LOGIC;
		 D9 : IN STD_LOGIC;
		 D10 : IN STD_LOGIC;
		 D11 : IN STD_LOGIC;
		 D12 : IN STD_LOGIC;
		 D13 : IN STD_LOGIC;
		 D14 : IN STD_LOGIC;
		 D15 : IN STD_LOGIC;
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
		 Q7 : OUT STD_LOGIC;
		 Q8 : OUT STD_LOGIC;
		 Q9 : OUT STD_LOGIC;
		 Q10 : OUT STD_LOGIC;
		 Q11 : OUT STD_LOGIC;
		 Q12 : OUT STD_LOGIC;
		 Q13 : OUT STD_LOGIC;
		 Q14 : OUT STD_LOGIC;
		 Q15 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT split8
	PORT(A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 High : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Low : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT alu
	PORT(S4 : IN STD_LOGIC;
		 S3 : IN STD_LOGIC;
		 S2 : IN STD_LOGIC;
		 S1 : IN STD_LOGIC;
		 S0 : IN STD_LOGIC;
		 A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Cout : OUT STD_LOGIC;
		 Z : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	dout_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	Q :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	QA :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	QB :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	Z :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_22 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 
SYNTHESIZED_WIRE_2 <= '0';
SYNTHESIZED_WIRE_8 <= '1';



PROCESS(CLK)
BEGIN
IF (RISING_EDGE(CLK)) THEN
	SYNTHESIZED_WIRE_26 <= CLR;
END IF;
END PROCESS;


b2v_inst1 : mux2x1_8bit
PORT MAP(SEL => SYNTHESIZED_WIRE_0,
		 A => QB,
		 B => QA,
		 Z => SYNTHESIZED_WIRE_24);


b2v_inst10 : register_8
PORT MAP(D0 => Z(0),
		 D1 => Z(1),
		 D2 => Z(2),
		 D3 => Z(3),
		 D4 => Z(4),
		 D5 => Z(5),
		 D6 => Z(6),
		 D7 => Z(7),
		 CLK => CLK,
		 CE => SYNTHESIZED_WIRE_1,
		 CLR => SYNTHESIZED_WIRE_26,
		 Q0 => QB(0),
		 Q1 => QB(1),
		 Q2 => QB(2),
		 Q3 => QB(3),
		 Q4 => QB(4),
		 Q5 => QB(5),
		 Q6 => QB(6),
		 Q7 => QB(7));


b2v_inst11 : zero_detector
PORT MAP(A => Z,
		 zero_det => SYNTHESIZED_WIRE_6);


b2v_inst12 : replicate
PORT MAP(A => SYNTHESIZED_WIRE_2,
		 Z => SYNTHESIZED_WIRE_3);


b2v_inst13 : joint16
PORT MAP(High => SYNTHESIZED_WIRE_3,
		 Low => QB,
		 Z => SYNTHESIZED_WIRE_11);



b2v_inst16 : decoder
PORT MAP(CLK => CLK,
		 CE => SYNTHESIZED_WIRE_4,
		 CLR => SYNTHESIZED_WIRE_26,
		 Carry => SYNTHESIZED_WIRE_5,
		 Zero => SYNTHESIZED_WIRE_6,
		 IR => SYNTHESIZED_WIRE_7,
		 RAM => SYNTHESIZED_WIRE_9,
		 ALU_S0 => SYNTHESIZED_WIRE_23,
		 ALU_S1 => SYNTHESIZED_WIRE_22,
		 ALU_S2 => SYNTHESIZED_WIRE_21,
		 ALU_S3 => SYNTHESIZED_WIRE_20,
		 ALU_S4 => SYNTHESIZED_WIRE_19,
		 MUXA => SYNTHESIZED_WIRE_0,
		 MUXB => SYNTHESIZED_WIRE_14,
		 MUXC => SYNTHESIZED_WIRE_17,
		 EN_IN => SYNTHESIZED_WIRE_12,
		 EN_DA => SYNTHESIZED_WIRE_1,
		 EN_PC => SYNTHESIZED_WIRE_13);

SYNTHESIZED_WIRE_4 <= SYNTHESIZED_WIRE_8;




b2v_inst2 : ram
PORT MAP(we => SYNTHESIZED_WIRE_9,
		 clk => CLK,
		 addr => SYNTHESIZED_WIRE_10,
		 din => SYNTHESIZED_WIRE_11,
		 dout => dout_ALTERA_SYNTHESIZED);


b2v_inst3 : register_16
PORT MAP(D0 => dout_ALTERA_SYNTHESIZED(0),
		 D1 => dout_ALTERA_SYNTHESIZED(1),
		 D2 => dout_ALTERA_SYNTHESIZED(2),
		 D3 => dout_ALTERA_SYNTHESIZED(3),
		 D4 => dout_ALTERA_SYNTHESIZED(4),
		 D5 => dout_ALTERA_SYNTHESIZED(5),
		 D6 => dout_ALTERA_SYNTHESIZED(6),
		 D7 => dout_ALTERA_SYNTHESIZED(7),
		 D8 => dout_ALTERA_SYNTHESIZED(8),
		 D9 => dout_ALTERA_SYNTHESIZED(9),
		 D10 => dout_ALTERA_SYNTHESIZED(10),
		 D11 => dout_ALTERA_SYNTHESIZED(11),
		 D12 => dout_ALTERA_SYNTHESIZED(12),
		 D13 => dout_ALTERA_SYNTHESIZED(13),
		 D14 => dout_ALTERA_SYNTHESIZED(14),
		 D15 => dout_ALTERA_SYNTHESIZED(15),
		 CLK => CLK,
		 CE => SYNTHESIZED_WIRE_12,
		 CLR => SYNTHESIZED_WIRE_26,
		 Q0 => Q(0),
		 Q1 => Q(1),
		 Q2 => Q(2),
		 Q3 => Q(3),
		 Q4 => Q(4),
		 Q5 => Q(5),
		 Q6 => Q(6),
		 Q7 => Q(7),
		 Q8 => Q(8),
		 Q9 => Q(9),
		 Q10 => Q(10),
		 Q11 => Q(11),
		 Q12 => Q(12),
		 Q13 => Q(13),
		 Q14 => Q(14),
		 Q15 => Q(15));


b2v_inst4 : split8
PORT MAP(A => Q,
		 High => SYNTHESIZED_WIRE_7,
		 Low => SYNTHESIZED_WIRE_27);


b2v_inst5 : split8
PORT MAP(A => dout_ALTERA_SYNTHESIZED,
		 Low => SYNTHESIZED_WIRE_15);


b2v_inst6 : register_8
PORT MAP(D0 => Z(0),
		 D1 => Z(1),
		 D2 => Z(2),
		 D3 => Z(3),
		 D4 => Z(4),
		 D5 => Z(5),
		 D6 => Z(6),
		 D7 => Z(7),
		 CLK => CLK,
		 CE => SYNTHESIZED_WIRE_13,
		 CLR => SYNTHESIZED_WIRE_26,
		 Q0 => QA(0),
		 Q1 => QA(1),
		 Q2 => QA(2),
		 Q3 => QA(3),
		 Q4 => QA(4),
		 Q5 => QA(5),
		 Q6 => QA(6),
		 Q7 => QA(7));


b2v_inst7 : mux2x1_8bit
PORT MAP(SEL => SYNTHESIZED_WIRE_14,
		 A => SYNTHESIZED_WIRE_15,
		 B => SYNTHESIZED_WIRE_27,
		 Z => SYNTHESIZED_WIRE_25);


b2v_inst8 : mux2x1_8bit
PORT MAP(SEL => SYNTHESIZED_WIRE_17,
		 A => QA,
		 B => SYNTHESIZED_WIRE_27,
		 Z => SYNTHESIZED_WIRE_10);


b2v_inst9 : alu
PORT MAP(S4 => SYNTHESIZED_WIRE_19,
		 S3 => SYNTHESIZED_WIRE_20,
		 S2 => SYNTHESIZED_WIRE_21,
		 S1 => SYNTHESIZED_WIRE_22,
		 S0 => SYNTHESIZED_WIRE_23,
		 A => SYNTHESIZED_WIRE_24,
		 B => SYNTHESIZED_WIRE_25,
		 Cout => SYNTHESIZED_WIRE_5,
		 Z => Z);

ACC <= QB;
dout <= dout_ALTERA_SYNTHESIZED;

END bdf_type;