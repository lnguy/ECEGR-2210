LIBRARY IEEE; 
USE IEEE.std_logic_1164.ALL; 
USE IEEE.numeric_std.ALL; 
------------------------------------------ 
PACKAGE component_pack IS 
------------------------------------------ 
  COMPONENT ss_counter 
    PORT(clk, toggle: IN std_logic; 
         count: OUT INTEGER RANGE 0 TO 9); 
  END COMPONENT; 
------------------------------------------ 
COMPONENT s_counter 
    PORT(clk, toggle: IN std_logic;
			s_count: IN INTEGER RANGE 0 TO 9; 
         count: OUT INTEGER RANGE 0 TO 5); 
  END COMPONENT; 
------------------------------------------ 
COMPONENT mm_counter 
    PORT(clk, toggle, inc: IN std_logic;
			s_count: IN INTEGER RANGE 0 TO 9;
			mm_count: IN INTEGER RANGE 0 TO 5; 
         count: OUT INTEGER RANGE 0 TO 9); 
  END COMPONENT;
------------------------------------------ 
COMPONENT m_counter 
    PORT(clk, toggle, inc: IN std_logic;
			s_count: IN INTEGER RANGE 0 TO 9;
			mm_count: IN INTEGER RANGE 0 TO 5;
			m_count: IN INTEGER RANGE 0 TO 9;
         count: OUT INTEGER RANGE 0 TO 5); 
  END COMPONENT;
------------------------------------------ 
COMPONENT hh_counter 
    PORT(clk, toggle, inc: IN std_logic;
			s_count: IN INTEGER RANGE 0 TO 9;
			mm_count: IN INTEGER RANGE 0 TO 5;
			m_count: IN INTEGER RANGE 0 TO 9;
			hh_count: IN INTEGER RANGE 0 TO 5;
			h_count: IN INTEGER RANGE 0 TO 3;
			count: OUT INTEGER RANGE 0 TO 9);
  END COMPONENT;
------------------------------------------ 
COMPONENT h_counter 
    PORT(clk, toggle, inc: IN std_logic;
			s_count: IN INTEGER RANGE 0 TO 9;
			mm_count: IN INTEGER RANGE 0 TO 5;
			m_count: IN INTEGER RANGE 0 TO 9;
			hh_count: IN INTEGER RANGE 0 TO 5;
			h_count: IN INTEGER RANGE 0 TO 9;
			count: OUT INTEGER RANGE 0 TO 3); 
  END COMPONENT;
------------------------------------------ 
  COMPONENT clock_divider 
    GENERIC(n: INTEGER := 25500000);  -- 2*10**7 when using hardware 
    PORT(clk_in, toggle: IN std_logic; 
         clk_out: OUT std_logic); 
  END COMPONENT; 
------------------------------------------ 
  COMPONENT sevenseg_disp
    PORT(input: IN integer range 0 to 15;
			output: OUT std_logic_vector(6 DOWNTO 0) ); 
  END COMPONENT; 
------------------------------------------ 
END;