`timescale 1ns / 1ps
 
module Instruction_Mem(instruction,address,clk);
input clk;
input [31:0] address;
output reg [31:0] instruction;
reg [31:0] memory[0:16];
reg [31:0] helper;
initial
begin
$readmemh("instructions.txt",memory);
end
always @ (posedge clk)
begin
instruction<= memory[address];
end
endmodule