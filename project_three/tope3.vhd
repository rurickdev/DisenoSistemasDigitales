library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity tope3 is        
	port (
		 clkl: in std_logic;
		 reset: in std_logic;
		 cs: in std_logic;
		 bus_datos: out std_logic_vector (6 downto 0));
end tope3;

architecture arqtope3 of tope3 is 
	signal cable1:std_logic;
	signal cable2:std_logic_vector(1 downto 0);    
	begin 
		u1: entity work.relojlento(arq_relojlento) port map (clkl,cable1);
		u2: entity work.contador2bits(arq_contador2bits) port map (cable1,reset,cable2);
		u3: entity work.ROM(arq_ROM) port map (cable2,cs,bus_datos);
	end architecture arqtope3;