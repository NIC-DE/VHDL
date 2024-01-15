library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2to1 is
    Port ( S : in STD_LOGIC;
           I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           Z : out STD_LOGIC);
end MUX_2to1;

architecture Behavioral of MUX_2to1 is
begin
    process (S, I0, I1)
    begin
        if S = '0' then
            Z <= I0;
        else
            Z <= I1;
        end if;
    end process;

end Behavioral;
