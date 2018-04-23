`timescale 1ns / 1ps
 
module IDEX(out_WB,out_M,out_EX,out_address,out_Readdata1,out_Readdata2,out_extended,out_Instruction20_16,out_Instruction15_11,In_WB,In_M,In_EX,In_address,In_Readdata1,In_Readdata2,In_extended,In_Instruction20_16,In_Instruction15_11,clk);
input In_WB,In_M,In_EX,clk;
input [31:0] In_address,In_Readdata1,In_Readdata2,In_extended;
input [4:0] In_Instruction20_16,In_Instruction15_11;
output reg out_WB,out_M,out_EX;
output reg [4:0] out_Instruction15_11,out_Instruction20_16;
output reg [31:0] out_address,out_Readdata1,out_Readdata2,out_extended;

always @ (posedge clk)
begin
	out_WB<=In_WB;
	out_M<=In_M;
	out_EX<=In_EX;
	out_address<=In_address;
	out_Readdata1<=In_Readdata1;
	out_Readdata2<=In_Readdata2;
	out_extended<=In_extended;
	out_Instruction20_16<=In_Instruction20_16;
	out_Instruction15_11<=In_Instruction15_11;
end
endmodule