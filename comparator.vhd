library IEEE;
use IEEE.std_logic_1164.all;

entity comparator is
	port(
		clk		: in std_logic;
		in1		: in std_logic_vector(3 downto 0);
		in2		: in std_logic_vector(3 downto 0);
		eq			: out std_logic
		);
end comparator;

architecture arch of comparator is

begin

	process(clk)
	begin
		if (in1 = in2) then
			eq <= '1';
		else
			eq <= '0';
		end if;
	end process;

end arch;