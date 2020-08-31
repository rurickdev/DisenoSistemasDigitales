library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity contador is
   port ( clk, inicio, x : in std_logic;
          var : out std_logic_vector(1 downto 0));
end contador;

architecture arqContador of contador is

	subtype estado is STD_LOGIC_VECTOR(2 downto 0);
	signal q, qmas1: estado;

	constant e0: estado:="000";
	constant e1: estado:="001";
	constant e2: estado:="010";
	constant e3: estado:="011";
	constant e4: estado:="100";
	constant e5: estado:="101";
	constant e6: estado:="110";
	
	begin

	process(clk)
		begin
			if rising_edge(clk) then
				if (inicio='0') then
					q<=e0;
				else
					q<=qmas1;
				end if;
			end if;
		end process;

	process(q)
		begin
			if (inicio = '0') then 
				qmas1<=e0;
			elsif (x = '0') then
					case q is
						when e0=> qmas1 <=e1;
							  var <= "01";
						when e1=> qmas1 <=e2;
							  var <= "10";
						when e2=> qmas1 <=e3;
							  var <= "11";
						when others=> qmas1 <=e0;
							  var <= "00";
					end case;
			else
					case q is
						when e0=> qmas1 <=e4;
							  var <= "11";
						when e4=> qmas1 <=e5;
							  var <= "10";
						when e5=> qmas1 <=e6;
							  var <= "01";
						when others=> qmas1 <=e0;
							  var <= "00";
					end case;
			end if;
		end process;

end arqContador;

