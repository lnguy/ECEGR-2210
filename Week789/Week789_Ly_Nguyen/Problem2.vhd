-- FSM template in VHDL --
-- based on Pedroni, pp. 279--280
-- author:
-------------------------------- 
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
--------------------------------
ENTITY Problem2 IS
  PORT ( clk, rst: IN std_logic;
         nickel_in, dime_in, quarter_in: IN BOOLEAN;
			candy_out, nickel_out, dime_out: OUT std_logic);
END Problem2;
--------------------------------
ARCHITECTURE FSM OF Problem2 IS
  TYPE state IS (st0, st5, st10, st15, st20, st25, st30, st35, st40);              -- An enumerated type (called "state") is created.
  SIGNAL prState, nxState: state;            -- The present and next states are of type 'state'.
  ATTRIBUTE ENUM_ENCODING: STRING;           -- optional attribute for choice: sequential/one-hot/Gray/Johnson
  ATTRIBUTE ENUM_ENCODING OF state: TYPE IS "sequential";
BEGIN
  -------- LOWER, SEQUENTIAL, SECTION --------
  PROCESS (clk, rst)
  BEGIN
    IF (rst='1') THEN
      prState <= st0;
    ELSIF (clk'EVENT AND clk='1') THEN
      prState <= nxState;
    END IF;
  END PROCESS;
  -------- UPPER, COMBINATIONAL, BLOCK --------
  PROCESS (prState, nickel_in, dime_in, quarter_in)                       -- no need for clk
  BEGIN                                          -- Always specify all outputs and each next state, using don't-cares if necessary.
    CASE prState IS                              -- This section can also be written with concurrent statements.
      WHEN st0 =>                                  -- "for the case when the present state is A..."
        candy_out <= '0';
		  nickel_out <= '0';
		  dime_out <= '0';
		  IF (nickel_in) THEN
			nxState <= st5;
		  ELSIF (dime_in) THEN
			nxState <= st10;
		  ELSIF(quarter_in) THEN
			nxState <= st25;
		  ELSE
			nxState <= st0;
		  END IF;
--
      WHEN st5 =>
		  candy_out <= '0';
		  nickel_out <= '0';
		  dime_out <= '0';
		  IF (nickel_in) THEN
			nxState <= st10;
		  ELSIF (dime_in) THEN
			nxState <= st15;
		  ELSIF (quarter_in) THEN
			nxState <= st30;
		  ELSE
			nxState <= st5;
		  END IF;
--
		WHEN st10 =>
		  candy_out <= '0';
		  nickel_out <= '0';
		  dime_out <= '0';
		  IF (nickel_in) THEN
			nxState <= st15;
		  ELSIF (dime_in) THEN
			nxState <= st20;
		  ELSIF (quarter_in) THEN
			nxState <= st35;
		  ELSE
			nxState <= st10;
		  END IF;
--
		WHEN st15 =>
		  candy_out <= '0';
		  nickel_out <= '0';
		  dime_out <= '0';
		  IF (nickel_in) THEN
			nxState <= st20;
		  ELSIF (dime_in) THEN
			nxState <= st25;
		  ELSIF (quarter_in) THEN
			nxState <= st40;
		  ELSE
			nxState <= st15;
		  END IF;
--
		WHEN st20 =>
		  candy_out <= '1';
		  nickel_out <= '0';
		  dime_out <= '0';
		  nxState <= st0;
--
		WHEN st25 =>
		  candy_out <= '1';
		  nickel_out <= '1';
		  dime_out <= '0';
		  nxState <= st0;
--
		WHEN st30 =>
		  candy_out <= '1';
		  nickel_out <= '0';
		  dime_out <= '1';
		  nxState <= st0;
--
		WHEN st35 =>
		  candy_out <= '1';
		  nickel_out <= '1';
		  dime_out <= '1';
		  nxState <= st0;
--
		WHEN st40 =>
		  candy_out <= '0';
		  nickel_out <= '1';
		  dime_out <= '0';
		  nxState <= st35;
--
    END CASE;
  END PROCESS;
END FSM;
