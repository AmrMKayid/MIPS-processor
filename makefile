##################################################################
#																 #
#			Make File for the Mips processor verilog			 #
#															     #
##################################################################



# Add the output Name here
EXEC = DataMemory

$(EXEC): makefile
	iverilog -o $(EXEC) $(EXEC).v tests/$(EXEC)_tb.v
# housekeeping
clean:
	rm -f $(EXEC) 

.PHONY: $(EXEC)