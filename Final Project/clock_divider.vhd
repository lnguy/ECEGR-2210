library IEEE;
use IEEE.std_logic_1164.all;

ENTITY clock_divider IS
  GENERIC(n: INTEGER := 25500000); --2*10**7
  PORT(clk_in: IN STD_LOGIC;
		toggle: IN std_logic;
		clk_out: OUT STD_LOGIC);
END;

ARCHITECTURE RTL OF clock_divider IS
  SIGNAL count: integer range 0 to n+1;
  SIGNAL internal: STD_LOGIC:= '0';
BEGIN
  PROCESS (clk_in, toggle)
  BEGIN
--	 IF (toggle = '0') THEN
		 IF (clk_in'event AND clk_in = '1') THEN
			count <= count + 1;
			IF (count = n) THEN
			  internal <= not internal;
			  clk_out <= internal;
			  count <= 0;
			END IF;
		 END IF;
--	 ELSIF (toggle = '1') THEN
--		count <= 0;
--	 END IF;
  END PROCESS;
END;
