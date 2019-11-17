library IEEE;
use IEEE.std_logic_1164.all;

entity controller is
	port(
		enter, reset, clk		: in std_logic;
		rst						: in std_logic;
		d7, d711, d2312, eq 	: in std_logic;
		roll					: out std_logic;
		sp					: out std_logic := '1';
		w, l 				: out std_logic
		);
end controller;

architecture structural of controller is

type state_types is (BEG, A, ROUND, B, LOSE, WIN);
signal current_state : state_types := BEG;
signal num_roll, follow : integer := 0;

begin

	process(clk, enter)
	begin
		if(clk'event and clk='1') then
			roll <= '1';
			case current_state is
				when BEG =>
					if(num_roll > follow) then
						current_state <= A;
						roll <= '0';	--indicate to datapath to begin calculation--
						follow <= num_roll;
					end if;
				when A =>
					if(d711 = '1') then
						current_state <= WIN;
						w <= '1';
					elsif(d2312 = '1') then
						current_state <= LOSE;
						l <= '1';
					else
						current_state <= ROUND;
					end if;
				when ROUND =>
					sp <= '0';
					if(num_roll > follow) then
						roll <= '0';
						current_state <= B;
						follow <= num_roll;
					end if;
				when B =>
					if(eq = '1') then
						current_state <= WIN;
						w <= '1';
					elsif(d7 = '1') then
						current_state <= LOSE;
						l <= '1';
					else
						current_state <= ROUND;
					end if;
				when WIN =>
					if(reset='1') then
						sp <= '1';
						w <= '0';
						current_state <= BEG;
					end if;
				when LOSE =>
					if(reset='1') then
						sp <= '1';
						l <= '0';
						current_state <= BEG;
					end if;
			end case;
		end if;
	end process;
	
	process(enter)
	begin
		if(enter'event and enter='0') then
			num_roll <= num_roll + 1;
		end if;
	end process;
	

end structural;