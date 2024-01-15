library ieee;
use ieee.std_logic_1164.all;

entity mux2to1 is
  port (
    sel : in std_logic;
    a : in std_logic;
    b : in std_logic;
    y : out std_logic
  );
end entity mux2to1;

architecture behavioral of mux2to1 is
begin

 

  mux_variant: process (a, b, sel)
    variable temp : std_logic;
  begin
    case sel is
      when '0' =>
        temp := a;
      when others =>
        temp := b;
    end case;
    y <= temp;
  end process mux_variant;

end architecture behavioral;