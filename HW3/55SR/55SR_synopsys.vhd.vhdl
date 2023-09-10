
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_fiveFiveSR is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_fiveFiveSR;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_fiveFiveSR.all;

entity DFFSR is

   port( Q : out std_logic;  clk, arst, aset, D : in std_logic);

end DFFSR;

architecture SYN_Behavioral of DFFSR is

   component GTECH_NAND2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component GTECH_FD3
      port( D, CP, CD, SD : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal n1, n_1000 : std_logic;

begin
   
   Q_reg : GTECH_FD3 port map( D => D, CP => clk, CD => n1, SD => aset, Q => Q,
                           QN => n_1000);
   U3 : GTECH_NAND2 port map( A => aset, B => arst, Z => n1);

end SYN_Behavioral;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_fiveFiveSR.all;

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

use work.CONV_PACK_fiveFiveSR.all;

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

use work.CONV_PACK_fiveFiveSR.all;

entity fiveFiveSR is

   port( x1, x2, x3, Aset, Areset, CLK : in std_logic;  z : out std_logic);

end fiveFiveSR;

architecture SYN_fiveFiveSR_arch of fiveFiveSR is

   component DFFSR
      port( Q : out std_logic;  clk, arst, aset, D : in std_logic);
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
   u3 : DFFSR port map( Q => y1, clk => CLK, arst => Areset, aset => Aset, D =>
                           c1);

end SYN_fiveFiveSR_arch;
