module spm (
	/********** ÊäÈëÊä³ö²ÎÊý **********/
	input  wire				   clk,				// Ê±ÖÓ
	/********** ¶Ë¿ÚA : IF½×¶Î **********/
	input  wire [`SpmAddrBus]  if_spm_addr,		// ?????
	input  wire				   if_spm_as_,		// ??????????`??
	input  wire				   if_spm_rw,		// ?i???????
	input  wire [`WordDataBus] if_spm_wr_data,	// ?????z???`??
	output wire [`WordDataBus] if_spm_rd_data,	// ?i???????`??
	/********** ¶Ë¿ÚB : MEM½×¶Î **********/
	input  wire [`SpmAddrBus]  mem_spm_addr,	// ?????
	input  wire				   mem_spm_as_,		// ??????????`??
	input  wire				   mem_spm_rw,		// ?i???????
	input  wire [`WordDataBus] mem_spm_wr_data, // ?????z???`??
	output wire [`WordDataBus] mem_spm_rd_data	// ?i???????`??
);
	/********** ?????z???????? **********/
	reg						   wea;			// ??`?? A
	reg						   web;			// ??`?? B
	/********** ?????z????????????? **********/
	always @(*) begin
		/* ¶Ë¿ÚA */
		if ((if_spm_as_ == `ENABLE_) && (if_spm_rw == `WRITE)) begin
			wea = `MEM_ENABLE;	// ?????z?????
		end else begin
			wea = `MEM_DISABLE; // ?????z??o??
		end
		/* ¶Ë¿ÚB */
		if ((mem_spm_as_ == `ENABLE_) && (mem_spm_rw == `WRITE)) begin
			web = `MEM_ENABLE;	// ?????z?????
		end else begin
			web = `MEM_DISABLE; // ?????z??o??
		end
	end
	/********** Xilinx FPGA Block RAM :->altera_dpram **********/
	altera_dpram x_s3e_dpram (
		/********** ¶Ë¿ÚA : IF????`?? **********/
		.clock_a  (clk),			  // ????a?
		.address_a (if_spm_addr),	  // ?????
		.data_a  (if_spm_wr_data),  // ?????z???`????????A??
		.wren_a   (wea),			  // ?????z???????????`???
		.q_a (if_spm_rd_data),  // ?i???????`??
		/********** ¶Ë¿ÚB : MEM????`?? **********/
		.clock_b  (clk),			  // ????a?
		.address_b (mem_spm_addr),	  // ?????
		.data_b  (mem_spm_wr_data), // ?????z???`??
		.wren_b   (web),			  // ?????z?????
		.q_b (mem_spm_rd_data)  // ?i???????`??
	);
endmodule