LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY adder3bit IS
    PORT (
        A, B : IN STD_LOGIC_VECTOR(2 downto 0);
        Cin  : IN STD_LOGIC;
        Sum  : OUT STD_LOGIC_VECTOR(2 downto 0);
        Cout : OUT STD_LOGIC
		  
    );
END adder3bit;

ARCHITECTURE structural OF adder3bit IS
    COMPONENT adder1bit
        PORT (
            inA  : IN STD_LOGIC;
            inB  : IN STD_LOGIC;
            Cin  : IN STD_LOGIC;
            Sum  : OUT STD_LOGIC;
            Cout : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL C : STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL S : STD_LOGIC_VECTOR(2 downto 0);

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
    
    Cout <= C(2);
    Sum  <= S;
END structural;