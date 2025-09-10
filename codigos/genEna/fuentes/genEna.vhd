library IEEE;
use IEEE.std_logic_1164.all;

-- declaracion de entidad
entity genEna is
	generic(
		N: natural := 10
	);
	port(
		clk_i: in std_logic;
		rst_i: in std_logic;
		q_o: out std_logic
	);
end;

--cuerpo de arquitectura
architecture genEna_arq of genEna is
	-- seccion declarativa

begin
	-- seccion descriptiva
	process(clk_i)
		variable aux: integer range 0 to N := 0;
	begin
		if rising_edge(clk_i) then
			if rst_i = '1' then
				q_o <= '0';
				aux := 0;
			elsif aux = N-1 then 
				q_o <= '1';
				aux := 0;
			else
				aux := aux + 1;
				q_o <= '0';
			end if;
		end if;
	end process;
end;

