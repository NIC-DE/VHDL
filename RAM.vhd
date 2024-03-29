

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity RAM is
    port (
        din : in std_logic_vector (15 downto 0);
        addr : in std_logic_vector (7 downto 0);
        we, clk : in std_logic;
        dout : out std_logic_vector (15 downto 0)
    );
end RAM;

 Architecture mem256x16_v2_rtl of RAM is

Type vector_array is array (0 to 255) Of std_logic_vector (15 downto 0);

    signal memory : vector_array := (
        0  => "1010000000101000",
        1  => "0110000000010100",
        2  => "0001000011110000",
        3  => "1001010000000001",
        4  => "1010000000101001",
        5  => "1000000000000101",
        6  => "0000000000000000",
        7  => "0000000000000000",
        8  => "0000000000000000",
        9  => "0000000000000000",
        10 => "0000000000000000",
        11 => "0000000000000000",
        12 => "0000000000000000",
        13 => "0000000000000000",
        14 => "0000000000000000",
        15 => "0000000000000000",
        16 => "0000000000000000",
        17 => "0000000000000000",
        18 => "0000000000000000",
        19 => "0000000000000000",
        20 => "0000000000000000",
        21 => "0000000000000000",
        22 => "0000000000000000",
        23 => "0000000000000000",
        24 => "0000000000000000",
        25 => "0000000000000000",
        26 => "0000000000000000",
        27 => "0000000000000000",
        28 => "0000000000000000",
        29 => "0000000000000000",
        30 => "0000000000000000",
        31 => "0000000000000000",
        32 => "0000000000000000",
        33 => "0000000000000000",
        34 => "0000000000000000",
        35 => "0000000000000000",
        36 => "0000000000000000",
        37 => "0000000000000000",
        38 => "0000000000000000",
        39 => "0000000000000000",
        40 => "0000000001010101",
        41 => "0000000011111111",       
        
    Others =>"0000000000000000"); 

Begin
Process (clk)
Begin
if rising_edge(clk) then
	if (we='1') then
		memory(conv_integer(addr)) <= din;
	End if;
End iF;
End Process;

dout <= memory(conv_integer(addr));
End mem256x16_v2_rtl;
