module RegisterFile_tb ();

  wire reg[31:0] ReadData1, ReadData2;
  reg [4:0] ReadReg1, ReadReg2, WriteReg;
  reg [31:0] WriteData;
  reg RegWrite, clk;

  RegisterFile rF(ReadData1, ReadData2, ReadReg1, ReadReg2, WriteReg, WriteData, RegWrite, clk);

  initial begin
    clk = 0;
    forever begin
      #5 clk = ~clk;
    end
  end

  initial begin
    $monitor("%t %b %b %b", $time, ReadData1, ReadData2, clk);
    #5 ReadReg1 <= 2'b0;
    #5 WriteReg <= 2'b01;
    RegWrite <= 1;
    WriteData <= 32'd37;
    #15 RegWrite = 0;
    #5 ReadReg2 <= 2'b1;
    #100 $finish;

  end

endmodule
