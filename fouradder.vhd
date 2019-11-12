library IEEE;
use  IEEE.STD_LOGIC_1164.all;

entity fouradder is
	port(
		ctrl  	: in std_logic;
		a	: in std_logic_vector(3 downto 0);
      b  : in std_logic_vector(3 downto 0);
		sum: out std_logic_vector(3 downto 0);
		cout : out std_logic
		);
end fouradder;

architecture rtl of fouradder is

component adder 
	port(
		a : in std_logic;
		b : in std_logic;
		cin : in std_logic;
		output : out std_logic;
		cout : out std_logic
		);
end component;

signal int_cout : std_logic_vector(2 downto 0);

begin

	adder0 : component adder port map (cin => ctrl, a => a(0), b => b(0), output => sum(0), cout => int_cout(0));
	adder1 : component adder port map (cin => int_cout(0), a => a(1), b => b(1), output => sum(1), cout => int_cout(1));
	adder2 : component adder port map (cin => int_cout(1), a => a(2), b => b(2), output => sum(2), cout => int_cout(2));
	adder3 : component adder port map (cin => int_cout(2), a => a(3), b => b(3), output => sum(3), cout => cout);

end rtl;
