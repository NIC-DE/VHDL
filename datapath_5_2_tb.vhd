LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_datapath_5_2 IS
END tb_datapath_5_2;

ARCHITECTURE testbench OF tb_datapath_5_2 IS
   
    SIGNAL TEMP, LOAD, CLOCK, RESET: STD_LOGIC := '0';
    SIGNAL ALU: STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";
    SIGNAL YA, YB: STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL COUT: STD_LOGIC;
    SIGNAL Z: STD_LOGIC_VECTOR(7 DOWNTO 0);

    COMPONENT datapath_5_2
        PORT (
            TEMP : IN STD_LOGIC;
            LOAD : IN STD_LOGIC;
            CLOCK : IN STD_LOGIC;
            RESET : IN STD_LOGIC;
            ALU : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
            YA : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            YB : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            COUT : OUT STD_LOGIC;
            Z : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;

BEGIN
    
    dut: datapath_5_2 PORT MAP (
        TEMP => TEMP,
        LOAD => LOAD,
        CLOCK => CLOCK,
        RESET => RESET,
        ALU => ALU,
        YA => YA,
        YB => YB,
        COUT => COUT,
        Z => Z
    );

    Clock_Process: PROCESS
    BEGIN
        CLOCK <= '0';
        WAIT FOR 5 NS;
        CLOCK <= NOT CLOCK AFTER 200 ps; -- Εναλλαγή του ρολογιού κάθε 5ns, 50% duty cycle
    END PROCESS Clock_Process;

    Stimulus_Process: PROCESS
    BEGIN
        RESET <= '1'; -- Ενεργοποίηση RESET
        WAIT FOR 10 NS;
        RESET <= '0'; -- Απενεργοποίηση RESET μετά από έναν κύκλο ρολογιού

        WAIT FOR 10 NS;

        -- Πρόσθεση 63 + 15 (ALU ADD)
        ALU <= "00000"; 
        YA <= "00111111"; -- 63
        YB <= "00001111"; -- 15
        LOAD <= '1';
        WAIT FOR 10 NS;
        LOAD <= '0';
        WAIT FOR 10 NS;

        -- Αφαίρεση 63 - 15 (ALU SUB)
        ALU <= "01100"; 
        LOAD <= '1';
        WAIT FOR 10 NS;
        LOAD <= '0';
        WAIT FOR 10 NS;

        -- Αφαίρεση 63 - 100 (ALU SUB)
        ALU <= "01100"; 
        YB <= "01100100"; -- 100
        LOAD <= '1';
        WAIT FOR 10 NS;
        LOAD <= '0';
        WAIT FOR 10 NS;

        -- Λογική ΠΡΑΞΗ AND (ALU AND)
        ALU <= "00001"; 
        YB <= "00100011"; -- 35
        LOAD <= '1';
        WAIT FOR 10 NS;
        LOAD <= '0';
        WAIT FOR 10 NS;

        -- Αύξηση κατά 1 (ALU INCREMENT)
        ALU <= "10100"; 
        YA <= "01000000"; -- 64
        LOAD <= '1';
        WAIT FOR 10 NS;
        LOAD <= '0';
        WAIT FOR 10 NS;

        -- Μεταφορά της εισόδου ΥΑ στην έξοδο (όπου YA = 57)
		ALU <="00010";
        YA <= "00111001"; -- 57
        LOAD <= '1';
        WAIT FOR 10 NS;
        LOAD <= '0';
        WAIT FOR 10 NS;

        -- Μεταφορά της εισόδου ΥΒ στην έξοδο (όπου YB = 47)
        ALU <= "00011"; 
		YB <="00101111";   -- 47
        LOAD <= '1';
        WAIT FOR 10 NS;
        LOAD <= '0';
        WAIT FOR 10 NS;

        WAIT;
    END PROCESS Stimulus_Process;

END testbench;
