`timescale 1ns / 1ps
 
module Instruction_Mem(instruction,address,clk);
input clk;
input [31:0] address;
output reg [31:0] instruction;
reg [7:0] memory[0:64];
reg [31:0] helper;
initial
begin
$readmemh("instructions.txt",memory);
end
always @ (posedge clk)
begin
// helper=address;
// instruction= (instruction|memory[helper])<<6;
// helper=address+1'b1;
// instruction= (instruction|memory[helper])<<4;
// helper=address+1'b1;
// instruction= (instruction|memory[helper])<<2;
// helper=address+1'b1;
// instruction= (instruction|memory[helper]);

instruction[31:24]<=memory[address];
instruction[23:16]<=memory[address+1'b1];
instruction[15:8]<=memory[address+2'b10];
instruction[7:0]<=memory[address+2'b11];


end
endmodule