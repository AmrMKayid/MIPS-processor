/**
  * Test for the 4x1 Mux 
  * Makes sure the Mux behaves as expected
  *
  */
module Mux4way32_tb();

	reg[127:0] in;
	reg sel; 
	wire[31:0] out;
	initial begin
	in = 0;
	sel = 0;
	end
Mux2way32 m(out[31:0], in[31:0], in[63:32], sel);


	initial begin
		$monitor("time=%t",$time ,"  a=%d", in[31:0],"  b=%d", in[63:32], " c=%d", in[95:64], " d=%d", in[127:96], "  sel=%b", sel,   "  out:%d", out);
		repeat(16) begin
			repeat(4) begin
				#5 sel = sel + 1;
			end
		in = in + 1;
		end
		repeat(16) begin
			repeat(4) begin
				#5 sel = sel + 1;
			end
		in[63:32] = in[63:32] + 1;
		end
		repeat(16) begin
			repeat(4) begin
				#5 sel = sel + 1;
			end
		in[95:64] = in[95:64] + 1;
		end
		#200 $finish;
		repeat(16) begin
			repeat(4) begin
				#5 sel = sel + 1;
			end
		in[127:96] = in[127:96] + 1;
		end
		#200 $finish;
	end
endmodule