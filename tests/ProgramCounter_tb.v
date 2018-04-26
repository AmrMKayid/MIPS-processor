module ProgramCounter_tb ();

  wire [31:0] NextPC;
  reg [31:0] Address;
  reg clk;

  ProgramCounter PC(NextPC, Address, clk);

  initial begin
    clk = 0;
    Address = 0;
    forever begin
      #5 clk = ~clk;
    end
  end

  initial begin
    #10 $monitor("time=%t NextPC=%d Address=%d clk=%d", $time, NextPC, Address, clk);
    repeat(5) begin
      #10 Address <= Address + 4;
    end
    #10 $finish;
  end

endmodule
