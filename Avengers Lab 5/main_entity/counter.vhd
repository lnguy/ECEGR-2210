library IEEE;
use IEEE.std_logic_1164.all;
----------------------------------------------
ENTITY counter IS
	PORT (clk: IN std_logic;
			count: OUT INTEGER RANGE 0 TO 9);
END ENTITY;
----------------------------------------------
ARCHITECTURE counter OF counter IS
SIGNAL temp: INTEGER RANGE 0 TO 10;
BEGIN
	PROCESS(clk)
	BEGIN
		IF (clk'EVENt AND clk='1') THEN
			IF (temp = 9) THEN
				temp <= 0;
			ELSE
				temp <= temp + 1;
			END IF;
		END IF;
	END PROCESS;
	count <= temp;
END ARCHITECTURE;
----------------------------------------------
