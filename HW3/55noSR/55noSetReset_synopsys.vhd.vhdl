
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_fiveFivenoSetReset is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_fiveFivenoSetReset;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_fiveFivenoSetReset.all;

entity DFFnoSR is

   port( Q : out std_logic;  clk, D : in std_logic);

end DFFnoSR;

architecture SYN_Behavioral of DFFnoSR is

   component GTECH_FD1
      port( D, CP : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal n_1000 : std_logic;

begin
   
   Q_reg : GTECH_FD1 port map( D => D, CP => clk, Q => Q, QN => n_1000);

end SYN_Behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_fiveFivenoSetReset.all;

entity myOr is

   port( A, B : in std_logic;  Z : out std_logic);

end myOr;

architecture SYN_beh_or of myOr is

   component GTECH_OR2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : GTECH_OR2 port map( A => A, B => B, Z => Z);

end SYN_beh_or;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_fiveFivenoSetReset.all;

entity myNor is

   port( A, B, C : in std_logic;  Z : out std_logic);

end myNor;

architecture SYN_beh_nor of myNor is

   component GTECH_NOT
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component GTECH_OA21
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   signal n1 : std_logic;

begin
   
   U1 : GTECH_OA21 port map( A => A, B => B, C => n1, Z => Z);
   U2 : GTECH_NOT port map( A => C, Z => n1);

end SYN_beh_nor;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_fiveFivenoSetReset.all;

entity fiveFivenoSetReset is

   port( x1, x2, x3, CLK : in std_logic;  z : out std_logic);

end fiveFivenoSetReset;

architecture SYN_fiveFivenoSetReset_arch of fiveFivenoSetReset is

   component DFFnoSR
      port( Q : out std_logic;  clk, D : in std_logic);
   end component;
   
   component myOr
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component myNor
      port( A, B, C : in std_logic;  Z : out std_logic);
   end component;
   
   signal y1, c1 : std_logic;

begin
   
   u1 : myNor port map( A => x2, B => x3, C => y1, Z => c1);
   u2 : myOr port map( A => x1, B => c1, Z => z);
   u3 : DFFnoSR port map( Q => y1, clk => CLK, D => c1);

end SYN_fiveFivenoSetReset_arch;
