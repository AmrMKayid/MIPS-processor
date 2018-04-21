`timescale 1ns / 1ps
//`include "Instruction_Mem.v"

module Instruction_Mem_tb();
reg clk;
reg [31:0] adress;
wire [31:0] instruction;
Instruction_Mem mem(instruction,adress,clk);

initial	begin
 clk	=	0;
forever	begin
#5	clk	=	~clk;
end
end
initial
begin
$monitor("%t  %d  %h	%b",	$time,adress,instruction,	clk);
adress<=0;
# 10 adress<=4;
# 10 adress<=8;
# 10 adress<=12;
# 10 adress<=16;
# 10 adress<=20;
# 10 adress<=24;
# 10 adress<=28;
# 10 adress<=32;
# 10 adress<=36;
# 10 adress<=40;
# 10 adress<=44;
# 10 adress<=48;
# 10 adress<=52;

# 10 $finish;
end
endmodule