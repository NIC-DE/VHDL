
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ClickTimer is
    Port (
        clk      : in  STD_LOGIC;          -- eisodos clock
        btn      : in  STD_LOGIC;          -- eisodos button
        reset    : in  STD_LOGIC;          -- Reset input
        seg_out  : out STD_LOGIC_VECTOR(6 downto 0);   -- 7-segment eksodos
        led_out  : out STD_LOGIC_VECTOR(3 downto 0)     -- LED eksodos
    );
end ClickTimer;

architecture Behavioral of ClickTimer is
    signal counter : UNSIGNED(9 downto 0);     -- sima metriti
    
    function to_bcd(value : UNSIGNED) return STD_LOGIC_VECTOR is
        variable temp : UNSIGNED(9 downto 0);
    begin
        for i in 0 to 9 loop
            if value >= to_unsigned(i, value'length) * to_unsigned(10, value'length) then
                temp := to_unsigned(i, temp'length);
            end if;
        end loop;
        return std_logic_vector(temp(6 downto 0));
    end function;
    
begin
    process(clk, reset)
    begin
        if reset = '1' then
            counter <= (others => '0');       -- midenismos metriti
        elsif rising_edge(clk) then
            if btn = '1' then
                if counter = 99 then
                    counter <= counter;      -- den anevazei ton metriti panv apo 99
                else
                    counter <= counter + 1;  -- afkise ton metriti
                end if;
            end if;
        end if;
    end process;

    -- metatropi se bcd
    seg_out <= to_bcd(unsigned(counter));
    
    -- metatropi toy led se eksodo
    led_out <= std_logic_vector(counter(3 downto 0));

end Behavioral;
