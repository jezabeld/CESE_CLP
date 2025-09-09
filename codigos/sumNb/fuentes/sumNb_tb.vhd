library IEEE;
use IEEE.std_logic_1164.all;

-- declaracion de entidad TEST BENCH
entity sumNb_tb is
end;

--cuerpo de arquitectura
architecture sumNb_tb_arq of sumNb_tb is
	-- seccion declarativa

	constant N_tb: natural := 4;

	signal a_tb: std_logic_vector(N_tb-1 downto 0) := "0011";
	signal b_tb: std_logic_vector(N_tb-1 downto 0) := "0101";
	signal ci_tb: std_logic := '0';
	signal s_tb: std_logic_vector(N_tb-1 downto 0);
	signal co_tb: std_logic;

begin
	-- seccion descriptiva

	sumNb_inst: entity work.sumNb 
		generic map(
			N => N_tb
		)
		port map(
			a_i  => a_tb,
			b_i  => b_tb,
			ci_i => ci_tb,
			s_o  => s_tb,
			co_o => co_tb
		);
end;