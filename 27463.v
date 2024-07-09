module `DEMUX1_4_DMS`
reg x = 0;
wire y0;
wire y1;
reg s0 = 0;
reg s1 = 0;
wire y2;
wire y3;
wire [17:0] xTV;
wire [17:0] s0TV;
wire [17:0] s1TV;
wire DEMUX1_4_DMS0_0_s0_y2y3_WIRE;
wire DEMUX1_4_DMS0_0_s0_y0y1_WIRE;
assign xTV = 18'd87399;
assign s0TV = 18'd52982;
assign s1TV = 18'd16277;
always @(x, y0, s1, s0, y3, y2, y1) begin: DEMUX1_4_DMS_TBV_PRINT_DATA
    $write("%h", x);
    $write(" ");
    $write("%h", s0);
    $write(" ");
    $write("%h", s1);
    $write(" ");
    $write("%h", y0);
    $write(" ");
    $write("%h", y1);
    $write(" ");
    $write("%h", y2);
    $write(" ");
    $write("%h", y3);
    $write("\n");
end
assign DEMUX1_4_DMS0_0_s0_y0y1_WIRE = ((!s1) && x);
assign DEMUX1_4_DMS0_0_s0_y2y3_WIRE = (s1 && x);
assign y0 = ((!s0) && DEMUX1_4_DMS0_0_s0_y0y1_WIRE);
assign y1 = (s0 && DEMUX1_4_DMS0_0_s0_y0y1_WIRE);
assign y2 = ((!s0) && DEMUX1_4_DMS0_0_s0_y2y3_WIRE);
assign y3 = (s0 && DEMUX1_4_DMS0_0_s0_y2y3_WIRE);
initial begin: DEMUX1_4_DMS_TBV_STIMULES
    integer i;
    for (i=0; i<18; i=i+1) begin
        x <= xTV[i];
        s0 <= s0TV[i];
        s1 <= s1TV[i];
        # 1;
    end
    $finish;
end
endmodule