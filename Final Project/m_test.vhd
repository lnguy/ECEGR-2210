library IEEE;
use IEEE.std_logic_1164.all;
----------------------------------------------
ENTITY m_test IS
	PORT (clk, toggle, inc, timer, start: IN std_logic;
			s_count: IN INTEGER RANGE 0 TO 9;
			mm_count: IN INTEGER RANGE 0 TO 5;
			m_count: IN INTEGER RANGE 0 TO 9;
			count: OUT INTEGER RANGE 0 TO 5);
END ENTITY;
----------------------------------------------
ARCHITECTURE m_test OF m_test IS
SIGNAL temp: INTEGER RANGE 0 TO 6;
BEGIN
	PROCESS(clk, toggle, inc, timer, start)
	BEGIN
		IF (clk'EVENt AND clk='1') THEN
			IF (toggle = '0') THEN
				IF (s_count = 9) THEN
					IF (mm_count = 5) THEN
						IF (m_count = 9) THEN
							IF (temp = 5) THEN
								temp <= 0;
							ELSE
								temp <= temp + 1;
							END IF;
						END IF;
					END IF;
				END IF;
			
			ELSIF (toggle = '1') THEN
				IF(inc = '0') THEN
					IF (clk'EVENt AND clk='1') THEN
						IF (temp = 5) THEN
							temp <= 0;
						ELSE
							temp <= temp + 1;
						END IF;
					END IF;
				END IF;
			
			ELSIF (timer = '1') THEN
				IF(inc = '0') THEN
					IF (clk'EVENt AND clk='1') THEN
						IF (temp = 5) THEN
							temp <= 0;
						ELSE
							temp <= temp + 1;
						END IF;
					END IF;
				
				ELSIF(start = '1') THEN
					IF (clk'EVENt AND clk='1') THEN
						IF (temp = 0) THEN
							temp <=
				END IF;
			END IF;
		END IF;
	END PROCESS;
	count <= temp;
END ARCHITECTURE;
----------------------------------------------
