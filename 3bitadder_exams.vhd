library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ThreeBitAdder is
  Port (
    A, B    : in  STD_LOGIC_VECTOR(2 downto 0);
    Cin     : in  STD_LOGIC;
    Sum     : out STD_LOGIC_VECTOR(2 downto 0);
    Cout    : out STD_LOGIC
  );
end ThreeBitAdder;

architecture Behavioral of ThreeBitAdder is
  signal Cout0, Cout1 : STD_LOGIC;
  signal S0, S1, S2  : STD_LOGIC;
begin
 
  FA0 : entity work.FullAdder
    port map (
      A    => A(0),
      B    => B(0),
      Cin  => Cin,
      S    => S0,
      Cout => Cout0
    );


  FA1 : entity work.FullAdder
    port map (
      A    => A(1),
      B    => B(1),
      Cin  => Cout0,
      S    => S1,
      Cout => Cout1
    );

 
  FA2 : entity work.FullAdder
    port map (
      A    => A(2),
      B    => B(2),
      Cin  => Cout1,
      S    => S2,
      Cout => Cout
    );

 
  Sum <= S2 & S1 & S0;
end Behavioral;
