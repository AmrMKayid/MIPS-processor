/**
  * Mux 2x1 routes 5 bits
  *
  * Output Ports: 
  * 	-data_out: 5 bits 
  *
  * Input ports: 
  * 	-a: 16 bit to be routed according to sel
  *		-b: 16 bit to be routed according to sel
  *		-sel: 1 bit signal to chose between a or b (0 selects a, 1 selects b)
  *
  */

module Mux2way5(data_out, a, b, sel);

	output reg[4:0] data_out; 
	input wire[4:0] a, b;
	input wire sel;
	wire not_sel, w1, w2, w3, w4; // w1 = a.b; w2 = b.sel; w3 = a.not_sel; w4 = w1 + w2

	always@(a or b or sel)
	begin
		if(sel)
			data_out = b;
		else
			data_out = a;
	end

endmodule