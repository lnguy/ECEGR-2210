library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.mypack.all;

ENTITY Lab_6 IS
	PORT (reset, clk: IN std_logic;
			q2, q1, q0: OUT std_logic_vector(3 DOWNTO 0));
END ENTITY;

ARCHITECTURE JohnCount OF Lab_6 IS
	TYPE state IS (s0, s1, s2, s3, s4, s5);
	SIGNAL pr_state, next_state: state;
BEGIN
	-------- LOWER, SEQUENTIAL, SECTION --------
  PROCESS (clk, reset)
  BEGIN
    IF (reset='0') THEN
      pr_state <= s0;
    ELSIF (clk'EVENT AND clk='1') THEN
      pr_state <= next_state;
    END IF;
  END PROCESS;
  -------- UPPER, COMBINATIONAL, BLOCK --------
  PROCESS(pr_state)
  BEGIN
		CASE pr_state IS
			WHEN s0 =>
				q2 <= "0000";
				q1 <= "0000";
				q0 <= "0000";
				next_state <= s1;
			WHEN s1 =>
				q2 <= "0001";
				q1 <= "0000";
				q0 <= "0000";
				next_state <= s2;
			WHEN s2 =>
				q2 <= "0001";
				q1 <= "0001";
				q0 <= "0000";
				next_state <= s3;
			WHEN s3 =>
				q2 <= "0001";
				q1 <= "0001";
				q0 <= "0001";
				next_state <= s4;
			WHEN s4 =>
				q2 <= "0000";
				q1 <= "0001";
				q0 <= "0001";
				next_state <= s5;
			WHEN s5 =>
				q2 <= "0000";
				q1 <= "0000";
				q0 <= "0001";
				next_state <= s0;
		END CASE;
	END PROCESS;
  ---------------------------------------------
END JohnCount;