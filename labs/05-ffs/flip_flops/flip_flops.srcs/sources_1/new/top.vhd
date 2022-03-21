library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    Port (
        CLK100MHZ   : in std_logic;
        BTNC        : in std_logic;
        SW          : in std_logic_vector(1 - 1 downto 0);
        LED         : out std_logic_vector(4 - 1 downto 0)
    );
end top;

------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture Behavioral of top is

  -- Internal signals between flip-flops
  signal s_ff_0_to_1 : std_logic;
  signal s_ff_1_to_2 : std_logic;
  signal s_ff_2_to_3 : std_logic;
  signal s_ff_3_out  : std_logic;

begin

  --------------------------------------------------------------------
  -- Four instances (copies) of D-type FF entity
  d_ff_0 : entity work.d_ff_rst
      port map(
          clk   => CLK100MHZ,
          rst   => BTNC,
          d     => SW(0),          
          q     => s_ff_0_to_1
      );

  d_ff_1 : entity work.d_ff_rst
      port map(
          clk   => CLK100MHZ,
          rst   => BTNC,
          d     => s_ff_0_to_1,
          q     => s_ff_1_to_2
      );
   
  d_ff_2 : entity work.d_ff_rst
      port map(
          clk   => CLK100MHZ,
          rst   => BTNC,
          d     => s_ff_1_to_2,
          q     => s_ff_2_to_3
      );
    
  d_ff_3 : entity work.d_ff_rst
      port map(
          clk   => CLK100MHZ,
          rst   => BTNC,
          d     => s_ff_2_to_3,
          q     => s_ff_3_out
      );
      
      LED(0) <= s_ff_0_to_1;
      LED(1) <= s_ff_1_to_2;
      LED(2) <= s_ff_2_to_3;
      LED(3) <= s_ff_3_out;

end architecture Behavioral;