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
		reset					: in std_logic;
		in_val				: in std_logic_vector(3 downto 0);
		d7, d711, d2312	: out std_logic
		);
end craps;

architecture structural of craps is

component test_logic is
	port(
		reset					: in std_logic;
		in_val				: in std_logic_vector(3 downto 0);
		d7, d711, d2312	: out std_logic
		);
end component;

begin

	comp : component test_logic port map(reset => reset, in_val => in_val, d7 => d7, d711 => d711, d2312 => d2312);

end structural;




