library IEEE;
use IEEE.std_logic_1164.ALL;

ENTITY priority_encoder IS
  PORT( d: IN std_logic_vector(7 DOWNTO 1);
		  y:OUt integer range 0 TO 7);
END;

ARCHITECTURE encoder_arch OF priority_encoder IS
BEGIN
  y <= 0 WHEN d(7)='1'
  else 1 WHEN d(6)='1'
  else 2 WHEN d(5)='1'
  else 3 WHEN d(4)='1'
  else 4 WHEN d(3)='1'
  else 5 WHEN d(2)='1'
  else 6 WHEN d(1)='1'
  else 7;
END;