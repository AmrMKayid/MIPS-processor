`timescale 1ns / 1ps
 
module InstructionMemory(instruction,address,clk);
input clk;
input wire [31:0] address;
output reg [31:0] instruction;
reg [7:0] memory[0:64];
reg [31:0] helper;
initial
begin
$readmemh("addtrial.txt",memory);
end
always @ (posedge clk)
begin

instruction[31:24]<=memory[address];
instruction[23:16]<=memory[address+1'b1];
instruction[15:8]<=memory[address+2'b10];
instruction[7:0]<=memory[address+2'b11];


end
endmodule