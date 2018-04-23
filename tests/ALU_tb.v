module ALU_tb();
reg [3:0] ALUControl;
reg [31:0] Data1,Data2;
wire [31:0] out;
wire zero;
initial begin

#0 ALUControl = 4'b0000;
#0 Data1 = 32'b0;
#0 Data2 = 32'b0;



end
 
ALU alu (out,zero, ALUControl, Data1, Data2);
 
initial begin
$monitor("ALUControl=%d $Data1=%b  $Data2=%b  out=%b" , ALUControl, Data1, Data2 , out);
#5  ALUControl = 4'b0000;
#5  Data1 = 32'b1;
#5  Data2 = 32'b1;
#5 ALUControl <= 4'b0001;
#5 ALUControl <= 4'b0010;
#5 ALUControl <= 4'b0110;
#5 ALUControl <= 4'b0111;
#5 ALUControl <= 4'b1100;


#50 $finish;
end

endmodule
