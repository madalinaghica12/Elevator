library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Bistabil_JK is
	port(J,K,CLOCK: in std_logic;
	Q,BQ : out std_logic);
end Bistabil_JK;

architecture Bistabil_JK of Bistabil_JK is	

begin
	process(CLOCK)
	variable semnal_pt_Q : std_logic; 
	
begin
	if( CLOCK = '1' and CLOCK'event) then
	if( J = '0' and K = '0'	) then
		semnal_pt_Q := semnal_pt_Q;
	elsif ( J = '0' and K = '1') then
		semnal_pt_Q := '0';
	elsif( J = '1' and K = '1') then
		semnal_pt_Q := not semnal_pt_Q;	 
		
	end if;
	Q <= semnal_pt_Q;
	BQ <= not semnal_pt_Q;
	
	end if;
	end process; 
end architecture Bistabil_JK;