module  alt_mem_ddrx_ecc_decoder_32_altecc_decoder
	(
	clk,
	reset_n,
	data,
	err_corrected,
	err_detected,
	err_fatal,
	err_sbe,
	q) /* synthesis synthesis_clearbox=1 */;
	parameter CFG_ECC_DECODER_REG = 0;
	input			clk;
	input			reset_n;
	input   [38:0]  data;
	output   err_corrected;
	output   err_detected;
	output   err_fatal;
	output   err_sbe;
	output   [31:0]  q;
	wire  [63:0]   wire_error_bit_decoder_eq;
	wire	wire_mux21_0_dataout;
	wire	wire_mux21_1_dataout;
	wire	wire_mux21_10_dataout;
	wire	wire_mux21_11_dataout;
	wire	wire_mux21_12_dataout;
	wire	wire_mux21_13_dataout;
	wire	wire_mux21_14_dataout;
	wire	wire_mux21_15_dataout;
	wire	wire_mux21_16_dataout;
	wire	wire_mux21_17_dataout;
	wire	wire_mux21_18_dataout;
	wire	wire_mux21_19_dataout;
	wire	wire_mux21_2_dataout;
	wire	wire_mux21_20_dataout;
	wire	wire_mux21_21_dataout;
	wire	wire_mux21_22_dataout;
	wire	wire_mux21_23_dataout;
	wire	wire_mux21_24_dataout;
	wire	wire_mux21_25_dataout;
	wire	wire_mux21_26_dataout;
	wire	wire_mux21_27_dataout;
	wire	wire_mux21_28_dataout;
	wire	wire_mux21_29_dataout;
	wire	wire_mux21_3_dataout;
	wire	wire_mux21_30_dataout;
	wire	wire_mux21_31_dataout;
	wire	wire_mux21_4_dataout;
	wire	wire_mux21_5_dataout;
	wire	wire_mux21_6_dataout;
	wire	wire_mux21_7_dataout;
	wire	wire_mux21_8_dataout;
	wire	wire_mux21_9_dataout;
	wire  data_bit;
	wire  [31:0]  data_t;
	wire  [38:0]  data_wire;
	wire  [63:0]  decode_output;
	wire  err_corrected_wire;
	wire  err_detected_wire;
	wire  err_fatal_wire;
	wire  [18:0]  parity_01_wire;
	wire  [9:0]  parity_02_wire;
	wire  [4:0]  parity_03_wire;
	wire  [1:0]  parity_04_wire;
	wire  [0:0]  parity_05_wire;
	wire  [5:0]  parity_06_wire;
	wire  parity_bit;
	wire  [37:0]  parity_final_wire;
	wire  [5:0]  parity_t;
	wire  [31:0]  q_wire;
	wire  syn_bit;
	wire  syn_e;
	wire  [4:0]  syn_t;
	wire  [6:0]  syndrome_wire;
	reg   [6:0]  syndrome;
	reg	  [38:0] data_reg;
	generate
		if (CFG_ECC_DECODER_REG == 1)
		begin
			always @ (posedge clk or negedge reset_n)
			begin
				if (!reset_n)
				begin
					syndrome	<= {7{1'b0}};
					data_reg	<= {39{1'b0}};
				end else
				begin
					syndrome	<= syndrome_wire;
					data_reg	<= data_wire;
				end
			end
		end else
		begin
			always @ (*)
			begin
				syndrome	= syndrome_wire;
				data_reg	= data_wire;
			end
		end
	endgenerate
	alt_mem_ddrx_ecc_decoder_32_decode   error_bit_decoder
	(
	.data(syndrome[5:0]),
	.eq(wire_error_bit_decoder_eq));
	assign		wire_mux21_0_dataout = (syndrome[6] == 1'b1) ? (decode_output[3] ^ data_reg[0]) : data_reg[0];
	assign		wire_mux21_1_dataout = (syndrome[6] == 1'b1) ? (decode_output[5] ^ data_reg[1]) : data_reg[1];
	assign		wire_mux21_10_dataout = (syndrome[6] == 1'b1) ? (decode_output[15] ^ data_reg[10]) : data_reg[10];
	assign		wire_mux21_11_dataout = (syndrome[6] == 1'b1) ? (decode_output[17] ^ data_reg[11]) : data_reg[11];
	assign		wire_mux21_12_dataout = (syndrome[6] == 1'b1) ? (decode_output[18] ^ data_reg[12]) : data_reg[12];
	assign		wire_mux21_13_dataout = (syndrome[6] == 1'b1) ? (decode_output[19] ^ data_reg[13]) : data_reg[13];
	assign		wire_mux21_14_dataout = (syndrome[6] == 1'b1) ? (decode_output[20] ^ data_reg[14]) : data_reg[14];
	assign		wire_mux21_15_dataout = (syndrome[6] == 1'b1) ? (decode_output[21] ^ data_reg[15]) : data_reg[15];
	assign		wire_mux21_16_dataout = (syndrome[6] == 1'b1) ? (decode_output[22] ^ data_reg[16]) : data_reg[16];
	assign		wire_mux21_17_dataout = (syndrome[6] == 1'b1) ? (decode_output[23] ^ data_reg[17]) : data_reg[17];
	assign		wire_mux21_18_dataout = (syndrome[6] == 1'b1) ? (decode_output[24] ^ data_reg[18]) : data_reg[18];
	assign		wire_mux21_19_dataout = (syndrome[6] == 1'b1) ? (decode_output[25] ^ data_reg[19]) : data_reg[19];
	assign		wire_mux21_2_dataout = (syndrome[6] == 1'b1) ? (decode_output[6] ^ data_reg[2]) : data_reg[2];
	assign		wire_mux21_20_dataout = (syndrome[6] == 1'b1) ? (decode_output[26] ^ data_reg[20]) : data_reg[20];
	assign		wire_mux21_21_dataout = (syndrome[6] == 1'b1) ? (decode_output[27] ^ data_reg[21]) : data_reg[21];
	assign		wire_mux21_22_dataout = (syndrome[6] == 1'b1) ? (decode_output[28] ^ data_reg[22]) : data_reg[22];
	assign		wire_mux21_23_dataout = (syndrome[6] == 1'b1) ? (decode_output[29] ^ data_reg[23]) : data_reg[23];
	assign		wire_mux21_24_dataout = (syndrome[6] == 1'b1) ? (decode_output[30] ^ data_reg[24]) : data_reg[24];
	assign		wire_mux21_25_dataout = (syndrome[6] == 1'b1) ? (decode_output[31] ^ data_reg[25]) : data_reg[25];
	assign		wire_mux21_26_dataout = (syndrome[6] == 1'b1) ? (decode_output[33] ^ data_reg[26]) : data_reg[26];
	assign		wire_mux21_27_dataout = (syndrome[6] == 1'b1) ? (decode_output[34] ^ data_reg[27]) : data_reg[27];
	assign		wire_mux21_28_dataout = (syndrome[6] == 1'b1) ? (decode_output[35] ^ data_reg[28]) : data_reg[28];
	assign		wire_mux21_29_dataout = (syndrome[6] == 1'b1) ? (decode_output[36] ^ data_reg[29]) : data_reg[29];
	assign		wire_mux21_3_dataout = (syndrome[6] == 1'b1) ? (decode_output[7] ^ data_reg[3]) : data_reg[3];
	assign		wire_mux21_30_dataout = (syndrome[6] == 1'b1) ? (decode_output[37] ^ data_reg[30]) : data_reg[30];
	assign		wire_mux21_31_dataout = (syndrome[6] == 1'b1) ? (decode_output[38] ^ data_reg[31]) : data_reg[31];
	assign		wire_mux21_4_dataout = (syndrome[6] == 1'b1) ? (decode_output[9] ^ data_reg[4]) : data_reg[4];
	assign		wire_mux21_5_dataout = (syndrome[6] == 1'b1) ? (decode_output[10] ^ data_reg[5]) : data_reg[5];
	assign		wire_mux21_6_dataout = (syndrome[6] == 1'b1) ? (decode_output[11] ^ data_reg[6]) : data_reg[6];
	assign		wire_mux21_7_dataout = (syndrome[6] == 1'b1) ? (decode_output[12] ^ data_reg[7]) : data_reg[7];
	assign		wire_mux21_8_dataout = (syndrome[6] == 1'b1) ? (decode_output[13] ^ data_reg[8]) : data_reg[8];
	assign		wire_mux21_9_dataout = (syndrome[6] == 1'b1) ? (decode_output[14] ^ data_reg[9]) : data_reg[9];
	assign
		data_bit = data_t[31],
		data_t = {(data_t[30] | decode_output[38]), (data_t[29] | decode_output[37]), (data_t[28] | decode_output[36]), (data_t[27] | decode_output[35]), (data_t[26] | decode_output[34]), (data_t[25] | decode_output[33]), (data_t[24] | decode_output[31]), (data_t[23] | decode_output[30]), (data_t[22] | decode_output[29]), (data_t[21] | decode_output[28]), (data_t[20] | decode_output[27]), (data_t[19] | decode_output[26]), (data_t[18] | decode_output[25]), (data_t[17] | decode_output[24]), (data_t[16] | decode_output[23]), (data_t[15] | decode_output[22]), (data_t[14] | decode_output[21]), (data_t[13] | decode_output[20]), (data_t[12] | decode_output[19]), (data_t[11] | decode_output[18]), (data_t[10] | decode_output[17]), (data_t[9] | decode_output[15]), (data_t[8] | decode_output[14]), (data_t[7] | decode_output[13]), (data_t[6] | decode_output[12]), (data_t[5] | decode_output[11]), (data_t[4] | decode_output[10]), (data_t[3] | decode_output[9]), (data_t[2] | decode_output[7]), (data_t[1] | decode_output[6]), (data_t[0] | decode_output[5]), decode_output[3]},
		data_wire = data,
		decode_output = wire_error_bit_decoder_eq,
		err_corrected = err_corrected_wire,
		err_corrected_wire = ((syn_bit & syn_e) & data_bit),
		err_detected = err_detected_wire,
		err_detected_wire = (syn_bit & (~ (syn_e & parity_bit))),
		err_fatal = err_fatal_wire,
		err_sbe = syn_e,
		err_fatal_wire = (err_detected_wire & (~ err_corrected_wire)),
		parity_01_wire = {(data_wire[30] ^ parity_01_wire[17]), (data_wire[28] ^ parity_01_wire[16]), (data_wire[26] ^ parity_01_wire[15]), (data_wire[25] ^ parity_01_wire[14]), (data_wire[23] ^ parity_01_wire[13]), (data_wire[21] ^ parity_01_wire[12]), (data_wire[19] ^ parity_01_wire[11]), (data_wire[17] ^ parity_01_wire[10]), (data_wire[15] ^ parity_01_wire[9]), (data_wire[13] ^ parity_01_wire[8]), (data_wire[11] ^ parity_01_wire[7]), (data_wire[10] ^ parity_01_wire[6]), (data_wire[8] ^ parity_01_wire[5]), (data_wire[6] ^ parity_01_wire[4]), (data_wire[4] ^ parity_01_wire[3]), (data_wire[3] ^ parity_01_wire[2]), (data_wire[1] ^ parity_01_wire[1]), (data_wire[0] ^ parity_01_wire[0]), data_wire[32]},
		parity_02_wire = {(data_wire[31] ^ parity_02_wire[8]), ((data_wire[27] ^ data_wire[28]) ^ parity_02_wire[7]), ((data_wire[24] ^ data_wire[25]) ^ parity_02_wire[6]), ((data_wire[20] ^ data_wire[21]) ^ parity_02_wire[5]), ((data_wire[16] ^ data_wire[17]) ^ parity_02_wire[4]), ((data_wire[12] ^ data_wire[13]) ^ parity_02_wire[3]), ((data_wire[9] ^ data_wire[10]) ^ parity_02_wire[2]), ((data_wire[5] ^ data_wire[6]) ^ parity_02_wire[1]), ((data_wire[2] ^ data_wire[3]) ^ parity_02_wire[0]), (data_wire[33] ^ data_wire[0])},
		parity_03_wire = {(((data_wire[29] ^ data_wire[30]) ^ data_wire[31]) ^ parity_03_wire[3]), ((((data_wire[22] ^ data_wire[23]) ^ data_wire[24]) ^ data_wire[25]) ^ parity_03_wire[2]), ((((data_wire[14] ^ data_wire[15]) ^ data_wire[16]) ^ data_wire[17]) ^ parity_03_wire[1]), ((((data_wire[7] ^ data_wire[8]) ^ data_wire[9]) ^ data_wire[10]) ^ parity_03_wire[0]), (((data_wire[34] ^ data_wire[1]) ^ data_wire[2]) ^ data_wire[3])},
		parity_04_wire = {((((((((data_wire[18] ^ data_wire[19]) ^ data_wire[20]) ^ data_wire[21]) ^ data_wire[22]) ^ data_wire[23]) ^ data_wire[24]) ^ data_wire[25]) ^ parity_04_wire[0]), (((((((data_wire[35] ^ data_wire[4]) ^ data_wire[5]) ^ data_wire[6]) ^ data_wire[7]) ^ data_wire[8]) ^ data_wire[9]) ^ data_wire[10])},
		parity_05_wire = {(((((((((((((((data_wire[36] ^ data_wire[11]) ^ data_wire[12]) ^ data_wire[13]) ^ data_wire[14]) ^ data_wire[15]) ^ data_wire[16]) ^ data_wire[17]) ^ data_wire[18]) ^ data_wire[19]) ^ data_wire[20]) ^ data_wire[21]) ^ data_wire[22]) ^ data_wire[23]) ^ data_wire[24]) ^ data_wire[25])},
		parity_06_wire = {(data_wire[31] ^ parity_06_wire[4]), (data_wire[30] ^ parity_06_wire[3]), (data_wire[29] ^ parity_06_wire[2]), (data_wire[28] ^ parity_06_wire[1]), (data_wire[27] ^ parity_06_wire[0]), (data_wire[37] ^ data_wire[26])},
		parity_bit = parity_t[5],
		parity_final_wire = {(data_wire[37] ^ parity_final_wire[36]), (data_wire[36] ^ parity_final_wire[35]), (data_wire[35] ^ parity_final_wire[34]), (data_wire[34] ^ parity_final_wire[33]), (data_wire[33] ^ parity_final_wire[32]), (data_wire[32] ^ parity_final_wire[31]), (data_wire[31] ^ parity_final_wire[30]), (data_wire[30] ^ parity_final_wire[29]), (data_wire[29] ^ parity_final_wire[28]), (data_wire[28] ^ parity_final_wire[27]), (data_wire[27] ^ parity_final_wire[26]), (data_wire[26] ^ parity_final_wire[25]), (data_wire[25] ^ parity_final_wire[24]), (data_wire[24] ^ parity_final_wire[23]), (data_wire[23] ^ parity_final_wire[22]), (data_wire[22] ^ parity_final_wire[21]), (data_wire[21] ^ parity_final_wire[20]), (data_wire[20] ^ parity_final_wire[19]), (data_wire[19] ^ parity_final_wire[18]), (data_wire[18] ^ parity_final_wire[17]), (data_wire[17] ^ parity_final_wire[16]), (data_wire[16] ^ parity_final_wire[15]), (data_wire[15] ^ parity_final_wire[14]), (data_wire[14] ^ parity_final_wire[13]), (data_wire[13] ^ parity_final_wire[12]), (data_wire[12] ^ parity_final_wire[11]), (data_wire[11] ^ parity_final_wire[10]), (data_wire[10] ^ parity_final_wire[9]), (data_wire[9] ^ parity_final_wire[8]), (data_wire[8] ^ parity_final_wire[7]), (data_wire[7] ^ parity_final_wire[6]), (data_wire[6] ^ parity_final_wire[5]), (data_wire[5] ^ parity_final_wire[4]), (data_wire[4] ^ parity_final_wire[3]), (data_wire[3] ^ parity_final_wire[2]), (data_wire[2] ^ parity_final_wire[1]), (data_wire[1] ^ parity_final_wire[0]), (data_wire[38] ^ data_wire[0])},
		parity_t = {(parity_t[4] | decode_output[32]), (parity_t[3] | decode_output[16]), (parity_t[2] | decode_output[8]), (parity_t[1] | decode_output[4]), (parity_t[0] | decode_output[2]), decode_output[1]},
		q = q_wire,
		q_wire = {wire_mux21_31_dataout, wire_mux21_30_dataout, wire_mux21_29_dataout, wire_mux21_28_dataout, wire_mux21_27_dataout, wire_mux21_26_dataout, wire_mux21_25_dataout, wire_mux21_24_dataout, wire_mux21_23_dataout, wire_mux21_22_dataout, wire_mux21_21_dataout, wire_mux21_20_dataout, wire_mux21_19_dataout, wire_mux21_18_dataout, wire_mux21_17_dataout, wire_mux21_16_dataout, wire_mux21_15_dataout, wire_mux21_14_dataout, wire_mux21_13_dataout, wire_mux21_12_dataout, wire_mux21_11_dataout, wire_mux21_10_dataout, wire_mux21_9_dataout, wire_mux21_8_dataout, wire_mux21_7_dataout, wire_mux21_6_dataout, wire_mux21_5_dataout, wire_mux21_4_dataout, wire_mux21_3_dataout, wire_mux21_2_dataout, wire_mux21_1_dataout, wire_mux21_0_dataout},
		syn_bit = syn_t[4],
		syn_e = syndrome[6],
		syn_t = {(syn_t[3] | syndrome[5]), (syn_t[2] | syndrome[4]), (syn_t[1] | syndrome[3]), (syn_t[0] | syndrome[2]), (syndrome[0] | syndrome[1])},
		syndrome_wire = {parity_final_wire[37], parity_06_wire[5], parity_05_wire[0], parity_04_wire[1], parity_03_wire[4], parity_02_wire[9], parity_01_wire[18]};
endmodule