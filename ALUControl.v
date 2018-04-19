module ALUControl (ALUOp, FuncCode, out);

input [1:0] ALUOp;   
input [5:0] FuncCode;   
output reg [3:0] out;

    always @ (ALUOp or FuncCode)
    begin
        if (ALUOp == 2'b0)
        begin
            out<=2;        //ADD   
        end
        
        else if (ALUOp == 2'b01)
        begin 
            out<=6;        //sub   

        end
        
        else
            begin
                case (FuncCode)
            
                    6'b100000: out<=2;        //ADD   
                    6'b100010: out<=6;        //sub   
                    6'b100100: out<=0;        //AND   
                    6'b100101: out<=1;        //OR   
                    6'b100111: out<=12;       //NOR   
                    6'b101010: out<=7;        //SLT   
                
                    default: out<=0; // should not happen   
                endcase 
        end
end

endmodule
