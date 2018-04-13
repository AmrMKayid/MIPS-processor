/**
  * Test for the 2x1 Mux 
  * Makes the Mux behaves as expected
  *
  */
module Mux2way1_tb();

	reg[1:0] in;
	reg sel; 
	wire out;
	initial begin
	in = 0;
	sel = 0;
	end
Mux2way1 m(out, in[0], in[1], sel);


	initial begin
		$monitor("time=%t",$time ,"  a=%d", in[0],"  b=%d", in[1],"  sel=%b", sel,  "", "  out:%d", out);
		repeat(4) begin
			repeat(2) begin
				#5 sel = sel + 1;
			end
		in = in + 1;
		end
		#10 $finish;
	end
endmodule