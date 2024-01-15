
LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY and_gate_revision IS
    PORT (
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        Y : OUT STD_LOGIC
    );
END entity and_gate_revision;

ARCHITECTURE bdf_type OF and_gate_revision IS
BEGIN
    Y <= A AND B;
END architecture bdf_type;
