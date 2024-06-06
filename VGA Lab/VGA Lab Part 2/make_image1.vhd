-- Generate the image: square ball moving up and down in the center of the screen
library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 

entity make_image1 is
	port(
		vsync:  in std_logic;
		pixel_row:  in integer range 0 to 480; 
		pixel_column: in integer range 0 to 640;
		red, green, blue: out std_logic_vector(7 downto 0));
end;
architecture image of make_image1 is
	SIGNAL ball_on: 		STD_LOGIC;
	SIGNAL size : 			integer range 0 to 20;   
	SIGNAL ball_y_motion: integer range -10 to 10; 
	SIGNAL ball_y_pos: 	 integer range 0 to 480; 
	SIGNAL ball_x_pos:    integer range 0 to 640; 
	SIGNAL ball_x_motion: integer range -10 to 10; 
	CONSTANT right_of_screen: integer := 640; 
	CONSTANT left_of_screen: integer := 1;
	CONSTANT bottom_of_screen: integer := 480;
	CONSTANT top_of_screen: integer := 1;
	CONSTANT bot_edge: integer := 400;
	CONSTANT top_edge: integer := 80;
	CONSTANT right_edge: integer := 540;
	CONSTANT left_edge: integer := 80;
	
	SIGNAL wall_on: std_logic;
	CONSTANT wall_width: integer := 10;
	CONSTANT wall_height: integer := 40;
	SIGNAL wall_top: integer 
	
	TYPE my_rom is array (0 to 20) of std_logic_vector (20 DOWNTO 0);
	CONSTANT my_shape: my_rom := ("000000000000000000000",
											"000000000000000000000",
											"000000000000000000000",
											"000111000000000111000",
											"000111000000000111000",
											"000111000000000111000",
											"000111000000000111000",
											"000111000000000111000",
											"000111000000000111000",
											"000000000000000000000",
											"000000000000000000000",
											"111000000000000000111",
											"111110000000000011111",
											"001111100000001111100",
											"000111110000011111000",
											"000011111111111110000",
											"000000001111100000000",
											"000000000000000000000",
											"000000000000000000000",
											"000000000000000000000",
											"000000000000000000000" );
BEGIN 
			
	size <= my_shape'length-1;  			--size of ball
	--ball_x_pos <= 320;   -- x position of ball's left top corner 
	-- x position of the square goes from (ball_x_pos) to (ball_x_pos + size)
	-- y position of the square goes from (ball_y_pos) to (ball_y_pos + size)

------------------------------------
	--check if pixel scanned in located within the square ball
	check_pixel:  PROCESS (ball_x_pos, ball_y_pos, pixel_column, pixel_row, size)
   BEGIN	                                
		IF (pixel_column >= ball_x_pos) AND (pixel_column <= ball_x_pos + size) AND  
 	   	(pixel_row >= ball_y_pos) AND (pixel_row <= ball_y_pos + size)  
      THEN
			ball_on <= my_shape(pixel_column-ball_x_pos)(pixel_row-ball_y_pos);						
 		ELSE
			ball_on <= '0';
		END IF;
	END PROCESS;
--------------------------------	
	setcolor:  PROCESS (ball_on, pixel_row, pixel_column)
	BEGIN
		CASE ball_on IS
			WHEN '1' =>
				red <=  (OTHERS => '1');  -- make the ball red
				green <= (OTHERS => '0'); -- turn off green when displaying ball
				blue  <= (OTHERS => '0'); -- turn off blue when displaying ball
			WHEN OTHERS =>
				red <=  (OTHERS => '1');  -- the background will be white (all colors set to 1 makes white)
				green <= (OTHERS => '1');
				blue  <= (OTHERS => '1');
				CASE pixel_column IS
					WHEN 560 TO 640 =>
						red  <=  (OTHERS => '0');  
						green <= (OTHERS => '0'); 
						blue  <= (OTHERS => '1');
					WHEN 80 TO 99 =>
						red  <=  (OTHERS => '1');  
						green <= (OTHERS => '0'); 
						blue  <= (OTHERS => '1');
						CASE pixel_row IS
							WHEN 200 TO 300 =>
								red  <=  (OTHERS => '1');  
								green <= (OTHERS => '0'); 
								blue  <= (OTHERS => '1');
							WHEN 400 TO 480 =>
								red  <=  (OTHERS => '0');  
								green <= (OTHERS => '0'); 
								blue  <= (OTHERS => '1');
							WHEN 0 TO 79 =>
								red  <=  (OTHERS => '0');  
								green <= (OTHERS => '0'); 
								blue  <= (OTHERS => '1');
							WHEN OTHERS =>
								red <=  (OTHERS => '1');  -- the background will be white (all colors set to 1 makes white)
								green <= (OTHERS => '1');
								blue  <= (OTHERS => '1');
							END CASE;
					WHEN 0 TO 79 =>
						red  <=  (OTHERS => '0');  
						green <= (OTHERS => '0'); 
						blue  <= (OTHERS => '1');
					WHEN OTHERS =>
						red <=  (OTHERS => '1');  -- the background will be white (all colors set to 1 makes white)
						green <= (OTHERS => '1');
						blue  <= (OTHERS => '1');
						CASE pixel_row IS
							WHEN 400 TO 480 =>
								red  <=  (OTHERS => '0');  
								green <= (OTHERS => '0'); 
								blue  <= (OTHERS => '1');
							WHEN 0 TO 79 =>
								red  <=  (OTHERS => '0');  
								green <= (OTHERS => '0'); 
								blue  <= (OTHERS => '1');
							WHEN OTHERS =>
								red <=  (OTHERS => '1');  -- the background will be white (all colors set to 1 makes white)
								green <= (OTHERS => '1');
								blue  <= (OTHERS => '1');
						END CASE;
					END CASE;
				END CASE;
			
	END PROCESS;
------------------------------------	
	--update position of ball once every screen refresh cycle
	y_motion: PROCESS			
	BEGIN				
		WAIT UNTIL (vsync'event AND vsync = '1');		         		
		IF (ball_y_pos + size) >= bot_edge  THEN	  --reached bottom of monitor    			
			ball_y_motion <= - 1;			                 -- start moving up by 1 pixel
		ELSIF 
			ball_y_pos <= top_edge THEN	 		     -- reached top of monitor   	     	 		
			ball_y_motion <= 1;                         -- start moving down by 1 pixel
		END IF;					
		ball_y_pos <= ball_y_pos + ball_y_motion;		--compute next position in the y-axis 
	END PROCESS;
	
	x_motion: PROCESS
	BEGIN
		WAIT UNTIL (vsync'event AND vsync = '1');
		IF(ball_x_pos + size) = right_edge THEN
			ball_x_motion <= -1;
		ELSIF
			ball_x_pos = left_edge THEN
			ball_x_motion <= 1;
		END IF;
		ball_x_pos <= ball_x_pos + ball_x_motion;
	END PROCESS;
END;
