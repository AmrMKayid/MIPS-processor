module shiftLeft2(shifted, sign_extended);
    input wire clk;
    input wire [31:0] sign_extended;
    output reg [31:0] shifted;
    
    always @ (sign_extended)
    begin
    shifted <= sign_extended << 2;
    end

endmodule


