library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( CLK100MHZ: in STD_LOGIC;
           SW : in std_logic_vector(1 - 1 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           DP : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           BTNC: in STD_LOGIC;
           BTND: in STD_LOGIC
           );
end top;

------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture Behavioral of top is

    -- Local counters
    signal s_cnt3  : std_logic_vector(3 - 1 downto 0);
    signal s_cnt2  : std_logic_vector(4 - 1 downto 0);
    signal s_cnt1  : std_logic_vector(4 - 1 downto 0);
    signal s_cnt0  : std_logic_vector(4 - 1 downto 0);

begin
    --------------------------------------------------------------------
    -- Instance (copy) of stopwatch_seconds entity
    stopwatch_sec : entity work.stopwatch_seconds
        port map(
            clk   => CLK100MHZ,
            reset => BTNC,
            start_i => BTND,
            pause_i => SW(0),
            seconds_h_o => s_cnt3,
            seconds_l_o => s_cnt2,
            hundredths_h_o => s_cnt1,
            hundredths_l_o => s_cnt0
        );

    --------------------------------------------------------------------
    -- Instance (copy) of driver_7seg_4digits entity
    driver_seg_4 : entity work.driver_7seg_4digits
        port map(
            clk                 => CLK100MHZ,
            reset               => BTNC,
            data3_i(3)          => '0',
            data3_i(2 downto 0) => s_cnt3,
            data2_i(3 downto 0) => s_cnt2,
            data1_i(3 downto 0) => s_cnt1,
            data0_i(3 downto 0) => s_cnt0,
            --- WRITE YOUR CODE HERE
          dp_i       => "1011",
          
          dp_o       => DP,
          seg_o(6)   => CA,
          seg_o(5)   => CB,
          seg_o(4)   => CC,
          seg_o(3)   => CD,
          seg_o(2)   => CE,
          seg_o(1)   => CF,
          seg_o(0)   => CG,
          
          dig_o(3 downto 0) => AN(3 downto 0)
      );

    -- Disconnect the top four digits of the 7-segment display
    AN(7 downto 4) <= b"1111";

end architecture Behavioral;