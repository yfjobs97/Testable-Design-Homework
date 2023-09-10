LIBRARY IEEE;

USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all ;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;

entity Myor2 is
port(
  a,b : in std_logic;
  c : out std_logic);
end Myor2;

architecture or2_arch of Myor2 is
begin
  c <= a or b;
end or2_arch;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity xor2 is
port(
  a,b : in std_logic;
  c: out std_logic);
end xor2;

architecture xor2_arch of xor2 is
begin
  c <= a xor b;
end xor2_arch;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity threeTwoThree is
port(
  x1, x2:in std_logic;
  z:out std_logic
);
end threeTwoThree;

architecture threeTwoThree_arch of threeTwoThree is
	component Myor2
	port(a,b:in std_logic; c: out std_logic);
	end component;
	component xor2
	port(a,b:in std_logic; c: out std_logic);
	end component;
	signal c8: std_logic;
	signal c9: std_logic;
begin
	u1: Myor2 port map (a=>x1, b=>x2, c=>c8);
	u2: xor2 port map(a=>x1, b=>x2, c=>c9);
	u3: xor2 port map(a=>c8, b=>c9, c=>z);
end threeTwoThree_arch;
