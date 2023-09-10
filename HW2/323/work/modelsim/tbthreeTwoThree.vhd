LIBRARY IEEE;

USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all ;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;

entity tb323 is
end tb323;

architecture tb323_arch of tb323 is
component threeTwoThree
port(
  x1, x2:in std_logic;
  z:out std_logic
);
end component;

signal in_x1, in_x2, out_z: std_logic := '0';
begin
  ithreeTwoThree:threeTwoThree port map(x1=>in_x1, x2=>in_x2, z=>out_z);
  in_x1<='0', '0' after 5 ns, '1' after 10 ns, '1' after 15 ns;
  in_x2<='0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns;
end tb323_arch;

configuration cf_323 of tb323 is
  for tb323_arch
    for ithreeTwoThree:threeTwoThree
      use entity WORK.threeTwoThree (threeTwoThree_arch);
    end for;
  end for;
end cf_323;
