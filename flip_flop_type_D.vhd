-- Copyright (C) 2017 Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions
-- and other software and tools, and its AMPP partner logic
-- functions, and any output files from any of the foregoing
-- (including device programming or simulation files), and any
-- associated documentation or information are expressly subject
-- to the terms and conditions of the Intel Program License
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other
-- applicable license agreement, including, without limitation,
-- that your use is for the sole purpose of programming logic
-- devices manufactured by Intel and sold by Intel or its
-- authorized distributors. Please refer to the applicable
-- agreement for further details.

-- PROGRAM        "Quartus Prime"
-- VERSION        "Version 17.0.0 Build 595 04/25/2017 SJ Lite Edition"
-- CREATED        "Tue Dec 06 17:45:26 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY work;

ENTITY flip_flop_type_D IS
    PORT
    (
        RESET : IN STD_LOGIC;
        CLEAR : IN STD_LOGIC;
        D     : IN STD_LOGIC;
        CLK   : IN STD_LOGIC;
        Q     : OUT STD_LOGIC
    );
END flip_flop_type_D;

ARCHITECTURE bdf_type OF flip_flop_type_D IS
BEGIN
    PROCESS(CLK, CLEAR, RESET)
    BEGIN
        IF (CLEAR = '0') THEN
            Q <= '0';
        ELSIF (RESET = '0') THEN
            Q <= '1';
        ELSIF (RISING_EDGE(CLK)) THEN
            Q <= D;
        END IF;
    END PROCESS;
END bdf_type;
