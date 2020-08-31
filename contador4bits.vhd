library ieee;
use ieee.std_logic_1164.all;

entity contador4bits is

    Port ( relog, reset : in  STD_LOGIC;
		   salcuenta: out STD_LOGIC_VECTOR(3 downto 0));

end contador4bits;

architecture arqcontador4bits of contador4bits is

	subtype estado is STD_LOGIC_VECTOR(3 downto 0);
    signal q, qmas1: estado;

	constant e00: estado:="0000";
	constant e01: estado:="0001";
	constant e02: estado:="0010";
	constant e03: estado:="0011";
	constant e04: estado:="0100";
	constant e05: estado:="0101";
	constant e06: estado:="0110";
	constant e07: estado:="0111";
	constant e08: estado:="1000";
	constant e09: estado:="1001";
	constant e10: estado:="1010";
	constant e11: estado:="1011";
	constant e12: estado:="1100";
	constant e13: estado:="1101";
	constant e14: estado:="1110";
	constant e15: estado:="1111";

begin

	process(relog)
			begin
				if rising_edge(relog) then
					if (reset='1') then
						q<=e00;
					else
						q<=qmas1;
					end if;
				end if;
			end process;

	process(q)
		begin
			case q is
				when e00=> qmas1 <=e01;
				when e01=> qmas1 <=e02;
				when e02=> qmas1 <=e03;
				when e03=> qmas1 <=e04;
				when e04=> qmas1 <=e05;
				when e05=> qmas1 <=e06;
				when e06=> qmas1 <=e07;
				when e07=> qmas1 <=e08;
				when e08=> qmas1 <=e09;
				when e09=> qmas1 <=e10;
				when e10=> qmas1 <=e11;
				when e11=> qmas1 <=e12;
				when e12=> qmas1 <=e13;
				when e13=> qmas1 <=e14;
				when e14=> qmas1 <=e15;
				when e15=> qmas1 <=e00;
				
				when others=> qmas1 <=e00;
			end case;
		end process;

	salcuenta<=q;

end arqcontador4bits;
