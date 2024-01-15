library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DFF_syncClear is
  Port (
    clk   : in  STD_LOGIC;
    clear : in  STD_LOGIC;
    D     : in  STD_LOGIC;
    Q     : out STD_LOGIC
  );
end DFF_syncClear;

architecture Behavioral of DFF_syncClear is
  
begin
  process (clk, clear)
  begin
  if rising_edge(clk) then
    if clear = '1' then
      Q <= '0';
      else
      Q <= D;
    end if;
  end if;
end process;

end Behavioral;
