library IEEE;
use IEEE.std_logic_1164.all;

-- declaracion de entidad TEST BENCH
entity sum4b_tb is
end;

--cuerpo de arquitectura
architecture sum4b_tb_arq of sum4b_tb is
	-- seccion declarativa

	signal a_tb: std_logic_vector(3 downto 0) := "0001";
	signal b_tb: std_logic_vector(3 downto 0) := "0101";
	signal ci_tb: std_logic := '0';
	signal s_tb: std_logic_vector(3 downto 0);
	signal co_tb: std_logic;

begin
	-- seccion descriptiva

	a_tb <= "0011" after 200 ns, "0010" after 400 ns;
	b_tb <= "0100" after 300 ns;
	ci_tb <= not ci_tb after 450 ns;

	sum4b_inst: entity work.sum4b 
		port map(
			a_i  => a_tb,
			b_i  => b_tb,
			ci_i => ci_tb,
			s_o  => s_tb,
			co_o => co_tb
		);
end;