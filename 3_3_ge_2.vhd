library ieee;
use ieee.std_logic_1164.all;

entity clk100hz is
    port (
        clk_in, reset : in std_logic;
        clk_out : out std_logic
    );
end clk100hz;

architecture behavioural of clk100hz is
    signal tmp : std_logic;
    signal counter : integer range 0 to 499999 := 0;
begin
    process(clk_in, reset)
    begin
        if reset = '1' then
		if counter=499999 then
            tmp <= '0';
            counter <= 0;
        elsif rising_edge(clk_in) then
            tmp <= NOT(tmp);
            counter <= 0;
        else
            counter <= counter + 1;
        end if;
    end process;
    clk_out <= tmp;
end behavioural;
