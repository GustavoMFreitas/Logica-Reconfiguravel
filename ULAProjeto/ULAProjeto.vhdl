library IEEE;					
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

entity ULAProjeto is
    port (  
        A : in  STD_LOGIC_VECTOR(3 DOWNTO 0) ; 
        B : in  STD_LOGIC_VECTOR(3 DOWNTO 0) ;
        seletor : in bit;
        seletorSaida : in bit;
        saidaDisplay1 : out std_logic_vector(6 downto 0);
        saidaDisplay2 : out std_logic_vector(6 downto 0);
        saidaLogica : out bit
    );
end entity ULAProjeto;

architecture main of ULAProjeto is 

	signal tempArit : std_logic_vector(4 downto 0);
    signal tempLogic : std_logic_vector(4 downto 0);
	signal seletorpush: integer;
    signal seletorpushSaida: integer;

	begin 
	   
	process(A,B, seletor)																	      
		 		
		begin	
			seletorpush<=0;
			if seletor = "1" then
                if seletorpush >= 6 then
					seletorpush <= 0;
				end if
				seletorpush <= seletorpush + 1;
				
			end if 
 			case seletorpush is															 
			    when 0 => 
                    tempArit <= ("0" & A)+("0" & B);
                    tempLogic<= "00000";
				when 1 => tempArit <= ("0" & A)-("0" & B);
				when 2 => 
                    tempLogic <= A and B;
                    tempArit<= "11111";
				when 3 => tempLogic <= A or B;
				when 4 => tempLogic <= A xor B;
				when 5 => tempLogic <= not A;			
			end case;
	end process;	
	process(tempArit,tempLogic,seletorSaida)
		begin
            if seletorSaida = "1" then
				if seletorpushSaida = "1" then
					seletorpushSaida = "0";
                else
                    seletorpushSaida = "1"
				end if
			end if 
			case tempArit is
				when "00000" => 
                    saidaDisplay1 <= "1000000"; --0
                    saidaDisplay2 <= "1000000"; --0
				when "00001" =>
                    saidaDisplay1 <= "1000000"; --0
                    saidaDisplay2 <= "1111001"; --1
				when "00010" =>
                    saidaDisplay1 <= "1000000"; --0
                    saidaDisplay2 <= "0100100"; --2
				when "00011" =>
                    saidaDisplay1 <= "1000000"; --0
                    saidaDisplay2 <= "0110000"; --3
				when "00100" =>
                    saidaDisplay1 <= "1000000"; --0    
                    saidaDisplay2 <= "0011001"; --4
				when "00101" =>
                    saidaDisplay1 <= "1000000"; --0
                    saidaDisplay2 <= "0010010";	--5									
				when "00110" =>
                    saidaDisplay1 <= "1000000"; --0    
                    saidaDisplay2 <= "0000010"; --6
	 		    when "00111" =>
                    saidaDisplay1 <= "1000000"; --0                
                    saidaDisplay2 <= "1111000"; --7
	 		    when "01000" =>
                    saidaDisplay1 <= "1000000"; --0    
                    saidaDisplay2 <= "0000000"; --8
				when "01001" =>
                    saidaDisplay1 <= "1000000"; --0    
                    saidaDisplay2 <= "0011000"; --9
                when "01010" => --10
                    saidaDisplay1 <= "1111001"; --1    
                    saidaDisplay2 <= "1000000"; --0
                when "01011" => --11
                    saidaDisplay1 <= "1111001"; --1  
                    saidaDisplay2 <= "1111001"; --1
                when "01100" => --12
                    saidaDisplay1 <= "1111001"; --1    
                    saidaDisplay2 <= "0100100"; --2
                when "01101" => --13
                    saidaDisplay1 <= "1111001"; --1    
                    saidaDisplay2 <= "0110000"; --3
                when "01110" => --14
                    saidaDisplay1 <= "1111001"; --1    
                    saidaDisplay2 <= "0011001"; --4
                when "01111" => --15
                    saidaDisplay1 <= "1111001"; --1    
                    saidaDisplay2 <= "0010010";	--5
                when "10000" => --16
                    saidaDisplay1 <= "1111001"; --1
                    saidaDisplay2 <= "0000010"; --6
                when "10001" => --17
                    saidaDisplay1 <= "1111001"; --1    
                    saidaDisplay2 <= "1111000"; --7
                when "10010" => --18
                    saidaDisplay1 <= "1111001"; --1    
                    saidaDisplay2 <= "0000000"; --8
                when "10011" => --19
                    saidaDisplay1 <= "1111001"; --1    
                    saidaDisplay2 <= "0011000"; --9
                when "10100" => --20
                    saidaDisplay1 <= "0100100"; --2    
                    saidaDisplay2 <= "1000000"; --0
                when "10101" => --21
                    saidaDisplay1 <= "0100100"; --2    
                    saidaDisplay2 <= "1111001"; --1
                when "10110" => --22
                    saidaDisplay1 <= "0100100"; --2    
                    saidaDisplay2 <= "0100100"; --2
                when "10111" => --23
                    saidaDisplay1 <= "0100100"; --2    
                    saidaDisplay2 <= "0110000"; --3
                when "11000" => --24
                    saidaDisplay1 <= "0100100"; --2    
                    saidaDisplay2 <= "0011001"; --4
                when "11001" => --25
                    saidaDisplay1 <= "0100100"; --2    
                    saidaDisplay2 <= "0010010";	--5
                when "11010" => --26
                    saidaDisplay1 <= "0100100"; --2    
                    saidaDisplay2 <= "0000010"; --6
                when "11011" => --27
                    saidaDisplay1 <= "0100100"; --2    
                    saidaDisplay2 <= "1111000"; --7
                when "11100" => --28
                    saidaDisplay1 <= "0100100"; --2    
                    saidaDisplay2 <= "0000000"; --8
                when "11101" => --29
                    saidaDisplay1 <= "0100100"; --2    
                    saidaDisplay2 <= "0011000"; --9
                when "11110" => --30
                    saidaDisplay1 <= "0110000"; --3    
                    saidaDisplay2 <= "1000000"; --0        
			    when others =>
                    saidaDisplay1 <= "1111111";-- desligado
                    saidaDisplay2 <= "1111111";
			end case;
            saidaLogic <= tempLogic(0);	
	end process;	 
end architecture main;
