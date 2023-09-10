LIBRARY IEEE;

USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all ;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;

entity tb55noSetReset is
end tb55noSetReset;

architecture tb55noSetReset_arch of tb55noSetReset is
component fiveFivenoSetReset
port(
  x1, x2, x3, CLK:in std_logic;
  z:out std_logic
);
end component;

signal in_x1, in_x2, in_x3, out_z: std_logic := '0';
signal in_value :std_logic_vector(2 downto 0) := "000"; 
signal CLK_in: std_logic := '0';
begin
  ifiveFivenoSetReset:fiveFivenoSetReset port map(x1=>in_x1, x2=>in_x2, x3=>in_x3, CLK=>CLK_in, z=>out_z);
  Clock: process
  begin
    CLK_in <= '0';
    wait for 5 ns;
    CLK_in <= '1';
    wait for 5 ns;
  end process;
  in_x3<='0', '1' after 80 ns, '0' after 160 ns;
  in_x2<='0', '1' after 40 ns, '0' after 80 ns, '1' after 120 ns, '0' after 160 ns;
  in_x1<='0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns, '0' after 80 ns, '1' after 100 ns, 
        '0' after 120 ns, '1' after 140 ns, '0' after 160 ns;
end tb55noSetReset_arch;

configuration cf_55noSR of tb55noSetReset is
  for tb55noSetReset_arch
    for ifiveFivenoSetReset:fiveFivenoSetReset
      use entity WORK.fiveFivenoSetReset (fiveFivenoSetReset_arch);
    end for;
  end for;
end cf_55noSR;
