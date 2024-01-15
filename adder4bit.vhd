LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY adder4bit IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cin  : IN STD_LOGIC;
        Sum  : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Cout : OUT STD_LOGIC
    );
END adder4bit;

ARCHITECTURE structural OF adder4bit IS
    COMPONENT adder1bit
        PORT (
            inA  : IN STD_LOGIC;
            inB  : IN STD_LOGIC;
            Cin  : IN STD_LOGIC;
            Sum  : OUT STD_LOGIC;
            Cout : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL C : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL S : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    FA0 : adder1bit PORT MAP (
        inA  => A(0),
        inB  => B(0),
        Cin  => Cin,
        Sum  => S(0),
        Cout => C(0)
    );
    FA1 : adder1bit PORT MAP (
        inA  => A(1),
        inB  => B(1),
        Cin  => C(0),
        Sum  => S(1),
        Cout => C(1)
    );
    FA2 : adder1bit PORT MAP (
        inA  => A(2),
        inB  => B(2),
        Cin  => C(1),
        Sum  => S(2),
        Cout => C(2)
    );
    FA3 : adder1bit PORT MAP (
        inA  => A(3),
        inB  => B(3),
        Cin  => C(2),
        Sum  => S(3),
        Cout => C(3)
    );
    Cout <= C(3);
    Sum  <= S;
END structural;
