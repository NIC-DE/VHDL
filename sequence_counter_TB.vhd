Library IEEE;
Use IEEE.std_logic_1164.all;
Use IEEE.numeric_std.all;

Entity sequence_counter_TB is
End sequence_counter_TB;

Architecture tb of sequence_counter_TB is
Signal rst: std_logic := '1';
Signal clk: std_logic := '1';
Signal data: std_logic := '0';
Signal result: std_logic_vector(3 downto 0);
constant clk_period: time := 10 ns;
constant serial_sequence: std_logic_vector(18 downto 0) := "1101101101010110100";
component sequence_counter is
port(reset, clock, serial_in: In std_logic;
seq_num: Out std_logic_vector(3 downto 0));
End component;

Begin
DUT: sequence_counter port map(reset=>rst, clock=>clk, serial_in=>data, seq_num=>result);

clk_process: Process
Begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
    End Process;

stimulus: Process
Begin
    wait for 10 ns;
    rst <= '0';
    wait for 10 ns;
    for i in 0 to 18 loop
        data <= serial_sequence(18-i);
        wait for 10 ns;
    end loop;
    wait;
    End Process;
End tb;