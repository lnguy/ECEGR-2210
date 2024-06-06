library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY priority_encoder IS
  PORT( d: IN integer range 0 TO 127;
		  y:OUt std_logic_vector(2 DOWNTO 0));
END;

ARCHITECTURE encoder_arch OF priority_encoder IS
BEGIN
  with d select
  y <= "000" WHEN 0,
		 "001" WHEN 1,
		 "010" WHEN 2 to 3,
		 "011" WHEN 4 to 7,
	    "100" WHEN 8 to 15,
		 "101" WHEN 16 to 31,
		 "110" WHEN 32 to 63,
		 "111" WHEN OTHERS;
END;