/**
  * Program Counter module
  *
  * Output Ports:
  *   - IncPC:   32 bit incremented PC by 4
  *
  * Input ports:
  * 	- PrevPC:  32 bit previous PC
  *
  */

module ProgramCounter(NextPC, Address, clk);

  output reg[31:0] NextPC;
  input [31:0] Address;
  input clk;

  always @ ( posedge clk )
  begin
    NextPC <= Address;
  end

endmodule
