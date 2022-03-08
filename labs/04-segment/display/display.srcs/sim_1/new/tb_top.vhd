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

    -- Local signals
    signal s_input  : std_logic_vector(3 downto 0);
    signal s_led  : std_logic_vector(7 downto 0);

begin
    -- Connecting testbench signals with decoder entity
    -- (Unit Under Test)
    uut_top : entity work.top
        port map(
            SW => s_input,
            LED => s_led
        );

    --------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;


        s_input <= x"0"; wait for 50 ns;
        s_input <= x"1"; wait for 50 ns;
        s_input <= x"2"; wait for 50 ns;
        s_input <= x"3"; wait for 50 ns;
        s_input <= x"4"; wait for 50 ns;
        s_input <= x"5"; wait for 50 ns;
        s_input <= x"6"; wait for 50 ns;
        s_input <= x"7"; wait for 50 ns;
        s_input <= x"8"; wait for 50 ns;
        s_input <= x"9"; wait for 50 ns;
        s_input <= x"A"; wait for 50 ns;
        s_input <= x"B"; wait for 50 ns;
        s_input <= x"C"; wait for 50 ns;
        s_input <= x"D"; wait for 50 ns;
        s_input <= x"E"; wait for 50 ns;
        s_input <= x"F"; wait for 50 ns;
        

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;
