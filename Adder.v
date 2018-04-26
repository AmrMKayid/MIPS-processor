// Code your design here
module Adder(out, input1, input2);
    input wire [31:0] input1;
    input wire [31:0] input2;
    output reg [31:0] out;
    always @ (input1 or input2)
    begin
    out <= input1 + input2;
    end

endmodule


