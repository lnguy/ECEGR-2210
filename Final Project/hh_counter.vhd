library IEEE;
use IEEE.std_logic_1164.all;
----------------------------------------------
ENTITY hh_counter IS
	PORT (clk, toggle, inc: IN std_logic;
			s_count: IN INTEGER RANGE 0 TO 9;
			mm_count: IN INTEGER RANGE 0 TO 5;
			m_count: IN INTEGER RANGE 0 TO 9;
			hh_count: IN INTEGER RANGE 0 TO 5;
			h_count: IN INTEGER RANGE 0 TO 3;
			count: OUT INTEGER RANGE 0 TO 9);
END ENTITY;
----------------------------------------------
ARCHITECTURE hh_counter OF hh_counter IS
SIGNAL temp: INTEGER RANGE 0 TO 10;
BEGIN
	PROCESS(clk, toggle, inc)
	BEGIN
		IF (clk'EVENt AND clk='1') THEN
			IF (toggle = '0') THEN
				IF (s_count = 9) THEN
					IF (mm_count = 5) THEN
						IF (m_count = 9) THEN
							IF (hh_count = 5) THEN
								IF (temp = 4 AND h_count = 2) THEN
									temp <= 0;
								ELSIF(temp = 9) THEN
									temp <= 0;
								ELSE
									temp <= temp + 1;
								END IF;
							END IF;
						END IF;
					END IF;
				END IF;
				
			ELSIF(toggle = '1') THEN
				IF(inc = '0') THEN
					IF (clk'EVENt AND clk='1') THEN
						IF(temp = 3 AND h_count = 2) THEN
							temp <= 0;
						ELSIF(temp = 9) THEN
							temp <= 0;
						ELSE
							temp <= temp + 1;
						END IF;
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;
	count <= temp;
END ARCHITECTURE;
----------------------------------------------
