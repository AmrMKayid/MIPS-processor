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

module ProgramCounter(IncPC, PrevPC, clk);

  output reg[31:0] IncPC;
  input [31:0] PrevPC;
  input clk;

  always @ ( posedge clk )
  begin
    IncPC <= PrevPC + 4;
  end

endmodule
