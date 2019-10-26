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
		roll, sp				: in std_logic;
		val1, val2			: in std_logic_vector(3 downto 0); -- temp for roll --
		d7, d711, d2312	: out std_logic;
		eq						: out std_logic
		);
end craps;

architecture structural of craps is

component datapath is
	port(
		roll, sp				: in std_logic;
		val1, val2			: in std_logic_vector(3 downto 0); -- temp for roll --
		d7, d711, d2312	: out std_logic;
		eq						: out std_logic
		);
end component;

begin

	d1 : component datapath port map(roll => roll, sp => sp, d7 => d7, d711 => d711, d2312 => d2312, eq => eq, val1 => val1, val2 => val2);

end structural;