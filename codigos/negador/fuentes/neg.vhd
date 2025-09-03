library IEEE;
use IEEE.std_logic_1164.all;

-- declaracion de entidad
entity neg is
	port(
		a_i: in std_logic;
		b_o: out std_logic
	);
end;

--cuerpo de arquitectura
architecture neg_arq of neg is
	-- seccion declarativa

begin
	-- seccion descriptiva
	b_o <= not a_i;
end;