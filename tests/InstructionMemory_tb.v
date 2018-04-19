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
# 10 adress<=1;
# 10 adress<=2;
# 10 adress<=3;
# 10 adress<=4;
# 10 adress<=5;
# 10 adress<=6;
# 10 adress<=7;
# 10 adress<=8;
# 10 adress<=9;
# 10 adress<=10;
# 10 adress<=11;
# 10 adress<=12;
# 10 adress<=13;

# 10 $finish;
end
endmodule