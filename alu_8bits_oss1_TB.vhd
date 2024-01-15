library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity testbench_alu_8bits_oss1 is
end entity testbench_alu_8bits_oss1;

architecture tb of testbench_alu_8bits_oss1 is
  signal A, B, R : std_logic_vector(7 downto 0);
  signal SEL    : std_logic_vector(4 downto 0);
  signal Z, Cout: std_logic;

  component alu_8bits_oss1
    port (
      A   : in std_logic_vector(7 downto 0);
      B   : in std_logic_vector(7 downto 0);
      SEL : in std_logic_vector(4 downto 0);
      R   : out std_logic_vector(7 downto 0);
      Z   : out std_logic;
      Cout: out std_logic
    );
  end component;

begin
  UUT : alu_8bits_oss1
    port map (
      A   => A,
      B   => B,
      SEL => SEL,
      R   => R,
      Z   => Z,
      Cout=> Cout
    );

  stimulus: process
  begin
    -- Test Case 1: ADD (63 + 15)
    A   <= "00111111";  -- A = 63
    B   <= "00001111";  -- B = 15
    SEL <= "00000";     -- SEL = 0 (A + B)
    wait for 10 ns;

    -- Test Case 2: SUB (63 - 15)
    A   <= "00111111";  -- A = 63
    B   <= "00001111";  -- B = 15
    SEL <= "01100";     -- SEL = 12 (A - B)
    wait for 10 ns;

    -- Test Case 3: SUB (63 - 100)
    A   <= "00111111";  -- A = 63
    B   <= "01100100";  -- B = 100
    SEL <= "01100";     -- SEL = 12 (A - B)
    wait for 10 ns;

    -- Test Case 4: AND (63 & 35)
    A   <= "00111111";  -- A = 63
    B   <= "00100011";  -- B = 35
    SEL <= "00001";     -- SEL = 1 (A AND B)
    wait for 10 ns;

    -- Test Case 5: INCREMENT (64)
    A   <= "01000000";  -- A = 64
    B   <= "00000000";  -- B = 0
    SEL <= "11000";     -- SEL = 24 (A + 1)
    wait for 10 ns;

    -- Test Case 6: Transfer A to Output (A = 57)
    A   <= "00111001";  -- A = 57
    B   <= "00000000";  -- B = 0
    SEL <= "10000";     -- SEL = 16 (A)
    wait for 10 ns;

    -- Test Case 7: Transfer B to Output (B = 47)
    A   <= "00000000";  -- A = 0
    B   <= "00101111";  -- B = 47
    SEL <= "10000";     -- SEL = 16 (B)
    wait for 10 ns;

    wait;
  end process stimulus;

  check_output: process
  begin
    wait for 5 ns;  -- Wait for some time to stabilize the output

    -- Check the results here using assert statements
    -- You can compare the output signals (R, Z, Cout) with expected values.

    assert false report "Testbench completed" severity note;
    wait;
  end process check_output;

end architecture tb;
