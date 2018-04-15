/**
  * Mux 4x1 routes 1 bit
  *
  * Output Ports: 
  * 	-data_out: 1 bit 
  *
  * Input ports: 
  * 	-a: 1 bit to be routed according to sel
  *		-b: 1 bit to be routed according to sel
  *		-c: 1 bit to be routed according to sel
  *		-d: 1 bit to be routed according to sel
  *		-sel: 1 bit signal to chose between a or b (0 selects a, 1 selects b)
  *
  * Built using three 2X1 Mux
  *
  */

module Mux2way1(data_out, a, b, c, d, sel);

	output data_out; 
	input a, b, c, d;
	input[1:0] sel;
	wire  w1, w2; // w1 = M1.data_out w2 = M2.data_out

	Mux2way1 M1(w1, a, b, sel[0])
	Mux2way1 M2(w2, c, d, sel[1])
	Mux2way1 M_out(data_out, w1, w2, sel[1])

endmodule