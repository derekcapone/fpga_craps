library IEEE;
use IEEE.std_logic_1164.all;

entity craps is
--    port (	
--		enter : in std_logic;
--		reset : in std_logic;
--		win 	: out std_logic;
--		clk	: in std_logic;
--		val1, val2			: in std_logic_vector(3 downto 0); -- temp for roll --
--		lose	: out std_logic
--	);
	port(
		roll, sp, clk		: in std_logic;
		d7, d711, d2312	: out std_logic;
		out1, out2			: out std_logic_vector(3 downto 0);
		eq						: out std_logic
		);
end craps;

architecture structural of craps is

component controller is
	port(
		enter, reset, clk		: in std_logic;
		d7, d711, d2312, eq 	: in std_logic;
		roll, sp					: out std_logic;
		w, l 				: out std_logic
		);
end component;

component datapath is 
	port(
		roll, sp, clk		: in std_logic;
		d7, d711, d2312	: out std_logic;
		out1, out2			: out std_logic_vector(3 downto 0);
		eq						: out std_logic
		);
end component;

component counter is
	port(
		roll		: in std_logic;
		clk		: in std_logic;
		o_val		: out std_logic_vector(3 downto 0) := "0000"
		);
end component;

signal id7, id711, id2312 : std_logic;
signal ieq, isp, iroll : std_logic;

begin

--	-- instantiate the controller --
--	control : component controller port map(clk => clk, reset => reset, enter => enter, w => win, l => lose, d7 => id7, d711 => id711, d2312 => id2312, eq => ieq, roll => iroll, sp => isp);
	
	-- instantiate the datapath --
	data : component datapath port map(roll => roll, sp => sp, clk => clk, d7 => d7, d711 => d711, d2312 => d2312, eq => eq, out1 => out1, out2 => out2);

end structural;




