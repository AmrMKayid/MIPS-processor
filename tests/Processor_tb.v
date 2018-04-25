	`timescale 1ns / 1ps

module Processor_tb();
reg clk;
reg [31:0] pc;

 Processor mips(clk);


initial	begin
 clk	=	0;
forever	begin
#5	clk	=	~clk;
end
end

initial
begin

# 120 $finish;
end
endmodule