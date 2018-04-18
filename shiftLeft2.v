module shiftLeft2(clk, sign_extended, shifted);
    input clk;
    input [31:0] sign_extended;
    output reg [31:0] shifted;
    
    always @ (posedge clk)
    begin
    shifted <= sign_extended << 2;
    end

endmodule


module test();
reg [31:0] sign_extended;
reg clk;
wire [31:0] shifted;

initial begin
clk = 0;
forever begin
#5 clk = ~clk;
end
end
 
shiftLeft2 SL (clk, sign_extended, shifted);
 
initial begin
$monitor("time=%t shifted=%b clk=%b" , $time , shifted, clk);
#5 sign_extended <= 32'b11111111111111111111111111111111;
#5 sign_extended <= 32'b11111111111111111111111111111111;
#5 sign_extended <= 32'b11111111111111111111111111111111;
#5 sign_extended <= 32'b11111111111111111111111111111111;
#5 sign_extended <= 32'b11111111111111111111111111111111;



#5 $finish;
end

endmodule
