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
entity myNor is
port ( A, B, C: in std_logic;
Z : out std_logic);
end myNor;
architecture beh_nor of myNor is
begin -- beh_nor
Z <= (A nor B) nor C;
end beh_nor;

Library IEEE;
USE IEEE.Std_logic_1164.all;

entity DFFnoSR is 
   port(
      Q : out std_logic;    
      clk :in std_logic;   
      D :in  std_logic    
   );
end DFFnoSR;
architecture Behavioral of DFFnoSR is  
begin  
 process(clk)
 begin 
    if(rising_edge(clk)) then
   Q <= D; 
    end if;       
 end process;  
end Behavioral;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

entity fiveFivenoSetReset is
port(
  x1, x2, x3, CLK:in std_logic;
  z:out std_logic
);
end fiveFivenoSetReset;

architecture fiveFivenoSetReset_arch of fiveFivenoSetReset is
	component myOr
	port(A,B:in std_logic; Z: out std_logic);
	end component;
	component myNor
	port(A,B,C:in std_logic; Z: out std_logic);
	end component;
	component DFFnoSR
	port(D,clk:in std_logic; Q: out std_logic);
	end component;
	signal y1: std_logic;--c1=Y1=c2
	signal c1: std_logic;
begin
	u1: myNor port map (A=>x2, B=>x3, C=>y1, Z=>c1);
	u2: myOr port map(A=>x1, B=>c1, Z=>z);
	u3: DFFnoSR port map(D=>c1, clk=>CLK, Q=>y1);
end fiveFivenoSetReset_arch;
