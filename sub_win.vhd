library ieee;
use ieee.std_logic_1164.all;

entity sub_win is
  port (a : in  std_logic_vector (8 downto 0);
        win : out std_logic);
end sub_win;

architecture check of sub_win is
  begin
    win <= (a(6) AND a(7) AND a(8)) OR (a(3) AND a(4) AND a(5)) OR (a(0) AND a(1) AND a(2)) OR (a(0) AND a(3) AND a(6)) OR (a(1) AND a(4) AND a(7)) OR (a(2) AND a(5) AND a(8)) OR (a(0) AND a(4) AND a(8)) OR (a(2) AND a(4) AND a(6));    
  end check;