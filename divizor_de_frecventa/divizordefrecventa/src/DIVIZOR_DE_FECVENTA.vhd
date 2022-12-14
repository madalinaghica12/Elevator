library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY DIVIZOR_DE_FRECVENTA IS
	PORT( CLOCK	: IN STD_LOGIC;
		  RESET : IN STD_LOGIC;  
		  DIVIZOR : OUT STD_LOGIC);     
END DIVIZOR_DE_FRECVENTA;

ARCHITECTURE DIVIZOR_DE_FRECVENTA OF DIVIZOR_DE_FRECVENTA IS

	SIGNAL NUMARATOR : STD_LOGIC_VECTOR( 27 DOWNTO 0);
	
	BEGIN  
		
		PROCESS(CLOCK, RESET)
			BEGIN
				IF( RESET = '1') THEN
					NUMARATOR <= ( OTHERS => '0');
				ELSIF (RISING_EDGE(CLOCK)) THEN
					IF( NUMARATOR >= x"5F5E0FF") THEN
						NUMARATOR <= (OTHERS => '0');
					ELSE
						NUMARATOR <= NUMARATOR + "0000001";
					END IF;
				END IF;	
		 END PROCESS;
		 
	DIVIZOR <= '1' WHEN NUMARATOR = x"5F5E0FF" ELSE '0';
END DIVIZOR_DE_FRECVENTA;