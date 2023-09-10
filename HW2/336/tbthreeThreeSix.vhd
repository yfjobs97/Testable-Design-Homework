LIBRARY IEEE;

USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all ;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;

entity tb336 is
end tb336;

architecture tb336_arch of tb336 is
component threeThreeSix
port(
  x1, x2, x3, x4, x5, x6:in std_logic;
  z1, z2, z3, z4:out std_logic
);
end component;

signal in_x1, in_x2, in_x3, in_x4, in_x5, in_x6, out_z1, out_z2, out_z3, out_z4: std_logic := '0';
begin
  ithreeThreeSix:threeThreeSix port map(x1=>in_x1, x2=>in_x2, x3=>in_x3, x4=>in_x4, x5=>in_x5, x6=>in_x6, z1=>out_z1, z2=>out_z2, z3=>out_z3, z4=>out_z4);
  in_x1<='0', '1' after 160 ns;
  in_x2<='0', '1' after 80 ns, '0' after 160 ns, '1' after 240 ns; 
  in_x3<='0', '1' after 40 ns, '0' after 80 ns, '1' after 120 ns, '0' after 160 ns, 
	      '1' after 200 ns, '0' after 240 ns, '1' after 280 ns;
  in_x4<='0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns, '0' after 80 ns,
	      '1' after 100 ns, '0' after 120 ns, '1' after 140 ns, '0' after 160 ns,
	      '1' after 180 ns, '0' after 200 ns, '1' after 220 ns, '0' after 240 ns,
	      '1' after 260 ns, '0' after 280 ns, '1' after 300 ns;
  in_x5<='0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns, '0' after 60 ns, '1' after 70 ns, '0' after 80 ns, '1' after 90 ns,'0' after 100 ns,
	      '1' after 110 ns, '0' after 120 ns, '1' after 130 ns, '0' after 140 ns, '1' after 150 ns, '0' after 160 ns, '1' after 170 ns, '0' after 180 ns, '1' after 190 ns,'0' after 200 ns, 
	      '1' after 210 ns, '0' after 220 ns, '1' after 230 ns, '0' after 240 ns, '1' after 250 ns, '0' after 260 ns, '1' after 270 ns, '0' after 280 ns, '1' after 290 ns,'0' after 300 ns,
	      '1' after 310 ns;
  in_x6<='0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0' after 30 ns, '1' after 35 ns, '0' after 40 ns, '1' after 45 ns, '0' after 50 ns, '1' after 55 ns, '0' after 60 ns, '1' after 65 ns, '0' after 70 ns, '1' after 75 ns, '0' after 80 ns, '1' after 85 ns, '0' after 90 ns, '1' after 95 ns, '0' after 100 ns, 
	      '1' after 105 ns, '0' after 110 ns, '1' after 115 ns, '0' after 120 ns, '1' after 125 ns, '0' after 130 ns, '1' after 135 ns, '0' after 140 ns, '1' after 145 ns, '0' after 150 ns, '1' after 155 ns, '0' after 160 ns, '1' after 165 ns, '0' after 170 ns, '1' after 175 ns, '0' after 180 ns, '1' after 185 ns, '0' after 190 ns, '1' after 195 ns, '0' after 200 ns, 
	      '1' after 205 ns, '0' after 210 ns, '1' after 215 ns, '0' after 220 ns, '1' after 225 ns, '0' after 230 ns, '1' after 235 ns, '0' after 240 ns, '1' after 245 ns, '0' after 250 ns, '1' after 255 ns, '0' after 260 ns, '1' after 265 ns, '0' after 270 ns, '1' after 275 ns, '0' after 280 ns, '1' after 285 ns, '0' after 290 ns, '1' after 295 ns, '0' after 300 ns,
	      '1' after 305 ns, '0' after 310 ns, '1' after 315 ns;
end tb336_arch;

configuration cf_336 of tb336 is
  for tb336_arch
    for ithreeThreeSix:threeThreeSix
      use entity WORK.threeThreeSix (threeThreeSix_arch);
    end for;
  end for;
end cf_336;
