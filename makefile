##################################################################
#																 #
#			Make File for the Mips processor verilog			 #
#															     #
##################################################################



# Add the output Name here
EXEC = DataMemory Mux2way1 Mux2way32

COMMAND := for e in $(EXEC); do iverilog -o $$e $$e.v tests/$$e\_tb.v tests/assert.v; done

all: makefile
	@$(COMMAND)
# housekeeping
clean:
	rm -f $(EXEC) 

.PHONY: $(EXEC)