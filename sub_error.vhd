library ieee;
use ieee.std_logic_1164.all;

entity sub_error is
 port (x : in std_logic_vector(8 downto 0);
  o : in std_logic_vector(8 downto 0);
  error : out std_logic);
end sub_error;

architecture check of sub_error is
 signal temperror : std_logic_vector (8 downto 0);
 begin
   y : for i in 8 downto 0 generate
   temperror(i) <= x(i) AND o(i);
   end generate;
error <= (temperror(0) or temperror(1) or temperror(2) or temperror(3) or temperror(4) or temperror(5) or temperror(6) or temperror(7) or temperror(8)) ;
 end check;