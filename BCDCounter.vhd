library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- Use numeric_std for '+' operator and rising_edge
use ieee.std_logic_unsigned.all;

entity BCDCounter is
  port (
    Countclock, reset, enable: in std_logic;
    bcd1, bcd0: out std_logic_vector(3 downto 0)
  );
end BCDCounter;

architecture beh of BCDCounter is
  signal tmp0: std_logic_vector(3 downto 0) := "0000";
  signal tmp1: std_logic_vector(3 downto 0) := "0000";
begin
  
process (Countclock, reset, enable)
  begin
    if reset = '1' then
      tmp1 <= "0000";
      tmp0 <= "0000";
    elsif rising_edge(Countclock) and enable = '1' then -- active high
      if tmp0 = "1001" then
        tmp0 <= "0000";
        if tmp1 = "1001" then
          tmp1 <= "1001"; -- Reset tmp1 to "0000" instead of keeping "1001"
        else
          tmp1 <= tmp1 + '1';
        end if;
      else
        tmp0 <= tmp0 + '1';
      end if;
    end if;
    bcd0 <= tmp0;
    bcd1 <= tmp1;
  end process;
end beh;