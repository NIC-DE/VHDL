
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY adder4ALU IS
    PORT (
        A,B: in std_logic_vector(3 downto 0);
        M0,M1: in std_logic;
        S: out std_logic_vector(3 downto 0);
        Cout: out std_logic  
    );
END adder4ALU;

ARCHITECTURE dataflow OF adder4ALU IS

    COMPONENT adder1bit_via_FAcomponent IS
        PORT (
            x1,y1,x2,y2,Cin: in std_logic;
            cout, sout: out std_logic
        );
    END COMPONENT;

    SIGNAL ci: std_logic_vector(4 downto 0);

BEGIN

    ci(0)<=M0 or M1;
    adder1bit_via_FAcomponent0: adder1bit_via_FAcomponent PORT MAP (A(0), B(0),M0,M1,Ci(0),S(0),ci(1));
    adder1bit_via_FAcomponent1: adder1bit_via_FAcomponent PORT MAP (A(1), B(1),M0,M1,Ci(1),S(1),ci(2));
    adder1bit_via_FAcomponent2: adder1bit_via_FAcomponent PORT MAP (A(2), B(2),M0,M1,Ci(2),S(2),ci(3));
    adder1bit_via_FAcomponent3: adder1bit_via_FAcomponent PORT MAP (A(3), B(3),M0,M1,Ci(3),S(3),ci(4));
    Cout<=Ci(4);

END dataflow;
