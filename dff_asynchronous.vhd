library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DFF_AsyncClear is
  Port (
    clk   : in  STD_LOGIC;
    clear : in  STD_LOGIC;
    D     : in  STD_LOGIC;
    Q     : out STD_LOGIC
  );
end DFF_AsyncClear;

architecture Behavioral of DFF_AsyncClear is
  
begin
  process (clk, clear)
  begin
    if clear = '1' then
      Q <= '0';
    elsif rising_edge(clk) then
      Q <= D;
    end if;
  end process;

end Behavioral;
