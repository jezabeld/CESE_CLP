library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- declaracion de entidad
entity contador is
    generic(
        N: natural := 4
    );
	port(
		clk_i: in std_logic;
		rst_i: in std_logic;
        ena_i: in std_logic;
        value_i: in std_logic_vector (N-1 downto 0);
        ld_i: in std_logic;
        up_i: in std_logic;
		q_o: out std_logic_vector (N-1 downto 0)
	);
end;

--cuerpo de arquitectura
architecture contador_arq of contador is
	-- seccion declarativa
    signal estadoActual, estadoSiguiente: std_logic_vector(N-1 downto 0);
begin
	-- seccion descriptiva
	registros: process(clk_i)
	begin
		if rising_edge(clk_i) then
			if rst_i = '1' then
                if up_i = '1' then
				    estadoActual <= (others => '0'); -- estado default para contar UP
                else
                    estadoActual <= (others => '1');
                end if;
            elsif ena_i = '1' then
                if ld_i = '1' then
                    estadoActual <= value_i;
                else
                    estadoActual <= estadoSiguiente;
                end if;
            end if;
		end if;
	end process;

    transiciones: process(estadoActual,up_i)
        variable sum_aux: unsigned(N downto 0);
    begin
		if up_i = '1' then -- sumo uno
            sum_aux := unsigned('0' & estadoActual) + to_unsigned(1,N+1);
		else -- resto uno
            sum_aux := unsigned('1' & estadoActual) - to_unsigned(1,N+1);
		end if;
        estadoSiguiente <= std_logic_vector(sum_aux(N-1 downto 0));
	end process;

    q_o <= estadoActual;
end;

