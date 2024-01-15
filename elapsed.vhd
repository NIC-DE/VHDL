

library ieee;
use ieee.std_logic_1164.all;

entity elapsed is
  port (
    clk, rst, pushbutton: in std_logic;
    digit1: out std_logic_vector(6 downto 0);
    digit0: out std_logic_vector(3 downto 0)
  );
end elapsed;

architecture structural of elapsed is
  signal clock100Hz: std_logic;
  signal bcd0: std_logic_vector(3 downto 0) := "0000";
  signal bcd1: std_logic_vector(3 downto 0) := "0000";
  signal countClock: std_logic; -- Declare a signal for the clock input to BCDCounter

  component clk100Hz is
    port (
      clkin, reset: in std_logic;
      clkout: out std_logic
    );
  end component;

  component BCDCounter is
    port (
      Countclock, reset, enable: in std_logic;
      bcd0, bcd1: out std_logic_vector(3 downto 0)
    );
  end component;

  component BCDToSevenSegment is
    port (
      bcd: in std_logic_vector(3 downto 0);
      sevensegment: out std_logic_vector(6 downto 0)
    );
  end component;

begin
  SysClock: clk100Hz port map(clk, rst, clock100Hz);
  timeCount: BCDCounter port map(countClock, rst, pushbutton, bcd0, bcd1);
  bcdconvert: BCDToSevenSegment port map(bcd1, digit1);
  digit0 <= bcd0;
  countClock <= clock100Hz; -- Connect the countClock signal to clock100Hz
end structural;


