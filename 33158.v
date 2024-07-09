module hmacqueue(clk, write, read, in, out, available, full);
	parameter elementWidth = 8;
	parameter elementCount = 128;
	parameter depth = 256;
	input clk;
	input write;
	input read;
	input [(elementWidth-1):0] in[0:(elementCount-1)];
	output [(elementWidth-1):0] out[0:(elementCount-1)];
	output available;
	output full;
	function integer log2(input integer v);
		begin log2=0;
		while(v>>log2)
			log2=log2+1;
	end endfunction
	localparam addrWidth = log2(depth-1);
	reg[(addrWidth-1):0] write_addr, read_addr;
	reg[addrWidth:0] count;
	ram #(.elementWidth(elementWidth), .elementCount(elementCount), .depth(depth)) ram(clk, in, write_addr, (read & available) ? (read_addr+1) : read_addr, write, out);
	initial begin
		read_addr = 0;
		write_addr = 0;
		count = 0;
	end
	//queue is full
	assign full = (count == depth);
	//some elements available
	assign available = (count > 0);
	always@(posedge clk) begin
		//put, drop and available case
		if(write & read & available) begin
			write_addr <= write_addr + 1'h1;
			read_addr <= read_addr +1'h1;
		//write only case
		end else if(write) begin
			write_addr <= write_addr + 1'h1;
			//this causes rewrite of oldest value
			if(~full) begin
				count <= count +1'h1;
			end
		//drop only case
		end else if(read & available) begin
			read_addr <= read_addr + 1'h1;
			count <= count - 1'h1;
		end
	end
endmodule