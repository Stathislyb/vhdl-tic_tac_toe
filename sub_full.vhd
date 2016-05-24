library ieee;
use ieee.std_logic_1164.all;

entity sub_full is
  port (y : in std_logic_vector (8 downto 0);
  u : in std_logic_vector (8 downto 0);
        full  : out std_logic);
end sub_full;

architecture check of sub_full is
  signal tempfull : std_logic_vector (8 downto 0);
  begin
    z : for i in 8 downto 0 generate
     tempfull(i) <= y(i) XOR u(i);
    end generate;
    full <= (tempfull(0) and tempfull(1) and tempfull(2) and tempfull(3) and tempfull(4) and tempfull(5) and tempfull(6) and tempfull(7) and tempfull(8)) ;
  end check;