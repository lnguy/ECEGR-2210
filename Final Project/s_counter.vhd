library IEEE;
use IEEE.std_logic_1164.all;
----------------------------------------------
ENTITY s_counter IS
	PORT (clk, toggle, alarm: IN std_logic;
			s_count: IN INTEGER RANGE 0 TO 9;
			count: OUT INTEGER RANGE 0 TO 5);
END ENTITY;
----------------------------------------------
ARCHITECTURE s_counter OF s_counter IS
SIGNAL temp: INTEGER RANGE 0 TO 6;
BEGIN
	PROCESS(clk, toggle)
	BEGIN
		IF (clk'EVENt AND clk='1') THEN
			IF (toggle = '0') THEN
				IF (s_count = 9) THEN
					IF (temp = 5) THEN
						temp <= 0;
					ELSE
						temp <= temp + 1;
					END IF;
				END IF;
			END IF;
		END IF;
	END PROCESS;
	count <= temp;
END ARCHITECTURE;
----------------------------------------------
