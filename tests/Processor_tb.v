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

# 300 $finish;
end




/*Display the values in the Processor components*/
always@(posedge clk)
begin
 $display("%d ",mips.pc);
 //$display("%h %h %h %b %h %h %h %h",mips.ALUroute,mips.out_Readdata2, mips.out_extended, mips.out_AlUsrc,mips.ReadData1, mips.ReadData2, mips.OutInstruction[25:21], mips.OutInstruction[20:16]);
// $display("outAluResult:%h",mips.outALUResult);
// $display("RF ReadData1:%d, ReadData2:%d, OutInstruction[25:21]:%h,OutInstruction[20:16]:%h, outWriteBackfinal:%h,outWBRegWrite:%b ,MemRoute:%d",
// 		mips.ReadData1,mips.ReadData2,mips.OutInstruction[25:21],mips.OutInstruction[20:16],mips.outWriteBackfinal,mips.outWBRegWrite,mips.MemRoute);
 	 // $display("ALUop:%h ,outWB:%b ,outMemtoReg:%b, outMR:%b ,out_MW:%b,out_RegDst:%b,outReadData2:%d",
 	 // 	mips.out_ALUop,mips.outWB,mips.outMemtoReg,mips.outMR,mips.outMW,mips.outWriteBack,mips.outReadData2);
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


endmodule