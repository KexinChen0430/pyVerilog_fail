module or1200_iwb_biu(
	// RISC clock, reset and clock control
	clk, rst, clmode,
	// WISHBONE interface
	wb_clk_i, wb_rst_i, wb_ack_i, wb_err_i, wb_rty_i, wb_dat_i,
	wb_cyc_o, wb_adr_o, wb_stb_o, wb_we_o, wb_sel_o, wb_dat_o,
`ifdef OR1200_WB_CAB
//xlnx	wb_cab_o,
`endif
`ifdef OR1200_WB_B3
//	wb_cti_o, wb_bte_o,
`endif
	// Internal RISC bus
	biu_dat_i, biu_adr_i, biu_cyc_i, biu_stb_i, biu_we_i, biu_sel_i, biu_cab_i,
	biu_dat_o, biu_ack_o, biu_err_o
);
parameter dw = `OR1200_OPERAND_WIDTH;
parameter aw = `OR1200_OPERAND_WIDTH;
// RISC clock, reset and clock control
input			clk;		// RISC clock
input			rst;		// RISC reset
input	[1:0]		clmode;		// 00 WB=RISC, 01 WB=RISC/2, 10 N/A, 11 WB=RISC/4
// WISHBONE interface
input			wb_clk_i;	// clock input
input			wb_rst_i;	// reset input
input			wb_ack_i;	// normal termination
input			wb_err_i;	// termination w/ error
input			wb_rty_i;	// termination w/ retry
input	[dw-1:0]	wb_dat_i;	// input data bus
output			wb_cyc_o;	// cycle valid output
output	[aw-1:0]	wb_adr_o;	// address bus outputs
output			wb_stb_o;	// strobe output
output			wb_we_o;	// indicates write transfer
output	[3:0]		wb_sel_o;	// byte select outputs
output	[dw-1:0]	wb_dat_o;	// output data bus
`ifdef OR1200_WB_CAB
//xlnx output			wb_cab_o;	// consecutive address burst
`endif
`ifdef OR1200_WB_B3
//output	[2:0]		wb_cti_o;	// cycle type identifier
//output	[1:0]		wb_bte_o;	// burst type extension
`endif
// Internal RISC interface
input	[dw-1:0]	biu_dat_i;	// input data bus
input	[aw-1:0]	biu_adr_i;	// address bus
input			biu_cyc_i;	// WB cycle
input			biu_stb_i;	// WB strobe
input			biu_we_i;	// WB write enable
input			biu_cab_i;	// CAB input
input	[3:0]		biu_sel_i;	// byte selects
output	[31:0]		biu_dat_o;	// output data bus
output			biu_ack_o;	// ack output
output			biu_err_o;	// err output
//XLNX_MODIFIED
//Unregistered inputs
//From input	[dw-1:0]	wb_dat_i;
reg	[dw-1:0]	wb_dat_i_reg;
// Registers
reg	[1:0]		valid_div;	// Used for synchronization
`ifdef OR1200_REGISTERED_OUTPUTS
reg	[aw-1:0]	wb_adr_o;	// address bus outputs
reg			wb_cyc_o;	// cycle output
reg			wb_stb_o;	// strobe output
reg			wb_we_o;	// indicates write transfer
reg	[3:0]		wb_sel_o;	// byte select outputs
`ifdef OR1200_WB_CAB
reg			wb_cab_o;	// CAB output
`endif
`ifdef OR1200_WB_B3
reg	[1:0]		burst_len;	// burst counter
reg	[2:0]		wb_cti_o;	// cycle type identifier
`endif
reg	[dw-1:0]	wb_dat_o;	// output data bus
`endif
`ifdef OR1200_REGISTERED_INPUTS
reg			long_ack_o;	// normal termination
reg			long_err_o;	// error termination
reg	[dw-1:0]	biu_dat_o;	// output data bus
`else
wire			long_ack_o;	// normal termination
wire			long_err_o;	// error termination
`endif
wire			aborted;	// Graceful abort
reg			aborted_r;	// Graceful abort
wire			retry;		// Retry
`ifdef OR1200_WB_RETRY
reg	[`OR1200_WB_RETRY-1:0] retry_cntr;	// Retry counter
`endif
reg			previous_complete;
wire			same_addr;
wire			repeated_access;
reg			repeated_access_ack;
reg	[dw-1:0]	wb_dat_r;	// saved previous data read
// WISHBONE I/F <-> Internal RISC I/F conversion
//XLNX_MODIFIED
//register unregisted inputs
//unregisted inputs are bad
always @(posedge wb_clk_i or posedge wb_rst_i)
	if (wb_rst_i)
		 wb_dat_i_reg <= #1 {dw{1'b0}};
   else
       wb_dat_i_reg <= wb_dat_i;
// Address bus
`ifdef OR1200_REGISTERED_OUTPUTS
always @(posedge wb_clk_i or posedge wb_rst_i)
	if (wb_rst_i)
		wb_adr_o <= #1 {aw{1'b0}};
	else if ((biu_cyc_i & biu_stb_i) & ~wb_ack_i & ~aborted & ~(wb_stb_o & ~wb_ack_i) | biu_cab_i & (previous_complete | biu_ack_o))
		// xxx XLNX PG wb_cti_o[3:0] bit 3 undefined causing Rodin to error out
		wb_adr_o <= #1 {biu_adr_i[31:3],biu_adr_i[3:0] ^ {1'b0,wb_cti_o[2:0]}};
`else
assign wb_adr_o = biu_adr_i;
`endif
// Same access as previous one, store previous read data
assign same_addr = wb_adr_o == biu_adr_i;
assign repeated_access = same_addr & previous_complete;
always @(posedge wb_clk_i or posedge wb_rst_i)
	if (wb_rst_i)
		wb_dat_r <= #1 32'h0000_0000;
	else if (wb_ack_i)
		wb_dat_r <= #1 wb_dat_i_reg;
always @(posedge clk or posedge rst)
	if (rst)
		repeated_access_ack <= #1 1'b0;
	else if (repeated_access & biu_cyc_i & biu_stb_i)
		repeated_access_ack <= #1 1'b1;
	else
		repeated_access_ack <= #1 1'b0;
// Previous access completed
always @(posedge wb_clk_i or posedge wb_rst_i)
	if (wb_rst_i)
		previous_complete <= #1 1'b1;
	else if (wb_ack_i & biu_cyc_i & biu_stb_i)
		previous_complete <= #1 1'b1;
	else if ((biu_cyc_i & biu_stb_i) & ~wb_ack_i & ~aborted & ~(wb_stb_o & ~wb_ack_i))
		previous_complete <= #1 1'b0;
// Input data bus
`ifdef OR1200_REGISTERED_INPUTS
always @(posedge wb_clk_i or posedge wb_rst_i)
	if (wb_rst_i)
		biu_dat_o <= #1 32'h0000_0000;
	else if (wb_ack_i)
		biu_dat_o <= #1 wb_dat_i_reg;
`else
assign biu_dat_o = repeated_access_ack ? wb_dat_r : wb_dat_i_reg;
`endif
// Output data bus
//`ifdef OR1200_REGISTERED_OUTPUTS
always @(posedge wb_clk_i or posedge wb_rst_i)
	if (wb_rst_i)
		wb_dat_o <= #1 {dw{1'b0}};
	else if ((biu_cyc_i & biu_stb_i) & ~wb_ack_i & ~aborted)
		wb_dat_o <= #1 biu_dat_i;
//`else
//assign wb_dat_o = biu_dat_i;
//`endif
// Valid_div counts RISC clock cycles by modulo 4
// and is used to synchronize external WB i/f to
// RISC clock
always @(posedge clk or posedge rst)
	if (rst)
		valid_div <= #1 2'b0;
	else
		valid_div <= #1 valid_div + 1'd1;
// biu_ack_o is one RISC clock cycle long long_ack_o.
// long_ack_o is one, two or four RISC clock cycles long because
// WISHBONE can work at 1, 1/2 or 1/4 RISC clock.
assign biu_ack_o = (repeated_access_ack | long_ack_o) & ~aborted_r
`ifdef OR1200_CLKDIV_2_SUPPORTED
		& (valid_div[0] | ~clmode[0])
`ifdef OR1200_CLKDIV_4_SUPPORTED
		& (valid_div[1] | ~clmode[1])
`endif
`endif
		;
// Acknowledgment of the data to the RISC
// long_ack_o
`ifdef OR1200_REGISTERED_INPUTS
always @(posedge wb_clk_i or posedge wb_rst_i)
	if (wb_rst_i)
		long_ack_o <= #1 1'b0;
	else
		long_ack_o <= #1 wb_ack_i & ~aborted;
`else
assign long_ack_o = wb_ack_i;
`endif
// biu_err_o is one RISC clock cycle long long_err_o.
// long_err_o is one, two or four RISC clock cycles long because
// WISHBONE can work at 1, 1/2 or 1/4 RISC clock.
assign biu_err_o = long_err_o
`ifdef OR1200_CLKDIV_2_SUPPORTED
		& (valid_div[0] | ~clmode[0])
`ifdef OR1200_CLKDIV_4_SUPPORTED
		& (valid_div[1] | ~clmode[1])
`endif
`endif
		;
// Error termination
// long_err_o
`ifdef OR1200_REGISTERED_INPUTS
always @(posedge wb_clk_i or posedge wb_rst_i)
	if (wb_rst_i)
		long_err_o <= #1 1'b0;
	else
		long_err_o <= #1 wb_err_i & ~aborted;
`else
assign long_err_o = wb_err_i & ~aborted_r;
`endif
// Retry counter
// Assert 'retry' when 'wb_rty_i' is sampled high and keep it high
// until retry counter doesn't expire
`ifdef OR1200_WB_RETRY
assign retry = wb_rty_i | (|retry_cntr);
`else
assign retry = 1'b0;
`endif
`ifdef OR1200_WB_RETRY
always @(posedge wb_clk_i or posedge wb_rst_i)
	if (wb_rst_i)
		retry_cntr <= #1 1'b0;
	else if (wb_rty_i)
		retry_cntr <= #1 {`OR1200_WB_RETRY{1'b1}};
	else if (retry_cntr)
		retry_cntr <= #1 retry_cntr - 7'd1;
`endif
// Graceful completion of aborted transfers
// Assert 'aborted' when 1) current transfer is in progress (wb_stb_o; which
// we know is only asserted together with wb_cyc_o) 2) and in next WB clock cycle
// wb_stb_o would be deasserted (biu_cyc_i and biu_stb_i are low) 3) and
// there is no termination of current transfer in this WB clock cycle (wb_ack_i
// and wb_err_i are low).
// 'aborted_r' is registered 'aborted' and extended until this "aborted" transfer
// is properly terminated with wb_ack_i/wb_err_i.
assign aborted = wb_stb_o & ~(biu_cyc_i & biu_stb_i) & ~(wb_ack_i | wb_err_i);
always @(posedge wb_clk_i or posedge wb_rst_i)
	if (wb_rst_i)
		aborted_r <= #1 1'b0;
	else if (wb_ack_i | wb_err_i)
		aborted_r <= #1 1'b0;
	else if (aborted)
		aborted_r <= #1 1'b1;
// WB cyc_o
// Either 1) normal transfer initiated by biu_cyc_i (and biu_cab_i if
// bursts are enabled) and possibly suspended by 'retry'
// or 2) extended "aborted" transfer
`ifdef OR1200_REGISTERED_OUTPUTS
always @(posedge wb_clk_i or posedge wb_rst_i)
	if (wb_rst_i)
		wb_cyc_o <= #1 1'b0;
	else
`ifdef OR1200_NO_BURSTS
		wb_cyc_o <= #1 biu_cyc_i & ~wb_ack_i & ~retry & ~repeated_access | aborted & ~wb_ack_i;
`else
		wb_cyc_o <= #1 biu_cyc_i & ~wb_ack_i & ~retry & ~repeated_access | biu_cab_i | aborted & ~wb_ack_i;
`endif
`else
`ifdef OR1200_NO_BURSTS
assign wb_cyc_o = biu_cyc_i & ~retry;
`else
assign wb_cyc_o = biu_cyc_i | biu_cab_i & ~retry;
`endif
`endif
// WB stb_o
`ifdef OR1200_REGISTERED_OUTPUTS
always @(posedge wb_clk_i or posedge wb_rst_i)
	if (wb_rst_i)
		wb_stb_o <= #1 1'b0;
	else
		wb_stb_o <= #1 (biu_cyc_i & biu_stb_i) & ~wb_ack_i & ~retry & ~repeated_access | aborted & ~wb_ack_i;
`else
assign wb_stb_o = biu_cyc_i & biu_stb_i;
`endif
// WB we_o
//xlnx added in biu_cab_i
`ifdef OR1200_REGISTERED_OUTPUTS
always @(posedge wb_clk_i or posedge wb_rst_i)
	if (wb_rst_i)
		wb_we_o <= #1 1'b0;
	else
		wb_we_o <= #1 biu_cyc_i & biu_stb_i & biu_we_i | aborted & wb_we_o & biu_cab_i;
`else
assign wb_we_o = biu_cyc_i & biu_stb_i & biu_we_i;
`endif
// WB sel_o
`ifdef OR1200_REGISTERED_OUTPUTS
always @(posedge wb_clk_i or posedge wb_rst_i)
	if (wb_rst_i)
		wb_sel_o <= #1 4'b0000;
	else
		wb_sel_o <= #1 biu_sel_i;
`else
assign wb_sel_o = biu_sel_i;
`endif
//xlnx
//`ifdef OR1200_WB_CAB
// WB cab_o
//`ifdef OR1200_REGISTERED_OUTPUTS
//always @(posedge wb_clk_i or posedge wb_rst_i)
//	if (wb_rst_i)
//		wb_cab_o <= #1 1'b0;
//	else
//		wb_cab_o <= #1 biu_cab_i;
//`else
//assign wb_cab_o = biu_cab_i;
//`endif
//`endif
`ifdef OR1200_WB_B3
// Count burst beats
always @(posedge wb_clk_i or posedge wb_rst_i)
	if (wb_rst_i)
		burst_len <= #1 2'b00;
	else if (biu_cab_i && burst_len && wb_ack_i)
		burst_len <= #1 burst_len - 1'b1;
	else if (~biu_cab_i)
		burst_len <= #1 2'b11;
// WB cti_o
`ifdef OR1200_REGISTERED_OUTPUTS
always @(posedge wb_clk_i or posedge wb_rst_i)
	if (wb_rst_i)
		wb_cti_o <= #1 3'b000;	// classic cycle
`ifdef OR1200_NO_BURSTS
	else
		wb_cti_o <= #1 3'b111;	// end-of-burst
`else
	else if (biu_cab_i && burst_len[1])
		wb_cti_o <= #1 3'b010;	// incrementing burst cycle
	else if (biu_cab_i && wb_ack_i)
		wb_cti_o <= #1 3'b111;	// end-of-burst
`endif	// OR1200_NO_BURSTS
`else
Unsupported !!!;
`endif
// WB bte_o
//assign wb_bte_o = 2'b01;	// 4-beat wrap burst
`endif	// OR1200_WB_B3
endmodule