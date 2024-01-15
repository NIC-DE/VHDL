library IEEE;
use IEEE.std_logic_1164.all;

entity sequence_identifier is
    port (
        reset, clock: in std_logic;
        serial_in: in std_logic_vector(18 downto 0);
        seq_num: out std_logic_vector(3 downto 0)
    );
end entity sequence_identifier;

architecture behavioral of sequence_identifier is
    component Moore_sequence_identifier is
        port (
            clock, reset: in std_logic;
            serial_in: in std_logic_vector(18 downto 0);
            outp: out std_logic := '0'
        );
    end component;

    component counter_up_asyn is
        port (
            clock, reset, flag: in std_logic;
            outp: out std_logic_vector(3 downto 0)
        );
    end component;

    signal flag: std_logic;
    signal seq_cnt: std_logic_vector(3 downto 0);

begin

    MooreSeqIden: Moore_sequence_identifier port map (
        serial_in => serial_in,
        clock => clock,
        reset => reset,
        outp => flag
    );

    CounterUpAsyn: counter_up_asyn port map (
        clock => clock,
        reset => reset,
        flag => flag,
        outp => seq_cnt
    );

    seq_num <= seq_cnt;

end architecture behavioral;

