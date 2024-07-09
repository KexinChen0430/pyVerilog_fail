module jt12_pcm_interpol
#(parameter dw=9, stepw=5)
(
    input           rst_n,
    input           clk,
    input           cen,      // 8MHz cen
    input           cen55,    // clk & cen55  =  55 kHz
    input           pcm_wr,      // advance to next sample
    input      signed [dw-1:0] pcmin,
    output reg signed [dw-1:0] pcmout
);
reg [stepw-1:0] dn, pre_dn={stepw{1'b1}};
wire posedge_pcmwr =  pcm_wr && !last_pcm_wr;
wire negedge_pcmwr = !pcm_wr &&  last_pcm_wr;
reg start_div = 0;
wire working;
reg signed [dw-1:0] pcmnew, dx, pcmlast, pcminter;
wire signed [dw:0]  dx_ext = { pcmin[dw-1], pcmin } - { pcmnew[dw-1], pcmnew };
reg sign, last_pcm_wr;
// latch new data and compute the two deltas : dx and dn, slope = dx/dn
always @(posedge clk) begin
    last_pcm_wr <= pcm_wr;
    start_div   <= posedge_pcmwr;
    if( posedge_pcmwr ) begin
        pre_dn    <= 1;
        pcmnew    <= pcmin;
        pcmlast   <= pcmnew;
        dn        <= pre_dn;
        dx        <= dx_ext[dw] ? ~dx_ext[dw-1:0] + 'd1 : dx_ext[dw-1:0];
        sign      <= dx_ext[dw];
        start_div <= 1;
    end
    if( !pcm_wr && cen55 ) begin
        if( pre_dn != {stepw{1'b1}} ) pre_dn <= pre_dn + 'd1;
    end
end
// interpolate samples
wire [dw-1:0] step;
wire signed [dw-1:0] next_up   = pcminter + step;
wire signed [dw-1:0] next_down = pcminter - step;
wire overflow_up   = 0;//next_up[dw-1]   != pcmnew[dw-1];
wire overflow_down = 0;//next_down[dw-1] != pcmnew[dw-1];
always @(posedge clk) begin
    if( negedge_pcmwr ) begin
        pcminter <= pcmlast;
    end else if(cen55 && !working && !pcm_wr) begin // only advance if the divider has finished
        if( sign ) begin // subtract
            if( next_down > pcmnew && !overflow_down )
                pcminter <= next_down;
            else
                pcminter <= pcmnew; // done
        end
        else begin // add
            if( next_up < pcmnew && !overflow_up )
                pcminter <= next_up;
            else
                pcminter <= pcmnew; // done
        end
    end
end
// output only at cen55
always @(posedge clk) if(cen55) pcmout <= pcminter;
jt10_adpcm_div #(.dw(dw)) u_div(
    .rst_n  ( rst_n       ),
    .clk    ( clk         ),
    .cen    ( 1'b1        ),
    .start  ( start_div   ),
    .a      ( dx          ),
    .b      ( { {dw-stepw{1'b0}}, dn }   ),
    .d      ( step        ),
    .r      (             ),
    .working( working     )
);
endmodule