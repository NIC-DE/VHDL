
library ieee;
use ieee.std_logic_1164.all;

entity System is
  port (
    clock_in  : in std_logic;                         -- Clock input (50MHz)
    btn       : in std_logic;                         -- Button input
    reset     : in std_logic;                         -- Reset input
    seg_out   : out std_logic_vector(6 downto 0);      -- 7-segment display output
    led_out   : out std_logic_vector(3 downto 0);      -- LED output
    clk_out   : out std_logic                          -- Clock output (100Hz)
  );
end System;

architecture Structural of System is

  component DECODER_4X16 is
    port (
      SEL : in std_logic_vector(3 downto 0);
      Y   : out std_logic_vector(6 downto 0)
    );
  end component;

  component ClickTimer is
    port (
      clk      : in std_logic;
      btn      : in std_logic;
      reset    : in std_logic;
      seg_out  : out std_logic_vector(6 downto 0);
      led_out  : out std_logic_vector(3 downto 0)
    );
  end component;

  component clk100hz is
    port (
      clock_in : in std_logic;
      reset    : in std_logic;
      clk_out  : out std_logic
    );
  end component;

  signal decoder_sel : std_logic_vector(3 downto 0);
  signal decoder_out : std_logic_vector(6 downto 0);
  signal clicktimer_seg : std_logic_vector(6 downto 0);
  signal clicktimer_led : std_logic_vector(3 downto 0);
  signal clk100hz_out : std_logic;

begin

  -- Instantiate the components
  Decoder_inst : DECODER_4X16
    port map (
      SEL => decoder_sel,
      Y => decoder_out
    );

  ClickTimer_inst : ClickTimer
    port map (
      clk => clock_in,
      btn => btn,
      reset => reset,
      seg_out => clicktimer_seg,
      led_out => clicktimer_led
    );

  Clk100Hz_inst : clk100hz
    port map (
      clock_in => clock_in,
      reset => reset,
      clk_out => clk100hz_out
    );

  -- Connect signals
  decoder_sel <= clicktimer_seg(3 downto 0);
  seg_out <= decoder_out;
  led_out <= clicktimer_led;
  clk_out <= clk100hz_out;

end Structural;
