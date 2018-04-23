module MEMWB (clk, readData, address, WB, writeBack, outreadData, outWB, outAddress, outWriteBack);   

    input  clk, readData, address, WB;
    output outReadData, outWB, outAddress;
    
    always @(posedge clk)
    outReadData = readData;
    outWB = WB;
    outAddress = address;
    outWriteBack = writeBack;

    end 
    
endmodule
