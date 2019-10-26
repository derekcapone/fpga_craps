library IEEE;
use  IEEE.STD_LOGIC_1164.all;

entity test_logic is
	port(
		clk, reset			: in std_logic;
		in_val				: in std_logic_vector(3 downto 0);
		d7, d711, d2312	: out std_logic
		);
end test_logic;

architecture rtl of test_logic is

begin

	process(clk, reset)
	begin
		if (reset='1') then
			d7 <= '0';
			d711 <= '0';
			d2312 <= '0';
		elsif (clk'event and clk='1') then
			if(in_val = "0111") then
				d7 <= '1';
				d711 <= '1';
				d2312 <= '0';
			elsif(in_val = "1011") then
				d7 <= '0';
				d711 <= '1';
				d2312 <= '0';
			elsif(in_val = "0010") or (in_val = "0011") or (in_val = "1100") then
				d7 <= '0';
				d711 <= '0';
				d2312 <= '1';
			else
				d7 <= '0';
				d711 <= '0';
				d2312 <= '0';
			end if;
		end if;
	end process;

end rtl;
