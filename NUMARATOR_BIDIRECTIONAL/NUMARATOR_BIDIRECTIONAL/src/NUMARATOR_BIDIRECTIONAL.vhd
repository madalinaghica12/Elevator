library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY NUMARATOR_BIDIRECT IS
	PORT( INTR : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		  CLOCK : IN STD_LOGIC;
		  RESET : IN STD_LOGIC;
		  INC_PARALELA : IN STD_LOGIC;
		  NUMARA_SUS : IN STD_LOGIC;
		  NUMARA_JOS : IN STD_LOGIC;
		  IESIRE : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		  SUS : OUT STD_LOGIC;
		  JOS : OUT STD_LOGIC);
END NUMARATOR_BIDIRECT;	
	
	
ARCHITECTURE NUMARATOR_BIDIRECT OF NUMARATOR_BIDIRECT IS
BEGIN	
	
	PROCESS(CLOCK, INTR, NUMARA_SUS, NUMARA_JOS, INC_PARALELA, RESET)
	VARIABLE NUMARA : STD_LOGIC_VECTOR(3 DOWNTO 0);
	VARIABLE DIRECTIE : STD_LOGIC_VECTOR(3 DOWNTO 0);
	BEGIN
		
		IF( CLOCK = '1' AND CLOCK'EVENT) THEN 
			
			IF ( RESET = '1') THEN
				NUMARA := "0000";
				SUS <= '0';
				JOS <= '0';
			ELSE
				IF( INC_PARALELA = '1') THEN
					NUMARA := INTR;
					SUS <= '0';
					JOS <= '0';
				ELSE		 
					
					IF( NUMARA_SUS = '1') THEN	  
						
						IF(NUMARA < "1100") THEN
							 NUMARA := NUMARA + "0001";
						ELSIF( NUMARA = "1100") THEN
								SUS <= '1';
						END IF;
					ELSIF( NUMARA_JOS = '1') THEN	
						
							IF( NUMARA > "0000") THEN
								   NUMARA := NUMARA - "0001";
							ELSIF( NUMARA = "0000") THEN
								   JOS <= '1';
	
							END IF;
							
						END	IF;
	
			  	  END IF;
	
			  END IF;
		IESIRE <= NUMARA;
		
		END IF;
	 END PROCESS;
	 
END NUMARATOR_BIDIRECT;
	
	
	
	
	
	
	