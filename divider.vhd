-- megafunction wizard: %LPM_COUNTER%
-- GENERATION: STANDARD
-- VERSION: WM1.0
-- MODULE: LPM_COUNTER 

-- ============================================================
-- File Name: divider.vhd
-- Megafunction Name(s):
-- 			LPM_COUNTER
--
-- Simulation Library Files(s):
-- 			lpm
-- ============================================================
-- ************************************************************
-- THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--
-- 20.1.0 Build 711 06/05/2020 SJ Lite Edition
-- ************************************************************


--Copyright (C) 2020  Intel Corporation. All rights reserved.
--Your use of Intel Corporation's design tools, logic functions 
--and other software and tools, and any partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Intel Program License 
--Subscription Agreement, the Intel Quartus Prime License Agreement,
--the Intel FPGA IP License Agreement, or other applicable license
--agreement, including, without limitation, that your use is for
--the sole purpose of programming logic devices manufactured by
--Intel and sold by Intel or its authorized distributors.  Please
--refer to the applicable agreement for further details, at
--https://fpgasoftware.intel.com/eula.


LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.all;

ENTITY divider IS
	PORT
	(
		clock		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (25 DOWNTO 0)
	);
END divider;


ARCHITECTURE SYN OF divider IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (25 DOWNTO 0);



	COMPONENT lpm_counter
	GENERIC (
		lpm_direction		: STRING;
		lpm_modulus		: NATURAL;
		lpm_port_updown		: STRING;
		lpm_type		: STRING;
		lpm_width		: NATURAL
	);
	PORT (
			clock	: IN STD_LOGIC ;
			q	: OUT STD_LOGIC_VECTOR (25 DOWNTO 0)
	);
	END COMPONENT;

BEGIN
	q    <= sub_wire0(25 DOWNTO 0);

	LPM_COUNTER_component : LPM_COUNTER
	GENERIC MAP (
		lpm_direction => "UP",
		lpm_modulus => 50000000,
		lpm_port_updown => "PORT_UNUSED",
		lpm_type => "LPM_COUNTER",
		lpm_width => 26
	)
	PORT MAP (
		clock => clock,
		q => sub_wire0
	);



END SYN;

-- ============================================================
-- CNX file retrieval info
-- ============================================================
-- Retrieval info: PRIVATE: ACLR NUMERIC "0"
-- Retrieval info: PRIVATE: ALOAD NUMERIC "0"
-- Retrieval info: PRIVATE: ASET NUMERIC "0"
-- Retrieval info: PRIVATE: ASET_ALL1 NUMERIC "1"
-- Retrieval info: PRIVATE: CLK_EN NUMERIC "0"
-- Retrieval info: PRIVATE: CNT_EN NUMERIC "0"
-- Retrieval info: PRIVATE: CarryIn NUMERIC "0"
-- Retrieval info: PRIVATE: CarryOut NUMERIC "0"
-- Retrieval info: PRIVATE: Direction NUMERIC "0"
-- Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Cyclone IV E"
-- Retrieval info: PRIVATE: ModulusCounter NUMERIC "1"
-- Retrieval info: PRIVATE: ModulusValue NUMERIC "50000000"
-- Retrieval info: PRIVATE: SCLR NUMERIC "0"
-- Retrieval info: PRIVATE: SLOAD NUMERIC "0"
-- Retrieval info: PRIVATE: SSET NUMERIC "0"
-- Retrieval info: PRIVATE: SSET_ALL1 NUMERIC "1"
-- Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
-- Retrieval info: PRIVATE: nBit NUMERIC "26"
-- Retrieval info: PRIVATE: new_diagram STRING "1"
-- Retrieval info: LIBRARY: lpm lpm.lpm_components.all
-- Retrieval info: CONSTANT: LPM_DIRECTION STRING "UP"
-- Retrieval info: CONSTANT: LPM_MODULUS NUMERIC "50000000"
-- Retrieval info: CONSTANT: LPM_PORT_UPDOWN STRING "PORT_UNUSED"
-- Retrieval info: CONSTANT: LPM_TYPE STRING "LPM_COUNTER"
-- Retrieval info: CONSTANT: LPM_WIDTH NUMERIC "26"
-- Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
-- Retrieval info: USED_PORT: q 0 0 26 0 OUTPUT NODEFVAL "q[25..0]"
-- Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
-- Retrieval info: CONNECT: q 0 0 26 0 @q 0 0 26 0
-- Retrieval info: GEN_FILE: TYPE_NORMAL divider.vhd TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL divider.inc FALSE
-- Retrieval info: GEN_FILE: TYPE_NORMAL divider.cmp TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL divider.bsf TRUE
-- Retrieval info: GEN_FILE: TYPE_NORMAL divider_inst.vhd FALSE
-- Retrieval info: LIB_FILE: lpm
