/**
  * The control unit of a MIPS processor 
  * Input: Opcode of the instruction
  * 
  * Nine single-bit singals: 
  * 1) RegDst
  * 2) RegWrite
  * 3) ALUSrc
  * 4) PCsrc
  * 5) MemRead
  * 6) MemWrite
  * 7) MemtoReg
  * 8) ALU op
  * 9) ALU op
  */

module ControlUnit(RegDst, RegWrite, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, ALUop, OPCode);

	output reg RegDst, RegWrite, ALUSrc, Branch, MemRead, MemWrite, MemtoReg;
	output reg[1:0] ALUop;
	input [5:0] OPCode;

	always@(OPCode) begin
		case(OPCode)
		6'b000000: RegDst <= 1; RegWrite <= 1; ALUSrc <= 0; Branch <= 0; MemRead <= 0; MemWrite <= 0; MemtoReg <= 0; ALUop <= 2;
		endcase

	end


endmodule