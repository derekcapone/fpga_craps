library IEEE;
use IEEE.std_logic_1164.all;

entity controller is
	port(
	enter: in std_logic;
	rst:	in	std_logic;
	clk:	in	std_logic;
	
	D7, D711, D2312: in std_logic;
	Eq: in std_logic;
	
	win:	out std_logic;
	lose: out std_logic;
	
	sp: out std_logic := '1';
	roll: out std_logic;
	
	is0, is1, is2: out std_logic
	);
end controller;

architecture behavioral of controller is

type state_types is (S0, S1, S2, SW, SL);
signal state_reg, state_next : state_types;
signal other1: std_logic;
signal other2: std_logic;

signal i : integer := 0; -- loop variable


begin

process(clk, rst)
begin
	if(rst = '1') then
		state_reg <= S0;
	elsif(clk'event and clk = '1') then
		state_reg <= state_next;
	end if;
end process;

process(enter, state_reg)
begin
	case state_reg is
		when S0 =>
			if (enter = '1') then
				state_next <= S1;
			else
				state_next <= S0;
			end if;
		when S1 =>
			if (enter = '1' and i > 2) then
				state_next <= S2;
			elsif (D711 = '1') then
				state_next <= SW;
			elsif (D2312 = '1') then
				state_next <= SL;
			else
				state_next <= S1;
			end if;
		when S2 =>
			if (Eq = '1') then
				state_next <= SW;
			elsif (D7 = '1') then
				state_next <= SL;
			else
				state_next <= S2;
			end if;
		-- do we need when SW and SL where they just keep setting state_reg to itself?
		when SW =>
			state_next <= SW;
		when SL =>
			state_next <= SL;
	end case;
end process;

with state_reg select
	sp	<= '1' when S1,
			'0' when others;

with state_reg select
	win <= '1' when SW,
			'0' when others;
			
with state_reg select
	lose <= '1' when SL,
			'0' when others;
			
with state_reg select
	is0 <= '1' when S0,
			'0' when others;
with state_reg select
	is1 <= '1' when S1,
			'0' when others;
with state_reg select
	is2 <= '1' when S2,
			'0' when others;

roll <= enter;

process(enter)
begin
if (enter'event and enter = '1') then
	i <= i + 1;
end if;
end process;

end architecture;