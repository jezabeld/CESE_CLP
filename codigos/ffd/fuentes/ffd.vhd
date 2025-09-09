library IEEE;
use IEEE.std_logic_1164.all;

-- declaracion de entidad
entity ffd is
	port(
		clk_i: in std_logic;
		rst_i: in std_logic;
		ena_i: in std_logic;
		d_i: in std_logic;
		q_o: out std_logic
	);
end;

--cuerpo de arquitectura
architecture ffd_arq of ffd is
	-- seccion declarativa

begin
	-- seccion descriptiva
	process(clk_i)
	begin
		if rising_edge(clk_i) then -- clk_i'event and clk_i - '1' (evento reloj)
			if rst_i = '1' then-- reset sincronico (solo se lee cuando cambia el clk)
				q_o <= '0';
			elsif ena_i = '1' then -- si esta habilitado, pasa la salida
				q_o <= d_i;
			-- else -- rst inactivo y no hay flanco, mantener estado
			-- 	q_o <= q_o; -- esto pasa por default
			end if;
		end if;
	end process;
end;

