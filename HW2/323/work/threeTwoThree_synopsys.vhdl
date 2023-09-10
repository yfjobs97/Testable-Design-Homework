
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_threeTwoThree is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_threeTwoThree;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_threeTwoThree.all;

entity threeTwoThree is

   port( x1, x2 : in std_logic;  z : out std_logic);

end threeTwoThree;

architecture SYN_threeTwoThree_arch of threeTwoThree is

   component xor2_0
      port( a, b : in std_logic;  c : out std_logic);
   end component;
   
   component xor2_1
      port( a, b : in std_logic;  c : out std_logic);
   end component;
   
   component Myor2
      port( a, b : in std_logic;  c : out std_logic);
   end component;
   
   signal c8, c9 : std_logic;

begin
   
   u1 : Myor2 port map( a => x1, b => x2, c => c8);
   u2 : xor2_1 port map( a => x1, b => x2, c => c9);
   u3 : xor2_0 port map( a => c8, b => c9, c => z);

end SYN_threeTwoThree_arch;
