--Seven-segment decoder

--This is the decoder VDHL code for running a seven-segment display
--Author: Ly Nguyen
--Date: January 11, 2022

--Declaring IEEE library to be able to call a standard logic vector later
library IEEE;
use IEEE.std_logic_1164.all;

--Initializing the entity portion
ENTITY two_seven_seg IS
	PORT( input: IN std_logic_vector(7 DOWNTO 0); --declares the input for the seven segment display as an integer
			seg1, seg2: OUT std_logic_vector(6 DOWNTO 0) ); --declares the output for the seven segment display as 7 bits: one bit for each segment on the display
end; --declares that the entity portion is done

--Initializing the architecture portion
ARCHITECTURE encoding OF two_seven_seg IS
	SIGNAL first_digit: std_logic_vector(7 DOWNTO 0); --declares SIGNAL architecture called "internal", 8 bits allow for the hex to read in two sections of 4 bits
	SIGNAL second_digit: std_logic_vector(7 DOWNTO 0);
	begin
		WITH input SELECT --declares what hex value is assigned to what value to display the hex value assignment to the seven segment display
			first_digit <= x"40" WHEN x"00",
								x"40" WHEN x"10",
								x"40" WHEN x"20",
								x"40" WHEN x"30",
								x"40" WHEN x"40",
								x"40" WHEN x"50",
								
								x"79" WHEN x"01",
								x"79" WHEN x"11",
								x"79" WHEN x"21",
								x"79" WHEN x"31",
								x"79" WHEN x"41",
								x"79" WHEN x"51",
								
								x"24" WHEN x"02",
								x"24" WHEN x"12",
								x"24" WHEN x"22",
								x"24" WHEN x"32",
								x"24" WHEN x"42",
								x"24" WHEN x"52",
								
								x"30" WHEN x"03",
								x"30" WHEN x"13",
								x"30" WHEN x"23",
								x"30" WHEN x"33",
								x"30" WHEN x"43",
								x"30" WHEN x"53",
								
								x"19" WHEN x"04",
								x"19" WHEN x"14",
								x"19" WHEN x"24",
								x"19" WHEN x"34",
								x"19" WHEN x"44",
								x"19" WHEN x"54",
								
								x"12" WHEN x"05",
								x"12" WHEN x"15",
								x"12" WHEN x"25",
								x"12" WHEN x"35",
								x"12" WHEN x"45",
								x"12" WHEN x"55",
								
								x"02" WHEN x"06",
								x"02" WHEN x"16",
								x"02" WHEN x"26",
								x"02" WHEN x"36",
								x"02" WHEN x"46",
								x"02" WHEN x"56",
								
								x"78" WHEN x"07",
								x"78" WHEN x"17",
								x"78" WHEN x"27",
								x"78" WHEN x"37",
								x"78" WHEN x"47",
								x"78" WHEN x"57",
								
								x"00" WHEN x"08",
								x"00" WHEN x"18",
								x"00" WHEN x"28",
								x"00" WHEN x"38",
								x"00" WHEN x"48",
								x"00" WHEN x"58",
								
								x"18" WHEN x"09",
								x"18" WHEN x"19",
								x"18" WHEN x"29",
								x"18" WHEN x"39",
								x"18" WHEN x"49",
								x"18" WHEN x"59",
								x"09" WHEN OTHERS; --segments 0 and 3 are off to make an H or X (however you look at it) pattern.
								
		WITH input SELECT
			second_digit <= x"40" WHEN x"00",
								 x"40" WHEN x"01",
								 x"40" WHEN x"02",
								 x"40" WHEN x"03",
								 x"40" WHEN x"04",
								 x"40" WHEN x"05",
								 x"40" WHEN x"06",
								 x"40" WHEN x"07",
								 x"40" WHEN x"08",
								 x"40" WHEN x"09",
								 
								 x"79" WHEN x"10",
								 x"79" WHEN x"11",
								 x"79" WHEN x"12",
								 x"79" WHEN x"13",
								 x"79" WHEN x"14",
								 x"79" WHEN x"15",
								 x"79" WHEN x"16",
								 x"79" WHEN x"17",
								 x"79" WHEN x"18",
								 x"79" WHEN x"19",
								 
								 x"24" WHEN x"20",
								 x"24" WHEN x"21",
								 x"24" WHEN x"22",
								 x"24" WHEN x"23",
								 x"24" WHEN x"24",
								 x"24" WHEN x"25",
								 x"24" WHEN x"26",
								 x"24" WHEN x"27",
								 x"24" WHEN x"28",
								 x"24" WHEN x"29",
								 
								 x"30" WHEN x"30",
								 x"30" WHEN x"31",
								 x"30" WHEN x"32",
								 x"30" WHEN x"33",
								 x"30" WHEN x"34",
								 x"30" WHEN x"35",
								 x"30" WHEN x"36",
								 x"30" WHEN x"37",
								 x"30" WHEN x"38",
								 x"30" WHEN x"39",
								 
								 x"19" WHEN x"40",
								 x"19" WHEN x"41",
								 x"19" WHEN x"42",
								 x"19" WHEN x"43",
								 x"19" WHEN x"44",
								 x"19" WHEN x"45",
								 x"19" WHEN x"46",
								 x"19" WHEN x"47",
								 x"19" WHEN x"48",
								 x"19" WHEN x"49",
								 
								 x"12" WHEN x"50",
								 x"12" WHEN x"51",
								 x"12" WHEN x"52",
								 x"12" WHEN x"53",
								 x"12" WHEN x"54",
								 x"12" WHEN x"55",
								 x"12" WHEN x"56",
								 x"12" WHEN x"57",
								 x"12" WHEN x"58",
								 x"12" WHEN x"59",
								 
								 x"09" WHEN OTHERS;
			
		seg1 <= first_digit(6 DOWNTO 0);
		seg2 <= second_digit(6 DOWNTO 0);
end; --declares the end of the architecture portion