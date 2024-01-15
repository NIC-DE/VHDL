library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux2x1_4bit is
    Port (
        A : in STD_LOGIC_VECTOR (3 downto 0); -- 4-bit input
        B : in STD_LOGIC_VECTOR (3 downto 0); -- 4-bit input
        S : in STD_LOGIC;                      -- Selection input
        Y : out STD_LOGIC_VECTOR (3 downto 0) -- 4-bit output
    );
end mux2x1_4bit;

architecture Behavioral of mux2x1_4bit is
begin
    process (A, B, S)
    begin
        if S = '0' then
            Y <= A;
        else
            Y <= B;
        end if;
    end process;
end Behavioral;
