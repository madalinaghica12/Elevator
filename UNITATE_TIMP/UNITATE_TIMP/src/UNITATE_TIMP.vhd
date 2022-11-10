library IEEE;
use IEEE.STD_LOGIC_1164.all;
 
ENTITY TIMP IS
	PORT( INCEPUT_TIMP : IN STD_LOGIC;
	      CLK : IN STD_LOGIC;     	
		  SFARSIT_TIMP : OUT STD_LOGIC);
END TIMP;

ARCHITECTURE TIMP OF TIMP IS

	COMPONENT Numarator_Usi_Deschise is
	 port(CLOCK : in std_logic;
		 INTRARE : in std_logic;
		  Q : out std_logic);
end COMPONENT Numarator_Usi_Deschise;	
	
	BEGIN
		NUMARATOR: Numarator_Usi_Deschise PORT MAP(iNCEPUT_TIMP, CLK, SFARSIT_TIMP);
	
END TIMP;	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	