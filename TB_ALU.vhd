library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TB_ALU is
end TB_ALU;

architecture Testbench of TB_ALU is
    signal SEL: STD_LOGIC_VECTOR(4 downto 0);
    signal A, B, Z: STD_LOGIC_VECTOR(7 downto 0);
    signal Cout: STD_LOGIC;

    component ALU
        Port ( SEL : in STD_LOGIC_VECTOR(4 downto 0);
               A, B : in STD_LOGIC_VECTOR(7 downto 0);
               Cout : out STD_LOGIC;
               Z : out STD_LOGIC_VECTOR(7 downto 0));
    end component;

begin
    uut: ALU port map(
        SEL => SEL,
        A => A,
        B => B,
        Cout => Cout,
        Z => Z
    );

    process
    begin
        -- Test ADD operation: 63 + 15
        SEL <= "00000";
        A <= "00111111"; -- 63 in binary
        B <= "00001111"; -- 15 in binary
        wait for 10 ns;

        -- Test SUB operation: 63 - 15
        SEL <= "11111";
        A <= "00111111"; -- 63 in binary
        B <= "00001111"; -- 15 in binary
        wait for 10 ns;

        -- Test SUB operation: 63 - 100
        SEL <= "11111"; -- Use subtraction operation
        A <= "00111111"; -- 63 in binary
        B <= "10011100"; -- -100 in two's complement
        wait for 10 ns;

        -- Test AND operation: 63 & 35
        SEL <= "00001";
        A <= "00111111"; -- 63 in binary
        B <= "00100011"; -- 35 in binary
        wait for 10 ns;

        -- Test INCREMENT operation: 64
        SEL <= "10100";
        A <= "01000000"; -- 64 in binary
        B <= (others => '0');
        wait for 10 ns;

        -- Test transfer input A to output
        SEL <= "00010";
        A <= "00111001"; -- 57 in binary
        B <= (others => '0');
        wait for 10 ns;

        -- Test transfer input B to output
        SEL <= "00011";
        A <= (others => '0');
        B <= "00101111"; -- 47 in binary
        wait for 10 ns;       

        wait;
    end process;
end Testbench;
