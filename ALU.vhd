
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
    port (
        A       : in std_logic_vector(7 downto 0); -- inputA
        B       : in std_logic_vector(7 downto 0); -- inputB
        SEL     : in std_logic_vector(3 downto 0); -- control signals
        R       : out std_logic_vector(7 downto 0); -- result
        Z       : out std_logic; -- zero result
        Overflow: out std_logic; -- overflow flag
        cin     : in std_logic; -- carry in
        Cout    : out std_logic -- carry out
    );
end ALU;

architecture behavioural of ALU is
    signal opA, opB : unsigned(8 downto 0);
    signal opR      : unsigned(8 downto 0);
begin
    opA <= unsigned("0" & A);
    opB <= unsigned("0" & B);

    process(opA, opB, SEL, cin,opR)
    begin  
        case ? SEL is
            when "0000" =>
                opR <= opA + opB; -- Add (A + B)

            when 
                 "0001" =>
                opR <= opA + opB + unsigned'("0" & cin); -- Add with Carry (A + B + Carry)

            when "0010" =>
                opR <= opA - opB; -- Subtract (A - B)

            when "0011" =>
                opR <= opA - opB - unsigned'("0" & cin); -- Subtract with borrow (A - B - Carry)

            when "0100" =>
                opR <= not opA + "00000001"; -- Negative (not A + 00000001)

            when "0101" =>
                opR <= opA and opB; -- Logical AND (A AND B)

            when "0110" =>
                opR <= opA or opB; -- Logical OR (A OR B)

            when "0111" =>
                opR <= opA xor opB; -- Logical XOR (A XOR B)

            when "1000" =>
                opR <= opA(7 downto 0) & '0'; -- Logical Shift Left (A & "0")

            when "1001" =>
                opR <= '0' & opA(7 downto 0); -- Logical Shift Right ("00" & A(7 downto 1))

            when "1010" =>
                opR <= opB; -- Pass through (B)

            when others =>
                opR <= (others => '1'); -- Any other value results in "11111111"
        end case?;

        Overflow <= '0'; -- Default: No overflow
        if opR(8) = '1' then
            Overflow <= '1'; -- Set overflow flag if opR(8) is '1'
        end if;

    end process;

    R <= std_logic_vector(opR(7 downto 0)); -- Output the result
    Z <= '1' when opR = "00000000" else '0'; -- Set Z flag if result is zero
    Cout <= opR(8); -- Set carry out

end behavioural;
