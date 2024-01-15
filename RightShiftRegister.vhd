library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RightShiftRegister is
  Port (
    clk    : in  STD_LOGIC;
    reset  : in  STD_LOGIC;
    shift_in : in  STD_LOGIC;
    shift_out : out STD_LOGIC;
    Q        : out STD_LOGIC_VECTOR(7 downto 0)
  );
end RightShiftRegister;

architecture Behavioral of RightShiftRegister is
  signal reg : STD_LOGIC_VECTOR(7 downto 0) := "00000000";
begin
  process (clk, reset)
  begin
    if reset = '1' then
      reg <= (others => '0');
    elsif rising_edge(clk) then
      if shift_in = '1' then
        reg <= shift_in & reg(7 downto 1);
      else
        reg <= '0' & reg(7 downto 1);
      end if;
    end if;
  end process;

  shift_out <= reg(0);
  Q <= reg;
end Behavioral;
