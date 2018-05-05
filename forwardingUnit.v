/* 
 * MIPS forwarding unit
 * Detects and handles Data hazards by ALU-ALU forwarding
 * 
 * Output: 
 * - ForwardA
 * - ForwardB
 *
 * Inputs:
 * - ID_EX_rs
 * - ID_EX_rt
 * - EX_MEM_rd
 * - MEM_WB_rd
 * - MEM_WB_RegWrite 
 *
 */


module forwardingUnit (forwardA, forwardB, ID_EX_rs, ID_EX_rt, EX_MEM_rd, MEM_WB_rd, MEM_WB_RegWrite, EX_MEM_RegWrite);

	output reg[1:0] forwardA, forwardB;
	input [4:0] ID_EX_rs, ID_EX_rt, EX_MEM_rd, MEM_WB_rd;
	input MEM_WB_RegWrite, EX_MEM_RegWrite;
	always @(ID_EX_rs or ID_EX_rt or EX_MEM_rd or MEM_WB_rd or MEM_WB_RegWrite or EX_MEM_RegWrite) begin
		
		if(EX_MEM_RegWrite && EX_MEM_rd != 0 && EX_MEM_rd == ID_EX_rs)
			forwardA = 2'b10;
		else if(MEM_WB_RegWrite && MEM_WB_rd != 0 && MEM_WB_rd == ID_EX_rs && 
				!(EX_MEM_RegWrite && EX_MEM_rd != ID_EX_rs && EX_MEM_rd != 0))
			forwardA = 2'b01;
		else
			forwardA = 2'b00;

		if(EX_MEM_RegWrite && EX_MEM_rd != 0 && EX_MEM_rd == ID_EX_rt)
			forwardB = 2'b10;
		
		else if(MEM_WB_RegWrite && MEM_WB_rd != 0 && MEM_WB_rd == ID_EX_rt && 
		  !(EX_MEM_RegWrite && EX_MEM_rd != ID_EX_rt && EX_MEM_rd != 0))
			forwardB = 2'b01;
		else
			forwardB = 2'b00;
		

	end
endmodule

