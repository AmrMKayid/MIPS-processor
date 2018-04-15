/**
  * Test for the sign Extend
  * Makes sure the sign extends yields correct numbers
  *
  */

module SignExtend_tb();

	reg [15:0] in;
	wire[31:0] out;
	SignExtend s(out[31:0], in[15:0]);

	initial begin
		#0 in = 0;
	end	


	initial begin
		$monitor("time=%t",$time , " in=%b", in[15:0], " out:%b", out[31:0]);
		#5 in = 5;
		#5 in = 12312;
		#5 in = -123;
		#5 in = -345;
		#5 in = -1;
		#5 in = 3; 


		#35 $finish;
	end
endmodule 