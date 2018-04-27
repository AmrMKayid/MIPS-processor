module MEMWEB ( outReadData, outWBRegWrite,outWBMemtoReg, outAddress, outWriteBackfinal,readData, address, WB,memtoreg, writeBack,clk);   

    input  clk;
    input wire [31:0] readData, address;
    input wire [4:0] writeBack;
    input wire WB,memtoreg;
    output reg [31:0] outReadData, outAddress;
    output reg [4:0]  outWriteBackfinal;
    output reg outWBRegWrite,outWBMemtoReg;

    always @(posedge clk)
    begin
    outReadData <= readData;
    outWBRegWrite <= WB;
    outAddress <= address;
    outWBMemtoReg<=memtoreg;
    outWriteBackfinal <= writeBack;
    end 
    
endmodule
