library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity adder8bits is
port(A,B:IN std_logic_vector(7 downto 0);
Cin:in std_logic;
s:out std_logic_vector(7 downto 0);
Cout:out std_logic);
end adder8bits;

architecture dataflow of  adder8bits is
signal sum :std_logic_vector(8 downto 0);
begin
sum<=('0' & A)+B+Cin;
s<=sum(7 downto 0);
Cout <=sum(8);
end dataflow;