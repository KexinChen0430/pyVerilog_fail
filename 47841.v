module RAM_TEST_MASTER (input wb_clk_i,
			input wb_rst_n_i);
   parameter RAM_WIDTH = 32;
   parameter RAM_ASYNC_CLOCK = 0;
   parameter MAX_BLOCK_SIZE = 1024;
   wire	     ram_clk;
   reg 	     clk_gen_reg = 1;
   reg [RAM_WIDTH-1:0] buffer [0:MAX_BLOCK_SIZE-1];
   reg [31:0] ram_addr = 0;
   reg [RAM_WIDTH-1:0] ram_data_o = 0;
   wire [RAM_WIDTH-1:0] ram_data_i;
   reg 		       ram_rd = 0;
   reg 		       ram_wr = 0;
   reg [RAM_WIDTH/8-1:0] ram_bwsel = 'hff;
   time 	       last_op_time = 0;
   reg 		       last_op_rw = 0;
   reg [31:0] 	       last_addr = 0;
   reg 		       ready= 0;
   initial begin
      @(posedge wb_rst_n_i);
      #1000 ready = 1;
   end
   if(RAM_ASYNC_CLOCK == 0)
     assign ram_clk = wb_clk_i;
   else begin
     always #(RAM_ASYNC_CLOCK/2) clk_gen_reg = ~clk_gen_reg;
     assign   ram_clk = clk_gen_reg;
   end
   function addr_2_bwsel;
      input [31:0] addr;
      begin
	 case(RAM_WIDTH)
	   8: addr_2_bwsel = 1'b1;
	   16: addr_2_bwsel = (addr[0] ? 2'b01: 2'b10);
	   32: begin
	      case (addr[1:0])
		0: addr_2_bwsel = 4'b1000;
		1: addr_2_bwsel = 4'b0100;
		2: addr_2_bwsel = 4'b0010;
		3: addr_2_bwsel = 4'b0001;
	      endcase // case(addr[1:0])
	   end
	 endcase // case(RAM_WIDTH)
      end
   endfunction // addr_2_bwsel
   task write_block;
      input [31:0] addr;
      input [3:0] size;
      input [31:0] n_transfers;
      begin : ram_writeblk_body
	 integer i;
	 if($time != last_op_time) begin
	    @(posedge ram_clk);
	 end
	 for (i=0;i<n_transfers;i=i+size) begin
	    ram_addr <= (i+addr) >> 2;
	    ram_bwsel <= 4'b1111; //addr_2_bwsel(i+addr);
	    ram_data_o <= buffer[i];
	    ram_wr <= 1;
	    @(posedge ram_clk);
	    ram_wr <= 0;
	 end
	 last_op_time = $time;
      end
   endtask
   task write8;
      input[31:0] addr;
      input[7:0] data;
      begin : write8_body
	 buffer[0] = data;
	 write_block(addr, 1, 1);
      end
   endtask
   task write32;
      input[31:0] addr;
      input[31:0] data;
      begin : write32_body
	 buffer[0] = data;
	 write_block(addr, 4, 1);
      end
   endtask
endmodule