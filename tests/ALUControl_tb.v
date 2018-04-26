module ALUControl_tb();

wire[3:0] out;

reg[2:0] ALUOp;

reg[5:0] FuncCode;

ALUControl aluControl (out, ALUOp, FuncCode);
 
initial begin
$monitor("time=%t ALUOp=%d FuncCode=%b out=%b", $time , ALUOp, FuncCode, out);

//                    6'b100000        //ADD   
  //                  6'b100010        //sub   
    //                6'b100100        //AND   
      //              6'b100101        //OR   
        //            6'b100111        //NOR   
          //          6'b101010        //SLT
                    
#5 ALUOp <= 2'b01;
FuncCode = 6'b010100;

#5 ALUOp <= 2'b10; //ADD
FuncCode = 6'b100000;

#5 ALUOp <= 2'b10; //sub
FuncCode = 6'b100010;

#5 ALUOp <= 2'b10; //AND
FuncCode = 6'b100100;

#5 ALUOp <= 2'b10; //OR
FuncCode = 6'b100101;

#5 ALUOp <= 2'b10; //NOR
FuncCode = 6'b100111;

#5 ALUOp <= 2'b10; //SLT
FuncCode = 6'b101010;


#50 $finish;
end

endmodule
