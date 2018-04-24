module EXMEM (clk, outWB, outM, outAddResult, outZero, outALUResult, outReadData2,outWriteBack, WB, M, addResult, zero, ALUResult, readData2,writeBack);   

    input  clk;
    input [31:0] addResult, ALUResult, readData2;
    input [31:0] writeBack;
    input WB,M, zero;
    output reg [31:0] outAddResult, outALUResult, outReadData2, outWriteBack;
    output reg outWB, outZero, outM;

    always @(posedge clk)
    begin
    outAddResult <= addResult;
    outALUResult <= ALUResult;
    outReadData2 <= readData2;
    outWriteBack <= writeBack;
    
    outWB <= WB;
    outZero <= zero;
    outM <= M;

end 
    
endmodule
