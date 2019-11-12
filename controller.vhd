library IEEE;
use IEEE.std_logic_1164.all;

entity controller is
	port(
		enter, reset 			: in std_logic;
		d7, d711, d2312, eq 	: in std_logic;
		roll, sp					: out std_logic;
		w, l 				: out std_logic
		);
end controller;

architecture structural of controller is

type state_types is (START, WIN, LOSE, STORE);
signal state_present : state_types := START;

begin

	process(enter)
	begin	
		if(reset='1') then
			state_present <= START;
			w <= '0';
			l <= '0';
		elsif(enter'event and enter='1') then
			
			case state_present is
				when START =>
					sp <= '1';
					if(d2312='1') then
						state_present <= LOSE;
						l <= '1';
					elsif(d711='1') then
						state_present <= WIN;
						w <= '1';
					else
						state_present <= STORE;
					end if;
				when WIN =>
					w <= '1';
					if(reset='1') then
						state_present <= START;
						
					
					
					
			end case;
		
		
		end if;
	end process;

end structural;
