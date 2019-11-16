library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lfsr is
    Port ( clk : in STD_LOGIC;
           outp : out STD_LOGIC_VECTOR (3 downto 0));
end lfsr;

architecture Behavioral of lfsr is

signal feedback : std_logic;
signal n_reg : std_logic_vector(3 downto 0):="0000";
signal out_reg : std_logic_vector(2 downto 0):="000";

begin

	feedback <= not (out_reg(1) xor out_reg(2));

	process (clk)
	begin
		 if (rising_edge(clk)) then
				out_reg <= (out_reg(1 downto 0) & feedback);
		 end if;
	end process;

	process(out_reg)
	begin
		if(out_reg = "000") then
			n_reg <= "0001";
		elsif(out_reg = "111") then
			n_reg <= "0110";
		else
			n_reg(3) <= '0';
			n_reg(2) <= out_reg(2);
			n_reg(1) <= out_reg(1);
			n_reg(0) <= out_reg(0);
		end if;
	end process;
		
	outp <= n_reg;

end Behavioral;