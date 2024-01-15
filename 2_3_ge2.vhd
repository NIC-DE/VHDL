

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity counter_up_asyn is
    port (
        clock, reset, flag: in std_logic;
        outp: out std_logic_vector(3 downto 0)
    );
end counter_up_asyn;

architecture behavioral of counter_up_asyn is
    signal temp: std_logic_vector(3 downto 0);
begin

    process (clock, reset)
    begin   
        if reset = '1' then 
            temp <= "0000";
        elsif falling_edge(clock) and flag = '1' then
            temp <= temp + 1;
        end if;
    end process;

    outp <= temp;
    
end architecture behavioral;


