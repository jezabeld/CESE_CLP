library IEEE;
use IEEE.std_logic_1164.all;

-- declaracion de entidad
entity sum_resNb is
	generic(
		N: natural := 4
	);
	port(
		a_i: in std_logic_vector(N-1 downto 0);
		b_i: in std_logic_vector(N-1 downto 0);
		ci_i: in std_logic;
		s_r: in std_logic;
		s_o: out std_logic_vector(N-1 downto 0);
		co_o: out std_logic
	);
end;

--cuerpo de arquitectura
architecture sum_resNb_arq of sum_resNb is
	-- seccion declarativa

	signal b_xor: std_logic_vector(N-1 downto 0);

begin
	-- seccion descriptiva

	b_xor <= b_i xor (N-1 downto 0 => s_r); -- xor con un vector replicado de s_r

	sum1b_inst: entity work.sumNb
		generic map(
			N => N
		)
		port map (
			a_i => a_i,
			b_i => b_xor,
			ci_i => s_r,
			s_o => s_o,
			co_o => co_o
		);

end;