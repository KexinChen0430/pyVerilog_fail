module main_array(
    input clk,
    output reg mic_clk,
    output mic_clk2,
    input [12:0] mic_data,
    input [15:0] mic_sel,
    output reg [15:0] led_out,
    output hs,
    output vs,
    output reg [11:0] rgb,
    output micLRSel,
    output ampPWM,
    output ampSD,
    output [7:0] an,
    output [7:0] seg,
    output lp_datum
    );
    assign lp_datum = lp_datum_valid[0];
    assign micLRSel = 1'b0;
    //assign mic_clk = clk_6_144;
    //reg mic_data_reg;
    // 100 MHz on clk input
    // we want around 3 MHz for mic clocks
    // 50 MHz/16 = 3.125 MHz
    // 100 MHz/16 = 6.25 MHz
    //reg [6:0] clk_divider;
    assign mic_clk2 = mic_clk;
    // get 6.144 MHz clock
    wire clk_6_144;
    reg clk_3_072;
    wire clk_25;
    clk_wiz_0 clk_gen0(.clk_in1(clk), .clk_out1(clk_6_144), .reset(1'b0));
    clk_wiz_1 clk_gen1(.clk_in1(clk), .clk_out1(clk_25), .reset(1'b0));
    parameter signed MAX_SHIFT = 17; // max buffer shift at 48khz and 5 inch spacing before 90 degrees
    parameter TOTAL_MICS = 13;
    reg signed [6:0] buf_target;   // current rolling sample in buffer
    reg signed [5:0] shift_val;    // integer time-shift of buffers
    //reg shift_ang;          // to delay-sum to the left or right
    //reg signed [5:0] vshift_val;    // integer time-shift of buffers
    //reg vshift_ang;          // to delay-sum to the left or right
    reg [15:0] shift_cycle_count; // number of half-scan cycles that have happened
    reg [2:0] khz_datum_delay;
    // max values for tracking amplitude over time
    reg signed [5:0]  calc_shift_val; // counter to find highest amp and specified beam location
    reg signed [5:0]  calc_vshift_val; // counter to find highest amp and specified beam location
    reg signed [47:0] calc_val;
    reg signed [47:0] vcalc_val;
    reg signed [5:0]  max_shift_val; // beam location of max value (-17 to +17)
    reg signed [5:0]  max_vshift_val; // beam location of max value
    // seven segment controller for debug output
    seven_seg(.clk(mic_clk), .shift_val(max_shift_val), .vshift_val(max_vshift_val), .anode(an), .segments(seg));
    // VGA output for visualization
    wire blank;
    wire signed [11:0] hcount, vcount;
    vga_controller_640_60(.rst(1'b0), .pixel_clk(clk_25), .HS(hs), .VS(vs), .hcount(hcount[10:0]), .vcount(vcount[10:0]), .blank(blank));
    reg signed [19:0] sum_out;     // un-truncated sum from mic signals
    reg signed [19:0] vsum_out;    // un-truncated sum from mic signals
    reg signed [15:0] aud_sum_out; // 16 value for PWM output
    reg [7:0] mic_datum[0:TOTAL_MICS];
    wire mic_datum_ready[0:TOTAL_MICS];
    wire cic_datum_valid[0:TOTAL_MICS];
    wire cic_datum_ready[0:TOTAL_MICS];
    wire hb_datum_valid[0:TOTAL_MICS];
    wire hb_datum_ready[0:TOTAL_MICS];
    wire lp_datum_valid[0:TOTAL_MICS];
    wire lp_datum_ready[0:TOTAL_MICS];
    wire [23:0] cic_output[0:TOTAL_MICS];
    wire [23:0] hb_output[0:TOTAL_MICS];
    wire [23:0] lp_output[0:TOTAL_MICS];
    wire [15:0] hp_output[0:TOTAL_MICS];
    wire signed [15:0] beamshift_o[0:TOTAL_MICS];
    reg signed [6:0] buf_target_offset[0:TOTAL_MICS]; // time-shifted addresses to pull from audio buffer
    reg signed [47:0] shift_ang_bucket[0:MAX_SHIFT*2]; // sum buckets for each angle ("0"+17+17)
    reg signed [47:0] vshift_ang_bucket[0:MAX_SHIFT*2]; // sum buckets for each angle ("0"+17+17)
    reg signed [47:0] max_shift_ang_bucket[0:MAX_SHIFT*2]; // sum buckets for each angle ("0"+17+17) for visualization
    reg signed [47:0] max_vshift_ang_bucket[0:MAX_SHIFT*2]; // sum buckets for each angle ("0"+17+17) for visualization
    //reg signed [58:0] shift_ang_bucket_sum[0:MAX_SHIFT*2]; // sum buckets for each angle ("0"+17+17) for visualization
    //wire signed [47:0] shift_ang_bucket_out[0:MAX_SHIFT*2];
    //reg [10:0] buf_sum_target;
    genvar i;
    integer j;
    generate
        for(i = 0; i < TOTAL_MICS; i = i+1) begin
            cascaded_integrator_comb cic_filter(.aclk(mic_clk),
                                                .s_axis_data_tdata(mic_datum[i]),
                                                .s_axis_data_tvalid(1'b1),
                                                .s_axis_data_tready(mic_datum_ready[i]),
                                                .m_axis_data_tdata(cic_output[i]),
                                                .m_axis_data_tvalid(cic_datum_valid[i])
                                                );
            half_band_FIR             hb_filter(.aclk(mic_clk),
                                                .s_axis_data_tdata(cic_output[i]),
                                                .s_axis_data_tvalid(cic_datum_valid[i]),
                                                .s_axis_data_tready(cic_datum_ready[i]),
                                                .m_axis_data_tdata(hb_output[i]),
                                                .m_axis_data_tvalid(hb_datum_valid[i])
                                                );
            lp_FIR                    lp_filter(.aclk(mic_clk),
                                                .s_axis_data_tdata(hb_output[i]),
                                                .s_axis_data_tvalid(hb_datum_valid[i]),
                                                .s_axis_data_tready(hb_datum_ready[i]),
                                                .m_axis_data_tdata(lp_output[i]),
                                                .m_axis_data_tvalid(lp_datum_valid[i])
                                                );
            hp_rc                     hp_filter(.clk_i(mic_clk),
                                                .rst_i(1'b0),
                                                .en_i(lp_datum_valid[i]),
                                                .data_i(lp_output[i][16:1]),
                                                .data_o(hp_output[i])
                                                );
            mic_bram            mic_buffer_bram(.clk(mic_clk),
                                                .addr_i(buf_target),
                                                .data_i(hp_output[i]),
                                                .addr_o(buf_target_offset[i]),
                                                .data_o(beamshift_o[i])
                                                );
        end
    endgenerate
    initial begin
        for(j = 0; j < TOTAL_MICS; j = j+1) begin
            mic_datum[j] = 8'b00000011;
        end
        for(j = 0; j <= 34; j = j+1) begin
            shift_ang_bucket[j] = 0;
            vshift_ang_bucket[j] = 0;
        end
        shift_val = 0;
        //shift_ang = 0;
        buf_target = 0;
        //buf_sum_target = 0;
    end
    always @(negedge lp_datum_valid[0]) begin
        buf_target <= buf_target + 1'b1;
    end
    // the part where we actually grab the mic input
    always @(posedge clk_6_144) begin
        clk_3_072 = ~clk_3_072;
    end
    always @(posedge clk_3_072) begin
        mic_clk = ~mic_clk;
    end
    //always @(negedge mic_clk) begin
    always @(negedge clk_3_072 & (mic_clk == 1)) begin
        // see chart
        mic_datum[0][7:1] = { 7 {mic_sel[0] ? ~mic_data[9] : 1'b0 }};
        mic_datum[1][7:1] = { 7 {mic_sel[0] ? ~mic_data[10] : 1'b0 }};
        mic_datum[2][7:1] = { 7 {mic_sel[0] ? ~mic_data[6] : 1'b0 }};
        mic_datum[3][7:1] = { 7 {mic_sel[0] ? ~mic_data[3] : 1'b0 }};
        mic_datum[4][7:1] = { 7 {mic_sel[0] ? ~mic_data[11] : 1'b0 }};
        mic_datum[5][7:1] = { 7 {mic_sel[0] ? ~mic_data[8] : 1'b0 }};
        mic_datum[6][7:1] = { 7 {mic_sel[0] ? ~mic_data[7] : 1'b0 }};
        mic_datum[7][7:1] = { 7 {mic_sel[1] ? ~mic_data[2] : 1'b0 }};
        mic_datum[8][7:1] = { 7 {mic_sel[1] ? ~mic_data[5] : 1'b0 }};
        mic_datum[9][7:1] = { 7 {mic_sel[1] ? ~mic_data[0] : 1'b0 }};
        mic_datum[10][7:1] = { 7 {mic_sel[1] ? ~mic_data[4] : 1'b0 }};
        mic_datum[11][7:1] = { 7 {mic_sel[1] ? ~mic_data[1] : 1'b0 }};
        mic_datum[12][7:1] = { 7 {mic_sel[1] ? ~mic_data[12] : 1'b0 }};
    end
    always @(posedge mic_clk) begin
        // 1.536 MHz
        // each cycle, adjust the time shifted buffer addresses if we aren't about to put out audio.
        khz_datum_delay = {khz_datum_delay[1:0], lp_datum_valid[0]};
        buf_target_offset[0] = (khz_datum_delay == 3'b001 ? (mic_sel[15] ? buf_target - 51 : (buf_target - 51 + max_shift_val * 3)) : (buf_target - 51 + shift_val * 3));
        buf_target_offset[1] = (khz_datum_delay == 3'b001 ? (mic_sel[15] ? buf_target - 51 : (buf_target - 51 + max_shift_val * 2)) : (buf_target - 51 + shift_val * 2));
        buf_target_offset[2] = (khz_datum_delay == 3'b001 ? (mic_sel[15] ? buf_target - 51 : (buf_target - 51 + max_shift_val    )) : (buf_target - 51 + shift_val    ));
        buf_target_offset[3] = (khz_datum_delay == 3'b001 ? (mic_sel[15] ? buf_target - 51 : (buf_target - 51                    )) : (buf_target - 51                ));
        buf_target_offset[4] = (khz_datum_delay == 3'b001 ? (mic_sel[15] ? buf_target - 51 : (buf_target - 51 - max_shift_val    )) : (buf_target - 51 - shift_val    ));
        buf_target_offset[5] = (khz_datum_delay == 3'b001 ? (mic_sel[15] ? buf_target - 51 : (buf_target - 51 - max_shift_val * 2)) : (buf_target - 51 - shift_val * 2));
        buf_target_offset[6] = (khz_datum_delay == 3'b001 ? (mic_sel[15] ? buf_target - 51 : (buf_target - 51 - max_shift_val * 3)) : (buf_target - 51 - shift_val * 3));
        buf_target_offset[7] =  (khz_datum_delay == 3'b001 ? (mic_sel[15] ? buf_target - 51 : (buf_target - 51 + max_vshift_val * 3)) : (buf_target - 51 + shift_val * 3));
        buf_target_offset[8] =  (khz_datum_delay == 3'b001 ? (mic_sel[15] ? buf_target - 51 : (buf_target - 51 + max_vshift_val * 2)) : (buf_target - 51 + shift_val * 2));
        buf_target_offset[9] =  (khz_datum_delay == 3'b001 ? (mic_sel[15] ? buf_target - 51 : (buf_target - 51 + max_vshift_val    )) : (buf_target - 51 + shift_val    ));
        buf_target_offset[10] = (khz_datum_delay == 3'b001 ? (mic_sel[15] ? buf_target - 51 : (buf_target - 51 - max_vshift_val    )) : (buf_target - 51 - shift_val    ));
        buf_target_offset[11] = (khz_datum_delay == 3'b001 ? (mic_sel[15] ? buf_target - 51 : (buf_target - 51 - max_vshift_val * 2)) : (buf_target - 51 - shift_val * 2));
        buf_target_offset[12] = (khz_datum_delay == 3'b001 ? (mic_sel[15] ? buf_target - 51 : (buf_target - 51 - max_vshift_val * 3)) : (buf_target - 51 - shift_val * 3));
        if (khz_datum_delay == 3'b010) begin
            sum_out = beamshift_o[0]+
                      beamshift_o[1]+
                      beamshift_o[2]+
                      beamshift_o[3]+
                      beamshift_o[4]+
                      beamshift_o[5]+
                      beamshift_o[6]+
                      beamshift_o[7]+
                      beamshift_o[8]+
                      beamshift_o[9]+
                      beamshift_o[10]+
                      beamshift_o[11]+
                      beamshift_o[12];
            aud_sum_out = sum_out[15:0];
            led_out = aud_sum_out[15] ? ~aud_sum_out[15:0] : aud_sum_out[15:0];
        end else begin
            sum_out = mic_sel[14] ? ((beamshift_o[0][15] ? ~beamshift_o[0] : beamshift_o[0]) +
                                     (beamshift_o[1][15] ? ~beamshift_o[1] : beamshift_o[1]) +
                                     (beamshift_o[2][15] ? ~beamshift_o[2] : beamshift_o[2]) +
                                     (beamshift_o[3][15] ? ~beamshift_o[3] : beamshift_o[3]) +
                                     (beamshift_o[4][15] ? ~beamshift_o[4] : beamshift_o[4]) +
                                     (beamshift_o[5][15] ? ~beamshift_o[5] : beamshift_o[5]) +
                                     (beamshift_o[6][15] ? ~beamshift_o[6] : beamshift_o[6]))
                                   : (beamshift_o[0] +
                                      beamshift_o[1] +
                                      beamshift_o[2] +
                                      beamshift_o[3] +
                                      beamshift_o[4] +
                                      beamshift_o[5] +
                                      beamshift_o[6]);
            vsum_out = mic_sel[14] ? ((beamshift_o[7][15] ? ~beamshift_o[7] : beamshift_o[7]) +
                                      (beamshift_o[8][15] ? ~beamshift_o[8] : beamshift_o[8]) +
                                      (beamshift_o[9][15] ? ~beamshift_o[9] : beamshift_o[9]) +
                                      (beamshift_o[3][15] ? ~beamshift_o[3] : beamshift_o[3]) +
                                      (beamshift_o[10][15] ? ~beamshift_o[10] : beamshift_o[10]) +
                                      (beamshift_o[11][15] ? ~beamshift_o[11] : beamshift_o[11]) +
                                      (beamshift_o[12][15] ? ~beamshift_o[12] : beamshift_o[12]))
                                    : (beamshift_o[7] +
                                       beamshift_o[8] +
                                       beamshift_o[9] +
                                       beamshift_o[3] +
                                       beamshift_o[10] +
                                       beamshift_o[11] +
                                       beamshift_o[12]);
            if (shift_cycle_count == 16384) begin // about 1/3 sec
                shift_cycle_count = 0;
                max_shift_val = calc_shift_val;
                max_vshift_val = calc_vshift_val;
                calc_shift_val = 0;
                calc_vshift_val = 0;
                calc_val = 0;
                vcalc_val = 0;
                for(j = 0; j <= 34; j = j+1) begin
                    shift_ang_bucket[j] = 0;
                    vshift_ang_bucket[j] = 0;
                    //shift_ang_bucket_sum[j] = 0;
                end
            end else begin
                // every ~2048 calcs, about 1/12 of a second
                if (!mic_sel[13]) begin // offset a couple to account for other stuff at 0
                    if (shift_cycle_count[10:0] == 2) begin
                        max_shift_ang_bucket[MAX_SHIFT + shift_val] = shift_ang_bucket[MAX_SHIFT + shift_val];
                        shift_ang_bucket[MAX_SHIFT + shift_val] = 0;
                        max_vshift_ang_bucket[MAX_SHIFT + shift_val] = vshift_ang_bucket[MAX_SHIFT + shift_val];
                        vshift_ang_bucket[MAX_SHIFT + shift_val] = 0;
                    end
                    if (sum_out > shift_ang_bucket[MAX_SHIFT + shift_val]) begin
                        shift_ang_bucket[MAX_SHIFT + shift_val] = sum_out;
                    end
                    if (vsum_out > vshift_ang_bucket[MAX_SHIFT + shift_val]) begin
                        vshift_ang_bucket[MAX_SHIFT + shift_val] = vsum_out;
                    end
                    if (sum_out > calc_val) begin
                        calc_val <= sum_out;
                        calc_shift_val <= shift_val;
                    end
                    if (vsum_out > vcalc_val) begin
                        vcalc_val <= vsum_out;
                        calc_vshift_val <= shift_val;
                    end
                end else begin
                    shift_ang_bucket[MAX_SHIFT + shift_val] = shift_ang_bucket[MAX_SHIFT + shift_val] + sum_out * sum_out;
                    if (shift_ang_bucket[MAX_SHIFT + shift_val] > calc_val) begin
                        calc_val <= shift_ang_bucket[MAX_SHIFT + shift_val];
                        calc_shift_val <= shift_val;
                    end
                end
            end
        //end
            shift_val = shift_val + 1;
            if (shift_val == MAX_SHIFT+1) begin
                shift_val = -MAX_SHIFT;
                shift_cycle_count = shift_cycle_count + 1;
            end
        end
    end
    delta_sigma audio_out(.clk_i(clk), .din(aud_sum_out), .dout(ampPWM));
    assign ampSD = 1'b1;
    always @(posedge clk_25) begin
        // video!
        case (blank)
            1: begin
                rgb = 0;
            end
            0: begin
                // grey
                rgb = 12'b0100_0100_0100;
                if (!mic_sel[13]) begin
                    if (vcount >> 3 <= MAX_SHIFT*2) begin
                        if (((max_vshift_ang_bucket[vcount >> 3][47] ? ~max_vshift_ang_bucket[vcount >> 3]+1
                                                                     :  max_vshift_ang_bucket[vcount >> 3]  ) >> 5) > hcount) begin
                            if ((vcount >> 3) == (MAX_SHIFT + max_vshift_val))
                                rgb = 12'b0001_0001_1110;
                            else if ((vcount >> 3) == MAX_SHIFT) /*should be center*/
                                rgb = 12'b1100_1100_1100;
                            else
                                rgb = 12'b1100_0011_0000;
                        end
                    end
                    if (hcount > 640-MAX_SHIFT*16) begin
                        // (hcount + MAX_SHIFT*32 - 640) >> 3
                        if (480-((max_shift_ang_bucket[(hcount + MAX_SHIFT*16 - 640) >> 3][47] ? ~max_shift_ang_bucket[(hcount + MAX_SHIFT*16 - 640) >> 3]+1
                                                                                               :  max_shift_ang_bucket[(hcount + MAX_SHIFT*16 - 640) >> 3]  ) >> 5) < vcount) begin
                            if (((hcount + MAX_SHIFT*16 - 640) >> 3) == (MAX_SHIFT + max_shift_val))
                                rgb = 12'b0001_0001_1110;
                            else if (((hcount + MAX_SHIFT*16 - 640) >> 3) == MAX_SHIFT) /*should be center*/
                                rgb = 12'b1100_1100_1100;
                            else
                                rgb = 12'b1100_0000_1100;
                        end
                    end
                    /*if ((hcount >> 3) <= (MAX_SHIFT*4)) begin
                        if ((hcount >> 3) <= MAX_SHIFT*2) begin
                            if (((max_vshift_ang_bucket[hcount >> 3][47] ? ~max_vshift_ang_bucket[hcount >> 3]+1
                                                                         :  max_vshift_ang_bucket[hcount >> 3]  ) >> 5) > vcount) begin
                                if ((hcount >> 3) == (MAX_SHIFT + max_vshift_val))
                                    rgb = 12'b0001_0001_1110;
                                else if ((hcount >> 3) == MAX_SHIFT)
                                    rgb = 12'b1100_0000_1100;
                                else
                                    rgb = 12'b1100_0100_0000;
                            end
                        end else begin // second half, x axis
                            if (((max_shift_ang_bucket[(hcount >> 3)-MAX_SHIFT*2][47] ? ~max_shift_ang_bucket[(hcount >> 3)-MAX_SHIFT*2]+1
                                                                                      :  max_shift_ang_bucket[(hcount >> 3)-MAX_SHIFT*2]  ) >> 5) > vcount) begin
                                if (((hcount >> 3)-MAX_SHIFT*2) == (MAX_SHIFT + max_shift_val))
                                    rgb = 12'b0001_0001_1110;
                                else if (((hcount >> 3)-MAX_SHIFT*2) == MAX_SHIFT)
                                    rgb = 12'b1100_1100_1100;
                                else
                                    rgb = 12'b1100_0000_1100;
                            end
                        end
                    end*/
                end else begin
                    if ((hcount >> 3) <= (MAX_SHIFT*4)) begin
                        if ({shift_ang_bucket[hcount >> 4][44],
                             shift_ang_bucket[hcount >> 4][42],
                             shift_ang_bucket[hcount >> 4][40],
                             shift_ang_bucket[hcount >> 4][38],
                             shift_ang_bucket[hcount >> 4][36],
                             shift_ang_bucket[hcount >> 4][34],
                             shift_ang_bucket[hcount >> 4][30],
                             shift_ang_bucket[hcount >> 4][26],
                             shift_ang_bucket[hcount >> 4][22],
                             shift_ang_bucket[hcount >> 4][18],
                             shift_ang_bucket[hcount >> 4][14],
                             shift_ang_bucket[hcount >> 4][10]} > vcount) begin
                            if ((hcount >> 4) == (MAX_SHIFT + max_shift_val))
                                rgb = 12'b1110_0001_0001;
                            else if (hcount >> 4 == MAX_SHIFT /*should be center*/)
                                rgb = 12'b1100_1100_1100;
                            else
                                rgb = 12'b0000_1100_1100;
                        end
                    end
                end
            end
        endcase
    end //always@
endmodule