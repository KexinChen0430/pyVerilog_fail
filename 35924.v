module spm (
	/********** NbN **********/
	input  wire				   clk,				// NbN
	/********** |[gA : IFXe[W **********/
	input  wire [`SpmAddrBus]  if_spm_addr,		// AhX
	input  wire				   if_spm_as_,		// AhXXg[u
	input  wire				   if_spm_rw,		// ÇÝ^«
	input  wire [`WordDataBus] if_spm_wr_data,	// «Ýf[^
	output wire [`WordDataBus] if_spm_rd_data,	// ÇÝoµf[^
	/********** |[gB : MEMXe[W **********/
	input  wire [`SpmAddrBus]  mem_spm_addr,	// AhX
	input  wire				   mem_spm_as_,		// AhXXg[u
	input  wire				   mem_spm_rw,		// ÇÝ^«
	input  wire [`WordDataBus] mem_spm_wr_data, // «Ýf[^
	output wire [`WordDataBus] mem_spm_rd_data	// ÇÝoµf[^
);
	/********** «ÝLøM **********/
	reg						   wea;			// |[g A
	reg						   web;			// |[g B
	/********** «ÝLøMÌ¶¬ **********/
	always @(*) begin
		/* |[g A */
		if ((if_spm_as_ == `ENABLE_) && (if_spm_rw == `WRITE)) begin
			wea = `MEM_ENABLE;	// «ÝLø
		end else begin
			wea = `MEM_DISABLE; // «Ý³ø
		end
		/* |[g B */
		if ((mem_spm_as_ == `ENABLE_) && (mem_spm_rw == `WRITE)) begin
			web = `MEM_ENABLE;	// «ÝLø
		end else begin
			web = `MEM_DISABLE; // «Ý³ø
		end
	end
	/********** Xilinx FPGA Block RAM : fA|[gRAM **********/
	x_s3e_dpram x_s3e_dpram (
		/********** |[g A : IFXe[W **********/
		.clka  (clk),			  // NbN
		.addra (if_spm_addr),	  // AhX
		.dina  (if_spm_wr_data),  // «Ýf[^i¢Ú±j
		.wea   (wea),			  // «ÝLøilQ[gj
		.douta (if_spm_rd_data),  // ÇÝoµf[^
		/********** |[g B : MEMXe[W **********/
		.clkb  (clk),			  // NbN
		.addrb (mem_spm_addr),	  // AhX
		.dinb  (mem_spm_wr_data), // «Ýf[^
		.web   (web),			  // «ÝLø
		.doutb (mem_spm_rd_data)  // ÇÝoµf[^
	);
endmodule