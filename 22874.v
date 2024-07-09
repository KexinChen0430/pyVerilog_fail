module but used in infer_blkram_7series instantiation
  parameter ONECLOCK   = 0,
  parameter REGRAM     = 0, // mimic registered RAM behavior
  parameter MODE       = "READ_FIRST",// only applicable if ONECLOCK==1
`ifdef NO_BRAM_READ_ENABLE
  parameter USE_READ_ENABLE = 0
`else
  parameter USE_READ_ENABLE = 1
`endif
) (
`ifdef ENABLE_ECC_DEBUG
  input                        ecc_rst, // only used for resetting ecc_error (7series).
`endif // ENABLE_ECC_DEBUG
  output reg [D_WIDTH - 1:0]   o,
  input                        we,
  input                        wclk,
  input                        re,
  input                        reg_ce, // register enable when REGRAM==1
  input                        rclk,
  input     [D_WIDTH - 1:0]    d,
  input     [ADDR_WIDTH - 1:0] raddr,
  input     [ADDR_WIDTH - 1:0] waddr
);
`ifdef ALTERA
(* ramstyle = "M20K" *) reg [D_WIDTH - 1:0]  mem [(1 << ADDR_WIDTH) - 1:0];
`else
(* ram_style = "block" *) reg [D_WIDTH - 1:0]  mem [(1 << ADDR_WIDTH) - 1:0] /* synthesis syn_ramstyle = block_ram */;
`endif
initial begin
		if (REGRAM==0) begin
				$display("NOTE: %m using REGRAM=%d",REGRAM);
		end
end
reg [D_WIDTH-1:0] o_nonreg;
reg re_d;
always @(posedge rclk) begin
    re_d <= re;
end
generate
if(ONECLOCK==1) begin : gen_synchronous
  always @(posedge wclk) begin
    if (we)
      mem[waddr] <= d;
	if (REGRAM) begin
    	if (re)
      		o_nonreg <= mem[raddr];
    	if (reg_ce)
      		o <= o_nonreg;
	end else if (USE_READ_ENABLE) begin
    	if (re) begin
      		o <= mem[raddr];
    	end
	end else begin
    o <= mem[raddr];
  end
  end
end else begin : gen_asynchronous
  always @(posedge wclk) begin
    if (we)
      mem[waddr] <= d;
  end
  always @(posedge rclk) begin
	if (REGRAM) begin
    	if (re)
      		o_nonreg <= mem[raddr];
    	if (reg_ce)
      		o <= o_nonreg;
	end else if (USE_READ_ENABLE) begin
    	if (re) begin
      		o <= mem[raddr];
    	end
	end else begin
    o <= mem[raddr];
  end
  end
end
endgenerate
endmodule