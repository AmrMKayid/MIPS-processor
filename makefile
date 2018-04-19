##################################################################
#																 #
#			Make File for the Mips processor verilog			 #
#															     #
##################################################################



# !!!! Add the SRC file path to this list !!!!
SRCS = DataMemory.v Mux2way1.v Mux2way32.v Mux4way1.v Mux4way32.v SignExtend.v ControlUnit.v Adder.v InstructionMemory.v ProgramCounter.v RegisterFile.v shiftLeft2.v

# Automatically generates list of objects
EXEC = $(SRCS:.v=)

COMMAND := for e in $(EXEC); do iverilog -o $$e $(SRCS) tests/$$e\_tb.v tests/assert.v; done

all: makefile
	@$(COMMAND)
# housekeeping
clean:
	rm -f $(EXEC) 

.PHONY: $(EXEC)