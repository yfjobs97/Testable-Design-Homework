
library IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_threeThreeSix is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_threeThreeSix;

library IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_threeThreeSix.all;

entity threeThreeSix is

   port( x1, x2, x3, x4, x5, x6 : in std_logic;  z1, z2, z3, z4 : out std_logic
         );

end threeThreeSix;

architecture SYN_threeThreeSix_arch of threeThreeSix is

   component myAnd_0
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component myAnd_1
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component myOr
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component myAnd_2
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component myAnd_3
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component myAnd_4
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component myAnd_5
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   component myAnd_6
      port( A, B : in std_logic;  Z : out std_logic);
   end component;
   
   signal z1_port, z3_port, c5, c6, c10, c12 : std_logic;

begin
   z1 <= z1_port;
   z3 <= z3_port;
   
   u1 : myAnd_6 port map( A => x1, B => x3, Z => z1_port);
   u2 : myAnd_5 port map( A => x2, B => x3, Z => c5);
   u3 : myAnd_4 port map( A => x3, B => x5, Z => c6);
   u4 : myAnd_3 port map( A => z1_port, B => c5, Z => c10);
   u5 : myAnd_2 port map( A => x4, B => c6, Z => z3_port);
   u6 : myOr port map( A => c6, B => x6, Z => c12);
   u7 : myAnd_1 port map( A => c10, B => z3_port, Z => z2);
   u8 : myAnd_0 port map( A => z3_port, B => c12, Z => z4);

end SYN_threeThreeSix_arch;
