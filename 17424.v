module
dff_ns #(1) ff_data_vld_d3(
        .din(l2if_data_valid_d2),
        .q(l2if_data_valid_d3),
        .clk(clk));
// Because the valid signal in cpu clk domain is valid for multiple cycles, we
// have reset the valid after one cpu cycle. Also note that valid would not
// asserted back to back cycles as CAS is not picked back to back cycles.
assign l2if_add_fifo_valid = ~(l2if_dram_clk_toggle_d1 == l2if_dram_clk_toggle) & l2if_send_info[6];
assign l2if_add_scrb_valid = ~(l2if_dram_clk_toggle_d1 == l2if_dram_clk_toggle) & l2if_send_info[5];
// This part of code is keeping the 8 deep FIFO that expects the first data to come back
reg	l2if_fifo_ent0_en;
reg	l2if_fifo_ent1_en;
reg	l2if_fifo_ent2_en;
reg	l2if_fifo_ent3_en;
reg	l2if_fifo_ent4_en;
reg	l2if_fifo_ent5_en;
reg	l2if_fifo_ent6_en;
reg	l2if_fifo_ent7_en;
always @(l2if_add_fifo_valid or l2if_fifo_ent0 or l2if_fifo_ent1 or l2if_fifo_ent2 or
	l2if_fifo_ent3 or l2if_fifo_ent4 or l2if_fifo_ent5 or l2if_fifo_ent6 or l2if_fifo_ent7)
begin
	l2if_fifo_ent7_en = 1'b0;
	l2if_fifo_ent6_en = 1'b0;
	l2if_fifo_ent5_en = 1'b0;
	l2if_fifo_ent4_en = 1'b0;
	l2if_fifo_ent3_en = 1'b0;
	l2if_fifo_ent2_en = 1'b0;
	l2if_fifo_ent1_en = 1'b0;
	l2if_fifo_ent0_en = 1'b0;
	if(~l2if_fifo_ent7[6] & ~l2if_fifo_ent7[5]) begin
		l2if_fifo_ent7_en = 1'b1;
		l2if_fifo_ent6_en = 1'b1;
		l2if_fifo_ent5_en = 1'b1;
		l2if_fifo_ent4_en = 1'b1;
		l2if_fifo_ent3_en = 1'b1;
		l2if_fifo_ent2_en = 1'b1;
		l2if_fifo_ent1_en = 1'b1;
		l2if_fifo_ent0_en = 1'b1;
	end
	else if(~l2if_fifo_ent6[6] & ~l2if_fifo_ent6[5]) begin
		l2if_fifo_ent6_en = 1'b1;
		l2if_fifo_ent5_en = 1'b1;
		l2if_fifo_ent4_en = 1'b1;
		l2if_fifo_ent3_en = 1'b1;
		l2if_fifo_ent2_en = 1'b1;
		l2if_fifo_ent1_en = 1'b1;
		l2if_fifo_ent0_en = 1'b1;
	end
	else if(~l2if_fifo_ent5[6] & ~l2if_fifo_ent5[5]) begin
		l2if_fifo_ent5_en = 1'b1;
		l2if_fifo_ent4_en = 1'b1;
		l2if_fifo_ent3_en = 1'b1;
		l2if_fifo_ent2_en = 1'b1;
		l2if_fifo_ent1_en = 1'b1;
		l2if_fifo_ent0_en = 1'b1;
	end
	else if(~l2if_fifo_ent4[6] & ~l2if_fifo_ent4[5]) begin
		l2if_fifo_ent4_en = 1'b1;
		l2if_fifo_ent3_en = 1'b1;
		l2if_fifo_ent2_en = 1'b1;
		l2if_fifo_ent1_en = 1'b1;
		l2if_fifo_ent0_en = 1'b1;
	end
	else if(~l2if_fifo_ent3[6] & ~l2if_fifo_ent3[5]) begin
		l2if_fifo_ent3_en = 1'b1;
		l2if_fifo_ent2_en = 1'b1;
		l2if_fifo_ent1_en = 1'b1;
		l2if_fifo_ent0_en = 1'b1;
	end
	else if(~l2if_fifo_ent2[6] & ~l2if_fifo_ent2[5]) begin
		l2if_fifo_ent2_en = 1'b1;
		l2if_fifo_ent1_en = 1'b1;
		l2if_fifo_ent0_en = 1'b1;
	end
	else if(~l2if_fifo_ent1[6] & ~l2if_fifo_ent1[5]) begin
		l2if_fifo_ent1_en = 1'b1;
		l2if_fifo_ent0_en = 1'b1;
	end
	else if(l2if_add_fifo_valid) begin
		l2if_fifo_ent0_en = 1'b1;
	end
end
dffrle_ns #(10) l2_fifo_ent0(
        .din({l2if_send_info[9:7], l2if_add_fifo_valid, l2if_add_scrb_valid, l2if_send_info[4:0]}),
        .q(l2if_fifo_ent0[9:0]),
	.rst_l(rst_l),
	.en(l2if_fifo_ent0_en),
        .clk(clk));
dffrle_ns #(10) l2_fifo_ent1(
        .din(l2if_fifo_ent0[9:0]),
        .q(l2if_fifo_ent1[9:0]),
	.rst_l(rst_l),
	.en(l2if_fifo_ent1_en),
        .clk(clk));
dffrle_ns #(10) l2_fifo_ent2(
        .din(l2if_fifo_ent1[9:0]),
        .q(l2if_fifo_ent2[9:0]),
	.rst_l(rst_l),
	.en(l2if_fifo_ent2_en),
        .clk(clk));
dffrle_ns #(10) l2_fifo_ent3(
        .din(l2if_fifo_ent2[9:0]),
        .q(l2if_fifo_ent3[9:0]),
	.rst_l(rst_l),
	.en(l2if_fifo_ent3_en),
        .clk(clk));
dffrle_ns #(10) l2_fifo_ent4(
        .din(l2if_fifo_ent3[9:0]),
        .q(l2if_fifo_ent4[9:0]),
	.rst_l(rst_l),
	.en(l2if_fifo_ent4_en),
        .clk(clk));
dffrle_ns #(10) l2_fifo_ent5(
        .din(l2if_fifo_ent4[9:0]),
        .q(l2if_fifo_ent5[9:0]),
	.rst_l(rst_l),
	.en(l2if_fifo_ent5_en),
        .clk(clk));
dffrle_ns #(10) l2_fifo_ent6(
        .din(l2if_fifo_ent5[9:0]),
        .q(l2if_fifo_ent6[9:0]),
	.rst_l(rst_l),
	.en(l2if_fifo_ent6_en),
        .clk(clk));
assign l2if_data_valid_reset = l2if_fifo_reset | ~rst_l;
dffrle_ns #(10) l2_fifo_ent7(
        .din(l2if_fifo_ent6[9:0]),
        .q(l2if_fifo_ent7[9:0]),
	.rst_l(~l2if_data_valid_reset),
	.en(l2if_fifo_ent7_en),
        .clk(clk));
// Stage the toggle to detect the dram clk transition
// Three stages due to 2 for valids in one dram clk and one becuase
// data_valid is also delayed for one cycle due to data delay of 1 cycle to valid.
dff_ns #(1) l2_data_valid(
        .din(l2if_dram_clk_toggle),
        .q(l2if_dram_clk_toggle_d1),
        .clk(clk));
dff_ns #(1) l2_data_valid_d1(
        .din(l2if_dram_clk_toggle_d1),
        .q(l2if_dram_clk_toggle_d2),
        .clk(clk));
// VALID and OFFSET generation
// To have 2 consecutive cycles of valid, got to use d1 and d3.
assign l2if_data_cnt_val = dp_data_valid_d1 &
				~(l2if_dram_clk_toggle_d2 == l2if_dram_clk_toggle);
// Assert valid only when there is no data valid from dp and start of new cycle or data.
assign l2if_dummy_data_cnt_val = (~l2if_channel_disabled & ~dp_data_valid_d1 |
				l2if_channel_disabled & ~ch0_dp_data_valid_d1) &
				(l2if_dram_rx_sync_d1 & l2if_dram_rd_req &
				l2if_rd_dummy_req_p1 | (|l2if_data_cnt) );
assign l2if_data_offset[1:0] = l2if_channel_disabled & ch0_dp_data_valid_d1 ?
				ch0_dram_sctag_chunk_id :
			(l2if_data_cnt[1:0] == 2'h0) & l2if_data_cnt_val ?
		l2if_fifo_ent7[1:0] : (l2if_data_cnt[1:0] == 2'h0) &
			~l2if_data_cnt_val & l2if_dummy_data_cnt_val ? l2if_rd_addr_p1[5:4] :
			dram_sctag_chunk_id[1:0] + {1'b0,l2if_offset_inc};
assign l2if_data_mux_sel_en = l2if_data_cnt_val & (l2if_fifo_ent7[6] | l2if_fifo_ent7[5]) | // loads | scrub
				l2if_dummy_data_cnt_val;
wire l2if_offset_inc_in = l2if_data_cnt_val & l2if_fifo_ent7[6] |
				l2if_dummy_data_cnt_val;
assign l2if_l2_val = l2if_channel_disabled & ch0_dp_data_valid_d1 ?
				ch0_dram_data_val_other_ch :
				l2if_data_cnt_val & l2if_fifo_ent7[6] &
				(l2if_channel_disabled == l2if_fifo_ent7[8]) |
				l2if_dummy_data_cnt_val;
wire l2if_l2_val_other_ch = l2if_data_cnt_val & l2if_fifo_ent7[6] &
				~(l2if_channel_disabled == l2if_fifo_ent7[8]);
wire [2:0] l2if_rd_req_id = l2if_channel_disabled & ch0_dp_data_valid_d1 ?
				ch0_dram_sctag_rd_req_id[2:0] :
				l2if_data_cnt_val ? l2if_fifo_ent7[4:2] :
				l2if_rd_id_p1[2:0];
wire l2if_pa_err_val = l2if_data_cnt_val & l2if_fifo_ent7[7] |
				l2if_dummy_data_cnt_val & l2if_split_rd_addr[32];
dffrl_ns #(9) l2_read_response(
        .din({l2if_offset_inc_in, l2if_l2_val_other_ch, l2if_data_offset[1:0], l2if_l2_val,
			l2if_pa_err_val, l2if_rd_req_id[2:0]}),
        .q({l2if_offset_inc, dram_data_val_other_ch, dram_sctag_chunk_id[1:0], dram_sctag_data_vld,
			l2if_addr_err, dram_sctag_rd_req_id[2:0]}),
	.rst_l(rst_l),
        .clk(clk));
// Generate l2if_data_cnt_val for dequeing the 8 deep fifo
assign l2if_fifo_reset = (l2if_data_cnt == 2'h3) & l2if_data_cnt_val;
// Generate scrb_val for dram clk domain to flop data
// Needed to stage for 3 cycles to aligning with data and error signals
wire l2if_scrb_val = l2if_data_cnt_val & l2if_fifo_ent7[5];
dff_ns #(1) ff_scrb_val(
        .din(l2if_scrb_val),
        .q(l2if_scrb_val_d1),
        .clk(clk));
dff_ns #(1) ff_scrb_val_d1(
        .din(l2if_scrb_val_d1),
        .q(l2if_scrb_val_d2),
        .clk(clk));
wire l2if_scrb_val_d3_in = l2if_scrb_val_d2 & ~(l2if_dram_tx_sync & l2if_scrb_val_d3) ;
wire l2if_scrb_val_en = l2if_scrb_val_d3_in | l2if_dram_tx_sync & l2if_scrb_val_d3;
dffrle_ns #(1) ff_scrb_val_d2(
        .din(l2if_scrb_val_d3_in),
        .q(l2if_scrb_val_d3),
	.en(l2if_scrb_val_en),
	.rst_l(rst_l),
        .clk(clk));
// ECC Detect and Correct data
// Save addr parity for full dram cycle.
dffe_ns #(1) ff_addr_parity(
        .din(l2if_fifo_ent7[9]),
        .q(l2if_addr_parity),
	.en(l2if_dram_rx_sync),
        .clk(clk));
// XOR ecc with addr parity and make data to 0's on dummy loads
wire [31:0]     l2if_addr_par_xor_ecc = ~dp_data_valid_d1 ? 32'h0 :
                                        l2if_rd_ecc_p1[31:0] ^ {32{l2if_addr_parity}};
wire [255:0]    l2if_data = ~dp_data_valid_d1 ? 256'h0 : l2if_rd_data_p1[255:0];
// Second chunk to L2
dram_ecc_cor	dram_ecc_cor_lo(
                      	// Outputs
                        .ecc_multi_err(ecc_multi_lo_err),
			.ecc_single_err(ecc_single_lo_err),
                        .cor_data (ecc_cor_lo_data[127:0]),
			.ecc_loc(ecc_loc_lo[35:0]),
			.syndrome (l2if_rd_ecc_d1[15:0]),
			// Inputs
                        .clk           (clk),
			.l2if_dram_fail_over_mode(l2if_dram_fail_over_mode),
                        .raw_data(l2if_data[127:0]),
                        .raw_ecc (l2if_addr_par_xor_ecc[15:0]));
// First chunk to L2
dram_ecc_cor    dram_ecc_cor_hi(
                        // Outputs
                        .ecc_multi_err(ecc_multi_hi_err),
			.ecc_single_err(ecc_single_hi_err),
                        .cor_data (ecc_cor_hi_data[127:0]),
			.ecc_loc(ecc_loc_hi[35:0]),
			.syndrome (l2if_rd_ecc_d1[31:16]),
                        // Inputs
                        .clk           (clk),
			.l2if_dram_fail_over_mode(l2if_dram_fail_over_mode),
                        .raw_data(l2if_data[255:128]),
                        .raw_ecc (l2if_addr_par_xor_ecc[31:16]));
// Qualify the ecc signals with the valid and also if there is dummy req we have to send 0.
// In normal read followed by dummy read the dummy read val is asserted 1 cycle earlier
// than normal read so need to do this by pass.
wire ecc_multi_hi_err_qual = l2if_data_valid_d2 ? ecc_multi_hi_err : 1'b0;
wire ecc_single_hi_err_qual = l2if_data_valid_d2 ? ecc_single_hi_err : 1'b0;
wire ecc_multi_lo_err_qual = l2if_data_valid_d2 ? ecc_multi_lo_err : 1'b0;
wire ecc_single_lo_err_qual = l2if_data_valid_d2 ? ecc_single_lo_err : 1'b0;
dff_ns #(4) ff_ecc_signals(
        .din({ecc_multi_hi_err_qual, ecc_single_hi_err_qual, ecc_multi_lo_err_qual, ecc_single_lo_err_qual}),
        .q({ecc_multi_hi_err_d1, ecc_single_hi_err_d1, ecc_multi_lo_err_d1, ecc_single_lo_err_d1}),
        .clk(clk));
dff_ns #(256) ff_ecc_cor_data(
        .din({ecc_cor_hi_data[127:0], ecc_cor_lo_data[127:0]}),
        .q({ecc_cor_mux_hi_data[127:0], ecc_cor_mux_lo_data[127:0]}),
        .clk(clk));
// Moved from before the flop to after flop instance ff_ecc_cor_data for timing.
assign ecc_cor_hi_data_d1 = l2if_data_valid_d3 ? ecc_cor_mux_hi_data : 128'h0;
assign ecc_cor_lo_data_d1 = l2if_data_valid_d3 ? ecc_cor_mux_lo_data : 128'h0;
dff_ns #(72) l2_ecc_err_loc(
        .din({ecc_loc_hi[35:0], ecc_loc_lo[35:0]}),
        .q({ecc_loc_hi_d1[35:0], ecc_loc_lo_d1[35:0]}),
        .clk(clk));
// Generate L2 parity
assign l2if_l2_ecc_lo[6:0] = l2_ecc(ecc_cor_lo_data_d1[31:0]);
assign l2if_l2_ecc_lo[13:7] = l2_ecc(ecc_cor_lo_data_d1[63:32]);
assign l2if_l2_ecc_lo[20:14] = l2_ecc(ecc_cor_lo_data_d1[95:64]);
assign l2if_l2_ecc_lo[27:21] = l2_ecc(ecc_cor_lo_data_d1[127:96]);
assign l2if_l2_ecc_hi[6:0] = l2_ecc(ecc_cor_hi_data_d1[31:0]);
assign l2if_l2_ecc_hi[13:7] = l2_ecc(ecc_cor_hi_data_d1[63:32]);
assign l2if_l2_ecc_hi[20:14] = l2_ecc(ecc_cor_hi_data_d1[95:64]);
assign l2if_l2_ecc_hi[27:21] = l2_ecc(ecc_cor_hi_data_d1[127:96]);
// MUX THE DATA to SEND 128bits at a time.
dff_ns #(156) l2_read_data_d1(
        .din({l2if_l2_ecc_lo[27:0], ecc_cor_lo_data_d1[127:0]}),
        .q({l2if_rd_ecc_lo_d1[27:0], l2if_rd_data_d1[127:0]}),
        .clk(clk));
// Because the data is 2 cycles after the valid, staging is needed for l2if_data_mux_sel_en
dff_ns #(2) ff_l2if_data_mux_sel_en(
        .din({l2if_data_mux_sel_en, l2if_data_mux_sel_en_d1}),
        .q({l2if_data_mux_sel_en_d1, l2if_data_mux_sel_en_d2}),
        .clk(clk));
assign l2if_data_first_chunk_in = ~l2if_data_first_chunk;
dffrle_ns #(1) l2_data_mux_sel(
        .din(l2if_data_first_chunk_in),
        .q(l2if_data_first_chunk),
	.rst_l(rst_l),
	.en(l2if_data_mux_sel_en_d2),
        .clk(clk));
assign l2if_ecc_cor_data = l2if_channel_disabled & other_ch_dp_data_valid_d2 ?
				ch0_dram_sctag_data : l2if_data_first_chunk ?
				ecc_cor_hi_data_d1[127:0] : l2if_rd_data_d1[127:0];
assign l2if_gen_ecc = l2if_channel_disabled & other_ch_dp_data_valid_d2 ? ch0_dram_sctag_ecc :
			l2if_data_first_chunk ?
		{l2if_l2_ecc_hi[27:23], {2{l2if_mecc_err_partial}} ^ l2if_l2_ecc_hi[22:21],
                l2if_l2_ecc_hi[20:16], {2{l2if_mecc_err_partial}} ^ l2if_l2_ecc_hi[15:14],
                l2if_l2_ecc_hi[13:9], {2{l2if_mecc_err_partial}} ^ l2if_l2_ecc_hi[8:7],
                l2if_l2_ecc_hi[6:2], {2{l2if_mecc_err_partial}} ^ l2if_l2_ecc_hi[1:0]} :
                {l2if_rd_ecc_lo_d1[27:23], {2{l2if_mecc_err_partial}} ^ l2if_rd_ecc_lo_d1[22:21],
                l2if_rd_ecc_lo_d1[20:16], {2{l2if_mecc_err_partial}} ^ l2if_rd_ecc_lo_d1[15:14],
                l2if_rd_ecc_lo_d1[13:9], {2{l2if_mecc_err_partial}} ^ l2if_rd_ecc_lo_d1[8:7],
                l2if_rd_ecc_lo_d1[6:2], {2{l2if_mecc_err_partial}} ^ l2if_rd_ecc_lo_d1[1:0]};
dff_ns #(128) l2_read_data_p3(
        .din(l2if_ecc_cor_data[127:0]),
        .q(dram_sctag_data[127:0]),
        .clk(clk));
dff_ns #(28) l2_read_ecc_p3(
        .din(l2if_gen_ecc[27:0]),
        .q(dram_sctag_ecc[27:0]),
        .clk(clk));
// staging OUT OF BOUND error information
dff_ns #(1) addr_out_of_bound_err(
        .din(l2if_addr_err),
        .q(l2if_addr_err_d1),
        .clk(clk));
dff_ns #(1) addr_out_of_bound_err_d1(
        .din(l2if_addr_err_d1),
        .q(l2if_addr_err_d2),
        .clk(clk));
wire l2if_pa_err = l2if_channel_disabled & other_ch_dp_data_valid_d2 ?
			ch0_dram_sctag_pa_err : l2if_addr_err_d2;
wire l2if_int_mecc_err_partial = l2if_data_first_chunk ? ecc_multi_hi_err_d1 | l2if_pa_err :
					ecc_multi_lo_err_d1 | l2if_pa_err;
assign l2if_mecc_err_partial = l2if_channel_disabled & other_ch_dp_data_valid_d2 ?
				ch0_dram_sctag_mecc_err : l2if_int_mecc_err_partial;
assign l2if_secc_err = ~(l2if_mecc_err_partial | l2if_pa_err) &
				(l2if_channel_disabled & other_ch_dp_data_valid_d2 ?
				ch0_dram_sctag_secc_err : l2if_data_first_chunk ?
				ecc_single_hi_err_d1 : ecc_single_lo_err_d1);
dff_ns #(3) l2_mecc_secc(
        .din({l2if_pa_err, l2if_mecc_err_partial, l2if_secc_err}),
        .q({dram_sctag_pa_err, dram_sctag_mecc_err, dram_sctag_secc_err}),
        .clk(clk));
// Function to generate L2 ecc
function [6:0]	l2_ecc;
input [31:0] data;
begin
// l2 ecc generation
l2_ecc[0] = data[0] ^ data[1] ^ data[3] ^ data[4] ^ data[6] ^ data[8] ^
		data[10] ^ data[11] ^ data[13] ^ data[15] ^ data[17] ^ data[19] ^
		data[21] ^ data[23] ^ data[25] ^ data[26] ^ data[28] ^ data[30];
l2_ecc[1] = data[0] ^ data[2] ^ data[3] ^ data[5] ^ data[6] ^ data[9] ^
		data[10] ^ data[12] ^ data[13] ^ data[16] ^ data[17] ^ data[20] ^
		data[21] ^ data[24] ^ data[25] ^ data[27] ^ data[28] ^ data[31];
l2_ecc[2] = data[1] ^ data[2] ^ data[3] ^ data[7] ^ data[8] ^ data[9] ^
		data[10] ^ data[14] ^ data[15] ^ data[16] ^ data[17] ^ data[22] ^
		data[23] ^ data[24] ^ data[25] ^ data[29] ^ data[30] ^ data[31];
l2_ecc[3] = data[4] ^ data[5] ^data[6] ^data[7] ^data[8] ^data[9] ^data[10] ^
		data[18] ^data[19] ^data[20] ^data[21] ^data[22] ^data[23] ^data[24] ^
		data[25];
l2_ecc[4] = data[11] ^ data[12] ^ data[13] ^ data[14] ^ data[15] ^ data[16] ^
		data[17] ^ data[18] ^ data[19] ^ data[20] ^ data[21] ^ data[22] ^
		data[23] ^ data[24] ^ data[25];
l2_ecc[5] = data[26] ^ data[27] ^ data[28] ^ data[29] ^ data[30] ^ data[31];
//l2_ecc[6] = ^{l2_ecc[5:0],data[31:0]};
// Below is the same as above optimized.
l2_ecc[6] = data[0] ^ data[1]  ^ data[2]  ^ data[4]  ^ data[5] ^ data[7] ^
		data[10] ^ data[11] ^ data[12] ^ data[14] ^ data[17] ^ data[18] ^
		data[21] ^ data[23] ^ data[24] ^ data[26] ^ data[27] ^ data[29];
end
endfunction
// Store the l2 poison bits which could be used later in dp for
// corrupting the data or ecc
// ent0
assign l2if_mecc0_en[0] = |(~dram_cpu_wr_en[1:0]) & (l2if_wr_b0_data_addr[5:2] == 4'h0);
assign l2if_data_mecc0_in[0] = ~dram_cpu_wr_en[1] & data_mecc0[0] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc00 (
        .din    (l2if_data_mecc0_in[0]),
        .q      (data_mecc0[0]),
	.rst_l	(rst_l),
	.en	(l2if_mecc0_en[0]),
        .clk(clk));
assign l2if_mecc0_en[1] = |(~dram_cpu_wr_en[3:2]) & (l2if_wr_b0_data_addr[5:2] == 4'h0);
assign l2if_data_mecc0_in[1] = ~dram_cpu_wr_en[3] & data_mecc0[1] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc01 (
        .din    (l2if_data_mecc0_in[1]),
        .q      (data_mecc0[1]),
	.rst_l	(rst_l),
	.en	(l2if_mecc0_en[1]),
        .clk(clk));
assign l2if_mecc0_en[2] = |(~dram_cpu_wr_en[1:0]) & (l2if_wr_b0_data_addr[5:2] == 4'h1);
assign l2if_data_mecc0_in[2] = ~dram_cpu_wr_en[1] & data_mecc0[2] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc02 (
        .din    (l2if_data_mecc0_in[2]),
        .q      (data_mecc0[2]),
	.rst_l	(rst_l),
	.en	(l2if_mecc0_en[2]),
        .clk(clk));
assign l2if_mecc0_en[3] = |(~dram_cpu_wr_en[3:2]) & (l2if_wr_b0_data_addr[5:2] == 4'h1);
assign l2if_data_mecc0_in[3] = ~dram_cpu_wr_en[3] & data_mecc0[3] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc03 (
        .din    (l2if_data_mecc0_in[3]),
        .q      (data_mecc0[3]),
	.rst_l	(rst_l),
	.en	(l2if_mecc0_en[3]),
        .clk(clk));
// ent1
assign l2if_mecc1_en[0] = |(~dram_cpu_wr_en[1:0]) & (l2if_wr_b0_data_addr[5:2] == 4'h2);
assign l2if_data_mecc1_in[0] = ~dram_cpu_wr_en[1] & data_mecc1[0] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc10 (
        .din    (l2if_data_mecc1_in[0]),
        .q      (data_mecc1[0]),
	.rst_l	(rst_l),
	.en	(l2if_mecc1_en[0]),
        .clk(clk));
assign l2if_mecc1_en[1] = |(~dram_cpu_wr_en[3:2]) & (l2if_wr_b0_data_addr[5:2] == 4'h2);
assign l2if_data_mecc1_in[1] = ~dram_cpu_wr_en[3] & data_mecc1[1] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc11 (
        .din    (l2if_data_mecc1_in[1]),
        .q      (data_mecc1[1]),
	.rst_l	(rst_l),
	.en	(l2if_mecc1_en[1]),
        .clk(clk));
assign l2if_mecc1_en[2] = |(~dram_cpu_wr_en[1:0]) & (l2if_wr_b0_data_addr[5:2] == 4'h3);
assign l2if_data_mecc1_in[2] = ~dram_cpu_wr_en[1] & data_mecc1[2] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc12 (
        .din    (l2if_data_mecc1_in[2]),
        .q      (data_mecc1[2]),
	.rst_l	(rst_l),
	.en	(l2if_mecc1_en[2]),
        .clk(clk));
assign l2if_mecc1_en[3] = |(~dram_cpu_wr_en[3:2]) & (l2if_wr_b0_data_addr[5:2] == 4'h3);
assign l2if_data_mecc1_in[3] = ~dram_cpu_wr_en[3] & data_mecc1[3] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc13 (
        .din    (l2if_data_mecc1_in[3]),
        .q      (data_mecc1[3]),
	.rst_l	(rst_l),
	.en	(l2if_mecc1_en[3]),
        .clk(clk));
// ent2
assign l2if_mecc2_en[0] = |(~dram_cpu_wr_en[1:0]) & (l2if_wr_b0_data_addr[5:2] == 4'h4);
assign l2if_data_mecc2_in[0] = ~dram_cpu_wr_en[1] & data_mecc2[0] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc20 (
        .din    (l2if_data_mecc2_in[0]),
        .q      (data_mecc2[0]),
	.rst_l	(rst_l),
	.en	(l2if_mecc2_en[0]),
        .clk(clk));
assign l2if_mecc2_en[1] = |(~dram_cpu_wr_en[3:2]) & (l2if_wr_b0_data_addr[5:2] == 4'h4);
assign l2if_data_mecc2_in[1] = ~dram_cpu_wr_en[3] & data_mecc2[1] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc21 (
        .din    (l2if_data_mecc2_in[1]),
        .q      (data_mecc2[1]),
	.rst_l	(rst_l),
	.en	(l2if_mecc2_en[1]),
        .clk(clk));
assign l2if_mecc2_en[2] = |(~dram_cpu_wr_en[1:0]) & (l2if_wr_b0_data_addr[5:2] == 4'h5);
assign l2if_data_mecc2_in[2] = ~dram_cpu_wr_en[1] & data_mecc2[2] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc22 (
        .din    (l2if_data_mecc2_in[2]),
        .q      (data_mecc2[2]),
	.rst_l	(rst_l),
	.en	(l2if_mecc2_en[2]),
        .clk(clk));
assign l2if_mecc2_en[3] = |(~dram_cpu_wr_en[3:2]) & (l2if_wr_b0_data_addr[5:2] == 4'h5);
assign l2if_data_mecc2_in[3] = ~dram_cpu_wr_en[3] & data_mecc2[3] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc23 (
        .din    (l2if_data_mecc2_in[3]),
        .q      (data_mecc2[3]),
	.rst_l	(rst_l),
	.en	(l2if_mecc2_en[3]),
        .clk(clk));
// ent3
assign l2if_mecc3_en[0] = |(~dram_cpu_wr_en[1:0]) & (l2if_wr_b0_data_addr[5:2] == 4'h6);
assign l2if_data_mecc3_in[0] = ~dram_cpu_wr_en[1] & data_mecc3[0] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc30 (
        .din    (l2if_data_mecc3_in[0]),
        .q      (data_mecc3[0]),
	.rst_l	(rst_l),
	.en	(l2if_mecc3_en[0]),
        .clk(clk));
assign l2if_mecc3_en[1] = |(~dram_cpu_wr_en[3:2]) & (l2if_wr_b0_data_addr[5:2] == 4'h6);
assign l2if_data_mecc3_in[1] = ~dram_cpu_wr_en[3] & data_mecc3[1] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc31 (
        .din    (l2if_data_mecc3_in[1]),
        .q      (data_mecc3[1]),
	.rst_l	(rst_l),
	.en	(l2if_mecc3_en[1]),
        .clk(clk));
assign l2if_mecc3_en[2] = |(~dram_cpu_wr_en[1:0]) & (l2if_wr_b0_data_addr[5:2] == 4'h7);
assign l2if_data_mecc3_in[2] = ~dram_cpu_wr_en[1] & data_mecc3[2] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc32 (
        .din    (l2if_data_mecc3_in[2]),
        .q      (data_mecc3[2]),
	.rst_l	(rst_l),
	.en	(l2if_mecc3_en[2]),
        .clk(clk));
assign l2if_mecc3_en[3] = |(~dram_cpu_wr_en[3:2]) & (l2if_wr_b0_data_addr[5:2] == 4'h7);
assign l2if_data_mecc3_in[3] = ~dram_cpu_wr_en[3] & data_mecc3[3] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc33 (
        .din    (l2if_data_mecc3_in[3]),
        .q      (data_mecc3[3]),
	.rst_l	(rst_l),
	.en	(l2if_mecc3_en[3]),
        .clk(clk));
// ent4
assign l2if_mecc4_en[0] = |(~dram_cpu_wr_en[1:0]) & (l2if_wr_b0_data_addr[5:2] == 4'h8);
assign l2if_data_mecc4_in[0] = ~dram_cpu_wr_en[1] & data_mecc4[0] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc40 (
        .din    (l2if_data_mecc4_in[0]),
        .q      (data_mecc4[0]),
	.rst_l	(rst_l),
	.en	(l2if_mecc4_en[0]),
        .clk(clk));
assign l2if_mecc4_en[1] = |(~dram_cpu_wr_en[3:2]) & (l2if_wr_b0_data_addr[5:2] == 4'h8);
assign l2if_data_mecc4_in[1] = ~dram_cpu_wr_en[3] & data_mecc4[1] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc41 (
        .din    (l2if_data_mecc4_in[1]),
        .q      (data_mecc4[1]),
	.rst_l	(rst_l),
	.en	(l2if_mecc4_en[1]),
        .clk(clk));
assign l2if_mecc4_en[2] = |(~dram_cpu_wr_en[1:0]) & (l2if_wr_b0_data_addr[5:2] == 4'h9);
assign l2if_data_mecc4_in[2] = ~dram_cpu_wr_en[1] & data_mecc4[2] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc42 (
        .din    (l2if_data_mecc4_in[2]),
        .q      (data_mecc4[2]),
	.rst_l	(rst_l),
	.en	(l2if_mecc4_en[2]),
        .clk(clk));
assign l2if_mecc4_en[3] = |(~dram_cpu_wr_en[3:2]) & (l2if_wr_b0_data_addr[5:2] == 4'h9);
assign l2if_data_mecc4_in[3] = ~dram_cpu_wr_en[3] & data_mecc4[3] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc43 (
        .din    (l2if_data_mecc4_in[3]),
        .q      (data_mecc4[3]),
	.rst_l	(rst_l),
	.en	(l2if_mecc4_en[3]),
        .clk(clk));
// ent5
assign l2if_mecc5_en[0] = |(~dram_cpu_wr_en[1:0]) & (l2if_wr_b0_data_addr[5:2] == 4'ha);
assign l2if_data_mecc5_in[0] = ~dram_cpu_wr_en[1] & data_mecc5[0] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc50 (
        .din    (l2if_data_mecc5_in[0]),
        .q      (data_mecc5[0]),
	.rst_l	(rst_l),
	.en	(l2if_mecc5_en[0]),
        .clk(clk));
assign l2if_mecc5_en[1] = |(~dram_cpu_wr_en[3:2]) & (l2if_wr_b0_data_addr[5:2] == 4'ha);
assign l2if_data_mecc5_in[1] = ~dram_cpu_wr_en[3] & data_mecc5[1] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc51 (
        .din    (l2if_data_mecc5_in[1]),
        .q      (data_mecc5[1]),
	.rst_l	(rst_l),
	.en	(l2if_mecc5_en[1]),
        .clk(clk));
assign l2if_mecc5_en[2] = |(~dram_cpu_wr_en[1:0]) & (l2if_wr_b0_data_addr[5:2] == 4'hb);
assign l2if_data_mecc5_in[2] = ~dram_cpu_wr_en[1] & data_mecc5[2] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc52 (
        .din    (l2if_data_mecc5_in[2]),
        .q      (data_mecc5[2]),
	.rst_l	(rst_l),
	.en	(l2if_mecc5_en[2]),
        .clk(clk));
assign l2if_mecc5_en[3] = |(~dram_cpu_wr_en[3:2]) & (l2if_wr_b0_data_addr[5:2] == 4'hb);
assign l2if_data_mecc5_in[3] = ~dram_cpu_wr_en[3] & data_mecc5[3] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc53 (
        .din    (l2if_data_mecc5_in[3]),
        .q      (data_mecc5[3]),
	.rst_l	(rst_l),
	.en	(l2if_mecc5_en[3]),
        .clk(clk));
// ent6
assign l2if_mecc6_en[0] = |(~dram_cpu_wr_en[1:0]) & (l2if_wr_b0_data_addr[5:2] == 4'hc);
assign l2if_data_mecc6_in[0] = ~dram_cpu_wr_en[1] & data_mecc6[0] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc60 (
        .din    (l2if_data_mecc6_in[0]),
        .q      (data_mecc6[0]),
	.rst_l	(rst_l),
	.en	(l2if_mecc6_en[0]),
        .clk(clk));
assign l2if_mecc6_en[1] = |(~dram_cpu_wr_en[3:2]) & (l2if_wr_b0_data_addr[5:2] == 4'hc);
assign l2if_data_mecc6_in[1] = ~dram_cpu_wr_en[3] & data_mecc6[1] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc61 (
        .din    (l2if_data_mecc6_in[1]),
        .q      (data_mecc6[1]),
	.rst_l	(rst_l),
	.en	(l2if_mecc6_en[1]),
        .clk(clk));
assign l2if_mecc6_en[2] = |(~dram_cpu_wr_en[1:0]) & (l2if_wr_b0_data_addr[5:2] == 4'hd);
assign l2if_data_mecc6_in[2] = ~dram_cpu_wr_en[1] & data_mecc6[2] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc62 (
        .din    (l2if_data_mecc6_in[2]),
        .q      (data_mecc6[2]),
	.rst_l	(rst_l),
	.en	(l2if_mecc6_en[2]),
        .clk(clk));
assign l2if_mecc6_en[3] = |(~dram_cpu_wr_en[3:2]) & (l2if_wr_b0_data_addr[5:2] == 4'hd);
assign l2if_data_mecc6_in[3] = ~dram_cpu_wr_en[3] & data_mecc6[3] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc63 (
        .din    (l2if_data_mecc6_in[3]),
        .q      (data_mecc6[3]),
	.rst_l	(rst_l),
	.en	(l2if_mecc6_en[3]),
        .clk(clk));
// ent7
assign l2if_mecc7_en[0] = |(~dram_cpu_wr_en[1:0]) & (l2if_wr_b0_data_addr[5:2] == 4'he);
assign l2if_data_mecc7_in[0] = ~dram_cpu_wr_en[1] & data_mecc7[0] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc70 (
        .din    (l2if_data_mecc7_in[0]),
        .q      (data_mecc7[0]),
	.rst_l	(rst_l),
	.en	(l2if_mecc7_en[0]),
        .clk(clk));
assign l2if_mecc7_en[1] = |(~dram_cpu_wr_en[3:2]) & (l2if_wr_b0_data_addr[5:2] == 4'he);
assign l2if_data_mecc7_in[1] = ~dram_cpu_wr_en[3] & data_mecc7[1] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc71 (
        .din    (l2if_data_mecc7_in[1]),
        .q      (data_mecc7[1]),
	.rst_l	(rst_l),
	.en	(l2if_mecc7_en[1]),
        .clk(clk));
assign l2if_mecc7_en[2] = |(~dram_cpu_wr_en[1:0]) & (l2if_wr_b0_data_addr[5:2] == 4'hf);
assign l2if_data_mecc7_in[2] = ~dram_cpu_wr_en[1] & data_mecc7[2] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc72 (
        .din    (l2if_data_mecc7_in[2]),
        .q      (data_mecc7[2]),
	.rst_l	(rst_l),
	.en	(l2if_mecc7_en[2]),
        .clk(clk));
assign l2if_mecc7_en[3] = |(~dram_cpu_wr_en[3:2]) & (l2if_wr_b0_data_addr[5:2] == 4'hf);
assign l2if_data_mecc7_in[3] = ~dram_cpu_wr_en[3] & data_mecc7[3] | l2if_dram_data_mecc;
dffrle_ns #(1) l2_mecc73 (
        .din    (l2if_data_mecc7_in[3]),
        .q      (data_mecc7[3]),
	.rst_l	(rst_l),
	.en	(l2if_mecc7_en[3]),
        .clk(clk));
// DRAM ERROR STATUS REGISTER WRITE
wire		l2if_err_sts_reg_en6;
wire		l2if_err_sts_reg_en5;
wire		l2if_err_sts_reg_en4;
wire		l2if_err_sts_reg_en3;
wire		l2if_err_sts_reg_en2;
wire		l2if_err_sts_reg_en1;
wire		l2if_err_sts_reg_en0;
wire		l2if_err_sts_reg_en;
wire [22:0]	l2if_err_sts_reg_in;
// Because the data valid is three cycles ahead of data the valid is
// needed to be staged two more cyle.
dff_ns #(1) ff_sctag_data_vld_d1(
        	.din(dram_sctag_data_vld),
        	.q(dram_sctag_data_vld_d1),
        	.clk(clk));
dff_ns #(1) ff_sctag_data_vld_d2(
        	.din(dram_sctag_data_vld_d1),
        	.q(dram_sctag_data_vld_d2),
        	.clk(clk));
dff_ns #(6) ff_data_cnt_d1(
        .din({l2if_data_cnt[1:0], l2if_data_cnt_d1[1:0], l2if_data_cnt_d2[1:0]}),
        .q({l2if_data_cnt_d1[1:0], l2if_data_cnt_d2[1:0], l2if_data_cnt_d3[1:0]}),
        .clk(clk));
// Multiple uncorrected errors
// If s/w write and error occurs in same cycle h/w update has priority.
assign l2if_err_sts_reg_en6 = (err_sts_reg[19] | err_sts_reg[17]) &
				(l2if_scrb_data_val | dram_sctag_data_vld_d2) &
				(l2if_mecc_err_partial & ~l2if_pa_err) |
				l2if_ucb_wr_req_vld & (l2if_ucb_addr == 32'h280);
assign l2if_err_sts_reg_in[22] = (err_sts_reg[19] | err_sts_reg[17]) &
					(l2if_mecc_err_partial & ~l2if_pa_err) ?
					1'b1 : ~l2if_ucb_data[63] & err_sts_reg[22];
dffe_ns #(1)      ff_err_sts_bit40(
                .din(l2if_err_sts_reg_in[22]),
                .q(err_sts_reg[22]),
                .en(l2if_err_sts_reg_en6),
                .clk(clk));
// Multiple corrected errors
assign l2if_err_sts_reg_en5 = (err_sts_reg[20] | err_sts_reg[18]) &
				(l2if_scrb_data_val | dram_sctag_data_vld_d2) &
				(l2if_secc_err) |
				l2if_ucb_wr_req_vld & (l2if_ucb_addr == 32'h280);
assign l2if_err_sts_reg_in[21] = (err_sts_reg[20] | err_sts_reg[18]) & (l2if_secc_err) ?
					1'b1 : ~l2if_ucb_data[62] & err_sts_reg[21];
dffe_ns #(1)      ff_err_sts_bit39(
                .din(l2if_err_sts_reg_in[21]),
                .q(err_sts_reg[21]),
                .en(l2if_err_sts_reg_en5),
                .clk(clk));
// DRAM access correctable error
assign l2if_err_sts_reg_en4 = dram_sctag_data_vld_d2 & ~err_sts_reg[20] & (l2if_secc_err) |
				l2if_ucb_wr_req_vld & (l2if_ucb_addr == 32'h280);
assign l2if_err_sts_reg_in[20] = dram_sctag_data_vld_d2 & ~err_sts_reg[20] & (l2if_secc_err) ?
					1'b1 : ~l2if_ucb_data[61] & err_sts_reg[20];
dffe_ns #(1)      ff_err_sts_bit37(
                .din(l2if_err_sts_reg_in[20]),
                .q(err_sts_reg[20]),
                .en(l2if_err_sts_reg_en4),
                .clk(clk));
// DRAM access uncorrectable error
assign l2if_err_sts_reg_en3 = dram_sctag_data_vld_d2 & ~err_sts_reg[19] &
				(l2if_mecc_err_partial & ~l2if_pa_err) |
				l2if_ucb_wr_req_vld & (l2if_ucb_addr == 32'h280);
assign l2if_err_sts_reg_in[19] = dram_sctag_data_vld_d2 & ~err_sts_reg[19] &
					(l2if_mecc_err_partial & ~l2if_pa_err) ? 1'b1 :
					~l2if_ucb_data[60] & err_sts_reg[19];
dffe_ns #(1)      ff_err_sts_bit36(
                .din(l2if_err_sts_reg_in[19]),
                .q(err_sts_reg[19]),
                .en(l2if_err_sts_reg_en3),
                .clk(clk));
// Scrub access correctable error
assign l2if_err_sts_reg_en2 = l2if_scrb_data_val & ~err_sts_reg[18] & (l2if_secc_err) |
				l2if_ucb_wr_req_vld & (l2if_ucb_addr == 32'h280);
assign l2if_err_sts_reg_in[18] = l2if_scrb_data_val & ~err_sts_reg[18] & (l2if_secc_err) ?
					1'b1 : ~l2if_ucb_data[59] & err_sts_reg[18];
dffe_ns #(1)      ff_err_sts_bit33(
                .din(l2if_err_sts_reg_in[18]),
                .q(err_sts_reg[18]),
                .en(l2if_err_sts_reg_en2),
                .clk(clk));
// Scrub access uncorrectable error
assign l2if_err_sts_reg_en1 = l2if_scrb_data_val & ~err_sts_reg[17] & (l2if_mecc_err_partial & ~l2if_pa_err) |
				l2if_ucb_wr_req_vld & (l2if_ucb_addr == 32'h280);
assign l2if_err_sts_reg_in[17] = l2if_scrb_data_val & ~err_sts_reg[17] & (l2if_mecc_err_partial & ~l2if_pa_err) ?
				1'b1 : ~l2if_ucb_data[58] & err_sts_reg[17];
dffe_ns #(1)      ff_err_sts_bit32(
                .din(l2if_err_sts_reg_in[17]),
                .q(err_sts_reg[17]),
                .en(l2if_err_sts_reg_en1),
                .clk(clk));
// OUT of BOUND PA error
assign l2if_err_sts_reg_en = dram_sctag_data_vld_d2 & l2if_pa_err | l2if_ucb_wr_req_vld & (l2if_ucb_addr == 32'h280);
assign l2if_err_sts_reg_in[16] = dram_sctag_data_vld_d2 & l2if_pa_err ? 1'b1 : ~l2if_ucb_data[57] & err_sts_reg[16];
dffe_ns #(1)      ff_err_sts_bit31(
                .din(l2if_err_sts_reg_in[16]),
                .q(err_sts_reg[16]),
                .en(l2if_err_sts_reg_en),
                .clk(clk));
// stage ecc with error signals to capture
dff_ns #(32)      ff_ecc_d2(
                .din(l2if_rd_ecc_d1[31:0]),
                .q(l2if_rd_ecc_d2[31:0]),
                .clk(clk));
dff_ns #(32)    ff_ecc_d3(
                .din(l2if_rd_ecc_d2[31:0]),
                .q(l2if_rd_ecc_d3[31:0]),
                .clk(clk));
// set it only if there is no prior uncorrectable error and a new uncorrectable one happens
// OR no prior uncorrectable and no prior correctable and new correctable happens
assign l2if_err_sts_reg_en0 = ((~(err_sts_reg[17] | err_sts_reg[19]) & l2if_mecc_err_partial & ~l2if_pa_err &
				(l2if_scrb_data_val | dram_sctag_data_vld_d2)) |
			(~(err_sts_reg[17] | err_sts_reg[18] | err_sts_reg[19] | err_sts_reg[20]) &
			l2if_secc_err & (l2if_scrb_data_val | dram_sctag_data_vld_d2))) |
			l2if_ucb_wr_req_vld & (l2if_ucb_addr == 32'h280);
assign l2if_err_sts_reg_in[15:0] = l2if_channel_disabled & other_ch_dp_data_valid_d2 ?
                        ch0_err_syn_d1 : ( (~(err_sts_reg[17] | err_sts_reg[19]) &
			(l2if_mecc_err_partial & ~l2if_pa_err)) | (~(err_sts_reg[17] | err_sts_reg[18] |
			err_sts_reg[19] | err_sts_reg[20]) & l2if_secc_err)) ?
			(l2if_data_first_chunk ? l2if_rd_ecc_d3[31:16] : l2if_rd_ecc_d3[15:0]) :
				l2if_ucb_data[15:0];
assign err_syn = l2if_data_first_chunk ? l2if_rd_ecc_d3[31:16] : l2if_rd_ecc_d3[15:0];
dffe_ns #(16)   ff_err_syn(
                .din(l2if_err_sts_reg_in[15:0]),
                .q(err_sts_reg[15:0]),
                .en(l2if_err_sts_reg_en0),
                .clk(clk));
// DRAM ERROR ADDRESS REGISTER WRITE
wire [35:0]	l2if_err_addr_reg_in;
// This address reg can only have scrub address as load address is not kept.
wire l2if_err_addr_reg_en = l2if_scrb_data_val & (l2if_mecc_err_partial & ~l2if_pa_err | l2if_secc_err) &
				~(err_sts_reg[18] | err_sts_reg[17]) |
				l2if_ucb_wr_req_vld & (l2if_ucb_addr == 32'h288);
assign l2if_err_addr_reg_in = l2if_scrb_data_val & (l2if_mecc_err_partial & ~l2if_pa_err | l2if_secc_err) ?
		{3'h0, l2if_scrb_addr[32:2], l2if_data_cnt_d3[1:0]} : l2if_ucb_data[39:4];
dffe_ns #(36)   ff_err_addr_reg(
                .din(l2if_err_addr_reg_in[35:0]),
                .q(err_addr_reg[35:0]),
                .en(l2if_err_addr_reg_en),
                .clk(clk));
// SECC ERROR COUNTER
wire [15:0]	l2if_secc_cnt_in;
// interrupt enable bit - cleared @ reset and also at every error. S/W has to enable.
wire l2if_secc_int_en = l2if_ucb_wr_req_vld & (l2if_ucb_addr == 32'h298);
wire l2if_secc_int_in = l2if_ucb_data[17];
dffrle_ns #(1)  ff_secc_int_en(
                .din(l2if_secc_int_in),
                .q(l2if_secc_int_enabled),
                .en(l2if_secc_int_en),
                .rst_l(rst_l),
                .clk(clk));
// counter valid
wire l2if_secc_vld_en = l2if_ucb_wr_req_vld & (l2if_ucb_addr == 32'h298);
wire l2if_secc_vld_in = l2if_ucb_data[16];
wire l2if_secc_vld_rst_l = rst_l & ~(l2if_secc_vld & l2if_jbus_tx_sync & ~(|l2if_secc_cnt[15:0]));
dffrle_ns #(1)    ff_secc_vld(
                .din(l2if_secc_vld_in),
                .q(l2if_secc_vld),
                .en(l2if_secc_vld_en),
                .rst_l(l2if_secc_vld_rst_l),
                .clk(clk));
// counter value
assign l2if_secc_cnt_in = l2if_secc_err ? ((l2if_secc_cnt != 16'h0) ? (l2if_secc_cnt - 16'h1) :
				l2if_secc_cnt) : l2if_ucb_data[15:0];
wire l2if_secc_cnt_en = l2if_ucb_wr_req_vld & (l2if_ucb_addr == 32'h298) | (l2if_secc_err &
				(l2if_scrb_data_val | dram_sctag_data_vld_d2) & l2if_secc_vld);
dffe_ns #(16)   ff_secc_cnt(
                .din(l2if_secc_cnt_in),
                .q(l2if_secc_cnt),
                .en(l2if_secc_cnt_en),
                .clk(clk));
assign l2if_secc_cnt_intr = l2if_secc_int_enabled & l2if_secc_vld & ~(|l2if_secc_cnt[15:0]);
// SECC DEBUG TRIGGER ENABLE REGISTER
wire l2if_dbg_trig_in = ~rst_l ? l2if_dbg_trig :
			l2if_secc_trig ? 1'b0 :
			l2if_ucb_wr_req_vld & (l2if_ucb_addr == 32'h230) ? l2if_ucb_data[2] :
			l2if_dbg_trig;
dffrl_async_ns #(1)  ff_dbg_trig(
                .din(l2if_dbg_trig_in),
                .q(l2if_dbg_trig),
                .rst_l(arst_l),
                .clk(clk));
assign l2if_secc_trig = l2if_dbg_trig & ~(|l2if_secc_cnt[15:0]);
// SECC ERROR LOCATION
// The interpretation of the parity is as following ecc[15:0] = {p0,p1,p2,p3} where p3 is not used
// failover mode.
// The error location is as = {err_in_p3, err_in_p2, ... err_in_d2, err_in_d1, err_in_d0}
// If the error location bit is 1, and to create mask in failover mode set all the bits left of 1 to 1
// (including the bit 1 set in err location) upto bit location 34.
// Also this error location once logged will not be over written when another error occurs till S/W
// resets.
wire [35:0]	l2if_secc_loc_in;
wire l2if_secc_loc_en = l2if_err_sts_reg_en2 & ~err_sts_reg[20] | l2if_err_sts_reg_en4 & ~err_sts_reg[18];
assign l2if_secc_loc_in = l2if_channel_disabled & other_ch_dp_data_valid_d2 ?
                        ch0_err_loc_d1 : l2if_data_first_chunk ? ecc_loc_hi_d1[35:0] : ecc_loc_lo_d1[35:0];
assign err_loc = l2if_data_first_chunk ? ecc_loc_hi_d1[35:0] : ecc_loc_lo_d1[35:0];
dffe_ns #(36)   ff_secc_loc(
                .din(l2if_secc_loc_in),
                .q(l2if_secc_loc),
                .en(l2if_secc_loc_en),
                .clk(clk));
// Asserting scrub ecc error to L2 cache
// use aligned scrub data valid with mecc error as l2if_srb_val three cycle off with ecc.
// Could have used l2if_scrb_val_d3 but its longer than 2 cycles till sync pulse is asserted.
dffrl_ns #(1) ff_scrb_data_en(
         .din(l2if_scrb_val_d2),
         .q(l2if_scrb_data_val),
         .rst_l(rst_l),
         .clk(clk));
wire l2if_scb_mecc_err = l2if_scrb_data_val & l2if_mecc_err_partial & ~l2if_pa_err;
wire l2if_scb_secc_err = l2if_scrb_data_val & l2if_secc_err;
dffrl_ns #(1)   ff_l2if_scrb_mecc_err(
                .din(l2if_scb_mecc_err),
                .q(dram_sctag_scb_mecc_err),
		.rst_l(rst_l),
                .clk(clk));
dffrl_ns #(1)   ff_l2if_scrb_secc_err(
                .din(l2if_scb_secc_err),
                .q(dram_sctag_scb_secc_err),
		.rst_l(rst_l),
                .clk(clk));
endmodule