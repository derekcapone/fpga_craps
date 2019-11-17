library IEEE;
use IEEE.std_logic_1164.all;

entity craps is
    port (	
		enter : in std_logic;
		rst : in std_logic;
		win 	: out std_logic;
		clk	: in std_logic;
		out1, out2 : out std_logic_vector(3 downto 0);
		lose	: out std_logic;
		outsp : out std_logic
	);
end craps;

architecture structural of craps is

component controller is
	port(
		enter, reset, clk		: in std_logic;
		d7, d711, d2312, eq 	: in std_logic;
		roll					: out std_logic;
		sp					: out std_logic := '1';
		w, l 				: out std_logic
		);
end component;

component datapath is 
	port(
		roll, sp, clk		: in std_logic;
		rst					: in std_logic;
		d7, d711, d2312	: out std_logic;
		out1, out2			: out std_logic_vector(3 downto 0);
		eq						: out std_logic
		);
end component;

signal id7, id711, id2312 : std_logic;
signal ieq, isp, iroll : std_logic;

begin

	-- instantiate the controller --
	control : component controller port map(enter => enter, reset => rst, clk => clk, D7 => id7, D711 => id711, D2312 => id2312, Eq => ieq, w => win, l => lose, sp => isp, roll => iroll);
	
	-- instantiate the datapath --
	data : component datapath port map(roll => iroll, sp => isp, clk => clk, d7 => id7, d711 => id711, d2312 => id2312, out1 => out1, out2 => out2, eq => ieq, rst => rst);
	
	outsp <= isp;

end structural;




