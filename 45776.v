module rx_crc_compare #(
    parameter LOG_FPW       = 2,
    parameter FPW           = 4,
    parameter DWIDTH        = 512
) (
    input   wire                clk,
    input   wire                res_n,
    input   wire [FPW-1:0]      d_in_hdr,
    input   wire [FPW-1:0]      d_in_tail,
    input   wire [FPW-1:0]      d_in_valid,
    input   wire [DWIDTH-1:0]   d_in_data,
    input   wire [(FPW*4)-1:0]  d_in_lng,
    output  wire [DWIDTH-1:0]   d_out_data,
    output  reg  [FPW-1:0]      d_out_hdr,
    output  reg  [FPW-1:0]      d_out_tail,
    output  reg  [FPW-1:0]      d_out_valid,
    output  reg  [FPW-1:0]      d_out_error,
    output  reg  [FPW-1:0]      d_out_poisoned,
    output  reg  [FPW-1:0]      d_out_rtc,
    output  reg  [FPW-1:0]      d_out_flow
);
//=====================================================================================================
//=====================================================================================================
`include "hmc_field_functions.h"
integer i_f;    //counts to FPW
integer i_f2;   //counts to FPW inside another i_f loop
integer i_c;    //depth of the crc data pipeline
genvar f, f2;
localparam CMD_TRET = 6'b000010;
localparam CMD_PRET = 6'b000001;
wire [127:0]    d_in_flit             [FPW-1:0];
wire [127:0]    d_in_flit_removed_crc [FPW-1:0];
generate
    for(f = 0; f < (FPW); f = f + 1) begin :SPLIT_FLITs_RX
        assign d_in_flit[f] = d_in_data[(f*128)+128-1:f*128];
        assign d_in_flit_removed_crc[f][95:0] = d_in_flit[f][95:0];
        assign d_in_flit_removed_crc[f][127:96] = d_in_tail[f] ? {32'h0} : d_in_flit[f][127:96];
    end
endgenerate
reg  [DWIDTH-1:0]       d_in_data_dly;
reg  [FPW-1:0]          d_in_hdr_dly;
reg  [FPW-1:0]          d_in_tail_dly;
reg  [FPW-1:0]          d_in_valid_dly;
reg  [LOG_FPW-1:0]      d_in_flit_target_crc  [FPW-1:0];
wire [3:0] d_in_lng_per_flit [FPW-1:0];
reg  [3:0] d_in_lng_per_flit_dly [FPW-1:0];
generate
    for(f = 0; f < (FPW); f = f + 1) begin  : retrieve_packet_lengths_for_crc_assignment
        assign d_in_lng_per_flit[f] = d_in_lng[(f*4)+4-1:f*4] ;
    end
endgenerate
reg                     swap_crc;
//Retrieve the target crc from the header and assign to corresponding tail
reg  [LOG_FPW-1:0]      target_crc_per_tail     [FPW-1:0];
reg  [LOG_FPW-1:0]      target_crc_per_tail1    [FPW-1:0];
reg  [LOG_FPW-1:0]      target_crc_per_tail_comb[FPW-1:0];
reg  [LOG_FPW-1:0]      target_crc_comb;
reg  [LOG_FPW-1:0]      target_crc_temp;
wire [31:0]    crc_init_out      [FPW-1:0];
reg  [31:0]    crc_accu_in       [FPW-1:0];
reg  [FPW-1:0] crc_accu_in_valid [FPW-1:0];
reg  [FPW-1:0] crc_accu_in_tail  [FPW-1:0];
wire [31:0]    crc_per_flit      [FPW-1:0];
reg  [3:0]              payload_remain    [FPW-1:0];
wire [(FPW*32)-1:0] crc_accu_in_combined [FPW-1:0];
generate
    for(f=0;f<FPW;f=f+1) begin : INTER_CRC_1_RX
        for(f2=0;f2<FPW;f2=f2+1) begin : INTER_CRC_2_RX
            assign crc_accu_in_combined[f][(f2*32)+31:(f2*32)] = crc_accu_in_valid[f][f2] ? crc_accu_in[f2] : 32'h0;
        end
    end
endgenerate
reg  [DWIDTH-1:0]       crc_data_pipe_in_data                               [1:0];
reg  [FPW-1:0]          crc_data_pipe_in_hdr                                [1:0];
reg  [FPW-1:0]          crc_data_pipe_in_tail                               [1:0];
reg  [FPW-1:0]          crc_data_pipe_in_valid                              [1:0];
wire [128-1:0]          crc_data_pipe_out_data_flit                         [FPW-1:0];
generate
    for(f = 0; f < (FPW); f = f + 1) begin : assign_data_pipe_output
        assign crc_data_pipe_out_data_flit[f]                        = crc_data_pipe_in_data[1][(f*128)+128-1:f*128];
    end
endgenerate
reg  [128-1:0]       data_rdy_flit   [FPW-1:0];
generate
        for(f = 0; f < (FPW); f = f + 1) begin : reorder_flits_to_word
            assign d_out_data[(f*128)+128-1:(f*128)] = data_rdy_flit[f];
        end
endgenerate
//==================================================================================
//==================================================================================
always @(*)  begin
//Retrieve the length from the header and assign it to the tail. This information will be used in the
//invalidation stage to the correct number of FLITs
    target_crc_comb = target_crc_temp;
    for(i_f = 0; i_f < (FPW); i_f = i_f + 1) begin
        if(d_in_hdr_dly[i_f]) begin
            target_crc_comb = d_in_flit_target_crc[i_f];
        end
        if(d_in_tail_dly[i_f]) begin
            target_crc_per_tail_comb[i_f] = target_crc_comb;
        end else begin
            target_crc_per_tail_comb[i_f] = {4{1'b0}};
        end
    end
end
//Register combinational values
`ifdef ASYNC_RES
always @(posedge clk or negedge res_n)  begin `else
always @(posedge clk)  begin `endif
if(!res_n) begin
    for(i_f = 0; i_f < (FPW); i_f = i_f + 1) begin
        target_crc_per_tail[i_f] <= 0;
    end
    target_crc_temp    <= {4{1'b0}};
end else begin
    for(i_f = 0; i_f < (FPW); i_f = i_f + 1) begin
        target_crc_per_tail[i_f] <= target_crc_per_tail_comb[i_f];
    end
    target_crc_temp    <= target_crc_comb;
end
end
//=====================================================================================================
//=====================================================================================================
//====================================================================
//====================================================================
`ifdef ASYNC_RES
always @(posedge clk or negedge res_n)  begin `else
always @(posedge clk)  begin `endif
if(!res_n) begin
    for(i_f=0;i_f<FPW;i_f=i_f+1)begin
        d_in_flit_target_crc[i_f] <= {LOG_FPW{1'b0}};
    end
    swap_crc            <= 1'b0;
end else begin
    for(i_f=0;i_f<FPW;i_f=i_f+1)begin
        d_in_flit_target_crc[i_f] <= {LOG_FPW{1'b0}};
    end
    //Reset if seen a tail
    if(|d_in_tail) begin
        swap_crc        <= 1'b0;
    end
    for(i_f=0;i_f<FPW;i_f=i_f+1)begin
        if(d_in_hdr[i_f])begin
            if((i_f+d_in_lng_per_flit[i_f])>FPW) begin
            //If the current packet spreads over multiple cycles
                if(swap_crc) begin
                    //If the last packet was swapped and the current packet also spreads over the more than 1 cycle use crc 0 now
                    d_in_flit_target_crc[i_f]   <= 3'h0;
                end else begin
                    d_in_flit_target_crc[i_f]   <= FPW-1'b1;
                    swap_crc                    <= 1'b1;
                end
            end else begin
                d_in_flit_target_crc[i_f] <= i_f;
                //If the highest order CRC contains a data packet that ends in this cycle, dont use this crc
                //It's ok always to decrement by 1 since we know the lowest order CRC would not be used (at least FLIT0 goes to highest order CRC)
                if(swap_crc && !(d_in_hdr > d_in_tail)) begin
                    d_in_flit_target_crc[i_f] <= i_f-1;
                end
            end
        end
    end
end
end
//Register input values to be used in CRC assignment logic after crc init stage
`ifdef ASYNC_RES
always @(posedge clk or negedge res_n)  begin `else
always @(posedge clk)  begin `endif
if(!res_n) begin
    for(i_f=0;i_f<FPW;i_f=i_f+1)begin
        d_in_lng_per_flit_dly[i_f]  <= 4'h0;
    end
    d_in_data_dly   <= {DWIDTH{1'b0}};
    d_in_hdr_dly    <= {FPW{1'b0}};
    d_in_tail_dly   <= {FPW{1'b0}};
    d_in_valid_dly  <= {FPW{1'b0}};
end else begin
    for(i_f=0;i_f<FPW;i_f=i_f+1)begin
        d_in_lng_per_flit_dly[i_f]  <= d_in_lng_per_flit[i_f];
    end
    d_in_data_dly   <= d_in_data;
    d_in_hdr_dly    <= d_in_hdr;
    d_in_tail_dly   <= d_in_tail;
    d_in_valid_dly  <= d_in_valid;
end
end
//====================================================================
//====================================================================
`ifdef ASYNC_RES
always @(posedge clk or negedge res_n)  begin `else
always @(posedge clk)  begin `endif
if(!res_n) begin
    for(i_f=0;i_f<FPW;i_f=i_f+1)begin
        crc_accu_in[i_f] <= {32{1'b0}};
        crc_accu_in_valid[i_f]  <= {FPW{1'b0}};
        crc_accu_in_tail[i_f]  <= {FPW{1'b0}};
        payload_remain[i_f]     <= 4'h0;
    end
end else begin
    for(i_f=0;i_f<FPW;i_f=i_f+1)begin
        crc_accu_in[i_f] <= crc_init_out[i_f];
        crc_accu_in_valid[i_f]  <= 4'h0;
        crc_accu_in_tail[i_f]  <= 4'h0;
    end
    for(i_f=0;i_f<FPW;i_f=i_f+1)begin
    //First go through accu crcs
        if(|payload_remain[i_f]) begin
            if(payload_remain[i_f] > FPW) begin
                crc_accu_in_valid[i_f]  <= {FPW{1'b1}};
                payload_remain[i_f]     <= payload_remain[i_f]-FPW;
            end else begin
                crc_accu_in_valid[i_f]  <= {FPW{1'b1}} >> (FPW-payload_remain[i_f]);
                crc_accu_in_tail[i_f]   <= 1'b1 << (payload_remain[i_f]-1);
                payload_remain[i_f]     <= 4'h0;
            end
        end
        for(i_f2=0;i_f2<FPW;i_f2=i_f2+1)begin
            if(i_f==d_in_flit_target_crc[i_f2] && d_in_hdr_dly[i_f2]) begin
            //Then go through all input crcs from the init crc and find the crc's that must be assigned to the currently selected crc
                if( (i_f2+d_in_lng_per_flit_dly[i_f2]) >FPW ) begin
                    payload_remain[i_f] <= (d_in_lng_per_flit_dly[i_f2]-FPW+i_f2);
                    crc_accu_in_valid[i_f]   <=  {FPW{1'b1}} >> i_f2 << i_f2;
                end else begin
                    crc_accu_in_tail[i_f] <= 1'b1 << d_in_lng_per_flit_dly[i_f2]+i_f2-1;
                    crc_accu_in_valid[i_f]   <=  ({FPW{1'b1}} >> (FPW-i_f2-d_in_lng_per_flit_dly[i_f2])) >> i_f2 << i_f2;
                end
            end
        end
    end
end
end
//====================================================================
//====================================================================
`ifdef ASYNC_RES
always @(posedge clk or negedge res_n)  begin `else
always @(posedge clk)  begin `endif
if(!res_n) begin
    for(i_c=0;i_c<2;i_c=i_c+1)begin
        crc_data_pipe_in_data[i_c]       <= {DWIDTH{1'b0}};
        crc_data_pipe_in_hdr[i_c]        <= {FPW{1'b0}};
        crc_data_pipe_in_tail[i_c]       <= {FPW{1'b0}};
        crc_data_pipe_in_valid[i_c]      <= {FPW{1'b0}};
    end
    for(i_f = 0; i_f < (FPW); i_f = i_f + 1) begin
        target_crc_per_tail1[i_f] <= 3'h0;
    end
end else begin
    for(i_f = 0; i_f < (FPW); i_f = i_f + 1) begin
        target_crc_per_tail1[i_f] <= target_crc_per_tail[i_f];
    end
    //Set the first stage of the data pipeline
    crc_data_pipe_in_data[0]       <= d_in_data_dly;
    crc_data_pipe_in_hdr[0]        <= d_in_hdr_dly;
    crc_data_pipe_in_tail[0]       <= d_in_tail_dly;
    crc_data_pipe_in_valid[0]      <= d_in_valid_dly;
    //Data Pipeline propagation
    for(i_c=0;i_c<(1);i_c=i_c+1)begin
        crc_data_pipe_in_data[i_c+1]   <= crc_data_pipe_in_data[i_c];
        crc_data_pipe_in_tail[i_c+1]   <= crc_data_pipe_in_tail[i_c];
        crc_data_pipe_in_hdr[i_c+1]    <= crc_data_pipe_in_hdr[i_c];
        crc_data_pipe_in_tail[i_c+1]   <= crc_data_pipe_in_tail[i_c];
        crc_data_pipe_in_valid[i_c+1]  <= crc_data_pipe_in_valid[i_c];
    end
end
end
//====================================================================
//====================================================================
`ifdef ASYNC_RES
always @(posedge clk or negedge res_n)  begin `else
always @(posedge clk)  begin `endif
if(!res_n) begin
    //Reset the outputs
    d_out_hdr             <= {FPW{1'b0}};
    d_out_tail            <= {FPW{1'b0}};
    d_out_valid           <= {FPW{1'b0}};
    d_out_error           <= {FPW{1'b0}};
    d_out_poisoned        <= {FPW{1'b0}};
    d_out_rtc             <= {FPW{1'b0}};
    d_out_flow            <= {FPW{1'b0}};
    for(i_f=0;i_f<FPW;i_f=i_f+1)begin
        data_rdy_flit[i_f]  <= {128{1'b0}};
    end
end else begin
    d_out_rtc               <= {FPW{1'b0}};
    d_out_error             <= {FPW{1'b0}};
    d_out_poisoned          <= {FPW{1'b0}};
    d_out_flow              <= {FPW{1'b0}};
    //Propagate
    d_out_hdr           <= crc_data_pipe_in_hdr[1];
    d_out_tail          <= crc_data_pipe_in_tail[1];
    d_out_valid         <= crc_data_pipe_in_valid[1];
    for(i_f=0;i_f<FPW;i_f=i_f+1)begin
        //Propagate data
        data_rdy_flit[i_f]  <= crc_data_pipe_out_data_flit[i_f];
        if(crc_data_pipe_in_tail[1][i_f])begin
        //Finally compare the CRC and add flow/rtc information if there is a tail
            if(crc(crc_data_pipe_out_data_flit[i_f]) == ~crc_per_flit[target_crc_per_tail1[i_f]]) begin
                //Poisoned
                d_out_poisoned[i_f]    <= 1'b1;
            end else if(crc(crc_data_pipe_out_data_flit[i_f]) != crc_per_flit[target_crc_per_tail1[i_f]]) begin
                //Error
                d_out_error[i_f]    <= 1'b1;
            end
            //Add the return token count indicator when the packet has rtc
            if(!crc_data_pipe_in_hdr[1][i_f]) begin
                //Multi-FLIT packets always have a valid RTC
                d_out_rtc[i_f] <= 1'b1;
            end else begin
                if((cmd(crc_data_pipe_out_data_flit[i_f]) == CMD_TRET) || !is_flow(crc_data_pipe_out_data_flit[i_f])) begin
                    //All non-flow packets have a valid RTC
                    d_out_rtc[i_f] <= 1'b1;
                end
                if(is_flow(crc_data_pipe_out_data_flit[i_f])) begin
                    //Set the flow packet indicator
                    d_out_flow[i_f] <= 1'b1;
                    //Check flow packets zero fields
                    if(|adrs(crc_data_pipe_out_data_flit[i_f]) || |tag(crc_data_pipe_out_data_flit[i_f])) begin
                        d_out_error[i_f]    <= 1'b1;
                    end
                    if( (cmd(crc_data_pipe_out_data_flit[i_f]) != CMD_TRET) &&
                        (|rtc(crc_data_pipe_out_data_flit[i_f]) || |seq(crc_data_pipe_out_data_flit[i_f]))) begin
                        d_out_error[i_f]    <= 1'b1;
                    end
                    if((cmd(crc_data_pipe_out_data_flit[i_f]) == CMD_PRET) && |frp(crc_data_pipe_out_data_flit[i_f])) begin
                        d_out_error[i_f] <= 1'b1;
                    end
                end
            end
        end
    end
end
end
//=====================================================================================================
//=====================================================================================================
//Init CRC: Calculate the remainders of each input FLIT individually
generate
    for(f=0;f<FPW;f=f+1) begin : crc_init_gen
        crc_128_init crc_init_I
        (
            .clk(clk),
            .res_n(res_n),
            .inData(d_in_flit_removed_crc[f]),
            .crc(crc_init_out[f])
        );
    end
endgenerate
//Calculate the actual CRC over all valid remainders
generate
    for(f=0;f<FPW;f=f+1) begin : crc_accu_gen
        crc_accu #(
        .FPW(FPW)
        )
        crc_accu_I
        (
            .clk(clk),
            .res_n(res_n),
            .tail(crc_accu_in_tail[f]),
            .d_in(crc_accu_in_combined[f]),
            .valid(crc_accu_in_valid[f]),
            .crc_out(crc_per_flit[f])
        );
    end
endgenerate
endmodule