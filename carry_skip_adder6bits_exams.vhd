library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CarrySelectAdder_6bit is
  Port (
    A, B : in STD_LOGIC_VECTOR(5 downto 0);
    Cin : in STD_LOGIC;
    Sum : out STD_LOGIC_VECTOR(5 downto 0);
    Cout : out STD_LOGIC
  );
end CarrySelectAdder_6bit;

architecture Behavioral of CarrySelectAdder_6bit is

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

  signal G : STD_LOGIC_VECTOR(5 downto 0);
  signal C : STD_LOGIC_VECTOR(5 downto 0);
  signal S0, S1, S2, S3, S4, S5 : STD_LOGIC;
  signal MuxOut1, MuxOut2, MuxOut3, MuxOut4, MuxOut5 : STD_LOGIC;
  
begin

  -- Generate the G signals for the Full Adders
  G(0) <= A(0) AND B(0);
  G(1) <= A(1) AND B(1);
  G(2) <= A(2) AND B(2);
  G(3) <= A(3) AND B(3);
  G(4) <= A(4) AND B(4);
  G(5) <= A(5) AND B(5);

  -- Generate the carry signals for the Full Adders
  FA0: FA port map (A(0), B(0), Cin, S0, C(0));
  FA1: FA port map (A(1), B(1), C(0), S1, C(1));
  FA2: FA port map (A(2), B(2), C(1), S2, C(2));
  FA3: FA port map (A(3), B(3), C(2), S3, C(3));
  FA4: FA port map (A(4), B(4), C(3), S4, C(4));
  FA5: FA port map (A(5), B(5), C(4), S5, C(5));

  -- Generate the carry skip signals
  Mux1: mux2x1 port map (G(0), S0, G(1), MuxOut1);
  Mux2: mux2x1 port map (G(2), S1, G(3), MuxOut2);
  Mux3: mux2x1 port map (MuxOut1, C(1), MuxOut2, MuxOut3);
  Mux4: mux2x1 port map (G(4), S2, G(5), MuxOut4);
  Mux5: mux2x1 port map (MuxOut3, C(3), MuxOut4, MuxOut5);

  -- Calculate the final Sum output
  Sum <= S5 & S4 & S3 & S2 & S1 & S0;

  -- Calculate the final Cout output
  Cout <= MuxOut5;

end Behavioral;
