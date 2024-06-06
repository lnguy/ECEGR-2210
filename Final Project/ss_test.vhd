library IEEE;
use IEEE.std_logic_1164.all;
----------------------------------------------
ENTITY ss_test IS
	PORT (clk, toggle, inc, timer, start: IN std_logic;
			s_count: IN INTEGER RANGE 0 TO 5;
			mm_count: IN INTEGER RANGE 0 TO 9;
			m_count: IN INTEGER RANGE 0 TO 5;
			count: OUT INTEGER RANGE 0 TO 9);
END ENTITY;
----------------------------------------------
ARCHITECTURE ss_test OF ss_test IS
SIGNAL temp: INTEGER RANGE 0 TO 10;
SIGNAL temp2: INTEGER RANGE 0 TO 10;
BEGIN
	clock: PROCESS (clk, toggle)
	BEGIN
		IF (clk'EVENt AND clk='1') THEN
			IF (toggle = '0') THEN
				IF (temp = 9) THEN
					temp <= 0;
				ELSE
					temp <= temp + 1;
				END IF;
			
			ELSIF (timer = '1') THEN
				IF (inc = '0') THEN
					IF (clk'EVENt AND clk='1') THEN
						IF (temp = 9) THEN
							temp <= 0;
						ELSE
							temp <= temp + 1;
						END IF;
					END IF;
				ELSIF (start = '1') THEN
					IF (clk'EVENt AND clk='1') THEN
						IF (temp = 0) THEN
							IF (s_count = 0) THEN
								IF (mm_count = 0) THEN
									IF (m_count = 0) THEN
										
								ELSE
									temp <= temp - 1;
								END IF;
							ELSE
								temp <= temp - 1;
							END IF;
			END IF;
		END IF;
		count <= temp;
	END PROCESS;
	countdown: PROCESS (clk, toggle, inc, start)
	BEGIN
		IF (timer = '1') THEN
			IF (inc = '0') THEN
				IF (clk'EVENt AND clk='1') THEN
					IF (temp = 9) THEN
						temp <= 0;
					ELSE
						temp <= temp + 1;
					END IF;
				END IF;
			ELSIF (start = '1') THEN
				IF (clk'EVENt AND clk='1') THEN
					IF (temp2 = 0) THEN
						IF (s_count = 0) THEN
							IF (mm_count = 0) THEN
								IF (m_count = 0) THEN
											
								ELSE
									temp2 <= temp2 - 1;
								END IF;
							ELSE
								temp2 <= temp2 - 1;
							END IF;
						END IF;
					END IF;
				END IF;
			END IF;
		END IF;
	count <= temp2;
	END PROCESS;
END ARCHITECTURE;
----------------------------------------------
