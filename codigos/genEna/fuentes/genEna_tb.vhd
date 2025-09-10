library IEEE;
use IEEE.std_logic_1164.all;

-- declaracion de entidad TEST BENCH
entity genEna_tb is
end;

--cuerpo de arquitectura
architecture genEna_tb_arq of genEna_tb is
	-- seccion declarativa

	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '1';
	signal q_tb: std_logic;

begin
	-- seccion descriptiva
	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= '0' after 20 ns;

	genEna_inst: entity work.genEna
		generic map(
			N => 10
		)
		port map(
			clk_i => clk_tb,
			rst_i => rst_tb,
			q_o => q_tb 
		);
end;