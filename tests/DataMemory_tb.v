/**
  * Test for the Data Memory
  * Writes some data to random locations in the memory and then tries to read them 
  *
  */


module DataMemory_tb();
	wire[31:0] data_out;
	reg[31:0] data_in;
	reg[31:0] address;
	reg Clk;
	reg MemRead;
	reg MemWrite;

	initial 
	begin
			Clk = 0;
		forever begin
			#5 Clk = ~ Clk;
		end
	end


	DataMemory dm(data_out, data_in, address, MemRead, MemWrite, Clk);

	initial 	
	begin 
		$monitor("time=%t",$time ,"  In=%d", data_in,"  out=%d", data_out,"  clk=%b", Clk, "  Address:%d", address);
 		
		#10 MemWrite = 1;
		#0 address = 50;
		#0 data_in = 1200;

		#10 address = 63;
		#0 data_in = 5400;

		#15 address = 40;
		#0 data_in = 400;

		
		#5 MemWrite = 0;
 
		#5 MemRead = 1;		

		#5 address = 50;


		#5 address = 63;

		#5 address = 40;

		
		#5 address = 50;


		#5 $finish;
	end
endmodule 