library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_2x4 is
    Port ( input_b : in STD_LOGIC_VECTOR(1 downto 0);
           enable : in STD_LOGIC;
           output_l : out STD_LOGIC_VECTOR(3 downto 0));
end decoder_2x4;

architecture Behavioral of decoder_2x4 is
begin
    process(input_b, enable)
    begin
        if enable = '1' then
            case input_b is
                when "00" =>
                    output_l <= "0001";
                when "01" =>
                    output_l <= "0010";
                when "10" =>
                    output_l <= "0100";
                when "11" =>
                    output_l <= "1000";
                when others =>
                    output_l <= (others => '0');
            end case;
        else
            output_l <= (others => '0');
        end if;
    end process;
end Behavioral;
