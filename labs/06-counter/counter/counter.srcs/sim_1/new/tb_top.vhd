------------------------------------------------------------
--
-- Testbench for N-bit Up/Down binary counter.
-- Nexys A7-50T, Vivado v2020.1.1, EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_top is
    -- Entity of testbench is always empty
end entity tb_top; 

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_top is

    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_reset_4b   : std_logic;
    signal s_reset_16b  : std_logic;
    signal s_cnt_up_4b  : std_logic;
    signal s_cnt_up_16b : std_logic;
    signal s_cnt_4b     : std_logic_vector(4 - 1 downto 0);
    signal s_cnt_16b    : std_logic_vector(16 - 1 downto 0);

begin
    -- Connecting testbench signals with cnt_up_down entity
    -- (Unit Under Test)
    uut_top : entity work.top
        port map(
            CLK100MHZ      => s_clk_100MHz,
            SW_UP_16bit    => s_cnt_up_16b,
            SW_UP_4bit    => s_cnt_up_4b,
            BTN_RESET_4bit => s_reset_4b,
            BTN_RESET_16bit => s_reset_16b,
            LED     => s_cnt_16b,
            CNT_OUT_4bit => s_cnt_4b
        );

    --------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 1000 ns loop -- 1000 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------
    p_reset_gen : process
    begin
        s_reset_4b <= '1'; 
        s_reset_16b <= '1';
        wait for 10 ns;
        s_reset_4b <= '0'; 
        s_reset_16b <= '0';
        wait for 280 ns;
        s_reset_16b <= '1';
        wait for 70 ns;
        s_reset_4b <= '1';
        wait for 50 ns;
        s_reset_16b <= '0';
        wait for 100 ns;
        s_reset_4b <= '0';
        
        wait;
    end process p_reset_gen;

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        s_cnt_up_4b <= '0';
        s_cnt_up_16b <= '0';
        wait for 250 ns;
        s_cnt_up_4b <= '1';
        wait for 180 ns;
        s_cnt_up_16b <= '1';
        wait for 200 ns;
        s_cnt_up_4b <= '0';
        wait for 180 ns;
        s_cnt_up_16b <= '0';
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;
