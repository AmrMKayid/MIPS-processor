/**
  * Test for the 2x1 Mux 
  * Makes sure the Mux behaves as expected
  *
  */
module Mux2way16_tb();

	reg[31:0] in;
	reg sel; 
	wire[15:0] out;
	initial begin
	in = 0;
	sel = 0;
	end
Mux2way16 m(out[15:0], in[15:0], in[31:16], sel);


	initial begin
		$monitor("time=%t",$time ,"  a=%d", in[15:0],"  b=%d", in[31:16],"  sel=%b", sel,  "", "  out:%d", out);
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
		in[31:16] = in[31:16] + 1;
		end
		#200 $finish;
	end
endmodule