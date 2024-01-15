LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY adder1bit_via_FAcomponent IS
    PORT (
        x1, y1, x2, y2,Cin: in std_logic;
        cout, sout : out std_logic
    );
END adder1bit_via_FAcomponent;

ARCHITECTURE dataflow OF adder1bit_via_FAcomponent IS

   COMPONENT adder1bit IS
    PORT (
        inA  : IN STD_LOGIC;
        inB  : IN STD_LOGIC;
        Cin  : IN STD_LOGIC;
        S  :   OUT STD_LOGIC;
        Cout : OUT STD_LOGIC
    );
END COMPONENT;

    SIGNAL z1, z2: std_logic; 

BEGIN 

  adder1bit0:adder1bit PORT MAP (z1,z2,Cin,cout,sout);
  z1<=x1 xor y1;
  z2<=x2 xor y2;
     
END dataflow;
