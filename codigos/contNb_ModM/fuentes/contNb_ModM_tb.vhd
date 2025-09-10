library IEEE;
use IEEE.std_logic_1164.all;

-- declaracion de entidad TEST BENCH
entity contNb_ModM_tb is
end;

--cuerpo de arquitectura
architecture contNb_ModM_tb_arq of contNb_ModM_tb is
	-- seccion declarativa

	constant N_tb: natural :=10;
	constant M_tb: natural := 510;

	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '1';
	signal ena_tb: std_logic := '1';
	signal q_tb: std_logic_vector (N_tb-1 downto 0);

begin
	-- seccion descriptiva
	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= '0' after 40 ns;

	contNb_ModM_inst: entity work.contNb_ModM
		generic map(
			N => N_tb,
			M => M_tb
		)
		port map(
			clk_i => clk_tb,
			rst_i => rst_tb,
			ena_i => ena_tb,
			q_o => q_tb 
		);
end;