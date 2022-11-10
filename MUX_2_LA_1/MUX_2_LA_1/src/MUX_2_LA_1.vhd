library IEEE;
use IEEE.STD_LOGIC_1164.all;

ENTITY MUX_2_LA_1 IS
	PORT( A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	      b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		  S : STD_LOGIC; 
		  Y : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END MUX_2_LA_1;

ARCHITECTURE MUX_2_LA_1 OF MUX_2_LA_1 IS

BEGIN
	
	PROCESS(S, A, B)
		BEGIN  
		  IF( S = '1') THEN
			  Y <= A;
		  ELSIF( S = '0') THEN
			  Y <= b;
		  END IF;
	END PROCESS;
	
END MUX_2_LA_1;
		  			 