library ieee;  

use ieee. std_logic_1164.all;  



entity sumator_1_BIT is
	

port(A, B, CIN: in std_logic;
	
S, COUT: out std_logic); 

end sumator_1_BIT ;	



architecture behavioral of sumator_1_BIT is	 

signal Y1, Y2, Y3: STD_LOGIC;

begin 
	

	S<= A XOR B XOR CIN;
	
	Y1<= A AND B;
	
	Y2<= B AND CIN;
	
	Y3<= A AND CIN;
	
	COUT<= Y1 OR Y2 OR Y3;
	

END BEHAVIORAL;


library ieee;  

use ieee. std_logic_1164.all;


entity sumator_4 is


	port( A, B: in std_logic_vector (3 downto 0);
	
CIN : IN std_logic;
COUT: out std_logic;
	
SUMA: out  std_logic_vector (3 downto 0));	


end sumator_4;



architecture  BEHAVIORAL of sumator_4 is  

component sumator_1_bit
	
	port(A, B, CIN: in std_logic;
	
	S, COUT: out std_logic); 

end component ;
	


signal S1, S2, S3: STD_logic;

begin  
	
	
sum1: sumator_1_bit port map  (A(0), B(0), CIN, SUMA(0), s1);
	
sum2: sumator_1_bit port map  (A(1), B(1), S1, SUMA(1), s2);
	sum3: sumator_1_bit port map  (A(2), B(2), S2, SUMA(2), s3);
	
sum4: sumator_1_bit port map  (A(3), B(3), S3, SUMA(3), COUT);	 


END BEHAVIORAL;