LIBRARY IEEE;

USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all ;
USE IEEE.numeric_std.all;
USE IEEE.std_logic_unsigned.all;

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
entity myNor is
port ( A, B : in std_logic;
Z : out std_logic);
end myNor;
architecture beh_nor of myNor is
begin -- beh_nor
Z <= A nor B;
end beh_nor;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
entity myInv is
port ( A: in std_logic;
Z : out std_logic);
end myInv;
architecture beh_inv of myInv is
begin -- beh_nor
Z <= not A;
end beh_inv;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity F813 is
port(
  x1, x2, x3, x4, x5:in std_logic;
  z:out std_logic
);
end F813;

architecture F813_arch of F813 is
	component myOr
	port(A,B:in std_logic; Z: out std_logic);
	end component;
	component myAnd
	port(A,B:in std_logic; Z: out std_logic);
	end component;
	component myNor
	port(A,B:in std_logic; Z: out std_logic);
	end component;
	component myInv
	port(a: in std_logic; Z: out std_logic);
	end component;

	signal c1, c2,c3,c4: std_logic;
	signal x1_bar: std_logic;
begin
	u1: myAnd port map (A=>x1, B=>x2, Z=>c1);
	u2: myOr port map(A=>x3, B=>x4, Z=>c2);
	invt: myInv port map (A=>x1, Z=>x1_bar);
	u3: myAnd port map(A=>x1_bar, B=>x5, Z=>c4);
	u4: myNor port map(A=>c1, B=>c2, Z=>c3);
	u5: myOr port map(A=>c3, B=>c4, Z=>z); 
end F813_arch;
