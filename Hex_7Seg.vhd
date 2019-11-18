library IEEE;
use  IEEE.STD_LOGIC_1164.all;

ENTITY Hex_7Seg IS
	PORT(hex_digit		: IN	STD_LOGIC_VECTOR(3 downto 0);
		 segment_0, segment_1, segment_2, segment_3, segment_4, 
		 segment_5, segment_6 : out STD_LOGIC);
END Hex_7Seg;

ARCHITECTURE rtl OF Hex_7Seg IS
	SIGNAL segment_data : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
PROCESS  (Hex_digit)
-- HEX to 7 Segment Decoder for 7 Segment LED Display
BEGIN
CASE Hex_digit IS

		-- 0 --
        WHEN "0000" =>
            segment_data <= "0000001";

		-- 1 --
		WHEN "0001" =>
            segment_data <= "1001111";
		
		-- 2 --
		WHEN "0010" =>
            segment_data <= "0010010";
		
		-- 3 --
		WHEN "0011" =>
            segment_data <= "0000110";
			
		-- 4 --
		WHEN "0100" =>
            segment_data <= "1001100";
			
		-- 5 --
		WHEN "0101" =>
            segment_data <= "0100100";
			
		-- 6 --
		WHEN "0110" =>
            segment_data <= "0100000";
			
		-- 7 --
		WHEN "0111" =>
            segment_data <= "0001111";
			
		-- 8 --
		WHEN "1000" =>
            segment_data <= "0000000";
			
		-- 9 --
		WHEN "1001" =>
            segment_data <= "0001100";
			
		-- A --
		WHEN "1010" =>
            segment_data <= "0001000";
			
		-- b --
		WHEN "1011" =>
            segment_data <= "1100000";
			
		-- C --
		WHEN "1100" =>
            segment_data <= "0110001";
			
		-- d --
		WHEN "1101" =>
            segment_data <= "1000010";
			
		-- E --
		WHEN "1110" =>
            segment_data <= "0110000";
			
		-- F --
		WHEN "1111" =>
            segment_data <= "0111000";
			
	   WHEN OTHERS =>
            segment_data <= "1000001";
END CASE;
END PROCESS;

-- extract segment data
segment_0 <= segment_data(6);
segment_1 <= segment_data(5);
segment_2 <= segment_data(4);
segment_3 <= segment_data(3);
segment_4 <= segment_data(2);
segment_5 <= segment_data(1);
segment_6 <= segment_data(0);

END rtl;
