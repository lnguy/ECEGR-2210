-- FSM template in VHDL --
-- based on Pedroni, pp. 279--280
-- author:
-------------------------------- 
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
--------------------------------
ENTITY Problem1 IS
  PORT ( clk, rst, sel: IN std_logic;
         led: OUT std_logic_vector (7 DOWNTO 0));
END Problem1;
--------------------------------
ARCHITECTURE FSM OF Problem1 IS
  TYPE state IS (s0, s1, s2, s3, s4, s5, s6, s7);              -- An enumerated type (called "state") is created.
  SIGNAL prState, nxState: state;            -- The present and next states are of type 'state'.
  ATTRIBUTE ENUM_ENCODING: STRING;           -- optional attribute for choice: sequential/one-hot/Gray/Johnson
  ATTRIBUTE ENUM_ENCODING OF state: TYPE IS "sequential";
BEGIN
  -------- LOWER, SEQUENTIAL, SECTION --------
  PROCESS (clk, rst)
  BEGIN
    IF (rst='1') THEN
      prState <= s0;
    ELSIF (clk'EVENT AND clk='1') THEN
      prState <= nxState;
    END IF;
  END PROCESS;
  -------- UPPER, COMBINATIONAL, BLOCK --------
  PROCESS (prState, sel)                       -- no need for clk
  BEGIN                                          -- Always specify all leds and each next state, using don't-cares if necessary.
    CASE prState IS                              -- This section can also be written with concurrent statements.
      WHEN s0 =>                                  -- "for the case when the present state is A..."
        nxState <= s1;
        IF (sel = '0') THEN
          led <= "00000000";
        ELSIF(sel = '1') THEN
          led <= "00000000";
        END IF;
--
      WHEN s1 =>
        nxState <= s2;
        IF (sel = '0') THEN
          led <= "01010101";
        ELSIF(sel = '1') THEN
          led <= "00000001";
        END IF;
--
		WHEN s2 =>
        nxState <= s3;
        IF (sel = '0') THEN
          led <= "10101010";
        ELSIF(sel = '1') THEN
          led <= "00000011";
        END IF;
--
		WHEN s3 =>
        nxState <= s4;
        IF (sel = '0') THEN
          led <= "00110011";
        ELSIF(sel = '1') THEN
          led <= "00000111";
        END IF;
--
		WHEN s4 =>
        nxState <= s5;
        IF (sel = '0') THEN
          led <= "11001100";
        ELSIF(sel = '1') THEN
          led <= "00001110";
        END IF;
--
		WHEN s5 =>
        nxState <= s6;
        IF (sel = '0') THEN
          led <= "00001111";
        ELSIF(sel = '1') THEN
          led <= "00011100";
        END IF;
--
		WHEN s6 =>
        nxState <= s7;
        IF (sel = '0') THEN
          led <= "11110000";
        ELSIF(sel = '1') THEN
          led <= "00011000";
        END IF;
--
		WHEN s7 =>
        nxState <= s0;
        IF (sel = '0') THEN
          led <= "11111111";
        ELSIF(sel = '1') THEN
          led <= "00010000";
        END IF;
--
    END CASE;
  END PROCESS;
END FSM;
