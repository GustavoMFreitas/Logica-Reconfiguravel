library IEEE;					
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity ULAProjeto is
 port (  
  A    :   in  STD_LOGIC_VECTOR(3 DOWNTO 0) ; 
  B    :   in  STD_LOGIC_VECTOR(3 DOWNTO 0) ;
  seletor    :   in bit;
  seletorSaida : in bit;
  saidaDisplay : out std_logic_vector(6 downto 0);
  saidaLogica : in bit
 );
 end entity ULAProjeto;

architecture main of ULAProjeto is 

	signal temp : std_logic_vector(4 downto 0);
	signal seletorpush: integer;
	begin 
	   
	 process(A,B, seletor)																	      
		 
				
		begin	
				seletorpush<=0;
				if seletor = "1" then
					seletorpush <= seletorpush + 1;
					if seletorpush >= 6 then
						seletorpush <= 0;
					end if
				end if 
 			  case seletorpush is															 
				 
				when 0 => temp <= ('0' & A)+('0' & B);
				when 1 => temp <= ('0' & A)-('0' & B);
				when 2 => temp <= A and B;
				when 3 => temp <= A or B;
				when 4 => temp <= A xor B;
				when 5 => temp <= A NAND '1';			
			  end case;
	   end process;
		
	process(temp,seletorSaida)
		begin
				 
				case temp is

				 when "0000" => bar <= "1000000";
				 when "0001" => bar <= "1111001";
				 when "0010" => bar <= "0100100";
				 when "0011" => bar <= "0110000";
				 when "0100" => bar <= "0011001";
				 when "0101" => bar <= "0010010";										
				 when "0110" => bar <= "0000010";
	 		    when "0111" => bar <= "1111000";
	 		    when "1000" => bar <= "0000000";
				 when "1001" => bar <= "0011000";
				 when "1010" => bar <= "0001000"; --'A'
				 when "1011" => bar <= "1100000"; --'B'
			    when "1100" => bar <= "0110001"; --'C'
				 when "1101" => bar <= "1000010"; --'D'
				 when "1110" => bar <= "0110000"; --'E'
			    when "1111" => bar <= "0111000"; --'F'
			    when others => bar <= "1111111";
			  end case;	
			
		end process;
		
		
	 
end architecture main;