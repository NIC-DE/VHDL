library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mux4x1_8bit is
    Port (
        A : in STD_LOGIC_VECTOR (7 downto 0); -- 8-bit input
        B : in STD_LOGIC_VECTOR (7 downto 0); -- 8-bit input
        C : in STD_LOGIC_VECTOR (7 downto 0); -- 8-bit input
        D : in STD_LOGIC_VECTOR (7 downto 0); -- 8-bit input
        S : in STD_LOGIC_VECTOR (1 downto 0);  -- 2-bit Selection input
        Y : out STD_LOGIC_VECTOR (7 downto 0)  -- 8-bit output
    );
end mux4x1_8bit;

architecture Behavioral of mux4x1_8bit is
begin
    process (A, B, C, D, S)
    begin
        case S is
            when "00" =>
                Y <= A;
            when "01" =>
                Y <= B;
            when "10" =>
                Y <= C;
            when others =>
                Y <= D;
        end case;
    end process;
end Behavioral;
