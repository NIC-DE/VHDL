library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CarrySelectAdder_4bit is
  Port (
    A, B : in STD_LOGIC_VECTOR(3 downto 0);
    Cin : in STD_LOGIC;
    Sum : out STD_LOGIC_VECTOR(3 downto 0);
    Cout : out STD_LOGIC
  );
end CarrySelectAdder_4bit;

architecture Behavioral of CarrySelectAdder_4bit is

  component FA is
    Port (
      A, B, Cin : in STD_LOGIC;
      S, Cout : out STD_LOGIC
    );
  end component FA;

  component mux2x1 is
    Port (
      S : in STD_LOGIC;
      D0, D1 : in STD_LOGIC;
      Y : out STD_LOGIC
    );
  end component mux2x1;

  signal G : STD_LOGIC_VECTOR(3 downto 0);
  signal C : STD_LOGIC_VECTOR(3 downto 0);
  signal S0, S1, S2, S3 : STD_LOGIC;
  signal MuxOut1, MuxOut2, MuxOut3 : STD_LOGIC;
  
begin

  -- Generate the G signals for the Full Adders
  G(0) <= A(0) AND B(0);
  G(1) <= A(1) AND B(1);
  G(2) <= A(2) AND B(2);
  G(3) <= A(3) AND B(3);

  -- Generate the carry signals for the Full Adders
  FA0: FA port map (A(0), B(0), Cin, S0, C(0));
  FA1: FA port map (A(1), B(1), C(0), S1, C(1));
  FA2: FA port map (A(2), B(2), C(1), S2, C(2));
  FA3: FA port map (A(3), B(3), C(2), S3, C(3));

  -- Generate the carry skip signals
  Mux1: mux2x1 port map (G(0), S0, G(1), MuxOut1);
  Mux2: mux2x1 port map (G(2), S1, G(3), MuxOut2);
  Mux3: mux2x1 port map (MuxOut1, C(1), MuxOut2, MuxOut3);

  -- Calculate the final Sum output
  Sum <= S3 & S2 & S1 & S0;

  -- Calculate the final Cout output
    Cout <= MuxOut3 OR C(3);

end Behavioral;
