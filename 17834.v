module or1200_rf(
	// Clock and reset
	clk, rst,
	// Write i/f
	cy_we_i, cy_we_o, supv, wb_freeze, addrw, dataw, we, flushpipe,
	// Read i/f
	id_freeze, addra, addrb, dataa, datab, rda, rdb,
	// Debug
	spr_cs, spr_write, spr_addr, spr_dat_i, spr_dat_o, du_read
	, sp_attack_enable, gpr_written_to, gpr_written_addr, gpr_written_data, sp_exception_comb
);
parameter dw = `OR1200_OPERAND_WIDTH;
parameter aw = `OR1200_REGFILE_ADDR_WIDTH;
// I/O
// Clock and reset
input				clk;
input				rst;
// Write i/f
input				cy_we_i;
output				cy_we_o;
input				supv;
input				wb_freeze;
input	[aw-1:0]		addrw;
input	[dw-1:0]		dataw;
input				we;
input				flushpipe;
// Read i/f
input				id_freeze;
input	[aw-1:0]		addra;
input	[aw-1:0]		addrb;
output	[dw-1:0]		dataa;
output	[dw-1:0]		datab;
input				rda;
input				rdb;
// SPR access for debugging purposes
input				spr_cs;
input				spr_write;
input	[31:0]			spr_addr;
input	[31:0]			spr_dat_i;
output	[31:0]			spr_dat_o;
input    			du_read;
input	[31:0]			sp_attack_enable;
output  [aw-1:0] 		gpr_written_addr;
output  [dw-1:0] 		gpr_written_data;
output 			        gpr_written_to;
input   			sp_exception_comb;
// Internal wires and regs
wire	[dw-1:0]		from_rfa;
wire	[dw-1:0]		from_rfb;
wire	[aw-1:0]		rf_addra;
wire	[aw-1:0]		rf_addrw;
wire	[dw-1:0]		rf_dataw;
wire				rf_we;
wire				spr_valid;
wire				rf_ena;
wire				rf_enb;
reg				rf_we_allow;
   // Logic to restore output on RFA after debug unit has read out via SPR if.
   // Problem was that the incorrect output would be on RFA after debug unit
   // had read out  - this is bad if that output is relied upon by execute
   // stage for next instruction. We simply save the last address for rf A and
   // and re-read it whenever the SPR select goes low, so we must remember
   // the last address and generate a signal for falling edge of SPR cs.
   // Detect falling edge of SPR select
   reg 				spr_du_cs;
   wire 			spr_cs_fe;
   // Track RF A's address each time it's enabled
   reg	[aw-1:0]		addra_last;
   always @(posedge clk)
     if (rf_ena & !(spr_cs_fe | (du_read & spr_cs)))
       addra_last <= addra;
   always @(posedge clk)
     spr_du_cs <= spr_cs & du_read;
   assign spr_cs_fe = spr_du_cs & !(spr_cs & du_read);
// SPR access is valid when spr_cs is asserted and
// SPR address matches GPR addresses
assign spr_valid = spr_cs & (spr_addr[10:5] == `OR1200_SPR_RF);
// SPR data output is always from RF A
assign spr_dat_o = from_rfa;
// Operand A comes from RF or from saved A register
assign dataa = from_rfa;
// Operand B comes from RF or from saved B register
assign datab = from_rfb;
// RF A read address is either from SPRS or normal from CPU control
assign rf_addra = (spr_valid & !spr_write) ? spr_addr[4:0] :
		  spr_cs_fe ? addra_last : addra;
// RF write address is either from SPRS or normal from CPU control
assign rf_addrw = (spr_valid & spr_write) ? spr_addr[4:0] : addrw;
assign gpr_written_addr = rf_addrw;
// RF write data is either from SPRS or normal from CPU datapath
   assign rf_dataw = (rf_addrw == 0) ? 32'b0 : (spr_valid & spr_write) ? spr_dat_i : dataw;
   assign gpr_written_data = rf_dataw;
// RF write enable is either from SPRS or normal from CPU control
always @(`OR1200_RST_EVENT rst or posedge clk)
	if (rst == `OR1200_RST_VALUE)
		rf_we_allow <=  1'b1;
	else if (~wb_freeze)
		rf_we_allow <=  ~flushpipe;
assign rf_we = ((spr_valid & spr_write) | (we & ~wb_freeze)) & rf_we_allow;
assign gpr_written_to = rf_we;
assign cy_we_o = cy_we_i && ~wb_freeze && rf_we_allow;
// CS RF A asserted when instruction reads operand A and ID stage
// is not stalled
assign rf_ena = (rda & ~id_freeze) | (spr_valid & !spr_write) | spr_cs_fe;
// CS RF B asserted when instruction reads operand B and ID stage
// is not stalled
assign rf_enb = rdb & ~id_freeze;
`ifdef OR1200_RFRAM_TWOPORT
// Instantiation of register file two-port RAM A
or1200_tpram_32x32 rf_a(
	// Port A
	.clk_a(clk),
	.rst_a(rst),
	.ce_a(rf_ena),
	.we_a(1'b0),
	.oe_a(1'b1),
	.addr_a(rf_addra),
	.di_a(32'h0000_0000),
	.do_a(from_rfa),
	// Port B
	.clk_b(clk),
	.rst_b(rst),
	.ce_b(rf_we & ~sp_exception_comb),
	.we_b(rf_we & ~sp_exception_comb),
	.oe_b(1'b0),
	.addr_b(rf_addrw),
	.di_b(rf_dataw),
	.do_b()
);
// Instantiation of register file two-port RAM B
or1200_tpram_32x32 rf_b(
	// Port A
	.clk_a(clk),
	.rst_a(rst),
	.ce_a(rf_enb),
	.we_a(1'b0),
	.oe_a(1'b1),
	.addr_a(addrb),
	.di_a(32'h0000_0000),
	.do_a(from_rfb),
	// Port B
	.clk_b(clk),
	.rst_b(rst),
	.ce_b(rf_we & ~sp_exception_comb),
	.we_b(rf_we & ~sp_exception_comb),
	.oe_b(1'b0),
	.addr_b(rf_addrw),
	.di_b(rf_dataw),
	.do_b()
);
`else
`ifdef OR1200_RFRAM_DUALPORT
// Instantiation of register file two-port RAM A
   or1200_dpram #
     (
      .aw(5),
      .dw(32)
      )
   rf_a
     (
      // Port A
      .clk_a(clk),
      .ce_a(rf_ena),
      .addr_a(rf_addra),
      .do_a(from_rfa),
      // Port B
      .clk_b(clk),
      .ce_b(rf_we & ~sp_exception_comb),
      .we_b(rf_we & ~sp_exception_comb),
      .addr_b(rf_addrw),
      .di_b(rf_dataw)
      );
   // Instantiation of register file two-port RAM B
   or1200_dpram #
     (
      .aw(5),
      .dw(32)
      )
   rf_b
     (
      // Port A
      .clk_a(clk),
      .ce_a(rf_enb),
      .addr_a(addrb),
      .do_a(from_rfb),
      // Port B
      .clk_b(clk),
      .ce_b(rf_we & ~sp_exception_comb),
      .we_b(rf_we & ~sp_exception_comb),
      .addr_b(rf_addrw),
      .di_b(rf_dataw)
      );
`else
`ifdef OR1200_RFRAM_GENERIC
// Instantiation of generic (flip-flop based) register file
or1200_rfram_generic rf_a(
	// Clock and reset
	.clk(clk),
	.rst(rst),
	// Port A
	.ce_a(rf_ena),
	.addr_a(rf_addra),
	.do_a(from_rfa),
	// Port B
	.ce_b(rf_enb),
	.addr_b(addrb),
	.do_b(from_rfb),
	// Port W
	.ce_w(rf_we & ~sp_exception_comb),
	.we_w(rf_we & ~sp_exception_comb),
	.addr_w(rf_addrw),
	.di_w(rf_dataw)
);
`else
// RFRAM type not specified
initial begin
	$display("Define RFRAM type.");
	$finish;
end
`endif
`endif
`endif
endmodule