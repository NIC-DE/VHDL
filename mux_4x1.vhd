library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_4x1 is
    Port ( input0, input1, input2, input3 : in STD_LOGIC_VECTOR(7 downto 0);
           select_l : in STD_LOGIC_VECTOR(1 downto 0);
           output : out STD_LOGIC_VECTOR(7 downto 0));
end mux_4x1;

architecture Behavioral of mux_4x1 is
begin
    process(select_l, input0, input1, input2, input3)
    begin
        case select_l is
            when "00" =>
                output <= input0;
            when "01" =>
                output <= input1;
            when "10" =>
                output <= input2;
            when "11" =>
                output <= input3;
            when others =>
                output <= (others => '0'); 
        end case;
    end process;
end Behavioral;
