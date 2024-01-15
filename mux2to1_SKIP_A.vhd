
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2x1 is
  Port (
    S   : in  STD_LOGIC;
    D0, D1 : in  STD_LOGIC;
    Y   : out STD_LOGIC
  );
end mux2x1 ;

architecture dataflow of mux2x1 is
begin
  process (S)
  begin
    case S is
      when '0' =>
        Y <= D0;
      when '1' =>
        Y <= D1;
      when others =>
        Y <= 'X'; 
    end case;
  end process;
end dataflow;
