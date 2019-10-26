library IEEE;
use IEEE.std_logic_1164.all;

entity counter is
	port(
		roll		: in std_logic;
		i_val		: in std_logic_vector(3 downto 0);
		o_val		: out std_logic_vector(3 downto 0) := "0000"
		);
end counter;

architecture arch of counter is

begin

	process(roll)
	begin
		if(roll = '1') then
			o_val <= i_val;
		end if;
	end process;

end arch;