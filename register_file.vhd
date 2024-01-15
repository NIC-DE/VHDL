library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_file is
    Port ( clk, reset, write : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR(1 downto 0);
           data_in : in STD_LOGIC_VECTOR(7 downto 0);
           address_out1, address_out2 : in STD_LOGIC_VECTOR(1 downto 0);
           data_out1, data_out2 : out STD_LOGIC_VECTOR(7 downto 0));
end register_file;

architecture Behavioral of register_file is
    type register_array is array (3 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
    signal registers : register_array;
    signal decoder_out : STD_LOGIC_VECTOR(3 downto 0);
    signal mux_out1, mux_out2 : STD_LOGIC_VECTOR(7 downto 0);

    component mux_4x1 is
        Port ( input0, input1, input2, input3 : in STD_LOGIC_VECTOR(7 downto 0);
               select_l : in STD_LOGIC_VECTOR(1 downto 0);
               output : out STD_LOGIC_VECTOR(7 downto 0));
    end component;

    component decoder_2x4 is
        Port ( input_b : in STD_LOGIC_VECTOR(1 downto 0);
               enable : in STD_LOGIC;
               output_l : out STD_LOGIC_VECTOR(3 downto 0));
    end component;
   
begin
    decoder_inst : decoder_2x4 port map(address, write, decoder_out);

    process(clk, reset)
    begin
        if reset = '1' then
            registers <= (others => (others => '0'));
        elsif rising_edge(clk) then
            if write = '1' then
                registers(conv_integer(address)) <= data_in;
            end if;
        end if;
    end process;

    mux_inst1 : mux_4x1 port map(registers(conv_integer(address_out1)),
                                registers(conv_integer(address_out2)),
                                (others => '0'),
                                (others => '0'),
                                decoder_out(1 downto 0),
                                mux_out1);

    mux_inst2 : mux_4x1 port map(registers(conv_integer(address_out1)),
                                registers(conv_integer(address_out2)),
                                (others => '0'),
                                (others => '0'),
                                decoder_out(3 downto 2),
                                mux_out2);

    data_out1 <= mux_out1;
    data_out2 <= mux_out2;
end Behavioral;
