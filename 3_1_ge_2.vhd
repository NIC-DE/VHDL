library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DECODER_4X16 is
PORT (SEL :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
Y:OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END DECODER_4X16;

architecture DATAFLOW_ARC OF DECODER_4X16 is
begin
Y<= "1111110"  WHEN (SEL ="0000") else  
    "0110000"  WHEN (SEL ="0001") else
    "1101101"  WHEN (SEL ="0010") else
    "1111001"  WHEN (SEL ="0011") else
	"0110011"  WHEN (SEL ="0100") else
	"1011011"  WHEN (SEL ="0101") else
	"0011111"  WHEN (SEL ="0110") else
	"1110000"  WHEN (SEL ="0111") else
	"1111111"  WHEN (SEL ="1000") else
	"1110011"  when (SEL ="1001") else
	"0000000";
END DATAFLOW_ARC;	
	
	
	
	


