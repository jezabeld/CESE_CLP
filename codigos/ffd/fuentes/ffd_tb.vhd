library IEEE;
use IEEE.std_logic_1164.all;

-- declaracion de entidad TEST BENCH
entity ffd_tb is
end;

--cuerpo de arquitectura
architecture ffd_tb_arq of ffd_tb is
	-- seccion declarativa

	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '0';
	signal ena_tb: std_logic := '1';
	signal d_tb: std_logic := '0';
	signal q_tb: std_logic;

begin
	-- seccion descriptiva
	clk_tb <= not clk_tb after 10 ns;
	d_tb <= '1' after 60 ns, '0' after 100 ns, '1' after 145 ns;
	ena_tb <= '0' after 105 ns, '1' after 120 ns;
	rst_tb <= '1' after 155 ns;

	ffd_inst: entity work.ffd
		port map(
			clk_i => clk_tb,
			rst_i => rst_tb,
			ena_i => ena_tb,
			d_i => d_tb,
			q_o => q_tb 
		);
end;