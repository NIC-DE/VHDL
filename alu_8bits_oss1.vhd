
--libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--entity
entity alu_8bits_oss1 is
port(A  :in std_logic_vector(7 downto 0);--inputA
     B  :in std_logic_vector(7 downto 0);--inputB
	 SEL :in std_logic_vector(4 downto 0);--control signals
	 R :out std_logic_vector(7 downto 0);--result
	 Z :out std_logic;
	 Cout:out std_logic);
end alu_8bits_oss1 ;

--architecture
architecture behavioural of alu_8bits_oss1 is
--internal signal declaration
signal opA,opB : unsigned(8 downto 0);
signal opR     : std_logic_vector(8 downto 0):=(others=>'0');

begin
opA<=unsigned("0" & A);
opB <=unsigned("0" & B);

process(opA,opB,SEL)
begin  
    case? SEL is --erotimatiko gia na ypologisei kai tiw payles dhl toys adiaforoys

        when "00000"=>
          opR<=std_logic_vector(opA+opB);  --a+b		  
	     when "---01"=>
          opR<=(std_logic_vector(opA)  and  std_logic_vector(opB)); --a and b
		  when "---10"=>
          opR<= std_logic_vector(opA);  --a
		  when "---11"=>
          opR<=std_logic_vector(opB);--b
		  when "01100"=>
          opR<=std_logic_vector(opA-opB);  --a-b
		  when "1-100"=>
          opR<=std_logic_vector(opA+1);  --a+1
		  when "1-000"=>
          opR<= std_logic_vector(opA);  --a
		  when "00100"=>
          opR<= std_logic_vector(opA+opB+1);  --a+b+1
		  when "01000"=>
          opR<= std_logic_vector(opA-opB-1);  --(a-b)-1
		  when others=>
		  opR <=(others=>'0');
	end case?;
end process;

--outputs	
R   <= opR(7 downto 0);
Cout <= opR(8);
Z<= not (opR(7) or opR(6) or  opR(5) or opR(4) or opR(3) or opR(2) or opR(1) or opR(0));
end behavioural;
		  