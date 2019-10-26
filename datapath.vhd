library IEEE;
use IEEE.std_logic_1164.all;

entity datapath is
	port(
		roll, sp				: in std_logic;
		val1, val2			: in std_logic_vector(3 downto 0); -- temp for roll --
		d7, d711, d2312	: out std_logic;
		eq						: out std_logic
		);
end datapath;

architecture arch of datapath is

-- define point register --
component point_reg is
	port(
		sp 		: in std_logic;
		point 	: in std_logic_vector(3 downto 0);
		npoint 	: out std_logic_vector(3 downto 0)
		);
end component;

-- define comparator --
component comparator is
	port(
		in1		: in std_logic_vector(3 downto 0);
		in2		: in std_logic_vector(3 downto 0);
		eq			: out std_logic
		);
end component;

-- define four bit adder --
component fouradder is
	port(
		ctrl  	: in std_logic;
		a	: in std_logic_vector(3 downto 0);
      b  : in std_logic_vector(3 downto 0);
		sum : out std_logic_vector(3 downto 0);
		cout : out std_logic
		);
end component;

-- define test logic --
component test_logic is
	port(
		reset			: in std_logic;
		in_val				: in std_logic_vector(3 downto 0);
		d7, d711, d2312	: out std_logic
		);
end component;

-- define test logic --
component counter is
	port(
		roll		: in std_logic;
		i_val		: in std_logic_vector(3 downto 0);
		o_val		: out std_logic_vector(3 downto 0) := "0000"
		);
end component;

signal c_out1, c_out2  	: std_logic_vector(3 downto 0);  -- output of dice --
signal add_out				: std_logic_vector(3 downto 0);  -- output of adder --
signal carry				: std_logic;
signal o_point				: std_logic_vector(3 downto 0);  -- output of point register --

begin

	-- instantiate counters -- 
	count1 : component counter port map(roll => roll, i_val => val1, o_val => c_out1);
	count2 : component counter port map(roll => roll, i_val => val2, o_val => c_out2);
	
	-- instantiate adder --
	adder : component fouradder port map(ctrl => '0', a => c_out1, b => c_out2, sum => add_out, cout => carry);
	
	-- instantiate point register --
	pr : component point_reg port map(sp => sp, point => add_out, npoint => o_point);
	
	-- instantiate comparator --
	comp : component comparator port map(in1 => add_out, in2 => o_point, eq => eq);
	
	-- instantiate test logic --
	tl : component test_logic port map(reset => '0', in_val => add_out, d7 => d7, d711 => d711, d2312 => d2312);

end arch;