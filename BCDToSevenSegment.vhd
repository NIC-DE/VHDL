library ieee;
use ieee.std_logic_1164.all;

entity BCDToSevenSegment is
  port (
    bcd: in std_logic_vector(3 downto 0);
    sevensegment: out std_logic_vector(6 downto 0)
  );
end BCDToSevenSegment;

architecture behavioral of BCDToSevenSegment is
begin
  process(bcd)
  begin
    case bcd is 
      when "0000" => sevensegment <= "1111110"; -- 0
      when "0001" => sevensegment <= "0110000"; -- 1
      when "0010" => sevensegment <= "1101101"; -- 2
      when "0011" => sevensegment <= "1111001"; -- 3
      when "0100" => sevensegment <= "0110011"; -- 4
      when "0101" => sevensegment <= "1011011"; -- 5
      when "0110" => sevensegment <= "0011111"; -- 6
      when "0111" => sevensegment <= "1110000"; -- 7
      when "1000" => sevensegment <= "1111111"; -- 8
      when "1001" => sevensegment <= "1110011"; -- 9
      when others => sevensegment <= "0000000";
    end case;
  end process;
end behavioral;
