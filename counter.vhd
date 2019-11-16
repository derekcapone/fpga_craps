library IEEE;
use IEEE.std_logic_1164.all;

entity counter is
	port(
		roll		: in std_logic;
		clk		: in std_logic;
		o_val		: out std_logic_vector(3 downto 0) := "0000"
		);
end counter;

architecture arch of counter is

component lfsr is
    Port ( clk : in STD_LOGIC;
           outp : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal prand : std_logic_vector(3 downto 0);

begin
	
	rand_reg : component lfsr port map(clk => clk, outp => prand);
	
	-- Handle falling edge of roll --
	process(roll)
	begin
		if(roll'event and roll='0') then
			o_val <= prand;
		end if;
	end process;

end arch;