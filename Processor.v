/**
  * Processor Module
  *
  * single cycle MIPS processor module 
  *
  */

module Processor(clk);
	input clk;
	wire[31:0] pc,  instruction, ReadData1, ReadData2, ALUOut, SEOut, PCin0, PCin1, shl, ALUroute, MemRoute, PCRoute, DataMemoryOut;
	wire[3:0] ALUCtrlOut;
	wire[4:0] RdRoute;
	wire RegDst, RegWrite, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, ALUZero, LoadHalf,LoadHalfUnsigned;
	wire [2:0] ALUop;
	Adder PCadder0(PCin0, pc, 4);
	
	Adder PCadder1(PCin1, PCin0, shl);
	
	shiftLeft2 SHL2(shl, SEOut);
	
	Mux2way32 PCMux(PCRoute, PCin0, PCin1, PCsrc);
	
	ProgramCounter PC(pc, PCRoute, clk);
	
	InstructionMemory IM(instruction,PCRoute,clk);
	
	RegisterFile RF(ReadData1, ReadData2, instruction[25:21], instruction[20:16], RdRoute, MemRoute, RegWrite, clk);
	
	ALUControl ALUCtrl(ALUCtrlOut, ALUop, instruction[5:0]);
	
	ALU ALU(ALUOut, ALUZero, ALUCtrlOut, ReadData1, ALUroute,instruction[10:6]);   
	
	DataMemory DM(DataMemoryOut, ReadData2, ALUOut, MemRead, MemWrite,LoadHalf, LoadHalfUnsigned, clk);

	ControlUnit CU(LoadHalf,LoadHalfUnsigned, RegDst, RegWrite, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, ALUop, instruction[31:26]);
	
	and PCSrc(PCsrc, ALUZero, Branch);
	
	Mux2way5 InstructionMux(RdRoute, instruction[20:16], instruction[15:11], RegDst);

	Mux2way32 RegMux(ALUroute, ReadData2, SEOut, ALUSrc);

	Mux2way32 MemMux(MemRoute, ALUOut, DataMemoryOut, MemtoReg);

	SignExtend SE(SEOut, instruction[15:0]);



/*Display the values in the Processor components*/
always@(posedge clk)
begin
 $display("%d %h",pc,instruction);

  if(MemRead)
 begin
 	$display("Value:%d was read out of DataMemory",DataMemoryOut);
 end
  if(MemWrite)
  begin
  	$display("Value:%d was written in DataMemory",ReadData2);
  end
 if(RegWrite)
 begin
 	 case (RdRoute)
        8:$display("Value:%d was written in Register:$t0",MemRoute);
        9:$display("Value:%d was written in Register:$t1",MemRoute);
        10:$display("Value:%d was written in Register:$t2",MemRoute);
        11:$display("Value:%d was written in Register:$t3",MemRoute);
        12:$display("Value:%d was written in Register:$t4",MemRoute);
        13:$display("Value:%d was written in Register:$t5",MemRoute);
        14:$display("Value:%d was written in Register:$t6",MemRoute);
        15:$display("Value:%d was written in Register:$t7",MemRoute);
        16:$display("Value:%d was written in Register:$s0",MemRoute);
        17:$display("Value:%d was written in Register:$s1",MemRoute);
        18:$display("Value:%d was written in Register:$s2",MemRoute);
        19:$display("Value:%d was written in Register:$s3",MemRoute);
        20:$display("Value:%d was written in Register:$s4",MemRoute);
        21:$display("Value:%d was written in Register:$s5",MemRoute);
        22:$display("Value:%d was written in Register:$s6",MemRoute);
        23:$display("Value:%d was written in Register:$s7",MemRoute);
        default:$display("");
        endcase
 end

 end

	
endmodule