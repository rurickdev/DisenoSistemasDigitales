library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_UNSIGNED.all;

entity ROM is
	port (
       bus_dir: in std_logic_vector (1 downto 0);
		 cs: in std_logic;
		 bus_datos: out std_logic_vector (6 downto 0));
end ROM;
		 
		 
architecture arq_ROM of ROM is

constant H: std_logic_vector (6 downto 0):= "1001000";
constant O: std_logic_vector (6 downto 0):= "0000001";
constant L: std_logic_vector (6 downto 0):= "1110001";
constant A: std_logic_vector (6 downto 0):= "0001000";

type memoria is array (3 downto 0) of std_logic_vector (6 downto 0);
constant mem_rom: memoria:=(H,O,L,A);

signal dato: std_logic_vector (6 downto 0);

begin
  prom: process (bus_dir)
  begin
     dato<=mem_rom(conv_integer(bus_dir));
	        end process prom;
pbuf: process (dato,cs)
begin
 if(cs='1') then
 bus_datos<=dato;
 else
 bus_datos <= (others=>'Z');
 end if;
 end process pbuf;
 end arq_ROM;