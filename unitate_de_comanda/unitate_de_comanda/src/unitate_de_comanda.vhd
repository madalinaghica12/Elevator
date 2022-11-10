 library IEEE;
 use IEEE.STD_LOGIC_1164.all;
  
 entity Unitate_de_comanda is
	  port(INTRARE : in std_logic_vector(8 downto 0);
	  IESIRE : out std_logic_vector(8 downto 0);
	  CLOCK :in std_logic;
	  RESET : in std_logic);
end Unitate_de_comanda;

architecture Unitate_de_comanda of Unitate_de_comanda is
	type tip_stare is ( s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, s12, s13, s14, s15, s16, s17, s18, s19, s20, s21);
	signal stare_actuala, starea_urmatoare : tip_stare;

	begin  
		process(CLOCK, RESET)
		begin
			if(RESET = '1') then
				stare_actuala <= s0;
			elsif (rising_edge(CLOCK)) then
				stare_actuala <= starea_urmatoare;
			end if;
		end process;
		
		process(stare_actuala, INTRARE)
		begin
			case stare_actuala is
			when s0 => if(INTRARE(0) = '1') then 
							starea_urmatoare <= s2;
						else  
							starea_urmatoare<= s1;
						end if;
			when s1 => if(INTRARE(1) = '1') then
				          starea_urmatoare <= s2;
					   else
						  starea_urmatoare <= s0;
				
					   end if;
			when s2 => if(INTRARE(2) = '1') then
							starea_urmatoare <= s0;	
						else	 
							starea_urmatoare <= s3;	 
						end if ;
			when s3 => starea_urmatoare <= s15;
			when s15 => starea_urmatoare <= s18;
			when s18 => if(INTRARE(3) = '1') then
							starea_urmatoare <= s13;
						else
							starea_urmatoare <= s4;
						end if;
			when s4 => if(INTRARE(4)='1') then 	   
							starea_urmatoare <= s7;
						else
							starea_urmatoare <= s5;
						end if;
			 when s5 => starea_urmatoare <= s16;
			 when s16 => starea_urmatoare <= s19;
			 when s19 => if(INTRARE(3) = '1') then
							 starea_urmatoare <= s14;
						 else
				 			 starea_urmatoare <= s6;
						end if;
 			when s6 => if(INTRARE(5) = '1') then
							starea_urmatoare <= s9;
					   else
						   starea_urmatoare <= s5;
					   end if;
			when s7 => starea_urmatoare <= s17;
			when s17 => starea_urmatoare <= s20;
			when s20 => if(INTRARE(3) = '1') then
							starea_urmatoare <= s14;
						else
							stare_urmataoare <= s6;
						end if;
			when s6 => if(INTRARE(5) = '1') then
							starea_urmatoare <= s9;
					  else
						  starea_urmatoare <= s5;
					  end if;
			when s9 => starea_urmatoare	<= s3;
			when s10 => starea_urmatoare <= s11;
			when s11 => if(INTRARE(7) = '1') then
							starea_urmatoare <= s12;
						else
							starea_urmatoare <= s11;
						end if;
			when s12 => starea_urmatoare <= s21;
			when s21 => starea_urmatoare <= s13;
			when s13 => starea_urmatoare <= s0;
			when s1 => if(INTRARE(8) = '1') then
							starea_urmatoare <= s10;
						else
							starea_urmatoare <=s14;
						end if;
			end case;
		end process;
		
		process(stare_actuala)	  
		
		begin			   
			
			case stare_actuala is
				when s0 => IESIRE <= "010000000";
				when s1 => IESIRE <= "010000000";
				when s2 => IESIRE <= "010000000";
				when s3 => IESIRE <= "001000000";
				when s4 => IESIRE <= "000000000";
				when s5 => IESIRE <= "000100000";
				when s6 => IESIRE <= "000000000";
				when s7 => IESIRE <= "000010000";
				when s8 => IESIRE <= "000000000";
				when s9 => IESIRE <= "000001000";
				when s10 => IESIRE <= "000000100";
				when s11 => IESIRE <= "000000010";
				when s12 => IESIRE <= "001000000";
				when s13 => IESIRE <= "000000001";
				when s14 => IESIRE <= "100000000";
				when s15 => IESIRE <= "001000000";
				when s16 => IESIRE <= "000000000";
				when s17 => IESIRE <= "000000000";
				when s18 => IESIRE <= "000000000";
				when s19 => IESIRE <= "000000000";
				when s20 => IESIRE <= "000000000";
				when s21 => IESIRE <= "000000000";
			end case;
			
		end process;	
		
	end Unitate_de_comanda;