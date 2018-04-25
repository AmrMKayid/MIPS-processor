/**
  * Sign Extends module 
  *
  * Extends the sign of a 16 bit number to a 32 bit number accroding the MSB
  *
  */

module SignExtend(out, in);
	output reg[31:0] out;
	input wire [15:0] in;

	always@(in) begin
		out[15:0] = in[15:0];
		if(in[15])
			out[31:16] = 16'hFFFF;
		else
			out[31:16] = 16'h0000;
	end

endmodule