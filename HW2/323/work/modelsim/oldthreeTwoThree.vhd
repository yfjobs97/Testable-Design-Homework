LIBRARY IEEE;

USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all ;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;

entity threeTwoThree is
port(
  x1, x2:in std_logic;
  z:out std_logic
);
end threeTwoThree;

architecture threeTwoThree_arch of threeTwoThree is
begin
  z<=(x1 or x2) xor (x1 xor x2);
end threeTwoThree_arch;
