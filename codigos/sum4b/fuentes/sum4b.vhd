library IEEE;
use IEEE.std_logic_1164.all;

-- declaracion de entidad
entity sum4b is
	port(
		a_i: in std_logic_vector(3 downto 0);
		b_i: in std_logic_vector(3 downto 0);
		ci_i: in std_logic;
		s_o: out std_logic_vector(3 downto 0);
		co_o: out std_logic
	);
end;

--cuerpo de arquitectura
architecture sum4b_arq of sum4b is
	-- seccion declarativa

	signal aux: std_logic_vector(4 downto 0);

begin
	-- seccion descriptiva
	sumNb_gen: for i in 0 to 3 generate
		sum1b_inst: entity work.sum1b
			port map (
				a_i => a_i(i),
				b_i => b_i(i),
				ci_i => aux(i),
				s_o => s_o(i),
				co_o => aux(i+1)
			);
	end generate;
	aux(0) <= ci_i; 
	co_o <= aux(4);
end;