LIBRARY IEEE; 
USE IEEE.std_logic_1164.ALL; 
USE IEEE.numeric_std.ALL; 
------------------------------------------ 
PACKAGE mypack IS 
------------------------------------------ 
  COMPONENT counter 
    PORT(clk: IN std_logic; 
         count: OUT INTEGER RANGE 0 TO 9); 
  END COMPONENT; 
------------------------------------------ 
  COMPONENT clock_divider 
    GENERIC(n: INTEGER := 2*10**7);  -- 2*10**7 when using hardware 
    PORT(clk_in: IN std_logic; 
         clk_out: OUT std_logic); 
  END COMPONENT; 
------------------------------------------ 
  COMPONENT sevenseg_disp 
    PORT(input: IN std_logic_vector(3 DOWNTO 0); 
         output: OUT std_logic_vector(6 DOWNTO 0) ); 
  END COMPONENT; 
------------------------------------------ 
END;