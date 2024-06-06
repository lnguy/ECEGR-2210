------------------------------------------------------------ 
LIBRARY IEEE; 
USE IEEE.std_logic_1164.all; 
USE IEEE.numeric_std.all; 
USE work.component_pack.all;
------------------------------------------------------------ 
ENTITY finalClock IS 
   GENERIC (n: INTEGER:= 25500000); 
   PORT (clock_in, toggle, inc1, inc2, inc3, inc4: in std_logic;
         segment1, segment2, segment3, segment4, segment5, segment6: out std_logic_vector(6 downto 0) ); 
END;
------------------------------------------------------------
ARCHITECTURE structure OF finalClock IS
SIGNAL clock_out: std_logic;
SIGNAL num1: INTEGER RANGE 0 TO 10;
SIGNAL num2: integer RANGE 0 TO 5;
SIGNAL num3: integer RANGE 0 TO 10;
SIGNAL num4: integer RANGE 0 TO 5;
SIGNAL num5: integer RANGE 0 TO 10;
SIGNAL num6: integer RANGE 0 TO 3;
--SIGNAL sgn: signed(3 DOWNTO 0);
--SIGNAL SLV: std_logic_vector (5 DOWNTO 0);
	BEGIN
		ClkDiv: clock_divider PORT MAP (clock_in, toggle, clock_out);
		Count1: ss_counter PORT MAP (clock_out, toggle, num1);
		Count2: s_counter PORT MAP (clock_out, toggle, num1, num2);
		Count3: mm_counter PORT MAP (clock_out, toggle, inc1, num1, num2, num3);
		count4: m_counter PORT MAP (clock_out, toggle, inc2, num1, num2, num3, num4);
		Count5: hh_counter PORT MAP (clock_out, toggle, inc3, num1, num2, num3, num4, num6, num5);
		Count6: h_counter PORT MAP (clock_out, toggle, inc4, num1, num2, num3, num4, num5, num6);
		
		SvnSeg1: sevenseg_disp PORT MAP (num1, segment1);
		SvnSeg2: sevenseg_disp PORT MAP (num2, segment2);
		SvnSeg3: sevenseg_disp PORT MAP (num3, segment3);
		SvnSeg4: sevenseg_disp PORT MAP (num4, segment4);
		SvnSeg5: sevenseg_disp PORT MAP (num5, segment5);
		SvnSeg6: sevenseg_disp PORT MAP (num6, segment6);
			
END ARCHITECTURE;