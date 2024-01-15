library IEEE;
use IEEE.std_logic_1164.all;

entity Moore_sequence_identifier is
  port (
    serial_in, clock, reset: in std_logic;
    outp: out std_logic := '0'
  );
end Moore_sequence_identifier;

architecture behavioral of Moore_sequence_identifier is
  type state is (S1, S2, S3, S4, S5);
  signal state_next: state;
begin
  process (clock, reset) is
  begin
    if reset = '1' then
      state_next <= S1;
    elsif rising_edge(clock) then
      case state_next is
        when S1 =>
          if serial_in = '1' then
            state_next <= S2;
          else 
            state_next <= S1;
          end if;
        when S2 =>
          if serial_in = '1' then
            state_next <= S3;
          else
            state_next <= S1;
          end if;
        when S3 =>
          if serial_in = '0' then   
            state_next <= S4;
          else
            state_next <= S1;
          end if;
        when S4 =>
          if serial_in = '1' then 
            state_next <= S5;
          else
            state_next <= S1;
          end if;
        when S5 =>
          if serial_in = '0' then   
            state_next <= S1;
          else
            state_next <= S3;
          end if;
      end case;
    end if;
  end process;

  outp <= '1' when state_next = S5 else '0';
end behavioral;
