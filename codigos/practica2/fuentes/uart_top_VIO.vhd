-------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2015 10:24:29 AM
-- Design Name: 
-- Module Name: uart_top_VIO
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
--////////////////////////////////////////////////////////////////////////////////

library IEEE;
use IEEE.std_logic_1164.all;

entity uart_top_VIO is
	port(
		--Write side inputs
		clk_pin: in std_logic;		-- Clock input (from pin)
		
		rxd_pin: in std_logic 		-- Uart input

	);
end;
	

architecture uart_top_VIO_arq of uart_top_VIO is

	signal probe_btn, probe_rst: std_logic;
	signal probe_leds: std_logic_vector(3 downto 0);
	
	COMPONENT vio
      PORT (
        clk : IN STD_LOGIC;
        probe_in0 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        probe_out0 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
        probe_out1 : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
      );
    END COMPONENT;

begin

	U0: entity work.uart_top
		port map(
			clk_pin => clk_pin,  	
			rst_pin => probe_rst,  	
			btn_pin => probe_btn,  	
			rxd_pin => rxd_pin,  	
			led_pins => probe_leds 	
		);
	VIO_inst : vio
          PORT MAP (
            clk => clk_pin,
            probe_in0 => probe_leds,
            probe_out0(0) => probe_rst,
            probe_out1(0) => probe_btn
          );
end;
