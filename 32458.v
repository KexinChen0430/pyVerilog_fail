module tb_register ;
  localparam REGISTER_NUM_REGISTERS    = 16 ;
  localparam REGISTER_NUM_DATA_IN      = 2 ;
  localparam REGISTER_NUM_DATA_OUT     = 4 ;
  localparam REGISTER_NUM_SEL_BITS     = $clog2(REGISTER_NUM_REGISTERS) ;
  localparam REGISTER_WIDTH_DATA       = 32 ;
  localparam REGISTER_NUM_WRITE_TESTS  = 128 ;
  reg  r_clk ;
  reg  [REGISTER_NUM_DATA_IN-1:0] r_we ;
  reg  [REGISTER_NUM_DATA_OUT-1:0] r_re ;
  reg  [REGISTER_NUM_DATA_IN*REGISTER_NUM_SEL_BITS-1:0] r_data_in_sel ;
  reg  [REGISTER_NUM_DATA_OUT*REGISTER_NUM_SEL_BITS-1:0] r_data_out_sel ;
  reg  [REGISTER_NUM_DATA_IN*REGISTER_WIDTH_DATA-1:0] r_data_in ;
  wire [REGISTER_NUM_DATA_OUT*REGISTER_WIDTH_DATA-1:0] w_data_out ;
  register dut (
    .i_clk          (r_clk),
    .i_we           (r_we),
    .i_re           (r_re),
    .i_data_in_sel  (r_data_in_sel),
    .i_data_out_sel (r_data_out_sel),
    .i_data_in      (r_data_in),
    .o_data_out     (w_data_out)
  ) ;
  initial begin
    r_clk = 0 ;
    r_we = {REGISTER_NUM_DATA_IN{1'b0}} ;
    r_re = {REGISTER_NUM_DATA_OUT{1'b0}} ;
    r_data_in_sel = {REGISTER_NUM_DATA_IN*REGISTER_NUM_SEL_BITS{1'b0}} ;
    r_data_out_sel = {REGISTER_NUM_DATA_OUT*REGISTER_NUM_SEL_BITS{1'b0}} ;
    r_data_in = {REGISTER_NUM_DATA_IN*REGISTER_WIDTH_DATA{1'b0}} ;
  end
  initial  begin
    $dumpfile ("tb_register.dump") ;
    $dumpvars ;
  end
  initial  begin
    $display("\t|%10s  |%4s  |%4s  |%13s  |%18s  |%4s  |%14s  |%34s  |","time","clk","we","data_in_sel","data_in","re",
      "data_out_sel","data_out") ;
    $monitor("\t|%10t  |%4h  |%4h  |%13h  |%18h  |%4h  |%14h  |%34h  |",$time,r_clk,r_we,r_data_in_sel,r_data_in,r_re,
      r_data_out_sel, w_data_out) ;
  end
  always begin
    #50  r_clk =  !r_clk ;
  end
  initial begin : Test_Cases
    integer i ;
    for (i=0; i<REGISTER_NUM_WRITE_TESTS; i=i+1) begin : Writing_Test
      #20   r_we[$urandom%REGISTER_NUM_DATA_IN] = $random ;
            r_data_in_sel[`INDEX($clog2(r_we),REGISTER_NUM_SEL_BITS)] = $random ;
            r_data_in[`INDEX($clog2(r_we),REGISTER_WIDTH_DATA)] = $random ;
            r_re = 1'b1 ;
            r_data_out_sel[`INDEX(0,REGISTER_NUM_SEL_BITS)] = r_data_in_sel[`INDEX($clog2(r_we),
              REGISTER_NUM_SEL_BITS)] ;
      #150  if ((r_we != {REGISTER_NUM_DATA_IN{1'b0}}) && (w_data_out[`INDEX(0,REGISTER_WIDTH_DATA)] !=
              r_data_in[`INDEX($clog2(r_we),REGISTER_WIDTH_DATA)])) begin
                $display ("Write error at time %0t",$time) ;
                $display ("Expected value: %0h, Actual value: %0h", r_data_in[`INDEX($clog2(r_we),REGISTER_WIDTH_DATA)],
                  w_data_out[`INDEX(0,REGISTER_WIDTH_DATA)]) ;
                $stop ;
            end
      #30   r_we = {REGISTER_NUM_DATA_IN{1'b0}} ;
            r_data_in_sel = {REGISTER_NUM_DATA_IN*REGISTER_NUM_SEL_BITS{1'b0}} ;
            r_data_in = {REGISTER_NUM_DATA_IN*REGISTER_WIDTH_DATA{1'b0}} ;
            r_re = {REGISTER_NUM_DATA_OUT{1'b0}} ;
            r_data_out_sel = {REGISTER_NUM_DATA_OUT*REGISTER_NUM_SEL_BITS{1'b0}} ;
    end
    $stop ;
  end
endmodule