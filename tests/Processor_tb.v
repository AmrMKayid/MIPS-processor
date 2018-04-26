	`timescale 1ns / 1ps

module Processor_tb();
reg clk;
reg [31:0] pc;

 Processor mips(clk);


initial	begin
 clk	=	0;
forever	begin
#5	clk	=	~clk;
end
end

initial
begin

# 250 $finish;
end




/*Display the values in the Processor components*/
always@(posedge clk)
begin
 $display("%d %h",mips.pc, mips.instruction);

  if(mips.MemRead)
 begin
 	$display("Value:%d was read out of DataMemory", mips.DataMemoryOut);
 end
  if(mips.MemWrite)
  begin
  	$display("Value:%d was written in DataMemory", mips.ReadData2);
  end
 if(mips.RegWrite)
 begin
 	 case (mips.RdRoute)
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


endmodule