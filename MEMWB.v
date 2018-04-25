module MEMWEB (clk, readData, address, WB, writeBack, outReadData, outWB, outAddress, outWriteBack);   

    input  clk;
    input wire [31:0] readData, address;
    input wire [31:0] writeBack;
    input wire WB;
    output reg [31:0] outReadData, outAddress, outWriteBack;
    output reg outWB;

    always @(posedge clk)
    begin
    outReadData <= readData;
    outWB <= WB;
    outAddress <= address;
    outWriteBack <= writeBack;
    end 
    
endmodule
