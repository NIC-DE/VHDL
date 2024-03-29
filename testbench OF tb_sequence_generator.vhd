
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY SEQUENCE_GENERATOR_tb IS
END SEQUENCE_GENERATOR_tb;

ARCHITECTURE tb_arch OF SEQUENCE_GENERATOR_tb IS
    -- ???????? ??? ???????? ??????????? ??????? ??????? ??? ??????
    SIGNAL CLK_TB : STD_LOGIC := '0'; -- ???? ????????
    SIGNAL CE_TB : STD_LOGIC := '0'; -- ???? ????????????? (enable)
    SIGNAL CLR_TB : STD_LOGIC := '1'; -- ???? ??????????? (clear)
    SIGNAL FETCH_TB, DECODE_TB, EXECUTE_TB, INCREMENT_TB : STD_LOGIC; -- ?????? ??????

    COMPONENT SEQUENCE_GENERATOR -- ????? ??? DUT (Design Under Test)
        PORT(
            CLK :  IN  STD_LOGIC;
            CE :  IN  STD_LOGIC;
            CLR :  IN  STD_LOGIC;
            FETCH :  OUT  STD_LOGIC;
            DECODE :  OUT  STD_LOGIC;
            EXECUTE :  OUT  STD_LOGIC;
            INCREMENT :  OUT  STD_LOGIC
        );
    END COMPONENT;

BEGIN
    -- ?????????? ???????? ??? DUT
    DUT: SEQUENCE_GENERATOR PORT MAP (
        CLK => CLK_TB,
        CE => CE_TB,
        CLR => CLR_TB,
        FETCH => FETCH_TB,
        DECODE => DECODE_TB,
        EXECUTE => EXECUTE_TB,
        INCREMENT => INCREMENT_TB
    );

    -- ?????????? ??? ??? ???????? ??? ????????
    CLK_Process: PROCESS
    BEGIN
        WAIT FOR 5 ns; -- ???????? ??? ???????? (??????????: 5 ns)
        CLK_TB <= NOT CLK_TB; -- ?????? ??? ????? ??? ????????
    END PROCESS;

    -- ?????????? ????????????? (enable) ??? ??????? ??????? ??????
    TB_Simulation: PROCESS
    BEGIN
        CLR_TB <= '1'; -- ??????? ??? ??????? ??????????? (clear)
        CE_TB <= '1'; -- ????????????
        WAIT FOR 10 ns; -- ??????? ??? 10 ns
        CE_TB <= '0'; -- ??????????????

        -- ????????? ?? ?????? ?????? ??? ?????? ????
        ASSERT(FETCH_TB = '1' AND DECODE_TB = '0' AND EXECUTE_TB = '0' AND INCREMENT_TB = '0')
            REPORT "Wrong output signals for FETCH state" SEVERITY ERROR;
        
        WAIT FOR 5 ns;
        ASSERT(FETCH_TB = '0' AND DECODE_TB = '1' AND EXECUTE_TB = '0' AND INCREMENT_TB = '0')
            REPORT "Wrong output signals for DECODE state" SEVERITY ERROR;
        
        WAIT FOR 5 ns;
        ASSERT(FETCH_TB = '0' AND DECODE_TB = '0' AND EXECUTE_TB = '1' AND INCREMENT_TB = '0')
            REPORT "Wrong output signals for EXECUTE state" SEVERITY ERROR;

        WAIT FOR 5 ns;
        ASSERT(FETCH_TB = '0' AND DECODE_TB = '0' AND EXECUTE_TB = '0' AND INCREMENT_TB = '1')
            REPORT "Wrong output signals for INCREMENT state" SEVERITY ERROR;
        
        WAIT;
    END PROCESS;
END tb_arch;
