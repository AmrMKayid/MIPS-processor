module EXMEM (outLoadHalf,outLoadHalfUnsigned,outWB,outMemtoReg, outMR,outMW,out_branch, outAddResult, outZero, outALUResult, outReadData2,outWriteBack, WB,
    inMemtoReg, MR,MW,branch, addResult, zero, ALUResult, readData2,writeBack,LoadHalf,LoadHalfUnsigned,clk);   

    input  clk;
    input wire [31:0] addResult, ALUResult, readData2;
    input wire [4:0] writeBack;
    input wire WB,MR,MW,branch, zero,inMemtoReg,LoadHalf,LoadHalfUnsigned;
    output reg [31:0] outAddResult, outALUResult, outReadData2;
    output reg [4:0] outWriteBack;
    output reg outWB,outMemtoReg, outZero, outMR,outMW,out_branch,outLoadHalf,outLoadHalfUnsigned;

    always @(posedge clk)
    begin
    outAddResult <= addResult;
    outALUResult <= ALUResult;
    outReadData2 <= readData2;
    outWriteBack <= writeBack;
    outMemtoReg<=inMemtoReg;
    outWB <= WB;
    outZero <= zero;
    outMR <= MR;
    outMW <=MW;
    out_branch<=branch;
    outLoadHalf<=LoadHalf;
    outLoadHalfUnsigned<=LoadHalfUnsigned;

end 
    
endmodule
