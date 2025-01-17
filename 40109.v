module fetch_db (
	clk		        ,
	rstn		        ,
  sysif_start_i    ,
	db_wen_i		,
	db_w4x4_x_i		,
	db_w4x4_y_i		,
        db_wprevious_i          ,
        db_done_i              ,
        db_wsel_i               ,
	db_wdata_i		,
	db_ren_i		,
	db_r4x4_i		,
	db_ridx_i		,
	db_rdata_o		,
	ext_store_addr_i	,
	ext_store_en_i		,
	ext_store_ready_o	,
	ext_store_data_o	,
        ext_store_done_i        ,
        ext_ref_addr_i          ,
	ext_ref_en_i		,
	ext_ref_data_i
);
//    INPUT / OUTPUT DECLARATION
input 	 [1-1:0] 	        clk 	             ; // clk signal
input 	 [1-1:0] 	        rstn 	             ; // asynchronous reset
input    [1-1:0]          sysif_start_i    ; // system pipeline start
input 	 [1-1:0] 	        db_wen_i 	     ; // db write enable
input 	 [5-1:0] 	        db_w4x4_x_i 	     ; // db write 4x4 block index in x
input 	 [5-1:0] 	        db_w4x4_y_i 	     ; // db write 4x4 block index in y
input    [1-1:0]                db_wprevious_i       ; // db write previous lcu data
input    [1-1:0]                db_done_i           ; // db write done
input    [2-1:0]                db_wsel_i            ; // db write 4x4 block sel : 0x:luma, 10: u, 11:v
input 	 [16*`PIXEL_WIDTH-1:0] 	db_wdata_i 	     ; // db write 4x4 block data
input 	 [1-1:0] 	        db_ren_i 	     ; // db read enable
input 	 [5-1:0] 	        db_r4x4_i 	     ; // db_read 4x4 block index
input 	 [2-1:0] 	        db_ridx_i 	     ; // db read pixel index in the block
output reg [4*`PIXEL_WIDTH-1:0] 	db_rdata_o 	     ; // db read pixel data
input 	 [8-1:0] 	        ext_store_addr_i     ; // read db_pixel ram address
input 	 [1-1:0] 	        ext_store_en_i 	     ; // read db_pixel ram enable
output 	 [1-1:0] 	        ext_store_ready_o    ; // previous lcu data ready : level
input    [1-1:0]                ext_store_done_i     ; // read db_pixel data done : pulse
output reg [32*`PIXEL_WIDTH-1:0] 	ext_store_data_o     ; // read db_pixel ram data
input 	 [5-1:0] 	        ext_ref_addr_i 	     ; // write db_ref ram enable
input 	 [1-1:0] 	        ext_ref_en_i 	     ; // write db_ref ram enable
input 	 [16*`PIXEL_WIDTH-1:0] 	ext_ref_data_i 	     ; // write db_ref ram data
//    WIRE / REG DECLARATION
reg      [1-1:0]                ref_buf;
wire     [1-1:0]                ref_buf0_en, ref_buf1_en;
wire     [5-1:0]                ref_buf0_addr;
wire     [5-1:0]                ref_buf1_addr;
wire     [16*`PIXEL_WIDTH-1 : 0]    ref_buf0_data       ;
wire     [16*`PIXEL_WIDTH-1 : 0]    ref_buf1_data       ;
wire     [16*`PIXEL_WIDTH-1 : 0]    ref_data            ;
wire     [32*`PIXEL_WIDTH-1 : 0]    ext_store_data_0    ;
wire     [32*`PIXEL_WIDTH-1 : 0]    ext_store_data_1    ;
wire     [32*`PIXEL_WIDTH-1 : 0]    ext_store_data_2    ;
reg      [1                 : 0]    db_r4x4_r           ;
//    Sequential Logic
always @ (posedge clk or negedge rstn) begin
    if (~rstn) begin
        ref_buf <= 'd1;
    end
    else if (sysif_start_i) begin
        ref_buf <= ~ref_buf;
    end
end
assign ref_buf0_en = ext_ref_en_i & ~ref_buf;
assign ref_buf1_en = ext_ref_en_i &  ref_buf;
assign ref_buf0_addr = ~ref_buf ? ext_ref_addr_i : ( db_ren_i ? ( db_r4x4_i[4] ? {1'b1,db_ridx_i[1:0],db_r4x4_i[2:1]} : {1'b0,db_r4x4_i[4],db_ridx_i,db_r4x4_i[3:2]} ) : 0 );
assign ref_buf1_addr =  ref_buf ? ext_ref_addr_i : ( db_ren_i ? ( db_r4x4_i[4] ? {1'b1,db_ridx_i[1:0],db_r4x4_i[2:1]} : {1'b0,db_r4x4_i[4],db_ridx_i,db_r4x4_i[3:2]} ) : 0 );
assign ref_data = ref_buf ? ref_buf0_data : ref_buf1_data;
  always @(posedge clk or negedge rstn ) begin
    if( !rstn )
      db_r4x4_r <= 0 ;
    else if( db_r4x4_i[4] )
      db_r4x4_r <= {db_r4x4_i[3],db_r4x4_i[0]} ;
    else begin
      db_r4x4_r <= db_r4x4_i[1:0] ;
    end
  end
  always @(*) begin
          db_rdata_o = 0 ;
    case( db_r4x4_r )
      0 : db_rdata_o = ref_data[16*`PIXEL_WIDTH-1:12*`PIXEL_WIDTH] ;
      1 : db_rdata_o = ref_data[12*`PIXEL_WIDTH-1:08*`PIXEL_WIDTH] ;
      2 : db_rdata_o = ref_data[08*`PIXEL_WIDTH-1:04*`PIXEL_WIDTH] ;
      3 : db_rdata_o = ref_data[04*`PIXEL_WIDTH-1:00*`PIXEL_WIDTH] ;
    endcase
  end
  // wr_rotate
  reg [1:0] wr_rotate ;
  always @(posedge clk or negedge rstn ) begin
    if( !rstn )
      wr_rotate     <= 0 ;
    else if( db_done_i ) begin
      if( wr_rotate == 2 )
        wr_rotate <= 0 ;
      else begin
        wr_rotate <= wr_rotate + 1 ;
      end
    end
  end
  // rd_rotate
  reg [1:0] rd_rotate ;
  always @(posedge clk or negedge rstn ) begin
    if( !rstn )
      rd_rotate     <= 0 ;
    else if( ext_store_done_i ) begin
      if( rd_rotate == 2 )
        rd_rotate <= 0 ;
      else begin
        rd_rotate <= rd_rotate + 1 ;
      end
    end
  end
  // ext_store_data_o
  always @(*) begin
          ext_store_data_o = ext_store_data_0 ;
    case( rd_rotate )
      0 : ext_store_data_o = ext_store_data_0 ;
      1 : ext_store_data_o = ext_store_data_1 ;
      2 : ext_store_data_o = ext_store_data_2 ;
    endcase
  end
  // post_rd
  wire post_r_buf0_en ;
  wire post_r_buf1_en ;
  wire post_r_buf2_en ;
  assign post_r_buf0_en = ext_store_en_i & ( rd_rotate==0 );
  assign post_r_buf1_en = ext_store_en_i & ( rd_rotate==1 );
  assign post_r_buf2_en = ext_store_en_i & ( rd_rotate==2 );
  // post_wr
  reg post_w_buf0_en ;
  reg post_w_buf1_en ;
  reg post_w_buf2_en ;
  always @(*) begin
    if( db_wprevious_i ) begin
      post_w_buf0_en = db_wen_i & ( wr_rotate==1 );
      post_w_buf1_en = db_wen_i & ( wr_rotate==2 );
      post_w_buf2_en = db_wen_i & ( wr_rotate==0 );
    end
    else begin
      post_w_buf0_en = db_wen_i & ( wr_rotate==0 );
      post_w_buf1_en = db_wen_i & ( wr_rotate==1 );
      post_w_buf2_en = db_wen_i & ( wr_rotate==2 );
    end
  end
//    Wrapper
  mem_bilo_db u_db_buf0 (
    .clk       ( clk                 ),
    .rst_n     ( rstn                ),
    .wen_i     ( post_w_buf0_en      ),
    .wsel_i    ( db_wsel_i           ),
    .w4x4_x_i  ( db_w4x4_x_i[3:0]    ),
    .w4x4_y_i  ( db_w4x4_y_i         ),
    .wdata_i   ( db_wdata_i          ),
    .ren_i     ( post_r_buf0_en      ),
    .raddr_i   ( ext_store_addr_i    ),
    .rdata_o   ( ext_store_data_0    )
    );
  mem_bilo_db u_db_buf1(
    .clk       ( clk                 ),
    .rst_n     ( rstn                ),
    .wen_i     ( post_w_buf1_en      ),
    .wsel_i    ( db_wsel_i           ),
    .w4x4_x_i  ( db_w4x4_x_i[3:0]    ),
    .w4x4_y_i  ( db_w4x4_y_i         ),
    .wdata_i   ( db_wdata_i          ),
    .ren_i     ( post_r_buf1_en      ),
    .raddr_i   ( ext_store_addr_i    ),
    .rdata_o   ( ext_store_data_1    )
    );
  mem_bilo_db u_db_buf2(
    .clk       ( clk                 ),
    .rst_n     ( rstn                ),
    .wen_i     ( post_w_buf2_en      ),
    .wsel_i    ( db_wsel_i           ),
    .w4x4_x_i  ( db_w4x4_x_i[3:0]    ),
    .w4x4_y_i  ( db_w4x4_y_i         ),
    .wdata_i   ( db_wdata_i          ),
    .ren_i     ( post_r_buf2_en      ),
    .raddr_i   ( ext_store_addr_i    ),
    .rdata_o   ( ext_store_data_2    )
    );
ram_1p #(.Addr_Width(5), .Word_Width(`PIXEL_WIDTH*16))
u_ram0_1p_32x128 (
    .clk  	( clk		),
    .cen_i      ( 1'b0   	),
    .oen_i      ( 1'b0		),
    .wen_i      ( ~ref_buf0_en	),
    .addr_i     ( ref_buf0_addr ),
    .data_i     ( ext_ref_data_i),
    .data_o     ( ref_buf0_data	)
);
ram_1p #(.Addr_Width(5), .Word_Width(`PIXEL_WIDTH*16))
u_ram1_1p_32x128 (
    .clk  	( clk		),
    .cen_i      ( 1'b0   	),
    .oen_i      ( 1'b0		),
    .wen_i      ( ~ref_buf1_en	),
    .addr_i     ( ref_buf1_addr ),
    .data_i     ( ext_ref_data_i),
    .data_o     ( ref_buf1_data	)
);
endmodule