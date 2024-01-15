library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity SerialRegister_4bit is
    Port ( SerialInput : in STD_LOGIC;
           Clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           SerialOutput : out STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end SerialRegister_4bit;

architecture Behavioral of SerialRegister_4bit is
    signal reg_data : STD_LOGIC_VECTOR (3 downto 0) := "0000";
begin
    process (Clock, Reset)
    begin
        if Reset = '0' then
            reg_data <= "0000";
        elsif rising_edge(Clock) then
            reg_data <= reg_data(2 downto 0) & SerialInput;
        end if;
    end process;

    SerialOutput <= reg_data(3);
    Q <= reg_data;

end Behavioral;
