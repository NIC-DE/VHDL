library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity FullAdder is
  Port (
    A, B, Cin : in  STD_LOGIC;
    S, Cout  : out STD_LOGIC
  );
end FullAdder;

architecture Behavioral of FullAdder is
begin
  process (A, B, Cin)
  begin
    S <= A XOR B XOR Cin;
    Cout <= (A AND B) OR (B AND Cin) OR (Cin AND A);
  end process;
end Behavioral;
