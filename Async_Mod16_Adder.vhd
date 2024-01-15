
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Async_Mod16_adder is
    Port ( Clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR(3 downto 0));
end Async_Mod16_adder;

architecture Behavioral of Async_Mod16_adder is
    signal tmp : STD_LOGIC_VECTOR(3 downto 0);
begin
    process (Clock, Reset)
    begin
        if Reset = '1' then
            tmp <= "0000";
        elsif clock'event and clock ='0' then             
                tmp <=tmp + 1;           
        end if;
    end process;

    Q <= tmp;

end Behavioral;
