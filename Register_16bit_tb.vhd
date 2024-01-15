library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_16bit_tb is
end Register_16bit_tb;

architecture Behavioral of Register_16bit_tb is
    constant N: integer := 16;  -- Generic parameter N set to 16
    signal D, Q: std_logic_vector(N-1 downto 0);
    signal Load, Clock, Reset: std_logic;

    -- Instantiate the 16-bit register with generic N=16
    component Register_16bit
        generic (
            N : integer := 16
        );
        Port (
            D : in std_logic_vector(N-1 downto 0);
            Load : in std_logic;
            Clock : in std_logic;
            Reset : in std_logic;
            Q : out std_logic_vector(N-1 downto 0)
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
        D <= "0000000001000001";  -- 65 in binary (ASCII value for 'A')

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

    -- Instantiate the 16-bit register
    UUT: Register_16bit
        generic map (
            N => N
        )
        port map (
            D => D,
            Load => Load,
            Clock => Clock,
            Reset => Reset,
            Q => Q
        );

end Behavioral;
