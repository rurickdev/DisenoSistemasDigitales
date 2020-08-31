library ieee;
use ieee.std_logic_1164.all;

entity contador3bits is

    Port ( relog, reset : in  STD_LOGIC;
		   salcuenta: out STD_LOGIC_VECTOR(2 downto 0));

end contador3bits;

architecture arqcontador3bits of contador3bits is

	subtype estado is STD_LOGIC_VECTOR(2 downto 0);
  signal q, qmas1: estado;

	constant e0: estado:="000";
	constant e1: estado:="001";
	constant e2: estado:="010";
	constant e3: estado:="011";
	constant e4: estado:="100";
	constant e5: estado:="101";
	constant e6: estado:="110";
	constant e7: estado:="111";

begin

	process(relog)
			begin
				if rising_edge(relog) then
					if (reset='1') then
						q<=e0;
					else
						q<=qmas1;
					end if;
				end if;
			end process;

	process(q)
		begin
			case q is
				when e0=> qmas1 <=e1;
				when e1=> qmas1 <=e2;
				when e2=> qmas1 <=e3;
				when e3=> qmas1 <=e4;
				when e4=> qmas1 <=e5;
				when e5=> qmas1 <=e6;
				when e6=> qmas1 <=e7;
				when e7=> qmas1 <=e0;
				
				when others=> qmas1 <=e0;
			end case;
		end process;

	salcuenta<=q;

end arqcontador3bits;
