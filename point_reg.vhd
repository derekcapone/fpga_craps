library IEEE;
use IEEE.std_logic_1164.all;

entity point_reg is
	port(
		sp 		: in std_logic;
		rst		: in std_logic;
		point 	: in std_logic_vector(3 downto 0);
		npoint 	: out std_logic_vector(3 downto 0)
		);
end point_reg;

architecture arch of point_reg is

begin
	
	process(sp, rst)
	begin
		if(sp'event and sp='0') then
			npoint <= point;
		end if;
	end process;

end arch;