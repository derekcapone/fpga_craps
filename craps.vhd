library IEEE;
use IEEE.std_logic_1164.all;

entity craps is
--    port (	
--		enter : in std_logic;
--		reset : in std_logic;
--		win 	: out std_logic;
--		lose	: out std_logic
--	);
	port(
		enter, reset, clk		: in std_logic;
		d7, d711, d2312, eq 	: in std_logic;
		roll, sp					: out std_logic;
		w, l 				: out std_logic
		);
end craps;

architecture structural of craps is

component controller is
	port(
		enter, reset, clk		: in std_logic;
		d7, d711, d2312, eq 	: in std_logic;
		roll, sp					: out std_logic;
		w, l 				: out std_logic
		);
end component;

begin

	cont : component controller port map(enter => enter, reset => reset, clk => clk, d711 => d711, d2312 => d2312, eq => eq, roll => roll, sp => sp, w => w, l => l, d7 => d7);

end structural;




