
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_4bit is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Clock : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Register_4bit;

architecture Behavioral of Register_4bit is
    signal clear : STD_LOGIC := '1';
    signal q0, q1, q2, q3 : STD_LOGIC;

    component D_FF_with_Clear is
        Port ( D : in STD_LOGIC;
               Clock : in STD_LOGIC;
               Clear : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;

    component MUX_2to1 is
        Port ( S : in STD_LOGIC;
               I0 : in STD_LOGIC;
               I1 : in STD_LOGIC;
               Z : out STD_LOGIC);
    end component;

begin
    process (Clock, Reset)
    begin
        if Reset = '0' then
            clear <= '0';
        elsif rising_edge(Clock) then
            clear <= '1';
        end if;
    end process;

    D_FF0: D_FF_with_Clear port map (D(0), Clock, clear, q0);
    D_FF1: D_FF_with_Clear port map (D(1), Clock, clear, q1);
    D_FF2: D_FF_with_Clear port map (D(2), Clock, clear, q2);
    D_FF3: D_FF_with_Clear port map (D(3), Clock, clear, q3);

    MUX_0: MUX_2to1 port map (Reset, '0', q0, Q(0));
    MUX_1: MUX_2to1 port map (Reset, '0', q1, Q(1));
    MUX_2: MUX_2to1 port map (Reset, '0', q2, Q(2));
    MUX_3: MUX_2to1 port map (Reset, '0', q3, Q(3));

end Behavioral;
