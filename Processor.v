/**
  * Processor Module
  *
  * single cycle MIPS processor module 
  *
  */

module Processor(clk);
	input clk;
    reg [31:0] count=0;
    reg [31:0] pcvalue;
	wire[31:0] pc,  instruction, ReadData1, ReadData2, ALUOut, SEOut, PCin0, PCin1, shl, ALUroute, MemRoute, PCRoute, DataMemoryOut;
	wire[3:0] ALUCtrlOut;
	wire[4:0] RdRoute;
	wire RegDst, RegWrite, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, ALUZero, LoadHalf,LoadHalfUnsigned;
	wire [1:0] ALUop;
always@(negedge clk)
begin
	if(count==0)
	begin
		 pcvalue=-4;
	end
	else begin
		pcvalue=pc;
	end
	count=count+1;
end
	Adder PCadder0(PCin0, pcvalue, 4);
	Adder PCadder1(PCin1, PCin0, shl);
	shiftLeft2 SHL2(shl, SEOut);
	Mux2way32 PCMux(PCRoute, PCin0, PCin1, PCsrc);
	ProgramCounter PC(pc, PCRoute, clk);
	InstructionMemory IM(instruction,pc,clk);
// always@(posedge clk)
// begin
// 	 $display("%d %h %b",pc,instruction,clk);
// end

	RegisterFile RF(ReadData1, ReadData2, instruction[25:21], instruction[20:16], RdRoute, MemRoute, RegWrite, clk);
 always@(posedge clk)
 begin
	 $display("%d %h %d",pc,instruction,MemRoute);
 end
	SignExtend SE(SEOut, instruction[15:0]);

	ALUControl ALUCtrl(ALUCtrlOut, ALUop, instruction[5:0]);
	ALU ALU(ALUOut, ALUZero, ALUCtrlOut, ReadData1, ALUroute);   
	
	DataMemory DM(DataMemoryOut, ReadData2, ALUOut, MemRead, MemWrite, clk);

	ControlUnit CU(LoadHalf,LoadHalfUnsigned, RegDst, RegWrite, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, ALUop, instruction[31:26]);
	
	and PCSrc(PCsrc, ALUZero, Branch);
	Mux2way5 InstructionMux(RdRoute, instruction[20:16], instruction[15:11], RegDst);

	Mux2way32 RegMux(ALUroute, ReadData2, SEOut, ALUSrc);

	Mux2way32 MemMux(MemRoute, ALUOut, DataMemoryOut, MemtoReg);



	
endmodule