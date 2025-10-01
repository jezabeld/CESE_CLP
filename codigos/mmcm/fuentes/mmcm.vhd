library IEEE;
use IEEE.std_logic_1164.all;

entity mmcm is 
    port(
        clk_i: in std_logic;
        clk_o: out std_logic;
        locked_o: out std_logic
    );
end;

architecture mmcm_arq of mmcm is
    component clk_wiz_0
    port(
        clk_out1          : out    std_logic;
        locked            : out    std_logic;
        clk_in1           : in     std_logic
    );
end component;
begin
    mmcm_inst : clk_wiz_0
    port map ( 
        clk_out1 => clk_o,            
        locked => locked_o,
        clk_in1 => clk_i
    );
end;