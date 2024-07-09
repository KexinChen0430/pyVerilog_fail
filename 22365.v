module aurora_64b66b_25p4G_common_reset_cbcc
 (
  input enchansync,
  input chan_bond_reset,
  input reset,
  input rd_clk,
  input init_clk,
  input cb_bit_err,
  input user_clk,
  output reg cbcc_fifo_reset_wr_clk,
  output cbcc_fifo_reset_to_fifo_wr_clk,
  output reg cbcc_data_srst = 1'b0,
  output reg cbcc_fifo_reset_rd_clk,
  output cbcc_fifo_reset_to_fifo_rd_clk,
  output cbcc_only_reset_rd_clk,
(* shift_extract = "{no}" *) output reg   cbcc_reset_cbstg2_rd_clk
 );
aurora_64b66b_25p4G_rst_sync u_rst_sync_cbcc_only_reset_rd_clk
(
    .prmry_in    ( reset                      ),
    .scndry_aclk ( rd_clk                     ),
    .scndry_out  ( cbcc_only_reset_rd_clk     )
);
 wire    fifo_reset_wr_sync3;
 wire    fifo_reset_comb;
 (* shift_extract = "{no}" *)    wire   fifo_reset_comb_user_clk;
 (* shift_extract = "{no}" *)    wire   fifo_reset_comb_read_clk;
 reg fifo_reset_rd = 1'b1;
 (* shift_extract = "{no}" *) reg reset_cbcc_comb = 1'b1;
 (* shift_extract = "{no}" *) reg cbc_wr_if_reset = 1'b1;
 wire    chan_bond_reset_r2;
     reg [3:0]  cb_bit_err_ext_cnt; //used for pulse extension to avoid drc violations on fifo
     // Double synchronize CHAN_BOND_RESET to account for domain crossing.
aurora_64b66b_25p4G_cdc_sync
   # (
      .c_cdc_type    (1),  // 0 Pulse synchronizer, 1 level synchronizer 2 level synchronizer with ACK
      .c_flop_input  (0),  // 1 Adds one flop stage to the input prmry_in signal
      .c_reset_state (0),  // 1 Reset needed for sync flops
      .c_single_bit  (1),  // 1 single bit input.
      .c_mtbf_stages (5)   // Number of sync stages needed
     )   u_cdc_chan_bond_reset
     (
       .prmry_aclk      (1'b0),
       .prmry_rst_n     (1'b1 ),
       .prmry_in        (chan_bond_reset),
       .prmry_vect_in   ('d0 ),
       .scndry_aclk     (user_clk ),
       .scndry_rst_n    (1'b1 ),
       .prmry_ack       ( ),
       .scndry_out      (chan_bond_reset_r2),
       .scndry_vect_out ( )
      );
     always @(posedge user_clk)
     begin
         if(reset)
             cb_bit_err_ext_cnt <= `DLY 4'd0;
         else if(cb_bit_err)
             cb_bit_err_ext_cnt <= `DLY 4'b1111;
         else if(cb_bit_err_ext_cnt == 4'd0)
             cb_bit_err_ext_cnt <= `DLY 4'd0;
         else
             cb_bit_err_ext_cnt <= `DLY cb_bit_err_ext_cnt - 1'b1;
     end
 always @(posedge user_clk)
 begin
     if(reset)
         reset_cbcc_comb <= `DLY 1'b1;
     else if(chan_bond_reset_r2)
         reset_cbcc_comb <= `DLY 1'b1;
     else if(cb_bit_err_ext_cnt != 4'd0)
         reset_cbcc_comb <= `DLY 1'b1;
     else
         reset_cbcc_comb <= `DLY 1'b0;
 end
 wire rst_cbcc_comb_rd_clk;
aurora_64b66b_25p4G_rst_sync u_rst_sync_rst_cbcc_rd_clk
(
    .prmry_in    ( reset_cbcc_comb       ),
    .scndry_aclk ( rd_clk                ),
    .scndry_out  ( rst_cbcc_comb_rd_clk  )
);
(* shift_extract = "{no}" *)  reg  rd_stg1 = 1'b1;
always @(posedge rd_clk)
begin
    if(rst_cbcc_comb_rd_clk)
    begin
        rd_stg1                  <= `DLY 1'b1;
        cbcc_reset_cbstg2_rd_clk <= `DLY 1'b1;
    end
    else
    begin
        rd_stg1                  <= `DLY rst_cbcc_comb_rd_clk;
        cbcc_reset_cbstg2_rd_clk <= `DLY rd_stg1;
    end
end
 always @(posedge rd_clk)
 begin
     if(cbcc_reset_cbstg2_rd_clk)
     	 fifo_reset_rd   <= `DLY 1'b1;
     else if(enchansync)
     	 fifo_reset_rd   <= `DLY 1'b0;
 end
aurora_64b66b_25p4G_rst_sync u_rst_sync_r_sync3
(
    .prmry_in    ( fifo_reset_rd        ),
    .scndry_aclk ( user_clk             ),
    .scndry_out  ( fifo_reset_wr_sync3  )
);
  assign  fifo_reset_comb = fifo_reset_wr_sync3 | reset_cbcc_comb;
//below signal will go to fifo_reset_i generation , wr domain as well as rd domain logic
aurora_64b66b_25p4G_rst_sync #
 (
     .c_mtbf_stages (11)
 )u_rst_sync_fifo_reset_user_clk
 (
     .prmry_in     (fifo_reset_comb),
     .scndry_aclk  (user_clk       ),
     .scndry_out   (fifo_reset_comb_user_clk)
 );
aurora_64b66b_25p4G_rst_sync u_rst_sync_cbcc_fifo_reset_rd_clk
(
    .prmry_in      (fifo_reset_comb_user_clk),
    .scndry_aclk   (rd_clk),
    .scndry_out    (fifo_reset_comb_read_clk)
);
wire fifo_reset_comb_user_clk_int;
reg  fifo_reset_comb_user_clk_int_22q =1'b1;
aurora_64b66b_25p4G_rst_sync #
(
    .c_mtbf_stages (21)
) u_rst_sync_fifo_reset_comb_user_clk_in
(
    .prmry_in    (fifo_reset_comb_user_clk),
    .scndry_aclk (user_clk),
    .scndry_out  (fifo_reset_comb_user_clk_int)
);
always @(posedge user_clk)
begin
    fifo_reset_comb_user_clk_int_22q <= `DLY fifo_reset_comb_user_clk_int;
end
aurora_64b66b_25p4G_rst_sync #
(
    .c_mtbf_stages (9)
) u_rst_sync_reset_to_fifo_wr_clk
(
    .prmry_in    (fifo_reset_comb_user_clk_int_22q),
    .scndry_aclk (user_clk),
    .scndry_out  (cbcc_fifo_reset_to_fifo_wr_clk)
);
reg dbg_srst_assert = 1'b0;
always @(posedge user_clk)
begin
    dbg_srst_assert <= `DLY (fifo_reset_comb_user_clk_int_22q && !(fifo_reset_comb_user_clk_int));
end
localparam  dbg_srst_high_period = 4'd11;
reg [3:0]   dbg_extend_srst = 4'd11;
always @(posedge user_clk)
begin
    if(dbg_srst_assert)
        dbg_extend_srst <= `DLY 4'd0;
    else if(dbg_extend_srst < dbg_srst_high_period)
        dbg_extend_srst <= `DLY dbg_extend_srst + 1'b1;
end
always @(posedge user_clk)
begin
    cbcc_data_srst <= `DLY  dbg_srst_assert || (dbg_extend_srst < dbg_srst_high_period);
end
aurora_64b66b_25p4G_rst_sync #
(
    .c_mtbf_stages (31)
) u_rst_sync_reset_to_fifo_rd_clk
(
    .prmry_in    (fifo_reset_comb_read_clk),
    .scndry_aclk (rd_clk),
    .scndry_out  (cbcc_fifo_reset_to_fifo_rd_clk)
);
wire cbcc_fifo_reset_wr_clk_pre;
(* shift_extract = "{no}" *)  reg cbcc_fifo_reset_to_fifo_wr_clk_dlyd = 1'b1;
always @(posedge user_clk)
begin
    cbcc_fifo_reset_to_fifo_wr_clk_dlyd <= `DLY cbcc_fifo_reset_to_fifo_wr_clk;
end
always @(posedge user_clk)
begin
    if(fifo_reset_comb_user_clk)
        cbc_wr_if_reset <= 1'b1;
    else if(!cbcc_fifo_reset_to_fifo_wr_clk & cbcc_fifo_reset_to_fifo_wr_clk_dlyd)
        cbc_wr_if_reset <= 1'b0;
end
aurora_64b66b_25p4G_rst_sync u_rst_sync_reset_wr_clk
(
    .prmry_in    (cbc_wr_if_reset),
    .scndry_aclk (user_clk),
    .scndry_out  (cbcc_fifo_reset_wr_clk_pre)
);
always @(posedge user_clk)
    cbcc_fifo_reset_wr_clk <= `DLY cbcc_fifo_reset_wr_clk_pre;
wire cbcc_fifo_reset_rd_clk_pre;
(* shift_extract = "{no}" *)  reg cbc_rd_if_reset = 1'b1;
(* shift_extract = "{no}" *)  reg cbcc_fifo_reset_to_fifo_rd_clk_dlyd = 1'b1;
always @(posedge rd_clk)
begin
    cbcc_fifo_reset_to_fifo_rd_clk_dlyd <= `DLY cbcc_fifo_reset_to_fifo_rd_clk;
end
always @(posedge rd_clk)
begin
    if(fifo_reset_comb_read_clk)
        cbc_rd_if_reset <= 1'b1;
    else if(!cbcc_fifo_reset_to_fifo_rd_clk & cbcc_fifo_reset_to_fifo_rd_clk_dlyd)
        cbc_rd_if_reset <= 1'b0;
end
aurora_64b66b_25p4G_rst_sync u_rst_sync_reset_rd_clk
(
    .prmry_in    (cbc_rd_if_reset),
    .scndry_aclk (rd_clk),
    .scndry_out  (cbcc_fifo_reset_rd_clk_pre)
);
always @(posedge rd_clk)
    cbcc_fifo_reset_rd_clk <= `DLY cbcc_fifo_reset_rd_clk_pre;
 endmodule