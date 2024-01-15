library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DatapathwithRegisterFile_Testbench is
end DatapathwithRegisterFile_Testbench;

architecture testbench of DatapathwithRegisterFile_Testbench is
  
    signal clk, reset, write, mem_or_reg: std_logic := '0';
    signal alu_op: std_logic_vector(3 downto 0) := (others => '0');
    signal res_reg_add, reg1_add, reg2_add: std_logic_vector(1 downto 0) := (others => '0');
    signal databus: std_logic_vector(7 downto 0) := (others => '0');
    signal mux_out, alu_out: std_logic_vector(7 downto 0);
    signal overflow, carryOut, carryin: std_logic := '0';
    signal data_out1, data_out2: std_logic_vector(7 downto 0);

    constant clock_period: time := 10 ns; 

    component DatapathwithRegisterFile is
        Port (
            clk, reset, write, mem_or_reg: in std_logic;
            res_reg_add, reg1_add, reg2_add: in std_logic_vector(1 downto 0);
            databus: in std_logic_vector(7 downto 0);
            mux_out, alu_out: out std_logic_vector(7 downto 0);
            overflow, carryOut: out std_logic;
            alu_op: in std_logic_vector(3 downto 0);
            carryin: in std_logic
        );
    end component;

begin
    DUT: DatapathwithRegisterFile port map (
        clk => clk,
        reset => reset,
        write => write,
        mem_or_reg => mem_or_reg,
        res_reg_add => res_reg_add,
        reg1_add => reg1_add,
        reg2_add => reg2_add,
        databus => databus,
        mux_out => mux_out,
        alu_out => alu_out,
        overflow => overflow,
        carryOut => carryOut,
        alu_op => alu_op,
        carryin => carryin
    );

    
    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for clock_period / 2;
            clk <= '1';
            wait for clock_period / 2;
        end loop;
    end process clk_process;

    
    reset_process: process
    begin
        reset <= '1'; 
        wait for clock_period * 2;
        reset <= '0'; 
        wait;
    end process reset_process;

    stimuli_process: process
    begin
        wait for clock_period * 2;

        databus <= "00010100"; 
        write <= '1'; 
        res_reg_add <= "01"; 
        wait for clock_period; 
        write <= '0'; 

        databus <= "00110100"; 
        write <= '1'; 
        reg2_add <= "10"; 
        wait for clock_period; 
        write <= '0'; 

        alu_op <= "0000"; 
        reg1_add <= "01"; 
        reg2_add <= "10"; 
        write <= '1'; 
        res_reg_add <= "00"; 
        wait for clock_period; 
        write <= '0'; 

        reg1_add <= "00"; 
        write <= '1'; 
        res_reg_add <= "11"; 
        wait for clock_period; 
        write <= '0'; 

        reg1_add <= "11"; 
        write <= '1'; 
        databus <= "11110000"; 
        mem_or_reg <= '1'; 
        wait for clock_period; 
        write <= '0'; 
        mem_or_reg <= '0'; 

        wait for clock_period * 4; 
        write <= '1'; 
        res_reg_add <= "00"; 
        wait for clock_period; 
        res_reg_add <= "01"; 
        wait for clock_period; 
        res_reg_add <= "10"; 
        wait for clock_period; 
        res_reg_add <= "11"; 
        wait for clock_period; 
        write <= '0'; 

        wait; 
    end process stimuli_process;
	

end testbench;
