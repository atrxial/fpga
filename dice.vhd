
library IEEE;
use IEEE.std_logic_1164.all;

entity dice is
Port ( CLOCK_50 : in std_logic; -- horloge 4 50 MHz
	KEY : in std_logic_vector(3 downto 0); -- bouttons poussoir

	HEX0 : out std_logic_vector(6 downto 0); --- parenthese et point virgule
	HEX1 : out std_logic_vector(6 downto 0);
	HEX2 : out std_logic_vector(6 downto 0);
	HEX3 : out std_logic_vector(6 downto 0) 
	);
 end dice;

 
 
 
 
 architecture dice_arch of dice is

	signal count : integer range 0 to 5 := 0;

	begin -- on décrit le contenu de la fonction, ie un compteur modulo5

	process (CLOCK_50) -- pas de variable donc rien à mettre dans la zone de déclaration du process
	begin
		if rising_edge(CLOCK_50) then -- si front montant
			if KEY(0) = '0' or KEY(1) = '0' or KEY(2) = '0' or KEY(3) = '0' then -- WARNING	 SW actif a l'état bas
				if count = 5 then count <= 0; -- remise 4 0 du compteur quand la valeur maxi est atteinte
   
				else count <= count + 1;
				end if;
			end if;
		end if;
	end process;

 
 -- on a pas besoin que cela soit clocké avec l'horloge -> on le fait pas sur un process

 
 

 -- on le fait pas avec un case car on ne fait que des case dans un process
 -- " pour un bus de stdlogic
 -- ça ressemble au case
 
 
	with count Select
	HEX0<= "1111001" when 0, --1
	"0100100" when 1, --2
	"0110000" when 2, --3
	"0011001" when 3, --4
	"0010010" when 4, --5
	"0000010" when 5, --6
	"1111111" when others; --off
	
	with count Select
	HEX1<= "1111001" when 0, --1
	"0100100" when 1, --2
	"0110000" when 2, --3
	"0011001" when 3, --4
	"0010010" when 4, --5
	"0000010" when 5, --6
	"1111111" when others; --off
	
	with count Select
	HEX2<= "1111001" when 0, --1
	"0100100" when 1, --2
	"0110000" when 2, --3
	"0011001" when 3, --4
	"0010010" when 4, --5
	"0000010" when 5, --6
	"1111111" when others; --off
	
	with count Select
	HEX3<= "1111001" when 0, --1
	"0100100" when 1, --2
	"0110000" when 2, --3
	"0011001" when 3, --4
	"0010010" when 4, --5
	"0000010" when 5, --6
	"1111111" when others; --off
	
	
end dice_arch;