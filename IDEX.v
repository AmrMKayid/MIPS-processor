`timescale 1ns / 1ps
 
module IDEX(out_LoadHalf,out_LoadHalfUnsigned,out_WB,out_MemtoReg,out_MR,out_MW,out_branch,out_RegDst,out_ALUop,out_AlUsrc,out_address,out_Readdata1,out_Readdata2,out_extended,out_Instruction20_16,
	out_Instruction15_11,out_Instruction10_6,In_WB,In_MemtoReg,In_MR,In_MW,In_branch,In_RegDst,
	In_ALUop,In_ALUsrc,In_address,In_Readdata1,In_Readdata2,In_extended,In_Instruction20_16,In_Instruction15_11,In_Instruction10_6,LoadHalf,LoadHalfUnsigned,clk);

input wire In_WB,In_MR,In_MW,In_branch,In_RegDst,In_ALUsrc,In_MemtoReg,LoadHalf,LoadHalfUnsigned,clk;
input wire [2:0] In_ALUop;
input wire [31:0] In_address,In_Readdata1,In_Readdata2,In_extended;
input wire [4:0] In_Instruction20_16,In_Instruction15_11,In_Instruction10_6;
output reg out_WB,out_RegDst,out_AlUsrc,out_MR,out_MW,out_branch,out_MemtoReg,out_LoadHalf,out_LoadHalfUnsigned;
output reg [4:0] out_Instruction15_11,out_Instruction20_16,out_Instruction10_6;
output reg [31:0] out_address,out_Readdata1,out_Readdata2,out_extended;
output reg [2:0] out_ALUop;
always @ (posedge clk)
begin
	out_WB<=In_WB;
	out_MR<=In_MR;
	out_MW<=In_MW;
	out_branch<=In_branch;
	out_RegDst<=In_RegDst;
	out_ALUop<=In_ALUop;
	out_AlUsrc<=In_ALUsrc;
	out_address<=In_address;
	out_Readdata1<=In_Readdata1;
	out_Readdata2<=In_Readdata2;
	out_extended<=In_extended;
	out_Instruction20_16<=In_Instruction20_16;
	out_Instruction15_11<=In_Instruction15_11;
	out_MemtoReg<=In_MemtoReg;
	out_LoadHalf<=LoadHalf;
	out_LoadHalfUnsigned<=LoadHalfUnsigned;
	out_Instruction10_6<=In_Instruction10_6;
end
endmodule