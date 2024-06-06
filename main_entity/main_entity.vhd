------------------------------------------------------------ 
LIBRARY IEEE; 
USE IEEE.std_logic_1164.all; 
USE IEEE.numeric_std.all; 
USE work.mypack.all;
------------------------------------------------------------ 
ENTITY main_entity IS 
   GENERIC (n: INTEGER:= 2*10**7); 
   PORT (clock_in: in std_logic;  
         segment: out std_logic_vector(6 downto 0) ); 
END;
------------------------------------------------------------
ARCHITECTURE structure OF main_entity IS
SIGNAL clock_out: std_logic;
SIGNAL num: INTEGER RANGE 0 TO 9;
SIGNAL sgn: signed(3 DOWNTO 0);
SIGNAL SLV: std_logic_vector (3 DOWNTO 0);
	BEGIN
		ClkDiv: clock_divider PORT MAP (clock_in, clock_out);
		Count: counter PORT MAP (clock_out, num);
		sgn <= to_signed(num, 4);
		SLV <= std_logic_vector(sgn);
		SvnSeg: sevenseg_disp PORT MAP (SLV, segment);
END ARCHITECTURE;