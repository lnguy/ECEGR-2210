--library IEEE;
--use IEEE.std_logic_1164.all;

--ENTITY Lab5Part1 IS
	--PORT (d, clk, rst: IN BIT;
--			q: OUT BIT);
--END ENTITY;
--------------Code 1--------------
--ARCHITECTURE circuit OF Lab5Part1 IS
--BEGIN
--	PROCESS (d, clk, rst)
--	BEGIN
--		IF (rst='1') THEN
--			q <= '0';
--		ELSIF (clk='1') THEN
--			q <= d;
--		END IF;
--	END PROCESS;
--END ARCHITECTURE;
----------------------------------

--------------Code 3--------------
--ARCHITECTURE circuit OF Lab5Part1 IS

--BEGIN
--	PROCESS (clk)
	--BEGIN
--		IF (clk='1') THEN
--			IF (rst='1') THEN
--				q <= '0';
--			ELSE
--				q <= d;
	--		END IF;
--		END IF;
--	END PROCESS;
--END ARCHITECTURE;
library IEEE;
use IEEE.std_logic_1164.all;
----------------------------------------------
ENTITY counter IS
	PORT (clk: IN BIT;
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
