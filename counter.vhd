library IEEE;
use IEEE.std_logic_1164.all;

entity counter is
	port(
		roll		: in std_logic;
		clk		: in std_logic;
		i_val		: in std_logic_vector(3 downto 0);
		o_val		: out std_logic_vector(3 downto 0) := "0000"
		);
end counter;

architecture arch of counter is

signal prand : std_logic_vector(3 downto 0);

begin

	-- Handle rising edge of clock signal --
	process(clk)
	begin
		if(clk'event and clk='1') then
			if(roll = '1') then
				-- Use the pseudorandom counter here --
				prand <= i_val;
			end if;
		end if;
	end process;
	
	-- Handle falling edge of roll --
	process(roll)
	begin
		if(roll'event and roll='0') then
			o_val <= prand;
		end if;
	end process;

end arch;