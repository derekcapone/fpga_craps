library IEEE;
use  IEEE.STD_LOGIC_1164.all;

entity adder is
	port(
		a : in std_logic;
		b : in std_logic;
		cin : in std_logic;
		output : out std_logic;
		cout : out std_logic
		);
end adder;

architecture rtl of adder is

	signal xor1 : std_logic;
	signal and1 : std_logic;
	signal and2 : std_logic;
	
begin

	xor1 <= a xor b;
	and1 <= a and b;
	output <= cin xor xor1;
	and2 <= cin and xor1;
	cout <= and2 or and1;

end rtl;

