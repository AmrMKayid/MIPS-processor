/**
  * Mux 2x1 routes 1 bit
  *
  * Output Ports: 
  * 	-data_out: 1 bit 
  *
  * Input ports: 
  * 	-a: 1 bit to be routed according to sel
  *		-b: 1 bit to be routed according to sel
  *		-sel: 1 bit signal to chose between a or b (0 selects a, 1 selects b)
  *
  */

module Mux2way1(data_out, a, b, sel);

	output data_out; 
	input wire a, b, sel;
	wire not_sel, w1, w2, w3, w4; // w1 = a.b; w2 = b.sel; w3 = a.not_sel; w4 = w1 + w2

	not(not_sel, sel);
	and(w1, a, b);
	and(w2, b, sel);
	and(w3, a, not_sel);
	or(w4, w1, w2);
	or(data_out, w4, w3);

endmodule