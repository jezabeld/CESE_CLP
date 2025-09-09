library IEEE;
use IEEE.std_logic_1164.all;

-- declaracion de entidad TEST BENCH
entity cont4b_tb is
end;

--cuerpo de arquitectura
architecture cont4b_tb_arq of cont4b_tb is
	-- seccion declarativa

	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '1';
	signal q_tb: std_logic_vector (3 downto 0) := "0000";

begin
	-- seccion descriptiva
	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= '0' after 40 ns;

	cont4b_inst: entity work.cont4b
		port map(
			clk_i => clk_tb,
			rst_i => rst_tb,
			q_o => q_tb 
		);
end;