/**
  * ALU module
  *
  * output:
  * out: the result of the operation
  * Zero: 1 (if data1 - data1 == 0)
  *
  * input: 
  * ALU Control: the opcode of the ALU operation
  * Data1: the first input 
  * Data2: the second input
  *
  * ALU control table
  * 0000 AND
  * 0001 OR
  * 0010 add
  * 0110 subtract
  * 0111 slt
  * 1100 NOR
  *
  */


module ALU (out, zero, ALUControl, Data1, Data2,shiftvalue);   

    input wire [3:0] ALUControl;
    input wire [4:0] shiftvalue;
    input wire [31:0] Data1,Data2;
	output reg zero;
    output reg [31:0] out;
    always @(ALUControl, Data1, Data2)

    begin 
        case (ALUControl)
    
            4'b0000: out <= Data1 & Data2;            //and
            4'b0001: out <= Data1 | Data2;            //or
    
            4'b0010: out <= Data1 + Data2;            //add
            4'b0110: out <= Data1 - Data2;            //subtract
    
            4'b0111: out <= $signed(Data1) < $signed(Data2) ? 1 : 0;    //slt signed
            4'b1000: out <= Data1 < Data2 ? 1 : 0; //slt unsigned
            4'b1001: out <= Data2 <<shiftvalue;             //sll    
            4'b1010: out <= Data2 >>shiftvalue;             //srl
            default: out <= 0;   
        endcase    
		zero = (Data2 - Data1 == 0);
    end 
    
endmodule
