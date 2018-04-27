/**
  * Processor Module
  *
  * single cycle MIPS processor module 
  *
  */

module Processor(clk);
	input clk;
	wire[31:0] pc,  instruction, ReadData1, ReadData2, ALUOut, SEOut, PCin0, PCin1, shl, ALUroute, MemRoute, PCRoute, DataMemoryOut,OutInstruction,OutPCin0,
	out_address,out_Readdata1,out_Readdata2,out_extended,outAddResult,outALUResult,outReadData2,outReadData,outAddress;
	wire[3:0] ALUCtrlOut;
	wire[4:0] RdRoute,out_Instruction15_11,out_Instruction20_16,outWriteBack,outWriteBackfinal,out_Instruction10_6;
	wire RegDst, RegWrite, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, ALUZero, LoadHalf,LoadHalfUnsigned;
	wire [2:0] ALUop,out_ALUop;
	wire  out_WB,out_MemtoReg,out_RegDst,out_AlUsrc,out_MR,out_MW,out_branch,out_LoadHalf,out_LoadHalfUnsigned,outWB,outMemtoReg, outMR,outMW,outbranch, outZero,
	outLoadHalf,outLoadHalfUnsigned,outWBRegWrite,outWBMemtoReg;
	Adder PCadder0(PCin0, pc, 4);
	
	Adder PCadder1(PCin1, out_address, shl);
	
	shiftLeft2 SHL2(shl, out_extended);
	
	Mux2way32 PCMux(PCRoute, PCin0, outAddResult, PCsrc);
	
	ProgramCounter PC(pc, PCRoute, clk);
	
	InstructionMemory IM(instruction,PCRoute,clk);
	
	IFID IFID(OutPCin0,OutInstruction,PCin0,instruction,clk);
	always @(OutInstruction) begin
	$display("instruction:%h was fetched",OutInstruction);
	end
	

	IDEX IDEX(out_LoadHalf,out_LoadHalfUnsigned,out_WB,out_MemtoReg,out_MR,out_MW,out_branch,out_RegDst,out_ALUop,out_AlUsrc,out_address,out_Readdata1,out_Readdata2,out_extended,out_Instruction20_16,
		out_Instruction15_11,out_Instruction10_6,RegWrite,MemtoReg,MemRead,MemWrite,Branch,RegDst,ALUop,ALUSrc,OutPCin0,
		ReadData1,ReadData2,SEOut,OutInstruction[20:16],OutInstruction[15:11],OutInstruction[10:6],LoadHalf,LoadHalfUnsigned,clk);

// always @(OutInstruction) begin
// 	$display("ALUop:%h ,out_WB:%b ,out_MemtoReg:%b, out_MR:%b ,out_MW:%b,out_AlUsrc:%b,out_RegDst:%b",out_ALUop,out_WB,out_MemtoReg,out_MR,out_MW,out_AlUsrc,out_RegDst);
// 	end

    EXMEM EXMEM (outLoadHalf,outLoadHalfUnsigned,outWB,outMemtoReg, outMR,outMW,outbranch, outAddResult, outZero, outALUResult, outReadData2,
    	outWriteBack, out_WB,out_MemtoReg, out_MR,out_MW,out_branch,PCin1, ALUZero, ALUOut, out_Readdata2,RdRoute,out_LoadHalf,out_LoadHalfUnsigned,clk);   
	
	// always @(OutInstruction) begin
	// $display("ALUop:%h ,out_WB:%b ,out_MemtoReg:%b, out_MR:%b ,out_MW:%b,out_RegDst:%b,outReadData2:%d",out_ALUop,outWB,outMemtoReg,outMR,outMW,outWriteBack,outReadData2);
	// end

	MEMWEB MEMWEB ( outReadData, outWBRegWrite,outWBMemtoReg, outAddress, outWriteBackfinal,DataMemoryOut, outALUResult, outWB,outMemtoReg,outWriteBack ,clk);


	RegisterFile RF(ReadData1, ReadData2, OutInstruction[25:21], OutInstruction[20:16], outWriteBackfinal, MemRoute, outWBRegWrite, clk);
	
	ALUControl ALUCtrl(ALUCtrlOut, out_ALUop, out_extended[5:0]);
	
	ALU ALU(ALUOut, ALUZero, ALUCtrlOut, out_Readdata1, ALUroute,out_Instruction10_6);   
	
	DataMemory DM(DataMemoryOut, outReadData2, outALUResult, outMR, outMW,outLoadHalf,outLoadHalfUnsigned, clk);

	ControlUnit CU(LoadHalf,LoadHalfUnsigned, RegDst, RegWrite, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, ALUop, OutInstruction[31:26]);
	
	and PCSrc(PCsrc, outZero, outbranch);
	
	Mux2way5 InstructionMux(RdRoute,out_Instruction20_16 , out_Instruction15_11,out_RegDst);

	Mux2way32 RegMux(ALUroute, out_Readdata2, out_extended, out_AlUsrc);

	Mux2way32 MemMux(MemRoute, outAddress, outReadData, outWBMemtoReg);

	SignExtend SE(SEOut, OutInstruction[15:0]);

	
endmodule