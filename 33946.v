module
  reg  [2*`FMV_WIDTH-1 : 0]    mb_mv_rdata  ;
  reg  [128-1          : 0]    tq_ori_data  ;
  always @(posedge clk or negedge rst_n ) begin
    if( !rst_n )
      db_inter_partition_r <= 42'b0 ;
    else if( sys_start_i ) begin
      db_inter_partition_r <= mc_partition_r ;
    end
  end
  assign db_intra_partition_w = (sys_type_i==INTRA) ? partition_old
                                                    : { db_inter_partition_r[41]&db_inter_partition_r[40]
                                                       ,db_inter_partition_r[39]&db_inter_partition_r[38]
                                                       ,db_inter_partition_r[37]&db_inter_partition_r[36]
                                                       ,db_inter_partition_r[35]&db_inter_partition_r[34]
                                                       ,db_inter_partition_r[33]&db_inter_partition_r[32]
                                                       ,db_inter_partition_r[31]&db_inter_partition_r[30]
                                                       ,db_inter_partition_r[29]&db_inter_partition_r[28]
                                                       ,db_inter_partition_r[27]&db_inter_partition_r[26]
                                                       ,db_inter_partition_r[25]&db_inter_partition_r[24]
                                                       ,db_inter_partition_r[23]&db_inter_partition_r[22]
                                                       ,db_inter_partition_r[21]&db_inter_partition_r[20]
                                                       ,db_inter_partition_r[19]&db_inter_partition_r[18]
                                                       ,db_inter_partition_r[17]&db_inter_partition_r[16]
                                                       ,db_inter_partition_r[15]&db_inter_partition_r[14]
                                                       ,db_inter_partition_r[13]&db_inter_partition_r[12]
                                                       ,db_inter_partition_r[11]&db_inter_partition_r[10]
                                                       ,db_inter_partition_r[09]&db_inter_partition_r[08]
                                                       ,db_inter_partition_r[07]&db_inter_partition_r[06]
                                                       ,db_inter_partition_r[05]&db_inter_partition_r[04]
                                                       ,db_inter_partition_r[03]&db_inter_partition_r[02]
                                                       ,db_inter_partition_r[01]&db_inter_partition_r[00]
                                                      };
  always @(*) begin
          db_mv_w = 0 ;
    case( sel_mod_3_r )
      2 : db_mv_w = { fme_mv_mem_0_rddata_w[9:0] ,fme_mv_mem_0_rddata_w[19:10] };
      0 : db_mv_w = { fme_mv_mem_1_rddata_w[9:0] ,fme_mv_mem_1_rddata_w[19:10] };
      1 : db_mv_w = { fme_mv_mem_2_rddata_w[9:0] ,fme_mv_mem_2_rddata_w[19:10] };
    endcase
  end
  assign db_mv_rdaddr_w = { db_mv_rdaddr_ori_w[5]
                           ,db_mv_rdaddr_ori_w[3]
                           ,db_mv_rdaddr_ori_w[1]
                           ,db_mv_rdaddr_ori_w[4]
                           ,db_mv_rdaddr_ori_w[2]
                           ,db_mv_rdaddr_ori_w[0]
                          };
  db_top u_db_top(
    .clk                 ( clk                  ),
    .rst_n               ( rst_n                ),
    .mb_x_total_i        ( sys_x_total_i        ),
    .mb_y_total_i        ( sys_y_total_i        ),
    .mb_x_i              ( ec_x                 ),
    .mb_y_i              ( ec_y                 ),
    .qp_i                ( ec_qp                ),
    .start_i             ( ec_start             ),
    .done_o              ( db_done              ),
    .mb_type_i           ( sys_type_i==INTRA    ),
    .mb_partition_i      ( db_intra_partition_w ),
    .mb_p_pu_mode_i      ( db_inter_partition_r ),
    .mb_cbf_i            ( ec_cbf_luma          ),
    .mb_cbf_u_i          ( (sys_type_i==INTRA) ? ec_cbf_cb : ec_cbf_cr ),
    .mb_cbf_v_i          ( (sys_type_i==INTRA) ? ec_cbf_cr : ec_cbf_cb ),
    .mb_mv_ren_o         ( db_mv_rden_w         ),
    .mb_mv_raddr_o       ( db_mv_rdaddr_ori_w   ),
    .mb_mv_rdata_i       ( db_mv_w              ),
    .tq_ren_o            ( db_mem_ren           ),
    .tq_raddr_o          ( db_mem_raddr         ),
    .tq_rdata_i          ( db_mem_rdata         ),
    .tq_ori_data_i       ( tq_ori_data          ),    // fake (for sao)
    .db_wen_o            ( db_wen_o             ),
    .db_w4x4_x_o         ( db_w4x4_x_o          ),
    .db_w4x4_y_o         ( db_w4x4_y_o          ),
    .db_wprevious_o      ( db_wprevious_o       ),
    .db_wdone_o          ( db_wdone_o           ),
    .db_wsel_o           ( db_wsel_o            ),
    .db_wdata_o          ( db_wdata_o           ),
    .mb_db_ren_o         ( db_ren_o             ),
    .mb_db_r4x4_o        ( db_r4x4_o            ),
    .mb_db_ridx_o        ( db_ridx_o            ),
    .mb_db_en_o          ( db_mb_en             ),    // for db auto check
    .mb_db_rw_o          ( db_mb_rw             ),    // for db auto check
    .mb_db_addr_o        ( db_mb_addr           ),    // for db auto check
    .mb_db_data_o        ( db_mb_data_o         ),    // for db auto check
`ifdef NO_FETCH
    .mb_db_data_i        ( db_rdata             )     // fake
`else
    .mb_db_data_i        ( db_rdata_i           )
`endif
    );
  assign db_done_o = db_done ;
/*
  reg  [`PIC_X_WIDTH-1 : 0]    db_x_total_r      ;
  reg  [`PIC_Y_WIDTH-1 : 0]    db_y_total_r      ;
  reg  [`PIC_X_WIDTH-1 : 0]    db_x_r            ;
  reg  [`PIC_Y_WIDTH-1 : 0]    db_y_r            ;
  reg  [6-1            : 0]    db_qp_r           ;
  reg  [21-1           : 0]    db_mb_partition_r ;
  reg  [42-1           : 0]    mb_p_pu_mode_r    ;
  reg  [256-1          : 0]    mb_cbf_r          ;
  reg  [16-1           : 0]    mb_cbf_top_r      ;
  reg  [256-1          : 0]    mb_cbf_u_r        ;
  reg  [256-1          : 0]    mb_cbf_v_r        ;
  reg  [128-1          : 0]    yuv_top[0:31]     ;
  reg  [128-1          : 0]    yuv_in[0:383]     ;
  reg  [128-1          : 0]    yuv_out[0:383]    ;
  reg  [128-1          : 0]    yuv_check[0:383]  ;
  reg  [4*32-1         : 0]    tq_rdata          ;
  integer                      f ,i, tp          ;
  integer                      fp_i_input        ;
  integer                      fp_i_check        ;
  integer                      fp_p_input        ;
  integer                      fp_p_check        ;
  reg  [8              : 0]    in                ;
  reg  [8              : 0]    index             ;
  reg  [19             : 0]    mv[0:71]          ;
  reg  [19             : 0]    mv_dat            ;
  reg  [128-1          : 0]    pixels            ;
  // configure db_top
  initial begin
    fp_i_input        = $fopen( "./tv/db_i_check_i.dat" ,"r" );
    fp_i_check        = $fopen( "./tv/db_i_check_o.dat" ,"r" );
    fp_p_input        = $fopen( "./tv/db_p_check_i.dat" ,"r" );
    fp_p_check        = $fopen( "./tv/db_p_check_o.dat" ,"r" );
    db_qp_r           = 6'h16  ;
    db_mb_partition_r = 21'd0  ;
    mb_p_pu_mode_r    = 42'd0  ;
    mb_cbf_r          = 256'd0 ;
    mb_cbf_top_r      = 16'd0  ;
    mb_cbf_u_r        = 256'd0 ;
    mb_cbf_v_r        = 256'd0 ;
    forever begin
      @(posedge ec_start)
      db_start_task ;
`ifdef DB_AUTO_CHECK
      check_task ;
`endif
    end
  end
  // read top reference
  always @(posedge clk) begin
    db_rdata <= db_ren_o ? 'dx : yuv_top[db_r4x4_o] ;
  end
  // read current rec
  always @(posedge clk) begin
    tq_rdata <= db_mem_ren ? 'dx : yuv_in[db_mem_raddr];
  end
  // read mv data
  always @(posedge clk) begin
    mb_mv_rdata <= db_mv_rden_w ? 'dx : mv[db_mv_rdaddr_ori_w];
  end
  // dump data
  always @(posedge clk) begin
    if(!db_mb_en&&db_mb_rw)begin
      yuv_out[db_mb_addr] <= db_mb_data_o ;
    end
  end
  // db_start_task
  task db_start_task ;
  begin
    if( sys_type_i == INTRA ) begin
      f = $fscanf( fp_i_input ,"%h" ,db_x_total_r      );
      f = $fscanf( fp_i_input ,"%h" ,db_y_total_r      );
      f = $fscanf( fp_i_input ,"%h" ,db_x_r            );
      f = $fscanf( fp_i_input ,"%h" ,db_y_r            );
      f = $fscanf( fp_i_input ,"%h" ,db_qp_r           );
      f = $fscanf( fp_i_input ,"%b" ,tp                );
      f = $fscanf( fp_i_input ,"%b" ,db_mb_partition_r );
      f = $fscanf( fp_i_input ,"%b" ,mb_p_pu_mode_r    );
      f = $fscanf( fp_i_input ,"%b" ,mb_cbf_r          );
      f = $fscanf( fp_i_input ,"%b" ,mb_cbf_top_r      );
      f = $fscanf( fp_i_input ,"%b" ,mb_cbf_u_r        );
      f = $fscanf( fp_i_input ,"%b" ,mb_cbf_v_r        );
    end
    else begin
      f = $fscanf( fp_p_input ,"%h" ,db_x_total_r      );
      f = $fscanf( fp_p_input ,"%h" ,db_y_total_r      );
      f = $fscanf( fp_p_input ,"%h" ,db_x_r            );
      f = $fscanf( fp_p_input ,"%h" ,db_y_r            );
      f = $fscanf( fp_p_input ,"%h" ,db_qp_r           );
      f = $fscanf( fp_p_input ,"%b" ,tp                );
      f = $fscanf( fp_p_input ,"%b" ,db_mb_partition_r );
      f = $fscanf( fp_p_input ,"%b" ,mb_p_pu_mode_r    );
      f = $fscanf( fp_p_input ,"%b" ,mb_cbf_r          );
      f = $fscanf( fp_p_input ,"%b" ,mb_cbf_top_r      );
      f = $fscanf( fp_p_input ,"%b" ,mb_cbf_u_r        );
      f = $fscanf( fp_p_input ,"%b" ,mb_cbf_v_r        );
    end
    // current lcu mv
    for ( i=0 ;i<64 ;i=i+1 ) begin
      in    = i ;
      index = getmvindex( in[5:0] );
      if( sys_type_i == INTRA )
        f = $fscanf( fp_i_input ,"%h" ,mv_dat );
      else begin
        f = $fscanf( fp_p_input ,"%h" ,mv_dat );
      end
      mv[index[5:0]] = mv_dat ;
    end
    // top lcu mv
    for ( i=0 ;i<8 ;i=i+1 ) begin
      if( sys_type_i == INTRA )
        f = $fscanf( fp_i_input ,"%h" ,mv_dat );
      else begin
        f = $fscanf( fp_p_input ,"%h" ,mv_dat );
      end
      mv[i+64] = mv_dat ;
    end
    // current lcu pixels
    for( i=0 ;i<384 ;i=i+1 ) begin
      in    = i ;
      index = getindex( in );
      if( sys_type_i == INTRA )
        f = $fscanf( fp_i_input ,"%h" ,pixels );
      else begin
        f = $fscanf( fp_p_input ,"%h" ,pixels );
      end
      yuv_in[index] = pixels ;
    end
    // top lcu pixels
    for( i=0 ;i<32 ;i=i+1 ) begin
      if( sys_type_i == INTRA )
        f = $fscanf( fp_i_input ,"%h" ,pixels );
      else begin
        f = $fscanf( fp_p_input ,"%h" ,pixels );
      end
      yuv_top[i] = pixels ;
    end
    // wait for done
    @(posedge db_done );
  end
  endtask
  // check task
  task check_task;
  begin
    for( i=0 ;i<384 ;i=i+1 ) begin
      in = i ;
      index = getindex( in );
      if( sys_type_i == INTRA )
        f = $fscanf( fp_i_check ,"%h" ,pixels );
      else begin
        f = $fscanf( fp_p_check ,"%h" ,pixels );
      end
      yuv_check[i] = pixels;
    end
    for( i=0 ;i<384 ;i=i+1 ) begin
      in = i ;
      index = getindex( in );
      pixels = yuv_out[index];
      if( (yuv_out[index]!==yuv_check[i]) && (i<256||(i>255 && i%8!=7)) ) begin
        $display( "DB Error : %5d" ,i );
        $display( "right: %h\nwrong: %h" ,yuv_check[index] ,yuv_out[i] );
        #1000 ; $finish ;
      end
    end
  end
  endtask
  // getindex
  function [8:0] getindex ;
    input [8:0] in ;
    begin
      if( in<256 ) begin
        case( in[6:0] )
          'd0     : getindex[6:0] = 'd0   ;
          'd1     : getindex[6:0] = 'd1   ;
          'd2     : getindex[6:0] = 'd4   ;
          'd3     : getindex[6:0] = 'd5   ;
          'd4     : getindex[6:0] = 'd16  ;
          'd5     : getindex[6:0] = 'd17  ;
          'd6     : getindex[6:0] = 'd20  ;
          'd7     : getindex[6:0] = 'd21  ;
          'd8     : getindex[6:0] = 'd64  ;
          'd9     : getindex[6:0] = 'd65  ;
          'd10    : getindex[6:0] = 'd68  ;
          'd11    : getindex[6:0] = 'd69  ;
          'd12    : getindex[6:0] = 'd80  ;
          'd13    : getindex[6:0] = 'd81  ;
          'd14    : getindex[6:0] = 'd84  ;
          'd15    : getindex[6:0] = 'd85  ;
          'd16    : getindex[6:0] = 'd2   ;
          'd17    : getindex[6:0] = 'd3   ;
          'd18    : getindex[6:0] = 'd6   ;
          'd19    : getindex[6:0] = 'd7   ;
          'd20    : getindex[6:0] = 'd18  ;
          'd21    : getindex[6:0] = 'd19  ;
          'd22    : getindex[6:0] = 'd22  ;
          'd23    : getindex[6:0] = 'd23  ;
          'd24    : getindex[6:0] = 'd66  ;
          'd25    : getindex[6:0] = 'd67  ;
          'd26    : getindex[6:0] = 'd70  ;
          'd27    : getindex[6:0] = 'd71  ;
          'd28    : getindex[6:0] = 'd82  ;
          'd29    : getindex[6:0] = 'd83  ;
          'd30    : getindex[6:0] = 'd86  ;
          'd31    : getindex[6:0] = 'd87  ;
          'd32    : getindex[6:0] = 'd8   ;
          'd33    : getindex[6:0] = 'd9   ;
          'd34    : getindex[6:0] = 'd12  ;
          'd35    : getindex[6:0] = 'd13  ;
          'd36    : getindex[6:0] = 'd24  ;
          'd37    : getindex[6:0] = 'd25  ;
          'd38    : getindex[6:0] = 'd28  ;
          'd39    : getindex[6:0] = 'd29  ;
          'd40    : getindex[6:0] = 'd72  ;
          'd41    : getindex[6:0] = 'd73  ;
          'd42    : getindex[6:0] = 'd76  ;
          'd43    : getindex[6:0] = 'd77  ;
          'd44    : getindex[6:0] = 'd88  ;
          'd45    : getindex[6:0] = 'd89  ;
          'd46    : getindex[6:0] = 'd92  ;
          'd47    : getindex[6:0] = 'd93  ;
          'd48    : getindex[6:0] = 'd10  ;
          'd49    : getindex[6:0] = 'd11  ;
          'd50    : getindex[6:0] = 'd14  ;
          'd51    : getindex[6:0] = 'd15  ;
          'd52    : getindex[6:0] = 'd26  ;
          'd53    : getindex[6:0] = 'd27  ;
          'd54    : getindex[6:0] = 'd30  ;
          'd55    : getindex[6:0] = 'd31  ;
          'd56    : getindex[6:0] = 'd74  ;
          'd57    : getindex[6:0] = 'd75  ;
          'd58    : getindex[6:0] = 'd78  ;
          'd59    : getindex[6:0] = 'd79  ;
          'd60    : getindex[6:0] = 'd90  ;
          'd61    : getindex[6:0] = 'd91  ;
          'd62    : getindex[6:0] = 'd94  ;
          'd63    : getindex[6:0] = 'd95  ;
          'd64    : getindex[6:0] = 'd32  ;
          'd65    : getindex[6:0] = 'd33  ;
          'd66    : getindex[6:0] = 'd36  ;
          'd67    : getindex[6:0] = 'd37  ;
          'd68    : getindex[6:0] = 'd48  ;
          'd69    : getindex[6:0] = 'd49  ;
          'd70    : getindex[6:0] = 'd52  ;
          'd71    : getindex[6:0] = 'd53  ;
          'd72    : getindex[6:0] = 'd96  ;
          'd73    : getindex[6:0] = 'd97  ;
          'd74    : getindex[6:0] = 'd100 ;
          'd75    : getindex[6:0] = 'd101 ;
          'd76    : getindex[6:0] = 'd112 ;
          'd77    : getindex[6:0] = 'd113 ;
          'd78    : getindex[6:0] = 'd116 ;
          'd79    : getindex[6:0] = 'd117 ;
          'd80    : getindex[6:0] = 'd34  ;
          'd81    : getindex[6:0] = 'd35  ;
          'd82    : getindex[6:0] = 'd38  ;
          'd83    : getindex[6:0] = 'd39  ;
          'd84    : getindex[6:0] = 'd50  ;
          'd85    : getindex[6:0] = 'd51  ;
          'd86    : getindex[6:0] = 'd54  ;
          'd87    : getindex[6:0] = 'd55  ;
          'd88    : getindex[6:0] = 'd98  ;
          'd89    : getindex[6:0] = 'd99  ;
          'd90    : getindex[6:0] = 'd102 ;
          'd91    : getindex[6:0] = 'd103 ;
          'd92    : getindex[6:0] = 'd114 ;
          'd93    : getindex[6:0] = 'd115 ;
          'd94    : getindex[6:0] = 'd118 ;
          'd95    : getindex[6:0] = 'd119 ;
          'd96    : getindex[6:0] = 'd40  ;
          'd97    : getindex[6:0] = 'd41  ;
          'd98    : getindex[6:0] = 'd44  ;
          'd99    : getindex[6:0] = 'd45  ;
          'd100   : getindex[6:0] = 'd56  ;
          'd101   : getindex[6:0] = 'd57  ;
          'd102   : getindex[6:0] = 'd60  ;
          'd103   : getindex[6:0] = 'd61  ;
          'd104   : getindex[6:0] = 'd104 ;
          'd105   : getindex[6:0] = 'd105 ;
          'd106   : getindex[6:0] = 'd108 ;
          'd107   : getindex[6:0] = 'd109 ;
          'd108   : getindex[6:0] = 'd120 ;
          'd109   : getindex[6:0] = 'd121 ;
          'd110   : getindex[6:0] = 'd124 ;
          'd111   : getindex[6:0] = 'd125 ;
          'd112   : getindex[6:0] = 'd42  ;
          'd113   : getindex[6:0] = 'd43  ;
          'd114   : getindex[6:0] = 'd46  ;
          'd115   : getindex[6:0] = 'd47  ;
          'd116   : getindex[6:0] = 'd58  ;
          'd117   : getindex[6:0] = 'd59  ;
          'd118   : getindex[6:0] = 'd62  ;
          'd119   : getindex[6:0] = 'd63  ;
          'd120   : getindex[6:0] = 'd106 ;
          'd121   : getindex[6:0] = 'd107 ;
          'd122   : getindex[6:0] = 'd110 ;
          'd123   : getindex[6:0] = 'd111 ;
          'd124   : getindex[6:0] = 'd122 ;
          'd125   : getindex[6:0] = 'd123 ;
          'd126   : getindex[6:0] = 'd126 ;
          'd127   : getindex[6:0] = 'd127 ;
          default : getindex[6:0] = 'd0   ;
        endcase
        getindex[8:7] = in[8:7] ;
      end
      else begin
        case( in[5:0] )
          'd0  : getindex[5:0] = 'd0  + 00 ;
          'd1  : getindex[5:0] = 'd1  + 00 ;
          'd2  : getindex[5:0] = 'd4  + 00 ;
          'd3  : getindex[5:0] = 'd5  + 00 ;
          'd4  : getindex[5:0] = 'd16 + 00 ;
          'd5  : getindex[5:0] = 'd17 + 00 ;
          'd6  : getindex[5:0] = 'd20 + 00 ;
          'd7  : getindex[5:0] = 'd21 + 00 ;
          'd8  : getindex[5:0] = 'd0  + 02 ;
          'd9  : getindex[5:0] = 'd1  + 02 ;
          'd10 : getindex[5:0] = 'd4  + 02 ;
          'd11 : getindex[5:0] = 'd5  + 02 ;
          'd12 : getindex[5:0] = 'd16 + 02 ;
          'd13 : getindex[5:0] = 'd17 + 02 ;
          'd14 : getindex[5:0] = 'd20 + 02 ;
          'd15 : getindex[5:0] = 'd21 + 02 ;
          'd16 : getindex[5:0] = 'd0  + 08 ;
          'd17 : getindex[5:0] = 'd1  + 08 ;
          'd18 : getindex[5:0] = 'd4  + 08 ;
          'd19 : getindex[5:0] = 'd5  + 08 ;
          'd20 : getindex[5:0] = 'd16 + 08 ;
          'd21 : getindex[5:0] = 'd17 + 08 ;
          'd22 : getindex[5:0] = 'd20 + 08 ;
          'd23 : getindex[5:0] = 'd21 + 08 ;
          'd24 : getindex[5:0] = 'd0  + 10 ;
          'd25 : getindex[5:0] = 'd1  + 10 ;
          'd26 : getindex[5:0] = 'd4  + 10 ;
          'd27 : getindex[5:0] = 'd5  + 10 ;
          'd28 : getindex[5:0] = 'd16 + 10 ;
          'd29 : getindex[5:0] = 'd17 + 10 ;
          'd30 : getindex[5:0] = 'd20 + 10 ;
          'd31 : getindex[5:0] = 'd21 + 10 ;
          'd32 : getindex[5:0] = 'd0  + 32 ;
          'd33 : getindex[5:0] = 'd1  + 32 ;
          'd34 : getindex[5:0] = 'd4  + 32 ;
          'd35 : getindex[5:0] = 'd5  + 32 ;
          'd36 : getindex[5:0] = 'd16 + 32 ;
          'd37 : getindex[5:0] = 'd17 + 32 ;
          'd38 : getindex[5:0] = 'd20 + 32 ;
          'd39 : getindex[5:0] = 'd21 + 32 ;
          'd40 : getindex[5:0] = 'd0  + 34 ;
          'd41 : getindex[5:0] = 'd1  + 34 ;
          'd42 : getindex[5:0] = 'd4  + 34 ;
          'd43 : getindex[5:0] = 'd5  + 34 ;
          'd44 : getindex[5:0] = 'd16 + 34 ;
          'd45 : getindex[5:0] = 'd17 + 34 ;
          'd46 : getindex[5:0] = 'd20 + 34 ;
          'd47 : getindex[5:0] = 'd21 + 34 ;
          'd48 : getindex[5:0] = 'd0  + 40 ;
          'd49 : getindex[5:0] = 'd1  + 40 ;
          'd50 : getindex[5:0] = 'd4  + 40 ;
          'd51 : getindex[5:0] = 'd5  + 40 ;
          'd52 : getindex[5:0] = 'd16 + 40 ;
          'd53 : getindex[5:0] = 'd17 + 40 ;
          'd54 : getindex[5:0] = 'd20 + 40 ;
          'd55 : getindex[5:0] = 'd21 + 40 ;
          'd56 : getindex[5:0] = 'd0  + 42 ;
          'd57 : getindex[5:0] = 'd1  + 42 ;
          'd58 : getindex[5:0] = 'd4  + 42 ;
          'd59 : getindex[5:0] = 'd5  + 42 ;
          'd60 : getindex[5:0] = 'd16 + 42 ;
          'd61 : getindex[5:0] = 'd17 + 42 ;
          'd62 : getindex[5:0] = 'd20 + 42 ;
          'd63 : getindex[5:0] = 'd21 + 42 ;
        endcase
        getindex[8:6] = in[8:6] ;
      end
    end
  endfunction
  // getmvindex
  function [5:0] getmvindex ;
    input [5:0] in ;
    begin
    case( in[4:0] )
      'd0     : getmvindex[4:0] = 'd0  ;
      'd1     : getmvindex[4:0] = 'd1  ;
      'd2     : getmvindex[4:0] = 'd4  ;
      'd3     : getmvindex[4:0] = 'd5  ;
      'd4     : getmvindex[4:0] = 'd16 ;
      'd5     : getmvindex[4:0] = 'd17 ;
      'd6     : getmvindex[4:0] = 'd20 ;
      'd7     : getmvindex[4:0] = 'd21 ;
      'd8     : getmvindex[4:0] = 'd2  ;
      'd9     : getmvindex[4:0] = 'd3  ;
      'd10    : getmvindex[4:0] = 'd6  ;
      'd11    : getmvindex[4:0] = 'd7  ;
      'd12    : getmvindex[4:0] = 'd18 ;
      'd13    : getmvindex[4:0] = 'd19 ;
      'd14    : getmvindex[4:0] = 'd22 ;
      'd15    : getmvindex[4:0] = 'd23 ;
      'd16    : getmvindex[4:0] = 'd8  ;
      'd17    : getmvindex[4:0] = 'd9  ;
      'd18    : getmvindex[4:0] = 'd12 ;
      'd19    : getmvindex[4:0] = 'd13 ;
      'd20    : getmvindex[4:0] = 'd24 ;
      'd21    : getmvindex[4:0] = 'd25 ;
      'd22    : getmvindex[4:0] = 'd28 ;
      'd23    : getmvindex[4:0] = 'd29 ;
      'd24    : getmvindex[4:0] = 'd10 ;
      'd25    : getmvindex[4:0] = 'd11 ;
      'd26    : getmvindex[4:0] = 'd14 ;
      'd27    : getmvindex[4:0] = 'd15 ;
      'd28    : getmvindex[4:0] = 'd26 ;
      'd29    : getmvindex[4:0] = 'd27 ;
      'd30    : getmvindex[4:0] = 'd30 ;
      'd31    : getmvindex[4:0] = 'd31 ;
      default : getmvindex[4:0] = 'd0  ;
    endcase
    case(in[5])
      1'b0    : getmvindex[5]   = 'd0  ;
      default : getmvindex[5]   = 'd1  ;
    endcase
    end
  endfunction
*/
endmodule