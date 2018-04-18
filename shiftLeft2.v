module shiftLeft2(sign_extended, shifted);
    input clk;
    input [31:0] sign_extended;
    output reg [31:0] shifted;
    
    always @ (sign_extended)
    begin
    shifted <= sign_extended << 2;
    end

endmodule


module test();
reg [31:0] sign_extended;
wire [31:0] shifted;

initial begin

#0 sign_extended = 11111111111111111111111111111111;


end
 
shiftLeft2 SL (sign_extended, shifted);
 
initial begin
$monitor("time=%t shifted=%b" , $time , shifted);
#5 sign_extended <= 32'b11111111111111110111111111111111;
#5 sign_extended <= 32'b11111111111111111011111111111111;
#5 sign_extended <= 32'b11111111111111111101111111111111;
#5 sign_extended <= 32'b11111111111111110110111111111111;
#5 sign_extended <= 32'b11111111111111110111101111111111;


#50 $finish;
end

endmodule
