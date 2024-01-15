library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_8bit_tb is
end Register_8bit_tb;

architecture Behavioral of Register_8bit_tb is
    signal D, Q: std_logic_vector(7 downto 0);
    signal Load, Clock, Reset: std_logic;

    -- Instantiate the 8-bit register
    component Register_8bit
        Port (
            D : in std_logic_vector(7 downto 0);
            Load : in std_logic;
            Clock : in std_logic;
            Reset : in std_logic;
            Q : out std_logic_vector(7 downto 0)
        );
    end component;

begin
    -- Stimulus process
    stimulus: process
    begin
        -- Initialize signals
        Load <= '1';  -- Enable loading data into the register
        Clock <= '0';
        Reset <= '0';
        D <= "00100101";  -- 37 in binary (00100101)

        -- Apply reset
        Reset <= '1';
        wait for 10 ns;
        Reset <= '0';

        -- Wait for one clock cycle before loading data
        wait for 10 ns;

        -- Load data into the register
        wait for 10 ns;
        Clock <= '1';
        wait for 10 ns;
        Clock <= '0';

        -- Wait for one clock cycle before reading data
        wait for 10 ns;

        -- Read data from the register
        Load <= '0';  -- Disable loading data
        wait for 10 ns;
        Clock <= '1';
        wait for 10 ns;
        Clock <= '0';

        wait;
    end process;

    -- Instantiate the 8-bit register
    UUT: Register_8bit
        port map (
            D => D,
            Load => Load,
            Clock => Clock,
            Reset => Reset,
            Q => Q
        );

end Behavioral;
