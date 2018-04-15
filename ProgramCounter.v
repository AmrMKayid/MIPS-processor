/**
  * Program Counter module
  *
  * Output Ports:
  *   - IncPC:  32 bit registered output
  *
  * Input ports:
  * 	- PrevPC:  5-Bit address to select a register to be read
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
