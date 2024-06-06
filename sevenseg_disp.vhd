--Seven-segment decoder

--This is the decoder VDHL code for running a seven-segment display
--Author: Ly Nguyen
--Date: January 11, 2022

--Declaring IEEE library to be able to call a standard logic vector later
library IEEE;
use IEEE.std_logic_1164.all;

--Initializing the entity portion
ENTITY sevenseg_disp IS
	PORT( input: IN integer range 0 to 15; --declares the input for the seven segment display as an integer
			output: OUT std_logic_vector(6 DOWNTO 0) ); --declares the output for the seven segment display as 7 bits: one bit for each segment on the display
end; --declares that the entity portion is done

--Initializing the architecture portion
ARCHITECTURE encoding OF sevenseg_disp IS
	SIGNAL internal: std_logic_vector(7 DOWNTO 0); --declares SIGNAL architecture called "internal", 8 bits allow for the hex to read in two sections of 4 bits
	begin
		WITH input SELECT --declares what hex value is assigned to what value to display the hex value assignment to the seven segment display
			internal <= x"40" WHEN 00,
							x"79" WHEN 01,
							x"24" WHEN 02,
							x"30" WHEN 03,
							x"19" WHEN 04,
							x"12" WHEN 05,
							x"02" WHEN 06,
							x"78" WHEN 07,
							x"00" WHEN 08,
							x"18" WHEN 09,
							x"09" WHEN OTHERS; --segments 0 and 3 are off to make an H or X (however you look at it) pattern.
		output <= internal(6 DOWNTO 0);
end; --declares the end of the architecture portion