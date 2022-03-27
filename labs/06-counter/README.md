# Lab 6: Filip Stryk

### Bidirectional counter

1. Process `p_cnt_up_down`.

```vhdl
    p_cnt_up_down : process(clk)
    begin
        if rising_edge(clk) then
        
            if (reset = '1') then   -- Synchronous reset
                s_cnt_local <= (others => '0'); -- Clear all bits

            elsif (en_i = '1') then -- Test if counter is enabled

                if (cnt_up_i = '1') then
                    s_cnt_local <= s_cnt_local + 1;
                else
                    s_cnt_local <= s_cnt_local - 1;
                end if;

            end if;
        end if;
    end process p_cnt_up_down
```

2. Simulater waaveforms of 3bit counter.

   - Full waveforms
   ![Full waveforms](img/waveforms_full.png)

   - `s_reset`
   ![Reset](img/waveforms_reset.png)

   - `s_en`
   ![Reset](img/waveforms_enable.png)

   - `s_cnt_up`
   ![Reset](img/waveforms_direction.png)

### Two counters

1. Image of the top layer structure with two independent counters (4bit and 16bit).
    ![Diagram](img/diagram.png)

2. Simulated waveforms of the top layer.
    ![Waveforms - TOP](img/waveforms_top.png)
