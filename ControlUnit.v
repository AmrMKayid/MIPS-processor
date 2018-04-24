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

module ControlUnit(LoadHalf,LoadHalfUnsigned,RegDst, RegWrite, ALUSrc, Branch, MemRead, MemWrite, MemtoReg, ALUop, OPCode);

	output reg RegDst, RegWrite, ALUSrc, Branch, MemRead, MemWrite, MemtoReg,LoadHalf,LoadHalfUnsigned;
	output reg[1:0] ALUop;
	input [5:0] OPCode;

	always@(OPCode) begin
		case(OPCode)
			6'h00:begin
			 RegDst <= 1; LoadHalf<=0; LoadHalfUnsigned<=0; RegWrite <= 1; ALUSrc <= 0; Branch <= 0; MemRead <= 0; MemWrite <= 0; MemtoReg <= 0; ALUop <= 2; /*R instructions*/
			end
			6'h08:begin 
			 RegDst <= 0; LoadHalf<=0; LoadHalfUnsigned<=0; RegWrite <= 1; ALUSrc <= 1; Branch <= 0; MemRead <= 0; MemWrite <= 0; MemtoReg <= 0; ALUop <= 2; /*Addi*/ 
			end
			6'h23:begin
			 RegDst <= 0; LoadHalf<=0; LoadHalfUnsigned<=0; RegWrite <= 1; ALUSrc <= 1; Branch <= 0; MemRead <= 1; MemWrite <= 0; MemtoReg <= 1; ALUop <= 0; /*lw*/ 
			end
			6'h2B:begin 
			 RegDst <= 0; LoadHalf<=0; LoadHalfUnsigned<=0; RegWrite <= 0; ALUSrc <= 1; Branch <= 0; MemRead <= 0; MemWrite <= 1; MemtoReg <= 0; ALUop <= 0; /*sw*/ 
			end
			6'h21:begin
			 RegDst <= 0; LoadHalf<=1; LoadHalfUnsigned<=0; RegWrite <= 1; ALUSrc <= 1; Branch <= 0; MemRead <= 1; MemWrite <= 0; MemtoReg <= 1; ALUop <= 0; /*lh*/ 
			end
			6'h25:begin
			 RegDst <= 0; LoadHalf<=0; LoadHalfUnsigned<=1; RegWrite <= 1; ALUSrc <= 1; Branch <= 0; MemRead <= 1; MemWrite <= 0; MemtoReg <= 1; ALUop <= 0; /*lhu*/
			end
			6'h0C:begin 
			 RegDst <= 0; LoadHalf<=0; LoadHalfUnsigned<=0; RegWrite <= 1; ALUSrc <= 1; Branch <= 0; MemRead <= 0; MemWrite <= 0; MemtoReg <= 0; ALUop <= 2; /*andi*/ 
			end
			6'h0D:begin
			 RegDst <= 0; LoadHalf<=0; LoadHalfUnsigned<=0; RegWrite <= 1; ALUSrc <= 1; Branch <= 0; MemRead <= 0; MemWrite <= 0; MemtoReg <= 0; ALUop <= 2; /*ori*/
			end
			6'h04:begin 
			 RegDst <= 0; LoadHalf<=0; LoadHalfUnsigned<=0; RegWrite <= 0; ALUSrc <= 0; Branch <= 1; MemRead <= 0; MemWrite <= 0; MemtoReg <= 0; ALUop <= 1; /*beq*/
			end
		endcase

	end


endmodule