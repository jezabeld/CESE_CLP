library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- declaracion de entidad TEST BENCH
entity contador_tb is
end;

--cuerpo de arquitectura
architecture contador_tb_arq of contador_tb is
	-- seccion declarativa

	constant N_tb: natural := 4;

	signal clk_tb: std_logic := '0';
	signal rst_tb: std_logic := '1';
	signal ena_tb: std_logic := '1';
	signal value_tb: std_logic_vector (N_tb-1 downto 0) := std_logic_vector(to_unsigned(5,N_tb));
    signal ld_tb: std_logic := '0';
    signal up_tb: std_logic := '1';
	signal q_tb: std_logic_vector (N_tb-1 downto 0);

begin
	-- seccion descriptiva
	clk_tb <= not clk_tb after 10 ns;
	rst_tb <= '0' after 40 ns;
	up_tb <= '0' after 400 ns;
	ld_tb <= '1' after 490 ns, '0' after 510 ns, '1' after 590 ns, '0' after 610 ns;
	ena_tb <= '0' after 570 ns;


	contador_inst: entity work.contador
		generic map(
			N => N_tb
		)
		port map(
			clk_i => clk_tb,
			rst_i => rst_tb,
			ena_i => ena_tb,
			value_i => value_tb,
			ld_i => ld_tb,
			up_i => up_tb,
			q_o => q_tb 
		);
end;