`timescale 1ns / 1ps
 
module IFID(out_address,out_instruction,In_address,In_instruction,clk);
input clk;
input wire [31:0] In_address;
input wire [31:0] In_instruction;
output reg [31:0] out_address;
output reg [31:0] out_instruction;
always @ (posedge clk)
begin
	out_address<=In_address;
	out_instruction<=In_instruction;
end
endmodule