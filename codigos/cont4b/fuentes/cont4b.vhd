library IEEE;
use IEEE.std_logic_1164.all;

-- declaracion de entidad
entity cont4b is
	port(
		clk_i: in std_logic;
		rst_i: in std_logic;
		q_o: out std_logic_vector (3 downto 0)
	);
end;

--cuerpo de arquitectura
architecture cont4b_arq of cont4b is
	-- seccion declarativa
	signal salInc: std_logic_vector (3 downto 0);
	signal salQ: std_logic_vector (3 downto 0) := "0000";
begin
	-- seccion descriptiva
	ffd_inst: entity work.regNb
		generic map(
			N => 4
		)
		port map(
			clk_i => clk_i,
			rst_i => rst_i,
			ena_i => '1',
			d_i => salInc,
			q_o => salQ-- puertos de salida no pueden ser leidos
		);

	sumNb_inst: entity work.sumNb
		generic map (
			N => 4
		)
		port map(
			a_i => salQ,
			b_i => "0001",
			ci_i => '0',
			s_o => salInc,
			co_o => open
	);
	q_o <= salQ;

end;

