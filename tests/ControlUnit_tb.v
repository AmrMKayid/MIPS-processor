/**
  * test for the control unit
  * Makes sure the control unit outputs the correct control signals on the given opcodes
  */


module ControlUnit_tb();

	reg [5:0] opcode;
	reg[9*8:0] string;
	wire[10:0] sig;



	ControlUnit cu(sig[9], sig[10], sig[8], sig[7], sig[6], sig[5], sig[4], sig[3], sig[2], sig[1:0], opcode);

	initial begin
	$monitor("time=%t",$time , " operation=%s", string[9*8:0], " RegDst:%b", sig[8], " RegWrite:%b", sig[7], " ALUSrc:%b", sig[6], " Branch:%d", sig[5], " MemRead:%b", sig[4], " MemWrite:%b", sig[3], " MemtoReg:%b", sig[2], "ALUop:%b", sig[1:0]);

	#0 opcode = 6'h00;
       string = "R Format";
    #5 opcode = 6'h23;
		string = "Lw";
	#5 opcode = 6'h2B;
		string = "SW";
    #5 opcode = 6'h04;
       string = "beq";
	#5 opcode = 6'h0D;
		string = "ori";
	#5 $finish;
	end


endmodule