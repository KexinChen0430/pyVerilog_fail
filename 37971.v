module eth_cop
(
  // WISHBONE common
  wb_clk_i, wb_rst_i,
  // WISHBONE MASTER 1
  m1_wb_adr_i, m1_wb_sel_i, m1_wb_we_i,  m1_wb_dat_o,
  m1_wb_dat_i, m1_wb_cyc_i, m1_wb_stb_i, m1_wb_ack_o,
  m1_wb_err_o,
  // WISHBONE MASTER 2
  m2_wb_adr_i, m2_wb_sel_i, m2_wb_we_i,  m2_wb_dat_o,
  m2_wb_dat_i, m2_wb_cyc_i, m2_wb_stb_i, m2_wb_ack_o,
  m2_wb_err_o,
  // WISHBONE slave 1
 	s1_wb_adr_o, s1_wb_sel_o, s1_wb_we_o,  s1_wb_cyc_o,
 	s1_wb_stb_o, s1_wb_ack_i, s1_wb_err_i, s1_wb_dat_i,
 	s1_wb_dat_o,
  // WISHBONE slave 2
 	s2_wb_adr_o, s2_wb_sel_o, s2_wb_we_o,  s2_wb_cyc_o,
 	s2_wb_stb_o, s2_wb_ack_i, s2_wb_err_i, s2_wb_dat_i,
 	s2_wb_dat_o
);
parameter Tp=1;
// WISHBONE common
input wb_clk_i, wb_rst_i;
// WISHBONE MASTER 1
input  [31:0] m1_wb_adr_i, m1_wb_dat_i;
input   [3:0] m1_wb_sel_i;
input         m1_wb_cyc_i, m1_wb_stb_i, m1_wb_we_i;
output [31:0] m1_wb_dat_o;
output        m1_wb_ack_o, m1_wb_err_o;
// WISHBONE MASTER 2
input  [31:0] m2_wb_adr_i, m2_wb_dat_i;
input   [3:0] m2_wb_sel_i;
input         m2_wb_cyc_i, m2_wb_stb_i, m2_wb_we_i;
output [31:0] m2_wb_dat_o;
output        m2_wb_ack_o, m2_wb_err_o;
// WISHBONE slave 1
input  [31:0] s1_wb_dat_i;
input         s1_wb_ack_i, s1_wb_err_i;
output [31:0] s1_wb_adr_o, s1_wb_dat_o;
output  [3:0] s1_wb_sel_o;
output        s1_wb_we_o,  s1_wb_cyc_o, s1_wb_stb_o;
// WISHBONE slave 2
input  [31:0] s2_wb_dat_i;
input         s2_wb_ack_i, s2_wb_err_i;
output [31:0] s2_wb_adr_o, s2_wb_dat_o;
output  [3:0] s2_wb_sel_o;
output        s2_wb_we_o,  s2_wb_cyc_o, s2_wb_stb_o;
reg           m1_in_progress;
reg           m2_in_progress;
reg    [31:0] s1_wb_adr_o;
reg     [3:0] s1_wb_sel_o;
reg           s1_wb_we_o;
reg    [31:0] s1_wb_dat_o;
reg           s1_wb_cyc_o;
reg           s1_wb_stb_o;
reg    [31:0] s2_wb_adr_o;
reg     [3:0] s2_wb_sel_o;
reg           s2_wb_we_o;
reg    [31:0] s2_wb_dat_o;
reg           s2_wb_cyc_o;
reg           s2_wb_stb_o;
reg           m1_wb_ack_o;
reg    [31:0] m1_wb_dat_o;
reg           m2_wb_ack_o;
reg    [31:0] m2_wb_dat_o;
reg           m1_wb_err_o;
reg           m2_wb_err_o;
wire m_wb_access_finished;
wire m1_req = m1_wb_cyc_i & m1_wb_stb_i & (`M1_ADDRESSED_S1 | `M1_ADDRESSED_S2);
wire m2_req = m2_wb_cyc_i & m2_wb_stb_i & (`M2_ADDRESSED_S1 | `M2_ADDRESSED_S2);
always @ (posedge wb_clk_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    begin
      m1_in_progress <=#Tp 0;
      m2_in_progress <=#Tp 0;
      s1_wb_adr_o    <=#Tp 0;
      s1_wb_sel_o    <=#Tp 0;
      s1_wb_we_o     <=#Tp 0;
      s1_wb_dat_o    <=#Tp 0;
      s1_wb_cyc_o    <=#Tp 0;
      s1_wb_stb_o    <=#Tp 0;
      s2_wb_adr_o    <=#Tp 0;
      s2_wb_sel_o    <=#Tp 0;
      s2_wb_we_o     <=#Tp 0;
      s2_wb_dat_o    <=#Tp 0;
      s2_wb_cyc_o    <=#Tp 0;
      s2_wb_stb_o    <=#Tp 0;
    end
  else
    begin
      case({m1_in_progress, m2_in_progress, m1_req, m2_req, m_wb_access_finished})  // synopsys_full_case synopsys_paralel_case
        5'b00_10_0, 5'b00_11_0 :
          begin
            m1_in_progress <=#Tp 1'b1;  // idle: m1 or (m1 & m2) want access: m1 -> m
            if(`M1_ADDRESSED_S1)
              begin
                s1_wb_adr_o <=#Tp m1_wb_adr_i;
                s1_wb_sel_o <=#Tp m1_wb_sel_i;
                s1_wb_we_o  <=#Tp m1_wb_we_i;
                s1_wb_dat_o <=#Tp m1_wb_dat_i;
                s1_wb_cyc_o <=#Tp 1'b1;
                s1_wb_stb_o <=#Tp 1'b1;
              end
            else if(`M1_ADDRESSED_S2)
              begin
                s2_wb_adr_o <=#Tp m1_wb_adr_i;
                s2_wb_sel_o <=#Tp m1_wb_sel_i;
                s2_wb_we_o  <=#Tp m1_wb_we_i;
                s2_wb_dat_o <=#Tp m1_wb_dat_i;
                s2_wb_cyc_o <=#Tp 1'b1;
                s2_wb_stb_o <=#Tp 1'b1;
              end
            else
              $display("(%t)(%m)WISHBONE ERROR: Unspecified address space accessed", $time);
          end
        5'b00_01_0 :
          begin
            m2_in_progress <=#Tp 1'b1;  // idle: m2 wants access: m2 -> m
            if(`M2_ADDRESSED_S1)
              begin
                s1_wb_adr_o <=#Tp m2_wb_adr_i;
                s1_wb_sel_o <=#Tp m2_wb_sel_i;
                s1_wb_we_o  <=#Tp m2_wb_we_i;
                s1_wb_dat_o <=#Tp m2_wb_dat_i;
                s1_wb_cyc_o <=#Tp 1'b1;
                s1_wb_stb_o <=#Tp 1'b1;
              end
            else if(`M2_ADDRESSED_S2)
              begin
                s2_wb_adr_o <=#Tp m2_wb_adr_i;
                s2_wb_sel_o <=#Tp m2_wb_sel_i;
                s2_wb_we_o  <=#Tp m2_wb_we_i;
                s2_wb_dat_o <=#Tp m2_wb_dat_i;
                s2_wb_cyc_o <=#Tp 1'b1;
                s2_wb_stb_o <=#Tp 1'b1;
              end
            else
              $display("(%t)(%m)WISHBONE ERROR: Unspecified address space accessed", $time);
          end
        5'b10_10_1, 5'b10_11_1 :
          begin
            m1_in_progress <=#Tp 1'b0;  // m1 in progress. Cycle is finished. Send ack or err to m1.
            if(`M1_ADDRESSED_S1)
              begin
                s1_wb_cyc_o <=#Tp 1'b0;
                s1_wb_stb_o <=#Tp 1'b0;
              end
            else if(`M1_ADDRESSED_S2)
              begin
                s2_wb_cyc_o <=#Tp 1'b0;
                s2_wb_stb_o <=#Tp 1'b0;
              end
          end
        5'b01_01_1, 5'b01_11_1 :
          begin
            m2_in_progress <=#Tp 1'b0;  // m2 in progress. Cycle is finished. Send ack or err to m2.
            if(`M2_ADDRESSED_S1)
              begin
                s1_wb_cyc_o <=#Tp 1'b0;
                s1_wb_stb_o <=#Tp 1'b0;
              end
            else if(`M2_ADDRESSED_S2)
              begin
                s2_wb_cyc_o <=#Tp 1'b0;
                s2_wb_stb_o <=#Tp 1'b0;
              end
          end
      endcase
    end
end
// Generating Ack for master 1
always @ (m1_in_progress or m1_wb_adr_i or s1_wb_ack_i or s2_wb_ack_i or s1_wb_dat_i or s2_wb_dat_i or `M1_ADDRESSED_S1 or `M1_ADDRESSED_S2)
begin
  if(m1_in_progress)
    begin
      if(`M1_ADDRESSED_S1) begin
        m1_wb_ack_o <= s1_wb_ack_i;
        m1_wb_dat_o <= s1_wb_dat_i;
      end
      else if(`M1_ADDRESSED_S2) begin
        m1_wb_ack_o <= s2_wb_ack_i;
        m1_wb_dat_o <= s2_wb_dat_i;
      end
    end
  else
    m1_wb_ack_o <= 0;
end
// Generating Ack for master 2
always @ (m2_in_progress or m2_wb_adr_i or s1_wb_ack_i or s2_wb_ack_i or s1_wb_dat_i or s2_wb_dat_i or `M2_ADDRESSED_S1 or `M2_ADDRESSED_S2)
begin
  if(m2_in_progress)
    begin
      if(`M2_ADDRESSED_S1) begin
        m2_wb_ack_o <= s1_wb_ack_i;
        m2_wb_dat_o <= s1_wb_dat_i;
      end
      else if(`M2_ADDRESSED_S2) begin
        m2_wb_ack_o <= s2_wb_ack_i;
        m2_wb_dat_o <= s2_wb_dat_i;
      end
    end
  else
    m2_wb_ack_o <= 0;
end
// Generating Err for master 1
always @ (m1_in_progress or m1_wb_adr_i or s1_wb_err_i or s2_wb_err_i or `M2_ADDRESSED_S1 or `M2_ADDRESSED_S2 or
          m1_wb_cyc_i or m1_wb_stb_i)
begin
  if(m1_in_progress)  begin
    if(`M1_ADDRESSED_S1)
      m1_wb_err_o <= s1_wb_err_i;
    else if(`M1_ADDRESSED_S2)
      m1_wb_err_o <= s2_wb_err_i;
  end
  else if(m1_wb_cyc_i & m1_wb_stb_i & ~`M1_ADDRESSED_S1 & ~`M1_ADDRESSED_S2)
    m1_wb_err_o <= 1'b1;
  else
    m1_wb_err_o <= 1'b0;
end
// Generating Err for master 2
always @ (m2_in_progress or m2_wb_adr_i or s1_wb_err_i or s2_wb_err_i or `M2_ADDRESSED_S1 or `M2_ADDRESSED_S2 or
          m2_wb_cyc_i or m2_wb_stb_i)
begin
  if(m2_in_progress)  begin
    if(`M2_ADDRESSED_S1)
      m2_wb_err_o <= s1_wb_err_i;
    else if(`M2_ADDRESSED_S2)
      m2_wb_err_o <= s2_wb_err_i;
  end
  else if(m2_wb_cyc_i & m2_wb_stb_i & ~`M2_ADDRESSED_S1 & ~`M2_ADDRESSED_S2)
    m2_wb_err_o <= 1'b1;
  else
    m2_wb_err_o <= 1'b0;
end
assign m_wb_access_finished = m1_wb_ack_o | m1_wb_err_o | m2_wb_ack_o | m2_wb_err_o;
// Activity monitor
integer cnt;
always @ (posedge wb_clk_i or posedge wb_rst_i)
begin
  if(wb_rst_i)
    cnt <=#Tp 0;
  else
  if(s1_wb_ack_i | s1_wb_err_i | s2_wb_ack_i | s2_wb_err_i)
    cnt <=#Tp 0;
  else
  if(s1_wb_cyc_o | s2_wb_cyc_o)
    cnt <=#Tp cnt+1;
end
always @ (posedge wb_clk_i)
begin
  if(cnt==1000) begin
    $display("(%0t)(%m) ERROR: WB activity ??? ", $time);
    if(s1_wb_cyc_o) begin
      $display("s1_wb_dat_o = 0x%0x", s1_wb_dat_o);
      $display("s1_wb_adr_o = 0x%0x", s1_wb_adr_o);
      $display("s1_wb_sel_o = 0x%0x", s1_wb_sel_o);
      $display("s1_wb_we_o = 0x%0x", s1_wb_we_o);
    end
    else if(s2_wb_cyc_o) begin
      $display("s2_wb_dat_o = 0x%0x", s2_wb_dat_o);
      $display("s2_wb_adr_o = 0x%0x", s2_wb_adr_o);
      $display("s2_wb_sel_o = 0x%0x", s2_wb_sel_o);
      $display("s2_wb_we_o = 0x%0x", s2_wb_we_o);
    end
    $stop;
  end
end
always @ (posedge wb_clk_i)
begin
  if(s1_wb_err_i & s1_wb_cyc_o) begin
    $display("(%0t) ERROR: WB cycle finished with error acknowledge ", $time);
    $display("s1_wb_dat_o = 0x%0x", s1_wb_dat_o);
    $display("s1_wb_adr_o = 0x%0x", s1_wb_adr_o);
    $display("s1_wb_sel_o = 0x%0x", s1_wb_sel_o);
    $display("s1_wb_we_o = 0x%0x", s1_wb_we_o);
    $stop;
  end
  if(s2_wb_err_i & s2_wb_cyc_o) begin
    $display("(%0t) ERROR: WB cycle finished with error acknowledge ", $time);
    $display("s2_wb_dat_o = 0x%0x", s2_wb_dat_o);
    $display("s2_wb_adr_o = 0x%0x", s2_wb_adr_o);
    $display("s2_wb_sel_o = 0x%0x", s2_wb_sel_o);
    $display("s2_wb_we_o = 0x%0x", s2_wb_we_o);
    $stop;
  end
end
endmodule