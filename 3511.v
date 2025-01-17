module n64_vinfo_ext(
  VCLK,
  nDSYNC,
  Sync_pre,
  Sync_cur,
  vinfo_o
);
`include "vh/n64rgb_params.vh"
input VCLK;
input nDSYNC;
input  [3:0] Sync_pre;
input  [3:0] Sync_cur;
output [3:0] vinfo_o;   // order: data_cnt,vmode,n64_480i
// some pre-assignments
wire posedge_nVSYNC = !Sync_pre[3] &  Sync_cur[3];
wire negedge_nVSYNC =  Sync_pre[3] & !Sync_cur[3];
wire posedge_nHSYNC = !Sync_pre[1] &  Sync_cur[1];
wire negedge_nHSYNC =  Sync_pre[1] & !Sync_cur[1];
// data counter for heuristic and de-mux
// =====================================
reg [1:0] data_cnt = 2'b00;
always @(posedge VCLK) begin // data register management
  if (!nDSYNC)
    data_cnt <= 2'b01;  // reset data counter
  else
    data_cnt <= data_cnt + 1'b1;  // increment data counter
end
// estimation of 240p/288p
// =======================
reg FrameID  = 1'b0; // 0 = even frame, 1 = odd frame; 240p: only even or only odd frames; 480i: even and odd frames
reg n64_480i = 1'b1; // 0 = 240p/288p , 1= 480i/576i
always @(posedge VCLK) begin
  if (!nDSYNC) begin
    if (negedge_nVSYNC) begin    // negedge at nVSYNC
      if (negedge_nHSYNC) begin  // negedge at nHSYNC, too -> odd frame
        n64_480i <= ~FrameID;
        FrameID  <= 1'b1;
      end else begin                    // no negedge at nHSYNC -> even frame
        n64_480i <= FrameID;
        FrameID  <= 1'b0;
      end
    end
  end
end
// determine vmode and blurry pixel position
// =========================================
reg [1:0] line_cnt;     // PAL: line_cnt[1:0] == 0x ; NTSC: line_cnt[1:0] = 1x
reg       vmode = 1'b0; // PAL: vmode == 1          ; NTSC: vmode == 0
always @(posedge VCLK) begin
  if (!nDSYNC) begin
    if(posedge_nVSYNC) begin // posedge at nVSYNC detected - reset line_cnt and set vmode
      line_cnt <= 2'b00;
      vmode    <= ~line_cnt[1];
    end else if(posedge_nHSYNC) // posedge nHSYNC -> increase line_cnt
      line_cnt <= line_cnt + 1'b1;
  end
end
// pack vinfo_o vector
// =================
assign vinfo_o = {data_cnt,vmode,n64_480i};
endmodule