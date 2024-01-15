LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY tb_STATUS_REGISTER IS
-- No ports for a testbench
END tb_STATUS_REGISTER;

ARCHITECTURE behavior OF tb_STATUS_REGISTER IS
  -- Import the entity you want to test
  COMPONENT STATUS_REGISTER
    PORT (
      CARRY : IN STD_LOGIC;
      CLOCK : IN STD_LOGIC;
      CLR : IN STD_LOGIC;
      ZERO : IN STD_LOGIC;
      ADD : IN STD_LOGIC;
      SUB : IN STD_LOGIC;
      BITAND : IN STD_LOGIC;
      CARRY_REG : OUT STD_LOGIC;
      ZERO_REG : OUT STD_LOGIC
    );
  END COMPONENT;

  -- Signals for the testbench
  SIGNAL CARRY_TB, CLOCK_TB, CLR_TB, ZERO_TB, ADD_TB, SUB_TB, BITAND_TB, CARRY_REG_TB, ZERO_REG_TB : STD_LOGIC := '0';
  SIGNAL SYNTHESIZED_WIRE_2_TB : STD_LOGIC := '0';

BEGIN

  -- Instantiate the entity to be tested
  UUT : STATUS_REGISTER PORT MAP (
    CARRY => CARRY_TB,
    CLOCK => CLOCK_TB,
    CLR => CLR_TB,
    ZERO => ZERO_TB,
    ADD => ADD_TB,
    SUB => SUB_TB,
    BITAND => BITAND_TB,
    CARRY_REG => CARRY_REG_TB,
    ZERO_REG => ZERO_REG_TB
  );

  -- Clock Process
  CLK_Process : PROCESS
  BEGIN
    WAIT FOR 5 ns;
    CLOCK_TB <= NOT CLOCK_TB; -- Generate clock signal
  END PROCESS;

  -- Asynchronous Clear
  ASYNC_Clear : PROCESS
  BEGIN
    CLR_TB <= '1';       -- Set clear to '1' initially
    WAIT FOR 5 ns;       -- Hold CLR_TB at '1' for 5 ns
    CLR_TB <= '0';       -- Release clear to '0' after 5 ns
    WAIT FOR 5 ns;       -- Hold time before releasing clear
    WAIT;                -- Wait indefinitely
  END PROCESS;

  -- Test vectors for ten different scenarios
  TEST : PROCESS
  BEGIN
    WAIT FOR 5 ns; -- Wait for initial conditions to settle with CLR = '1'
    WAIT FOR 5 ns; -- Maintain CLR = '1' for the first clock cycle
    CLR_TB <= '0'; -- Release clear after the first clock cycle
    WAIT FOR 15 ns; -- Additional wait time after CLR transition
    
    -- Test 1
    CARRY_TB <= '0';
    CLOCK_TB <= '0';
    CLR_TB <= '1';
    ZERO_TB <= '0';
    ADD_TB <= '1';
    SUB_TB <= '0';
    BITAND_TB <= '1';
    WAIT FOR 10 ns; -- Simulate input changes

    -- Test 2
    CARRY_TB <= '1';
    CLOCK_TB <= '1';
    CLR_TB <= '0';
    ZERO_TB <= '1';
    ADD_TB <= '0';
    SUB_TB <= '1';
    BITAND_TB <= '0';
    WAIT FOR 10 ns; -- Simulate input changes

    -- Test 3
    CARRY_TB <= '1';
    CLOCK_TB <= '0';
    CLR_TB <= '1';
    ZERO_TB <= '1';
    ADD_TB <= '1';
    SUB_TB <= '0';
    BITAND_TB <= '1';
    WAIT FOR 10 ns; -- Simulate input changes

    -- Test 4
    CARRY_TB <= '0';
    CLOCK_TB <= '1';
    CLR_TB <= '0';
    ZERO_TB <= '0';
    ADD_TB <= '0';
    SUB_TB <= '1';
    BITAND_TB <= '1';
    WAIT FOR 10 ns; -- Simulate input changes

    -- Test 5
    CARRY_TB <= '1';
    CLOCK_TB <= '1';
    CLR_TB <= '1';
    ZERO_TB <= '1';
    ADD_TB <= '0';
    SUB_TB <= '1';
    BITAND_TB <= '0';
    WAIT FOR 10 ns; -- Simulate input changes

    -- Test 6
    CARRY_TB <= '0';
    CLOCK_TB <= '0';
    CLR_TB <= '0';
    ZERO_TB <= '0';
    ADD_TB <= '0';
    SUB_TB <= '0';
    BITAND_TB <= '0';
    WAIT FOR 10 ns; -- Simulate input changes

    -- Test 7
    CARRY_TB <= '1';
    CLOCK_TB <= '1';
    CLR_TB <= '1';
    ZERO_TB <= '0';
    ADD_TB <= '1';
    SUB_TB <= '1';
    BITAND_TB <= '1';
    WAIT FOR 10 ns; -- Simulate input changes

    -- Test 8
    CARRY_TB <= '0';
    CLOCK_TB <= '1';
    CLR_TB <= '0';
    ZERO_TB <= '1';
    ADD_TB <= '1';
    SUB_TB <= '1';
    BITAND_TB <= '1';
    WAIT FOR 10 ns; -- Simulate input changes

    -- Test 9
    CARRY_TB <= '1';
    CLOCK_TB <= '0';
    CLR_TB <= '0';
    ZERO_TB <= '1';
    ADD_TB <= '0';
    SUB_TB <= '0';
    BITAND_TB <= '0';
    WAIT FOR 10 ns; -- Simulate input changes

    -- Test 10
    CARRY_TB <= '1';
    CLOCK_TB <= '0';
    CLR_TB <= '1';
    ZERO_TB <= '0';
    ADD_TB <= '1';
    SUB_TB <= '1';
    BITAND_TB <= '0';
    WAIT FOR 10 ns; -- Simulate input changes

    WAIT;
  END PROCESS;

END behavior;
