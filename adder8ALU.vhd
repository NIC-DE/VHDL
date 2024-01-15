LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY adder8ALU IS
    GENERIC (
        N : integer := 8
    );
    PORT (
        A,B: in std_logic_vector(N-1 downto 0);
        M0,M1: in std_logic;
        S: out std_logic_vector(N-1 downto 0);
        Cout: out std_logic  
    );
END adder8ALU;

ARCHITECTURE dataflow OF adder8ALU IS

    COMPONENT adder1bit_via_FAcomponent IS
        PORT (
            x1,y1,x2,y2,Cin: in std_logic;
            cout, sout: out std_logic
        );
    END COMPONENT;

    SIGNAL ci: std_logic_vector(N downto 0);

BEGIN

    ci(0) <= M0 or M1;
    adder1bit_via_FAcomponent0: adder1bit_via_FAcomponent PORT MAP (A(0), B(0),M0,M1,ci(0),S(0),ci(1));
    adder1bit_via_FAcomponent1: adder1bit_via_FAcomponent PORT MAP (A(1), B(1),M0,M1,ci(1),S(1),ci(2));
    adder1bit_via_FAcomponent2: adder1bit_via_FAcomponent PORT MAP (A(2), B(2),M0,M1,ci(2),S(2),ci(3));
    adder1bit_via_FAcomponent3: adder1bit_via_FAcomponent PORT MAP (A(3), B(3),M0,M1,ci(3),S(3),ci(4));
    adder1bit_via_FAcomponent4: adder1bit_via_FAcomponent PORT MAP (A(4), B(4),M0,M1,ci(4),S(4),ci(5));
    adder1bit_via_FAcomponent5: adder1bit_via_FAcomponent PORT MAP (A(5), B(5),M0,M1,ci(5),S(5),ci(6));
    adder1bit_via_FAcomponent6: adder1bit_via_FAcomponent PORT MAP (A(6), B(6),M0,M1,ci(6),S(6),ci(7));
    adder1bit_via_FAcomponent7: adder1bit_via_FAcomponent PORT MAP (A(7), B(7),M0,M1,ci(7),S(7),ci(8));
    Cout <= ci(8);

END dataflow;
