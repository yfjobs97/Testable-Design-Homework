
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_threeTwoThree is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_threeTwoThree;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_threeTwoThree.all;

entity xor2 is

   port( a, b : in std_logic;  c : out std_logic);

end xor2;

architecture SYN_xor2_arch of xor2 is

   component GTECH_XOR2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   C7 : GTECH_XOR2 port map( A => a, B => b, Z => c);

end SYN_xor2_arch;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_threeTwoThree.all;

entity Myor2 is

   port( a, b : in std_logic;  c : out std_logic);

end Myor2;

architecture SYN_or2_arch of Myor2 is

   component OR2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;

begin
   
   U1 : OR2 port map( A => a, B => b, Z => c);

end SYN_or2_arch;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_threeTwoThree.all;

entity threeTwoThree is

   port( x1, x2 : in std_logic;  z : out std_logic);

end threeTwoThree;

architecture SYN_threeTwoThree_arch of threeTwoThree is

   component xor2
      port( a, b : in std_logic;  c : out std_logic);
   end component;
   
   component Myor2
      port( a, b : in std_logic;  c : out std_logic);
   end component;
   
   signal c8, c9 : std_logic;

begin
   
   u1 : Myor2 port map( a => x1, b => x2, c => c8);
   u2 : xor2 port map( a => x1, b => x2, c => c9);
   u3 : xor2 port map( a => c8, b => c9, c => z);

end SYN_threeTwoThree_arch;
