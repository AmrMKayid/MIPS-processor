	`timescale 1ns / 1ps

module Processor_tb();
reg finish,clk;
reg [31:0] pc;

 Processor mips(finish,clk);

initial	begin
 clk	=	0;
forever	begin
#5	clk	=	~clk;
end
end

initial
begin
     mips.RF.Registers[0] <= 32'h00000000;
     mips.RF.Registers[8] <= 32'h00000000;
     mips.RF.Registers[9] <= 32'h00000000;
     mips.RF.Registers[10] <= 32'h00000000;
     mips.RF.Registers[11] <= 32'h00000000;
     mips.RF.Registers[12] <= 32'h00000000;
     mips.RF.Registers[13] <= 32'h00000000;
     mips.RF.Registers[14] <= 32'h00000000;
     mips.RF.Registers[15] <= 32'h00000000;
     mips.RF.Registers[16] <= 32'h00000000;
     mips.RF.Registers[17] <= 32'h00000000;
     mips.RF.Registers[18] <= 32'h00000000;
     mips.RF.Registers[19] <= 32'h00000000;
     mips.RF.Registers[20] <= 32'h00000000;
     mips.RF.Registers[21] <= 32'h00000000;
     mips.RF.Registers[22] <= 32'h00000000;
     mips.RF.Registers[23] <= 32'h00000000;
     mips.RF.Registers[24] <= 32'h00000000;
     mips.RF.Registers[25] <= 32'h00000000;
     mips.DM.memory[0] <= 8'h0;
     mips.DM.memory[1] <= 8'h0;
     mips.DM.memory[2] <= 8'h0;
     mips.DM.memory[3] <= 8'h0;
     mips.DM.memory[4] <= 8'h0;
     mips.DM.memory[5] <= 8'h0;
     mips.DM.memory[6] <= 8'h0;
     mips.DM.memory[7] <= 8'h0;
     mips.DM.memory[8] <= 8'h0;
     mips.DM.memory[9] <= 8'h0;
     mips.DM.memory[10] <= 8'h0;
     mips.DM.memory[11] <= 8'h0;
     mips.DM.memory[12] <= 8'h0;
     mips.DM.memory[13] <= 8'h0;
     mips.DM.memory[14] <= 8'h0;
     mips.DM.memory[15] <= 8'h0;
     mips.DM.memory[16] <= 8'h0;
     mips.DM.memory[17] <= 8'h0;
     mips.DM.memory[18] <= 8'h0;
     mips.DM.memory[19] <= 8'h0;
     mips.DM.memory[20] <= 8'h0;
     mips.DM.memory[21] <= 8'h0;
     mips.DM.memory[22] <= 8'h0;
     mips.DM.memory[23] <= 8'h0;
     mips.DM.memory[24] <= 8'h0;
     mips.DM.memory[25] <= 8'h0;
# 400 finish<=1;
# 10 $finish;

end




/*Display the values in the Processor components*/
always@(posedge clk)
begin
if(finish)
begin
	 begin
           $display("Final Register File");
           $display("Value:%d is in Register:$0",mips.RF.Registers[0]);
           $display("Value:%d is in Register:$t0",mips.RF.Registers[8]);
           $display("Value:%d is in Register:$t1",mips.RF.Registers[9]);
           $display("Value:%d is in Register:$t2",mips.RF.Registers[10]);
           $display("Value:%d is in Register:$t3",mips.RF.Registers[11]);
           $display("Value:%d is in Register:$t4",mips.RF.Registers[12]);
           $display("Value:%d is in Register:$t5",mips.RF.Registers[13]);
           $display("Value:%d is in Register:$t6",mips.RF.Registers[14]);
           $display("Value:%d is in Register:$t7",mips.RF.Registers[15]);
           $display("Value:%d is in Register:$s0",mips.RF.Registers[16]);
           $display("Value:%d is in Register:$s1",mips.RF.Registers[17]);
           $display("Value:%d is in Register:$s2",mips.RF.Registers[18]);
           $display("Value:%d is in Register:$s3",mips.RF.Registers[19]);
           $display("Value:%d is in Register:$s4",mips.RF.Registers[20]);
           $display("Value:%d is in Register:$s5",mips.RF.Registers[21]);
           $display("Value:%d is in Register:$s6",mips.RF.Registers[22]);
           $display("Value:%d is in Register:$s7",mips.RF.Registers[23]);

           $display("Final DataMemory");
           $display("Value:%h is in Address 0",mips.DM.memory[0]);
           $display("Value:%h is in Address 1",mips.DM.memory[1]);
           $display("Value:%h is in Address 2",mips.DM.memory[2]);
           $display("Value:%h is in Address 3",mips.DM.memory[3]);
           $display("Value:%h is in Address 4",mips.DM.memory[4]);
           $display("Value:%h is in Address 5",mips.DM.memory[5]);
           $display("Value:%h is in Address 6",mips.DM.memory[6]);
           $display("Value:%h is in Address 7",mips.DM.memory[7]);
           $display("Value:%h is in Address 8",mips.DM.memory[8]);
           $display("Value:%h is in Address 9",mips.DM.memory[9]);
           $display("Value:%h is in Address 10",mips.DM.memory[10]);
           $display("Value:%h is in Address 11",mips.DM.memory[11]);
           $display("Value:%h is in Address 12",mips.DM.memory[12]);
           $display("Value:%h is in Address 13",mips.DM.memory[13]);
           $display("Value:%h is in Address 14",mips.DM.memory[14]);
           $display("Value:%h is in Address 15",mips.DM.memory[15]);
           $display("Value:%h is in Address 16",mips.DM.memory[16]);
           $display("Value:%h is in Address 17",mips.DM.memory[17]);
           $display("Value:%h is in Address 18",mips.DM.memory[18]);
           $display("Value:%h is in Address 19",mips.DM.memory[19]);
           $display("Value:%h is in Address 20",mips.DM.memory[20]);
           $display("Value:%h is in Address 21",mips.DM.memory[21]);
           $display("Value:%h is in Address 22",mips.DM.memory[22]);
           $display("Value:%h is in Address 23",mips.DM.memory[23]);
           $display("Value:%h is in Address 24",mips.DM.memory[24]);
          

end
end
else begin
	
 $display("%d ",mips.pc);
 $display("instruction:%h was fetched",mips.OutInstruction);
 
  if(mips.outMR)
 begin
 	$display("Value:%d was read out of DataMemory", mips.DataMemoryOut);
 end
  if(mips.outMW)
  begin
  	$display("Value:%d was written in DataMemory", mips.outReadData2);
  end
 if(mips.outWBRegWrite )
 begin
 	 case (mips.outWriteBackfinal)
        8:$display("Value:%d was written in Register:$t0",mips.MemRoute);
        9:$display("Value:%d was written in Register:$t1",mips.MemRoute);
        10:$display("Value:%d was written in Register:$t2",mips.MemRoute);
        11:$display("Value:%d was written in Register:$t3",mips.MemRoute);
        12:$display("Value:%d was written in Register:$t4",mips.MemRoute);
        13:$display("Value:%d was written in Register:$t5",mips.MemRoute);
        14:$display("Value:%d was written in Register:$t6",mips.MemRoute);
        15:$display("Value:%d was written in Register:$t7",mips.MemRoute);
        16:$display("Value:%d was written in Register:$s0",mips.MemRoute);
        17:$display("Value:%d was written in Register:$s1",mips.MemRoute);
        18:$display("Value:%d was written in Register:$s2",mips.MemRoute);
        19:$display("Value:%d was written in Register:$s3",mips.MemRoute);
        20:$display("Value:%d was written in Register:$s4",mips.MemRoute);
        21:$display("Value:%d was written in Register:$s5",mips.MemRoute);
        22:$display("Value:%d was written in Register:$s6",mips.MemRoute);
        23:$display("Value:%d was written in Register:$s7",mips.MemRoute);
        default:$display("");
        endcase
 end
end
 end
endmodule