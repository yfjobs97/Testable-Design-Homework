LIBRARY IEEE;

USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all ;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;

entity myNand is
port ( A, B : in std_logic;
Z : out std_logic);
end myNand;
architecture beh_nand of myNand is
begin -- beh_nand
Z <= A nand B;
end beh_nand;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity threeTwoEight is
port(
  x1, x2, x3, x4:in std_logic;
  z:out std_logic
);
end threeTwoEight;

architecture threeTwoEight_arch of threeTwoEight is
	component myNand
	port(A,B:in std_logic; Z: out std_logic);
	end component;

	signal c5: std_logic;
	signal c4: std_logic;
	signal c1: std_logic;
begin
	u1: myNand port map(A=>x2, B=>x3, Z=>c1);
	u2: myNand port map(A=>x1, B=>c1, Z=>c5);
	u3: myNand port map(A=>c1, B=>x4, Z=>c4);
	u4: myNand port map(A=>c5, B=>c4, Z=>z);
end threeTwoEight_arch;
