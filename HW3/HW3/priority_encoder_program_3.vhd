library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY priority_encoder IS
  PORT( d: IN std_logic_vector(7 DOWNTO 1);
		  y:OUt integer range 0 TO 7);
END;

ARCHITECTURE encoder_arch OF priority_encoder IS
BEGIN
  with d select
  y <= 0 WHEN "0000000",
		 1 WHEN "0000001",
		 2 WHEN "0000010" to "0000011",
		 3 WHEN "0000100" to "0000111",
	    4 WHEN "0001000" to "0001111",
		 5 WHEN "0010000" to "0011111",
		 6 WHEN "0100000" to "0111111",
		 7 WHEN OTHERS;
END;