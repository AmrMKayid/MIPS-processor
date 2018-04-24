/**
  * Test for the 4x1 Mux 
  * Makes sure the Mux behaves as expected
  *
  */
module Mux4way1_tb();

	reg[3:0] in;
	reg[1:0] sel; 
	wire out;
	initial begin
	in = 0;
	sel = 0;
	end
Mux4way1 m(out, in[0], in[1], in[2], in[3], sel[1:0]);


	initial begin
		$monitor("time=%t",$time ,"  a=%d", in[0],"  b=%d", in[1], " c=%d", in[2], " d=%d", in[3], " sel=%d", sel[1:0],  "   out:%d", out);
		repeat(16) begin
			repeat(4) begin
				#5 sel = sel + 1;
			end
		in = in + 1;
		end
		#10 $finish;
	end
endmodule