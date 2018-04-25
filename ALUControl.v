module ALUControl (out, ALUOp, FuncCode);

input wire [2:0] ALUOp;   
input wire [5:0] FuncCode;   
output reg [3:0] out;

    always @ (ALUOp or FuncCode)
    begin
        if (ALUOp == 3'b0)
        begin
            out<=2;        //ADD   
        end
        
        else if (ALUOp == 3'b001)
        begin 
            out<=6;        //sub   

        end
        else if( ALUOp==3'b011) //addi
        begin
            out<=2;
        end
        else if(ALUOp==3'b100) //andi
        begin
            out<=0;
        end
        else if(ALUOp==3'b101) //ori
        begin
            out<=1;
        end
        else
            begin
                case (FuncCode)
            
                    6'b100000: out<=2;        //ADD   
                    6'b100010: out<=6;        //sub   
                    6'b100100: out<=0;        //AND   
                    6'b100101: out<=1;        //OR   
                    6'b101010: out<=7;        //SLT signed  
                    6'b101011: out<=8;        //SLT unsigned
                    6'b000000: out<=9;        //SLL
                    6'b000010: out<=10;       //SRL
                    default: out<=0; // should not happen   
                endcase 
        end
end

endmodule
