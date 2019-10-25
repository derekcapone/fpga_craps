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
		sp 		: in std_logic;
		point 	: in std_logic_vector(3 downto 0);
		npoint 	: out std_logic_vector(3 downto 0)
		);
end craps;

architecture structural of craps is

component point_reg
	port(
		sp 		: in std_logic;
		point 	: in std_logic_vector(3 downto 0);
		npoint 	: out std_logic_vector(3 downto 0)
		);
end component;

begin

	pr : component point_reg port map(sp => sp, point => point, npoint => npoint);

end structural;