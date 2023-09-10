LIBRARY IEEE;

USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all ;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;

entity tb55SR is
end tb55SR;

architecture tb55SR_arch of tb55SR is
component fiveFiveSR
port(
  x1, x2, x3, Aset, Areset, CLK:in std_logic;
  z:out std_logic
);
end component;

signal in_x1, in_x2, in_x3, in_arst, out_z: std_logic := '0';
signal in_aset: std_logic := '1';
signal CLK_in: std_logic := '0';
begin
  ifiveFiveSR:fiveFiveSR port map(x1=>in_x1, x2=>in_x2, x3=>in_x3,Aset=>in_aset, Areset=>in_arst, CLK=>CLK_in, z=>out_z);
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
  in_arst<= '1' after 180 ns, '0' after 190 ns;
  in_aset<= '0' after 190 ns, '1' after 200 ns;
end tb55SR_arch;

configuration cf_55SR of tb55SR is
  for tb55SR_arch
    for ifiveFiveSR:fiveFiveSR
      use entity WORK.fiveFiveSR (fiveFiveSR_arch);
    end for;
  end for;
end cf_55SR;
