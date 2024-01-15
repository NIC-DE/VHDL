library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Register_16bit is
    Port ( D : in STD_LOGIC_VECTOR (15 downto 0);
           Load : in STD_LOGIC;
           Clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (15 downto 0));
end Register_16bit;

architecture Behavioral of Register_16bit is
    signal reg_data : STD_LOGIC_VECTOR (15 downto 0);
begin
    process (Clock, Reset)
    begin
        if Reset = '1' then
            reg_data <= (others => '0');
        elsif rising_edge(Clock) then
            if Load = '1' then
                reg_data <= D;
            end if;
        end if;
    end process;

    Q <= reg_data;

end Behavioral;
