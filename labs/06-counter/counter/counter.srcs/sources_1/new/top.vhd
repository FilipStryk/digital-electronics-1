library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( CLK100MHZ: in STD_LOGIC;
           SW_UP_4bit : in STD_LOGIC;
           SW_UP_16bit : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (15 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           BTN_RESET_4bit: in STD_LOGIC;
           BTN_RESET_16bit: in STD_LOGIC;
           CNT_OUT_4bit: out STD_LOGIC_VECTOR (3 downto 0) -- only for tests
           );
end top;

------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture Behavioral of top is

  -- Internal clock enable
  signal s_en_4bit  : std_logic;
  signal s_en_16bit  : std_logic;
  -- Internal counter
  signal s_cnt_4bit : std_logic_vector(4 - 1 downto 0);
  signal s_cnt_16bit : std_logic_vector(16 - 1 downto 0);

begin

  --------------------------------------------------------------------
  -- Instance (copy) of clock_enable entity
  clk_en_4bit : entity work.clock_enable
      generic map(
--          g_MAX => 25000000
          g_MAX => 5 -- only for tests
      )
      port map(
          clk   => CLK100MHZ,
          reset => BTN_RESET_4bit,
          ce_o  => s_en_4bit
      );
  
  clk_en_16bit : entity work.clock_enable
      generic map(
--          g_MAX => 1000000
          g_MAX => 3 -- only for tests
      )
      port map(
          clk   => CLK100MHZ,
          reset => BTN_RESET_16bit,
          ce_o  => s_en_16bit
      );

  --------------------------------------------------------------------
  -- Instance (copy) of cnt_up_down entity
  bin_cnt_4bit : entity work.cnt_up_down
     generic map(
          g_CNT_WIDTH => 4
          
      )
      port map(
          clk => CLK100MHZ,
          reset => BTN_RESET_4bit,
          en_i => s_en_4bit,
          cnt_up_i => SW_UP_4bit,
          cnt_o => s_cnt_4bit
      );
  
  bin_cnt_16bit : entity work.cnt_up_down
     generic map(
          g_CNT_WIDTH => 16
          
      )
      port map(
          clk => CLK100MHZ,
          reset => BTN_RESET_16bit,
          en_i => s_en_16bit,
          cnt_up_i => SW_UP_16bit,
          cnt_o => s_cnt_16bit
      );

  --------------------------------------------------------------------
  -- Instance (copy) of hex_7seg entity
  hex2seg : entity work.hex_7seg
      port map(
          hex_i    => s_cnt_4bit,
          seg_o(6) => CA,
          seg_o(5) => CB,
          seg_o(4) => CC,
          seg_o(3) => CD,
          seg_o(2) => CE,
          seg_o(1) => CF,
          seg_o(0) => CG
      );

  -- Connect one common anode to 3.3V
  AN <= b"1111_1110";

  -- Display counter values on LEDs
  LED(15 downto 0) <= s_cnt_16bit;
  CNT_OUT_4bit(3 downto 0) <= s_cnt_4bit; -- only for tests

end architecture Behavioral;
