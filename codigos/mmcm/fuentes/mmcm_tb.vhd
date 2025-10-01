library IEEE;
use IEEE.std_logic_1164.all;

entity mmcm_tb is 

end;

architecture mmcm_tb_arq of mmcm_tb is
    signal clk_i_tb: std_logic := '0';
    signal clk_o_tb: std_logic;
    signal locked_tb: std_logic;
begin

    clk_i_tb <= not clk_i_tb after 4 ns;
    
    mmcm_inst : entity work.mmcm
    port map (  
        clk_o => clk_o_tb,             
        locked_o => locked_tb,
        clk_i => clk_i_tb
    );
end;