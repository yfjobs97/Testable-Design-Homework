LIBRARY IEEE;

USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all ;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;

entity myAnd is
port ( A, B : in std_logic;
Z : out std_logic);
end myAnd;
architecture beh_and of myAnd is
begin -- beh_and
Z <= A and B;
end beh_and;
--------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
entity myOr is
port ( A, B : in std_logic;
Z : out std_logic);
end myOr;
architecture beh_or of myOr is
begin -- beh_or
Z <= A or B;
end beh_or;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity threeThreeSix is
port(
  x1, x2, x3, x4, x5, x6:in std_logic;
  z1, z2, z3, z4:out std_logic
);
end threeThreeSix;

architecture threeThreeSix_arch of threeThreeSix is
	component myAnd
	port(A,B:in std_logic; Z: out std_logic);
	end component;
	component myOr
	port(A,B:in std_logic; Z: out std_logic);
	end component;
	signal c4: std_logic;
	signal c5: std_logic;
	signal c6: std_logic;
	signal c10: std_logic;
	signal c11: std_logic;	
	signal c12: std_logic;
begin
	u1: myAnd port map(A=>x1, B=>x3, Z=>c4);--c4=z1
	u2: myAnd port map(A=>x2, B=>x3, Z=>c5);
	u3: myAnd port map(A=>x3, B=>x5, Z=>c6);
	u4: myAnd port map(A=>c4, B=>c5, Z=>c10);
	u5: myAnd port map(A=>x4, B=>c6, Z=>c11);--c11=z3
	u6: myOr port map(A=>c6, B=>x6, Z=>c12);
	u7: myAnd port map(A=>c10, B=>c11, Z=>z2);
	u8: myAnd port map(A=>c11, B=>c12, Z=>z4);
	  
	z1<=c4;
	z3<=c11;
end threeThreeSix_arch;
