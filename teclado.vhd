library IEEE;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity teclado is
port ( fila   : in  std_logic_vector  (0 to 3);
       clk    : in  std_logic ;
		 led    : out std_logic ;
		 columna: out std_logic_vector (0 to 3);
		 Q      : out std_logic_vector (0 to 6)
);
end entity;

architecture arq of teclado is

 type estado is (A, B, C, D) ;
 signal presente, prox : estado ; 
 signal dato : std_logic ;
 signal Qn   : integer range 0 to 15 := 0 ;
 signal F    : integer range 0 to 15 := 0 ;
 
 constant Max_count:integer:= 100_000;  
 signal count:integer range 0 to max_count;
 signal clk_s:Std_LOGIC := '0' ;

begin

 process (clk,clk_s, count)
 begin 
  if (clk'event and clk = '1') then 	
	 if count < max_count then 
	   count<=count+1;
	 else
		clk_s <= not clk_s ;
		count<=0;
	 end if;
	end if;
 end process;

 process (clk_s) 
 begin 
	if (rising_edge(clk_s)) then 
	  presente <= prox ;
	end if;
 end process;
 
 process (presente, fila)
 begin
 
   case (presente) is
	
	when A => columna <= "1000";
	   if (fila = "1000") then 
		  F <= 1 ;             --1
		  dato <= '1';
		  prox <= A ;
		elsif (fila = "0100") then 
		  F <= 4 ;             --4
		  dato <= '1';
		  prox <= A ;
		elsif (fila = "0010") then 
		  F <= 7 ;             --7
		  dato <= '1';
		  prox <= A ;
		elsif (fila = "0001") then 
		  F <= 14 ;             --*
		  dato <= '1';
		  prox <= A ;
		else
		  dato <= '0';
		  prox <= B;
		end if;
		
	when B => columna <= "0100";
	   if (fila = "1000") then 
		  F <= 2 ;             --2
		  dato <= '1';
		  prox <= B ;
		elsif (fila = "0100") then 
		  F <= 5 ;             --5
		  dato <= '1';
		  prox <= B ;
		elsif (fila = "0010") then 
		  F <= 8 ;             --8
		  dato <= '1';
		  prox <= B ;
		elsif (fila = "0001") then 
		  F <= 0 ;             --0
		  dato <= '1';
		  prox <= B ;
		else
		  dato <= '0';
		  prox <= C;
		end if;
		
	when C => columna <= "0010";
	   if (fila = "1000") then 
		  F <= 3 ;             --3
		  dato <= '1';
		  prox <= C ;
		elsif (fila = "0100") then 
		  F <= 6 ;             --6
		  dato <= '1';
		  prox <= C ;
		elsif (fila = "0010") then 
		  F <= 9 ;             --9
		  dato <= '1';
		  prox <= C ;
		elsif (fila = "0001") then 
		  F <= 15 ;            --#
		  dato <= '1';
		  prox <= C ;
		else
		  dato <= '0';
		  prox <= D;
		end if;
		
	when D => columna <= "0001";
	   if (fila = "1000") then 
		  F <= 10 ;             --a
		  dato <= '1';
		  prox <= D ;
		elsif (fila = "0100") then 
		  F <= 11 ;             --b
		  dato <= '1';
		  prox <= D ;
		elsif (fila = "0010") then 
		  F <= 12 ;             --c
		  dato <= '1';
		  prox <= D ;
		elsif (fila = "0001") then 
		  F <= 13 ;             --d
		  dato <= '1';
		  prox <= D ;
		else
		  dato <= '0';
		  prox <= A;
		end if;
	end case;
 end process;
 
 process (clk_s)
 begin 
   if (dato = '0') then 
	  Qn <= Qn ;
	elsif (rising_edge(clk_s)) then
	  Qn <= F ;
	end if;
 end process;
 
 led <= dato ;
 
 Q   <=  NOT "1111110" when Qn = 0  else
         NOT "0110000" when Qn = 1  else
	      NOT "1101101" when Qn = 2  else
         NOT "1111001" when Qn = 3  else
         NOT "0110011" when Qn = 4  else
	      NOT "1011011" when Qn = 5  else
	      NOT "1011111" when Qn = 6  else
	      NOT "1110000" when Qn = 7  else
	      NOT "1111111" when Qn = 8  else
	      NOT "1111011" when Qn = 9  else
		   NOT "0011101" when Qn = 10 else
		   NOT "0011111" when Qn = 11 else
		   NOT "0001101" when Qn = 12 else
		   NOT "0111101" when Qn = 13 else
		   NOT "1100011" when Qn = 14 else
		   NOT "0110111" ;
 
end architecture;
		  
		  
		  
		  
		  

 