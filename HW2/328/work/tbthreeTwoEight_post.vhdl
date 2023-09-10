
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_threeTwoEight is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_threeTwoEight;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_threeTwoEight.all;

entity myNand is

   port( A, B : in std_logic;  Z : out std_logic);

end myNand;

architecture SYN_beh_nand of myNand is

   component GTECH_NOT
      port( A : in std_logic;  Z : out std_logic);
   end component;
   
   component GTECH_AND2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   signal N0 : std_logic;

begin
   
   C7 : GTECH_AND2 port map( A => A, B => B, Z => N0);
   I_0 : GTECH_NOT port map( A => N0, Z => Z);

end SYN_beh_nand;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_threeTwoEight.all;

entity threeTwoEight is

   port( x1, x2, x3, x4 : in std_logic;  z : out std_logic);

end threeTwoEight;

architecture SYN_threeTwoEight_arch of threeTwoEight is

   component myNand
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   signal c1, c5, c4 : std_logic;

begin
   
   u1 : myNand port map( A => x2, B => x3, Z => c1);
   u2 : myNand port map( A => x1, B => c1, Z => c5);
   u3 : myNand port map( A => c1, B => x4, Z => c4);
   u4 : myNand port map( A => c5, B => c4, Z => z);

end SYN_threeTwoEight_arch;
