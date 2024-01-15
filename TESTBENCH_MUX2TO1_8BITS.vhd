library IEEE;
use IEEE.STD_LOGIC_1164.ALL;   ---idies libraries

entity tb_mux2x1_8bit is    
end tb_mux2x1_8bit;             --- keno entity

architecture testbench of tb_mux2x1_8bit is
    signal A, B, Y: std_logic_vector(7 downto 0);----simata opos einai dilomena sto entity
    signal S: std_logic;

begin
    uut: entity work.mux2x1_8bit  ----tha borousa kai uut: tb_mux2x1_8bit port map(A,B,S,Y);
        port map (
            A => A,
            B => B,
            S => S,
            Y => Y
        );

    -- Stimulus process
    stimulus: process
    begin
        A <= "00000000";  -- Input A
        B <= "11111111";  -- Input B

        S <= '0';         -- Select input A
        wait for 10 ns;

        S <= '1';         -- Select input B
        wait for 10 ns;

        S <= '0';         -- Select input A
        wait for 10 ns;

        S <= '1';         -- Select input B
        wait for 10 ns;

        report "Simulation complete" severity note;
        wait;
    end process;

end testbench;
