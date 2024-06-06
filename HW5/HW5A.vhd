library IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY HW5A IS
	GENERIC(len_in: INTEGER := 8);
	PORT (input: IN std_logic_vector ((len_in-1) DOWNTO 0);
		hamming_weight: OUT INTEGER RANGE 0 TO len_in;
		oneCounter: OUT BIT_VECTOR ((len_in-1) DOWNTO 0));
END ENTITY;

ARCHITECTURE concurrent OF HW5A IS
	TYPE integer_array is array (0 to len_in) of integer range 0 to len_in;
	SIGNAL internal: integer_array;
BEGIN
	internal(0) <= 0;
--------------------------Part A--------------------------
	HammWeightCalc: for i in 1 to len_in GENERATE
		internal (i) <= internal(i-1) + 1 when input(i-1) = '1' else internal(i-1);
	END GENERATE;
	hamming_weight <= internal(len_in);
----------------------------------------------------------
	
--------------------------Part B--------------------------
	sorting: for j in 0 to len_in-1 GENERATE
		oneCounter((len_in-1)-j) <= '1' WHEN j < internal(len_in) ELSe '0';
	END GENERATE;
----------------------------------------------------------
END ARCHITECTURE;