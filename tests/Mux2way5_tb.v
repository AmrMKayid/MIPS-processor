/**
  * Test for the 2x1 Mux 
  * Makes sure the Mux behaves as expected
  *
  */
module Mux2way5_tb();

	reg[9:0] in;
	reg sel; 
	wire[4:0] out;
	initial begin
	in = 0;
	sel = 0;
	end
Mux2way5 m(out[4:0], in[4:0], in[9:5], sel);


	initial begin
		$monitor("time=%t",$time ,"  a=%d", in[5:0],"  b=%d", in[9:5],"  sel=%b", sel,  "", "  out:%d", out);
		repeat(16) begin
			repeat(2) begin
				#5 sel = sel + 1;
			end
		in = in + 1;
		end
		repeat(16) begin
			repeat(2) begin
				#5 sel = sel + 1;
			end
		in[9:5] = in[9:5] + 1;
		end
		#200 $finish;
	end
endmodule