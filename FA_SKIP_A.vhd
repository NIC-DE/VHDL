
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FA is
    port (
        A,B,Cin : in std_logic;
        S,Cout : out std_logic
    );
end FA;

architecture dataflow of FA is

begin
	S<=(A xor B) xor Cin;
	Cout<=((A xor B) and Cin) xor (A and B);
end architecture;