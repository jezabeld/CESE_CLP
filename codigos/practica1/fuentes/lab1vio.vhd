---------------------------------------------------------
-- Nombre del componente: lab1
--
-- Funcion: Implementar funciones de salida para los
--          leds de acuerdo a valores de entrada de
--          los switches
---------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity lab1vio is
	port(
		clk_i: in std_logic
	);
end entity;

architecture llab1vio_arq of lab1vio is
	signal probe_swt: std_logic_vector(3 downto 0);
	signal probe_led: std_logic_vector(3 downto 0);
	
	COMPONENT vio
      PORT (
        clk : IN STD_LOGIC;
        probe_in0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        probe_out0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
      );
    END COMPONENT;
    
begin
	lab1_inst: entity work.lab1
		port map(
			swt => probe_swt,
			led => probe_led
		);
		
	vio_inst : vio
      PORT MAP (
        clk => clk_i,
        probe_in0 => probe_led,
        probe_out0 => probe_swt
      );
	
end architecture;