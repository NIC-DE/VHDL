LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY adder8ALU_new IS
    GENERIC (
        N : integer := 8
    );
    PORT (
        A,B: in std_logic_vector(N-1 downto 0);
        M0,M1: in std_logic;
        S: out std_logic_vector(N-1 downto 0);
        Cout: out std_logic  
    );
END adder8ALU_new;

ARCHITECTURE dataflow OF adder8ALU_new IS

    COMPONENT adder1bit_via_FAcomponent IS
        PORT (
            x1,y1,x2,y2,Cin: in std_logic;
            cout, sout: out std_logic
        );
    END COMPONENT;

    SIGNAL ci: std_logic_vector(N downto 0);

BEGIN

    ci(0) <= M0 or M1;

    gen_adder1bit_via_FAcomponent: FOR i IN 0 TO N-1 GENERATE
        adder1bit_via_FAcomponent_i: adder1bit_via_FAcomponent PORT MAP (A(i), B(i), M0, M1, ci(i), S(i), ci(i+1));
    END GENERATE gen_adder1bit_via_FAcomponent;

    Cout <= ci(N);

END dataflow;
