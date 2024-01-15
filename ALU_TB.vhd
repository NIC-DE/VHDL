
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_tb is
end ALU _tb;

architecture testbench of ALU _tb is
    -- Component declaration
    component ALU  is
        port (
            A       : in std_logic_vector(7 downto 0);
            B       : in std_logic_vector(7 downto 0);
            SEL     : in std_logic_vector(3 downto 0);
            R       : out std_logic_vector(7 downto 0);
            Z       : out std_logic;
            Overflow: out std_logic;
            cin     : in std_logic;
            Cout    : out std_logic
        );
    end component;

    -- Signals for testbench
    signal opA      : std_logic_vector(7 downto 0) := "00110111";
    signal opB      : std_logic_vector(7 downto 0) := "00100100";
    signal SEL      : std_logic_vector(3 downto 0);
    signal R        : std_logic_vector(7 downto 0);
    signal Z        : std_logic;
    signal Overflow : std_logic;
    signal cin      : std_logic := '0';
    signal Cout     : std_logic;

begin
    
    UUT: ALU
        port map (
            A        => opA,
            B        => opB,
            SEL      => SEL,
            R        => R,
            Z        => Z,
            Overflow => Overflow,
            cin      => cin,
            Cout     => Cout
        );

    -- Stimulus process:
    stimulus_process: process
    begin
        SEL <= "0000"; -- Add (A + B)
        wait for 10 ns;

        SEL <= "0001"; -- Add with Carry (A + B + Carry)
        cin <= '1';
        wait for 10 ns;

        SEL <= "0010"; -- Subtract (A - B)
        wait for 10 ns;

        SEL <= "0011"; -- Subtract with borrow (A - B - Carry)
        cin <= '1';
        wait for 10 ns;

        SEL <= "0100"; -- Negative (not A + 00000001)
        wait for 10 ns;

        SEL <= "0101"; -- Logical AND (A AND B)
        wait for 10 ns;

        SEL <= "0110"; -- Logical OR (A OR B)
        wait for 10 ns;

        SEL <= "0111"; -- Logical XOR (A XOR B)
        wait for 10 ns;

        SEL <= "1000"; -- Logical Shift Left (A & "0")
        wait for 10 ns;

        SEL <= "1001"; -- Logical Shift Right (??0?? & ?)
        wait for 10 ns;

        SEL <= "1010"; -- Pass through (B)
        wait for 10 ns;

        wait;
    end process stimulus_process;
end testbench;

