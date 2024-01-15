library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FF_with_Clear is
    Port ( D : in STD_LOGIC;
           Clock : in STD_LOGIC;
           Clear : in STD_LOGIC;
           Q : out STD_LOGIC);
end D_FF_with_Clear;

architecture Behavioral of D_FF_with_Clear is
begin
    process (Clock, Clear)
    begin
        if Clear = '1' then
            Q <= '0';
        elsif rising_edge(Clock) then
            Q <= D;
        end if;
    end process;

end Behavioral;
