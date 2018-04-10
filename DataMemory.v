/**
  * Data Memory (RAM)
  *
  * Output Ports: 
  * 	-data_out: 32 bit word referenced by the address
  *
  * Input ports: 
  * 	-data_in: 32 bit data to be written to a word referenced by the address
  *		-address: references a word in the memory
  *		-MemRead: signals it's a read operation
  *		-MemWrite: signals it's a write operation
  *
  */
module DataMemory(data_out, data_in, address, MemRead, MemWrite, Clk);
	output reg[31:0] data_out;
	input[31:0] data_in;
	input[31:0] address;
	input Clk;
	input MemRead;
	input MemWrite;
	
	reg[31:0] memory[63:0];


	always @(posedge Clk)
	begin 
		if(MemWrite)
		begin 
			memory[address] = data_in;
		end
	end

	always @(posedge MemRead or address)
		if(MemRead)
			data_out = memory[address];

endmodule