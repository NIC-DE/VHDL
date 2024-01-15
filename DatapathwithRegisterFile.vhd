library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DatapathwithRegisterFile is
    Port (
        clk, reset, write, mem_or_reg: in STD_LOGIC;
        res_reg_add, reg1_add, reg2_add: in STD_LOGIC_VECTOR(1 downto 0);
        databus: in STD_LOGIC_VECTOR(7 downto 0);
        alu_out: out STD_LOGIC_VECTOR(7 downto 0);
        overflow, carryOut: out STD_LOGIC;
        alu_op: in STD_LOGIC_VECTOR(3 downto 0);
        carryin: in STD_LOGIC;
		mux_out:out STD_LOGIC_VECTOR(7 downto 0)
    );
end entity DatapathwithRegisterFile;

architecture Behavioral of DatapathwithRegisterFile is
    signal mux_out_int, alu_out_int, alu_result_int: STD_LOGIC_VECTOR(7 downto 0);
    signal overflow_int, carryOut_int: STD_LOGIC;

    component Multiplexer_2to1_8bit is
        Port (
            DATA0, DATA1: in STD_LOGIC_VECTOR(7 downto 0);
            Sel: in STD_LOGIC;
            Output: out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component ALU is
        Port (
            A, B: in STD_LOGIC_VECTOR(7 downto 0);
            SEL: in STD_LOGIC_VECTOR(3 downto 0);
            cin: in STD_LOGIC;
            R: out STD_LOGIC_VECTOR(7 downto 0);
            Overflow, cout: out STD_LOGIC
        );
    end component;

    component register_file is
        Port (
            clk, reset, write: in STD_LOGIC;
            address: in STD_LOGIC_VECTOR(1 downto 0);
            data_in: in STD_LOGIC_VECTOR(7 downto 0);
            address_out1, address_out2: in STD_LOGIC_VECTOR(1 downto 0);
            data_out1, data_out2: out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal address_out1, address_out2: STD_LOGIC_VECTOR(1 downto 0);
    signal data_out1, data_out2: STD_LOGIC_VECTOR(7 downto 0);
begin
    RF: register_file port map (
        clk => clk,
        reset => reset,
        write => write,
        address => res_reg_add,
        data_in => alu_result_int,  -- Connect data_in to ALU result
        address_out1 => reg1_add,
        address_out2 => reg2_add,
        data_out1 => data_out1,
        data_out2 => data_out2		
    );

    MUX: Multiplexer_2to1_8bit port map (
        DATA0 => data_out2,
        DATA1 => databus,
        Sel => mem_or_reg,
        Output => mux_out_int
    );

    ALU_unit: ALU port map (
        A => data_out1,
        B => mux_out_int,
        SEL => alu_op,
        cin => carryin,
        R => alu_result_int,
        Overflow => overflow_int,
        cout => carryOut_int
    );

    alu_out  <= alu_result_int;   
    overflow <= overflow_int;
    carryOut <= carryOut_int;
    mux_out  <= mux_out_int;
end Behavioral;
