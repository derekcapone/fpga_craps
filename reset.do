force -freeze sim:/craps/clk 0
force -freeze sim:/craps/enter 0
force -freeze sim:/craps/rst 1
run 20000

force -freeze sim:/craps/clk 1
force -freeze sim:/craps/enter 0
force -freeze sim:/craps/rst 1
run 20000

force -freeze sim:/craps/clk 0
force -freeze sim:/craps/enter 0
force -freeze sim:/craps/rst 1
run 20000

force -freeze sim:/craps/clk 1
force -freeze sim:/craps/enter 0
force -freeze sim:/craps/rst 1
run 20000

