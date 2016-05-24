library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PanelDisplay is
 port (clk : in std_logic;
  rst : in std_logic;
  oldx : in std_logic_vector(8 downto 0);
  o : in std_logic_vector(8 downto 0);
  hsync : out std_logic;
  vsync : out std_logic;
  red : out std_logic_vector (3 downto 0);
  green : out std_logic_vector (3 downto 0);
  blue : out std_logic_vector (3 downto 0);
  error : out std_logic;
  full : out std_logic;
  winX : out std_logic;
  winO : out std_logic;
  noWin : out std_logic);
end PanelDisplay;

architecture archy of PanelDisplay is
 signal pclk: std_logic;
 signal shapingx : std_logic;
 signal shapingo : std_logic;
 signal black_l : std_logic; 
 signal black_f : std_logic; 
 signal current_p : std_logic_vector (9 downto 0);
 signal current_l : std_logic_vector (9 downto 0);
 signal counter_l : std_logic_vector (5 downto 0);
 signal counter_p : std_logic_vector (5 downto 0);
 signal datax : std_logic_vector(63 downto 0);
 signal datao : std_logic_vector(63 downto 0);
 signal x : std_logic_vector(8 downto 0);
 component char_romx is
   port (address : in std_logic_vector(5 downto 0); data : out std_logic_vector(63 downto 0) );
 end component;
 component char_romo is
   port (address : in std_logic_vector(5 downto 0); data : out std_logic_vector(63 downto 0) );
 end component;
 component tictactoe is
   port (x : in std_logic_vector (8 downto 0); o : in std_logic_vector (8 downto 0); newx : out std_logic_vector(8 downto 0); error : out std_logic; full : out std_logic; winX : out std_logic; winO : out std_logic; noWin : out std_logic);
 end component;

 begin
   
   ttt: tictactoe port map(x => oldx, o => o, newx => x, error => error, full => full, winX=> winX, winO => winO, noWin => noWin);
  
   process(clk, rst)
    begin
      if rst = '1' then
       pclk <= '0';
     elsif rising_edge(clk) then
       pclk <= not pclk;
     end if;
  end process;  
  
  p0: process (pclk,rst)
     begin 
          
         if rst = '1' then
       counter_l <= (others => '0');
      counter_p <= (others => '0');
    elsif rising_edge(pclk) then
                
      --    if(rst = '1') then 
      --     counter_l <= "000000";
      --    else
          if(current_l = 81) then
            counter_l <= "000000";
          elsif(current_l = 246) then
            counter_l <= "000000";
          elsif(current_l = 411) then
            counter_l <= "000000";
          elsif(counter_l = 48) then  
            counter_l <= "000000";
			else
			   counter_l <= counter_l+1;
      --    end if; 
         end if;
          
      --    if(rst = '1') then 
      --     counter_p <= "000000";
      --    else
          if(current_p = 212) then
            counter_p <= "000000";
          elsif(current_p = 432) then
            counter_p <= "000000";
          elsif(current_p = 652) then
            counter_p <= "000000";
          elsif(counter_p = 64) then  
            counter_p <= "000000";
			 else
			   counter_p <= counter_p+1;
          end if; 
      --   end if; 
        end if;       
           
  end process;
  
  romx: char_romx port map(address => counter_l, data => datax);
  romo: char_romo port map(address => counter_l, data => datao);

  
  p1: process (pclk,rst)
     begin 
          
         if rst = '1' then
      current_p <= (others => '0');
    elsif rising_edge(pclk) then
       --   if(rst = '1') then 
       --    current_p <= "0000000000";
      --    else
           if(current_p = 800) then
            current_p <= "0000000000";
           else
            current_p <= current_p+1;
          end if; 
      --   end if;
        end if;
         
  end process;
  
  p2 :  process (pclk,rst)
   begin
  if rst = '1' then
       current_l <= (others => '0');
    elsif rising_edge(pclk) then
      --    if(rst = '1') then 
      --     current_l <= "0000000000";
          if(current_p = 800) then
           if(current_l = 524) then
             current_l <= "0000000000";
           else
             current_l <= current_l + 1;
           end if;
          end if;
         end if;
            
     end process;
     
     
    p3: process(pclk)
     begin 
          
         if rising_edge(pclk) then
         
          
          if((current_p > 212 AND current_p < 275 AND current_l > 81 AND current_l < 128 AND x(0) = '1') OR 
          (current_p > 432 AND current_p < 495 AND current_l > 81 AND current_l < 128 AND x(1) = '1') OR 
          (current_p > 652 AND current_p < 715 AND current_l > 81 AND current_l < 128 AND x(2) = '1') OR 
          (current_p > 212 AND current_p < 275 AND current_l > 246 AND current_l < 293 AND x(3) = '1') OR 
          (current_p > 432 AND current_p < 495 AND current_l > 246 AND current_l < 293 AND x(4) = '1') OR 
          (current_p > 652 AND current_p < 715 AND current_l > 246 AND current_l < 293 AND x(5) = '1') OR 
          (current_p > 212 AND current_p < 275 AND current_l > 411 AND current_l < 458 AND x(6) = '1') OR 
          (current_p > 432 AND current_p < 495 AND current_l > 411 AND current_l < 458 AND x(7) = '1') OR 
          (current_p > 652 AND current_p < 715 AND current_l > 411 AND current_l < 458 AND x(8) = '1')) then
            shapingx <='1';
          else
            shapingx <='0';
          end if;
          
          if((current_p > 212 AND current_p < 275 AND current_l > 81 AND current_l < 128 AND o(0) = '1') OR 
          (current_p > 432 AND current_p < 495 AND current_l > 81 AND current_l < 128 AND o(1) = '1') OR 
          (current_p > 652 AND current_p < 715 AND current_l > 81 AND current_l < 128 AND o(2) = '1') OR 
          (current_p > 212 AND current_p < 275 AND current_l > 246 AND current_l < 293 AND o(3) = '1') OR 
          (current_p > 432 AND current_p < 495 AND current_l > 246 AND current_l < 293 AND o(4) = '1') OR 
          (current_p > 652 AND current_p < 715 AND current_l > 246 AND current_l < 293 AND o(5) = '1') OR 
          (current_p > 212 AND current_p < 275 AND current_l > 411 AND current_l < 458 AND o(6) = '1') OR 
          (current_p > 432 AND current_p < 495 AND current_l > 411 AND current_l < 458 AND o(7) = '1') OR 
          (current_p > 652 AND current_p < 715 AND current_l > 411 AND current_l < 458 AND o(8) = '1')) then
            shapingo <='1';
          else
            shapingo <='0';
          end if; 
          
          
         end if;
    end process;
     
    p4:   process (pclk,rst)
   begin
  if rst = '1' then
       hsync <= '0';
       vsync <= '0';
    elsif rising_edge(pclk) then
           
        --  if(rst = '1') then 
        --   hsync <= '0';
          if(current_p = 0) then        
           hsync <= '0';
          elsif (current_p = 96) then
           hsync <= '1';
          end if;
          
          if (current_p = 784 OR current_p = 0) then
           black_l <= '1';
          elsif (current_p=0 OR current_p = 144) then
           black_l <= '0';
          end if;
         
          --if(rst = '1') then 
         --  vsync <= '0';
         if(current_l = 0) then        
           vsync <= '0';
          elsif (current_l = 2) then
           vsync <= '1';
          end if;
          
          if (current_l = 513 OR current_l = 0) then
           black_f <= '1';
          elsif (current_l=0 OR current_l = 33) then
           black_f <= '0';
          end if;
         
         end if;
         
   end process;
   
p5: process (pclk,rst)
     begin 
          
         if rst = '1' then
          green <= (others => '0');
          blue <= (others => '0');
          red <= (others => '0');
        elsif rising_edge(pclk) then
          
          if(black_l='1' OR black_f='1') then 
            red <= "0000";
            green <= "0000";
            blue <= "0000";                     
          elsif((current_l > 178 AND current_l < 198) OR ( current_l > 343 AND current_l <363)) then
            red <= "1111";
            green <= "1111";
            blue <= "1111";
          elsif(current_p = 344 OR current_p = 564) then
            red <= "1111";
            green <= "1111";
            blue <= "1111";
          elsif(current_p = 364 OR current_p = 584) then
            red <= "0000";
            green <= "0000";
            blue <= "0000";
          elsif( shapingx = '1') then
            if(datax(conv_integer(counter_p))='1')then
              red <= "1000";
              green <= "0011";
              blue <= "0110";
            end if;          
          elsif(shapingo = '1') then
            if(datao(conv_integer(counter_p))='1')then
              red <= "0011";
              green <= "1001";
              blue <= "0000";
            end if;
          end if;
                   
        end if;
    end process;
   

end archy;
