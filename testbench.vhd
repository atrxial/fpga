
library IEEE;
use IEEE.std_logic_1164.all;


entity dice_tb is

end dice_tb;

architecture dice_tb_arch of dice_tb is 
	component dice
		port (
		CLOCK_50 : in std_logic; -- horloge 4 50 MHz
		KEY : in std_logic_vector(3 downto 0); -- bouttons poussoir

		HEX0 : out std_logic_vector(6 downto 0); --- parenthese et point virgule
		HEX1 : out std_logic_vector(6 downto 0);
		HEX2 : out std_logic_vector(6 downto 0);
		HEX3 : out std_logic_vector(6 downto 0)

				);
	end component;

 
	constant period : time := 20 ns; -- seul endroit que l'on a un type time (qui n'est pas synthétisable)
 

		
		signal  CLOCK_50 : std_logic :='0'; -- horloge 4 50 MHz
		signal KEY :  std_logic_vector(3 downto 0) := "1111"; -- bouttons poussoir

		signal HEX0 : std_logic_vector(6 downto 0);--- parenthese et point virgule
		signal HEX1 : std_logic_vector(6 downto 0);
		signal HEX2 : std_logic_vector(6 downto 0);
		signal HEX3 : std_logic_vector(6 downto 0);
	begin 
		UUT : dice
 
		port map (CLOCK_50=> CLOCK_50, KEY=> KEY, HEX0 => HEX0);
 
	CLOCK_50 <= not CLOCK_50 after period/2;
 
	KEY(0) <= '0' after 167 ns, '1' after 543 ns; -- mots after n'existent pas dans un design tout comme la notion de temps
 
 
 
 
 end dice_tb_arch;
 
 
 
