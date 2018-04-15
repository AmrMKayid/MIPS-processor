/**
  * Mux 4x1 routes 32 bit
  *
  * Output Ports: 
  * 	-data_out: 32 bit 
  *
  * Input ports: 
  * 	-a: 32 bit to be routed according to sel
  *		-b: 32 bit to be routed according to sel
  *		-c: 32 bit to be routed according to sel
  *		-d: 32 bit to be routed according to sel
  *		-sel: 2 bit signal to chose between a or b (00 selects a, 01 selects b, 10 selects c, 11 selects d)
  *
  * Built using three 2X1 Mux
  *
  */

module Mux4way32(data_out, a, b, c, d, sel);

	output[31:0] data_out; 
	input[31:0] a, b, c, d;
	input[1:0] sel;
	wire[31:0]  w1, w2; // w1 = M1.data_out w2 = M2.data_out

	Mux2way32 M1(w1[31:0], a[31:0], b[31:0], sel[0]);
	Mux2way32 M2(w2[31:0], c[31:0], d[31:0], sel[1]);
	Mux2way32 M_out(data_out[31:0], w1[31:0], w2[31:0], sel[1]);

endmodule