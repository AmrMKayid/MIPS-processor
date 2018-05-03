/*
 * Test bench for the forwarding unit 
 */


module forwardingUnit_tb();

	reg[4:0] ID_EX_rs, ID_EX_rt, EX_MEM_rd, MEM_WB_rd;
	reg MEM_WB_RegWrite, EX_MEM_RegWrite;
	wire[1:0] forwardA, forwardB;

	forwardingUnit fu(forwardA, forwardB, ID_EX_rs, ID_EX_rt, EX_MEM_rd, MEM_WB_rd, MEM_WB_RegWrite, EX_MEM_RegWrite);


	initial begin
		MEM_WB_RegWrite = 0;
		EX_MEM_RegWrite = 0;
	end



	initial
	begin

	$monitor("time:%d ForwardA: %b ForwardB: %b", $time, forwardA, forwardB);


	#5 ID_EX_rs = 5; 
	   EX_MEM_rd = 5;
	   EX_MEM_RegWrite = 1;

	#5 ID_EX_rt = 5; 
	   EX_MEM_rd = 5;
	   EX_MEM_RegWrite = 1;

	#5  MEM_WB_rd = 5;
	    MEM_WB_RegWrite = 1;	

	#5 EX_MEM_RegWrite = 0;

	#5 MEM_WB_RegWrite = 0;
	
	#5 $finish;
	end
endmodule


