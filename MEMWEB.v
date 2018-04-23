module MEMWEB (clk, readData, address, WB, outreadData, outWB, outAddress);   

    input  clk, readData, address, WB;
    output outReadData, outWB, outAddress;
    
    always @(posedge clk)
    outReadData = readData;
    outWB = WB;
    outAddress = address;
    end 
    
endmodule
