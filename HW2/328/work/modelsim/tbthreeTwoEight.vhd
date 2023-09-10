LIBRARY IEEE;

USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all ;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;

entity tb328 is
end tb328;

architecture tb328_arch of tb328 is
component threeTwoEight
port(
  x1, x2, x3, x4:in std_logic;
  z:out std_logic
);
end component;

signal in_x1, in_x2, in_x3, in_x4, out_z: std_logic := '0';
begin
  ithreeTwoEight:threeTwoEight port map(x1=>in_x1, x2=>in_x2, x3=>in_x3, x4=>in_x4, z=>out_z);
  in_x1<='0', '1' after 40 ns;
  in_x2<='0', '0' after 5 ns, '0' after 10 ns, '0' after 15 ns, '1' after 20 ns, '1' after 25 ns, '1' after 30 ns, '1' after 35 ns, '0' after 40 ns, '0' after 45 ns, '0' after 50 ns, '0' after 55 ns, '1' after 60 ns, '1' after 65 ns, '1' after 70 ns, '1' after 75 ns;
  in_x3<='0', '0' after 5 ns, '1' after 10 ns, '1' after 15 ns, '0' after 20 ns, '0' after 25 ns, '1' after 30 ns, '1' after 35 ns, '0' after 40 ns, '0' after 45 ns, '1' after 50 ns, '1' after 55 ns, '0' after 60 ns, '0' after 65 ns, '1' after 70 ns, '1' after 75 ns;
  in_x4<='0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0' after 30 ns, '1' after 35 ns, '0' after 40 ns, '1' after 45 ns, '0' after 50 ns, '1' after 55 ns, '0' after 60 ns, '1' after 65 ns, '0' after 70 ns, '1' after 75 ns;
end tb328_arch;

configuration cf_328 of tb328 is
  for tb328_arch
    for ithreeTwoEight:threeTwoEight
      use entity WORK.threeTwoEight (threeTwoEight_arch);
    end for;
  end for;
end cf_328;
