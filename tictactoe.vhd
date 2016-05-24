library ieee;
use ieee.std_logic_1164.all;

entity tictactoe is
 port (x : in std_logic_vector (8 downto 0);
  o : in std_logic_vector (8 downto 0);
  newx : out std_logic_vector(8 downto 0);
  error : out std_logic;
  full : out std_logic;
  winX : out std_logic;
  winO : out std_logic;
  noWin : out std_logic);
end tictactoe;

architecture game of tictactoe is

 signal sigf, sige, sigx, sigo : std_logic;
 signal xmove, tempx : std_logic_vector(8 downto 0);
 component sub_error is
   port (x : in std_logic_vector (8 downto 0); o : in std_logic_vector (8 downto 0); error: out std_logic);
 end component;
 component sub_win is
   port (a: in  std_logic_vector (8 downto 0); win : out std_logic);
 end component;
 component sub_full is
   port (y : in std_logic_vector (8 downto 0); u : in std_logic_vector (8 downto 0); full : out std_logic);
 end component;
 component MoveGen is
   port (x : in std_logic_vector(8 downto 0); o : in std_logic_vector(8 downto 0); newX : out std_logic_vector(8 downto 0));
 end component;
 --component PanelDisplay is
 --  port (clk : in std_logic; rst : in std_logic; x : in std_logic_vector(8 downto 0); o : in std_logic_vector(8 downto 0); hsync : out std_logic; vsync : out std_logic; red : out std_logic_vector (3 downto 0); green : out std_logic_vector (3 downto 0); blue : out std_logic_vector (3 downto 0));
 --end component;
 
 begin
   
   mg : MoveGen port map(x => x, o => o, newx => xmove);
   tempx <= x AND xmove;
   se: sub_error port map(x => tempx, o => o, error => sige);
   sf: sub_full port map(y => tempx, u => o, full => sigf); 
   swx: sub_win port map(a => tempx, win => sigx);
   swo: sub_win port map(a => o, win => sigo);
   
   noWin <= sigf AND (NOT(sigx OR sigo));
   full <= sigf;
   winX <= sigx;
   winO <= sigo;
   error <= sige;
   newx <= tempx;
   

  --pd : PanelDisplay pro map(clk => clk, x => newx, o => o, hsync => hsync, vsync => vsync, red => red, green => green, blue => blue);

  end game;