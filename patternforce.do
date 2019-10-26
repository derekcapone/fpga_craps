force -freeze sim:/craps/roll 0
force -freeze sim:/craps/val1 0001
force -freeze sim:/craps/val2 0001
run 20000

force -freeze sim:/craps/roll 1
force -freeze sim:/craps/val1 0001
force -freeze sim:/craps/val2 0010
run 20000
