library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux4x1_8bit is
end tb_mux4x1_8bit;

architecture testbench_architecture of tb_mux4x1_8bit is
    signal A, B, C, D : STD_LOGIC_VECTOR (7 downto 0);
    signal S : STD_LOGIC_VECTOR (1 downto 0);
    signal Y : STD_LOGIC_VECTOR (7 downto 0);
begin
    -- Instantiate the mux4x1_8bit entity
    uut: entity work.mux4x1_8bit
        port map (
            A => A,
            B => B,
            C => C,
            D => D,
            S => S,
            Y => Y
        );

    -- Stimulus process
    stimulus_process: process
    begin
        -- Test case 1: S = "00"
        A <= "00001111";
        B <= "11110000";
        C <= "01010101";
        D <= "10101010";
        S <= "00";
        wait for 10 ns;

        -- Test case 2: S = "01"
        A <= "11111111";
        B <= "00000000";
        C <= "11111111";
        D <= "00000000";
        S <= "01";
        wait for 10 ns;

        -- Test case 3: S = "10"
        A <= "01010101";
        B <= "10101010";
        C <= "01010101";
        D <= "10101010";
        S <= "10";
        wait for 10 ns;

        -- Test case 4: S = "11"
        A <= "11001100";
        B <= "00110011";
        C <= "11001100";
        D <= "00110011";
        S <= "11";
        wait for 10 ns;

        -- End the simulation
        wait;
    end process stimulus_process;
end testbench_architecture;
