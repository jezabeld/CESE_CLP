library IEEE;
use IEEE.std_logic_1164.all;

-- declaracion de entidad
entity regNb is
	generic(
		N: natural := 4
	);
	port(
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		d_i: in std_logic_vector(N-1 downto 0);
		q_o: out std_logic_vector(N-1 downto 0)
	);
end;

--cuerpo de arquitectura
architecture regNb_arq of regNb is
	-- seccion declarativa

begin
	-- seccion descriptiva
	process(clk_i)
	begin
		if rising_edge(clk_i) then -- clk_i'event and clk_i - '1' (evento reloj)
			if rst_i = '1' then -- reset sincronico (solo se lee cuando cambia el clk)
				q_o <= (N-1 downto 0 => '0');
			elsif ena_i = '1' then -- si esta habilitado, pasa la salida
				q_o <= d_i;
			-- else -- rst inactivo y no hay flanco, mantener estado
			-- 	q_o <= q_o; -- esto pasa por default
			end if;
		end if;
	end process;
end;

