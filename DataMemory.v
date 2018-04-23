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
	
	reg[7:0] memory[63:0];


	always @(posedge Clk)
	begin 
		if(MemWrite)
		begin 
			memory[address] = data_in & 32'hFF;
			memory[address + 1] = (data_in >> 8) & 32'hFF;
			memory[address + 2] = (data_in >> 16) & 32'hFF;
			memory[address + 3] = (data_in >> 24) & 32'hFF;
		end
	end

	always @(posedge MemRead or address)
		if(MemRead) begin
			data_out[7:0] = memory[address];
			data_out[15:8] = memory[address + 1];
			data_out[23:16] = memory[address + 2];
			data_out[31:24] =memory[address + 3];
		end

endmodule