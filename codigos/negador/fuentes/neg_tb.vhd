library IEEE;
use IEEE.std_logic_1164.all;

-- declaracion de entidad TEST BENCH
entity neg_tb is
end;

--cuerpo de arquitectura
architecture neg_tb_arq of neg_tb is
	-- seccion declarativa
	component neg is -- traigo el componente
		port(
			a_i: in std_logic;
			b_o: out std_logic
		);
	end component;

	signal a_tb: std_logic := '0';
	signal b_tb: std_logic;

begin
	-- seccion descriptiva

	a_tb <= '1' after 100 ns, '0' after 200 ns, '1' after 250 ns;

	neg_inst: neg
		port map(
			a_i => a_tb,
			b_o => b_tb
		);
end;