library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity MoveGen is
port (x : in std_logic_vector(8 downto 0);
      o : in std_logic_vector(8 downto 0);
      newX : out std_logic_vector(8 downto 0));

end MoveGen;


architecture game of MoveGen is
begin
  
--newX <= "000000000";
 
process (o, x)
begin 

 newX <= "000000000";
  
 if( ( x(0)='0' AND o(0)='0' ) AND (( x(1)='1' AND x(2)='1' ) OR ( x(3)='1' AND x(6)='1' ) OR ( x(4)='1' AND x(8)='1' )) ) then                 --win
   newX(0)<='1';
 elsif ( ( x(1)='0' AND o(1)='0' ) AND (( x(0)='1' AND x(2)='1' ) OR ( x(4)='1' AND x(7)='1' )) ) then
   newX(1)<='1';
 elsif (( x(2)='0' AND o(2)='0' ) AND (( x(0)='1' AND x(1)='1' ) OR ( x(4)='1' AND x(6)='1' ) OR ( x(5)='1' AND x(8)='1' )) ) then
   newX(2)<='1';
 elsif ( ( x(3)='0' AND o(3)='0' ) AND (( x(0)='1' AND x(6)='1' ) OR ( x(4)='1' AND x(5)='1' )) ) then
   newX(3)<='1';
 elsif (( x(4)='0' AND o(4)='0' ) AND (( x(0)='1' AND x(8)='1' ) OR ( x(2)='1' AND x(6)='1' ) OR ( x(1)='1' AND x(7)='1' ) OR ( x(3)='1' AND x(5)='1' )) ) then
   newX(4)<='1';
 elsif ( ( x(5)='0' AND o(5)='0' ) AND (( x(2)='1' AND x(8)='1' ) OR ( x(3)='1' AND x(4)='1' )) ) then
   newX(5)<='1';
 elsif (( x(6)='0' AND o(6)='0' ) AND (( x(0)='1' AND x(3)='1' ) OR ( x(2)='1' AND x(4)='1' ) OR ( x(7)='1' AND x(8)='1' )) ) then
   newX(6)<='1';
 elsif ( ( x(7)='0' AND o(7)='0' ) AND (( x(1)='1' AND x(4)='1' ) OR ( x(6)='1' AND x(8)='1' )) ) then
   newX(7)<='1';
 elsif (( x(8)='0' AND o(8)='0' ) AND (( x(0)='1' AND x(4)='1' ) OR ( x(2)='1' AND x(5)='1' ) OR ( x(6)='1' AND x(7)='1' )) ) then
   newX(8)<='1';
 else
  if ( ( x(0)='0' AND o(0)='0' ) AND (( o(1)='1' AND o(2)='1' ) OR ( o(3)='1' AND o(6)='1' ) OR ( o(4)='1' AND o(8)='1' )) ) then                --block
   newX(0)<='1';
  elsif ( ( x(1)='0' AND o(1)='0' ) AND (( o(0)='1' AND o(2)='1' ) OR ( o(4)='1' AND o(7)='1' )) ) then
   newX(1)<='1';
  elsif (( x(2)='0' AND o(2)='0' ) AND (( o(0)='1' AND o(1)='1' ) OR ( o(4)='1' AND o(6)='1' ) OR ( o(5)='1' AND o(8)='1' )) ) then
   newX(2)<='1';
  elsif ( ( x(3)='0' AND o(3)='0' ) AND (( o(0)='1' AND o(6)='1' ) OR ( o(4)='1' AND o(5)='1' )) ) then
   newX(3)<='1';
  elsif (( x(4)='0' AND o(4)='0' ) AND (( o(0)='1' AND o(8)='1' ) OR ( o(2)='1' AND o(6)='1' ) OR ( o(1)='1' AND o(7)='1' ) OR ( o(3)='1' AND o(5)='1' )) ) then
   newX(4)<='1';
  elsif ( ( x(5)='0' AND o(5)='0' ) AND (( o(2)='1' AND o(8)='1' ) OR ( o(3)='1' AND o(4)='1' )) ) then
   newX(5)<='1';
  elsif (( x(6)='0' AND o(6)='0' ) AND (( o(0)='1' AND o(3)='1' ) OR ( o(2)='1' AND o(4)='1' ) OR ( o(7)='1' AND o(8)='1' )) ) then
   newX(6)<='1';
  elsif ( ( x(7)='0' AND o(7)='0' ) AND (( o(1)='1' AND o(4)='1' ) OR ( o(6)='1' AND o(8)='1' )) ) then
   newX(7)<='1';
  elsif (( x(8)='0' AND o(8)='0' ) AND (( o(0)='1' AND o(4)='1' ) OR ( o(2)='1' AND o(5)='1' ) OR ( o(6)='1' AND o(7)='1' )) ) then
   newX(8)<='1';
  else
   if ( x(0)='0' AND o(0)='0' ) then                                                                                                                 --empty
    newX(0) <= '1';
   elsif ( x(1)='0' AND o(1)='0' ) then 
    newX(1) <= '1';
   elsif ( x(2)='0' AND o(2)='0' ) then 
    newX(2) <= '1';
   elsif ( x(3)='0' AND o(3)='0' ) then 
    newX(3) <= '1';
   elsif ( x(4)='0' AND o(4)='0' ) then 
    newX(4) <= '1';
   elsif ( x(5)='0' AND o(5)='0' ) then 
    newX(5) <= '1';
   elsif ( x(6)='0' AND o(6)='0' ) then 
    newX(6) <= '1'; 
   elsif ( x(7)='0' AND o(7)='0' ) then 
    newX(7) <= '1';
   elsif ( x(8)='0' AND o(8)='0' ) then 
    newX(8) <= '1';
   else                                                                                                                                                   --no move
    newX <= "000000000";
   end if;
  end if;
 end if; 
 
end process;

  
end game;