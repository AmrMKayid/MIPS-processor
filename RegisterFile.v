/**
  * Register File module
  *
  * Output Ports:
  *   - ReadData1: 32 bit registered output
  *   - ReadData2: 32 bit registered output
  *
  * Input ports:
  * 	- ReadReg1:  5-Bit address to select a register to be read
  *		- ReadReg2:  5-Bit address to select a register to be read
  *		- WriteReg:  5-Bit address to select a register to be written
  *		- WriteData: 32-Bit write input port
  *		- RegWrite:  1-Bit control input signal
  *
  */

module RegisterFile(ReadData1, ReadData2, ReadReg1, ReadReg2, WriteReg, WriteData, RegWrite, clk);

  output reg[31:0] ReadData1, ReadData2;
  input wire [4:0] ReadReg1, ReadReg2, WriteReg;
  input wire [31:0] WriteData;
  input wire RegWrite, clk;

  reg [31:0] Registers[31:0];

initial 
begin
    Registers[0] <= 32'h00000000;
    Registers[8] <= 32'h00000000;
    Registers[9] <= 32'h00000000;
    Registers[10] <= 32'h00000000;
    Registers[11] <= 32'h00000000;
    Registers[12] <= 32'h00000000;
    Registers[13] <= 32'h00000000;
    Registers[14] <= 32'h00000000;
    Registers[15] <= 32'h00000000;
    Registers[16] <= 32'h00000000;
    Registers[17] <= 32'h00000000;
    Registers[18] <= 32'h00000000;
    Registers[19] <= 32'h00000000;
    Registers[20] <= 32'h00000000;
    Registers[21] <= 32'h00000000;
    Registers[22] <= 32'h00000000;
    Registers[23] <= 32'h00000000;
    Registers[24] <= 32'h00000000;
    Registers[25] <= 32'h00000000;
  end
  always @ ( ReadReg1, ReadReg2 )
  begin
    ReadData1 <= (ReadReg1 == 0)? 32'b0 : Registers[ReadReg1];
    ReadData2 <= (ReadReg2 == 0)? 32'b0 : Registers[ReadReg2];
  end

  always @ ( posedge clk )
  begin
    if(RegWrite)
      begin
        Registers[WriteReg] <= WriteData;
        //$display("t0:%d",Registers[08] );
      end
  end

endmodule
