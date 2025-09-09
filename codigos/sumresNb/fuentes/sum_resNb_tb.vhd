library IEEE;
use IEEE.std_logic_1164.all;

-- declaracion de entidad TEST BENCH
entity sum_resNb_tb is
end;

--cuerpo de arquitectura
architecture sum_res_tb_arq of sum_resNb_tb is
	-- seccion declarativa

	constant N_tb: natural := 5;

	signal a_tb: std_logic_vector(N_tb-1 downto 0) := "00111";
	signal b_tb: std_logic_vector(N_tb-1 downto 0) := "00011";
	signal ci_tb: std_logic := '0';
	signal s_r_tb: std_logic := '0';
	signal s_tb: std_logic_vector(N_tb-1 downto 0);
	signal co_tb: std_logic;

begin
	-- seccion descriptiva
	s_r_tb <= '1' after 200 ns;

	sumNb_inst: entity work.sum_resNb
		generic map(
			N => N_tb
		)
		port map(
			a_i  => a_tb,
			b_i  => b_tb,
			ci_i => ci_tb,
			s_o  => s_tb,
			co_o => co_tb,
			s_r => s_r_tb
		);
end;