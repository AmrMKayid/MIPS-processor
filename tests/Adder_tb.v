module Adder_tb();
    reg [31:0] input1;
    reg [31:0] input2;
    wire [31:0] out;

initial begin

#0 input1 = 32'b11111111111111111111111111111111;
#0 input2 = 32'b11111111111111111111111111111111;


end
 
adder ADD (input1, input2, out);
 
initial begin
$monitor("time=%t input1=%b input2=%b out=%b" , $time , input1, input2, out);
#5 input1 <= 32'b00;
#5 input2 <= 32'b01;
#5 input1 <= 32'b10;
#5 input2 <= 32'b11;
#5 input1 <= 32'b01;


#50 $finish;
end

endmodule
