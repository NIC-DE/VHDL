 
	
library ieee;
use ieee.std_logic_1164.all;

entity clk100Hz is
  port (
    clkin, reset: in std_logic;
    clkout: out std_logic
  );
end clk100Hz;

architecture behavioral of clk100Hz is
  signal tmp: std_logic;
  signal counter: integer range 0 to 249999 := 0;

begin
  process (clkin, reset)
  begin
    if reset = '1' then
      tmp <= '0';
      counter <= 0; -- Use integer value instead of '0'
    elsif rising_edge(clkin) then
      if counter = 249999 then
        tmp <= not(tmp);
        counter <= 0; -- Use integer value instead of '0'
      else
        counter <= counter + 1; -- Use integer value instead of '1'
      end if;
    end if;
  end process;

  clkout <= tmp;
end behavioral;

