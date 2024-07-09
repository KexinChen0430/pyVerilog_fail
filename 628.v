module NetFilter #(
    parameter DATA_WIDTH = 64
) (
    input wire[31:0] cfg_ar_addr,
    input wire[2:0] cfg_ar_prot,
    output wire cfg_ar_ready,
    input wire cfg_ar_valid,
    input wire[31:0] cfg_aw_addr,
    input wire[2:0] cfg_aw_prot,
    output wire cfg_aw_ready,
    input wire cfg_aw_valid,
    input wire cfg_b_ready,
    output wire[1:0] cfg_b_resp,
    output wire cfg_b_valid,
    output wire[63:0] cfg_r_data,
    input wire cfg_r_ready,
    output wire[1:0] cfg_r_resp,
    output wire cfg_r_valid,
    input wire[63:0] cfg_w_data,
    output wire cfg_w_ready,
    input wire[7:0] cfg_w_strb,
    input wire cfg_w_valid,
    input wire clk,
    input wire[63:0] din_data,
    input wire din_last,
    output wire din_ready,
    input wire din_valid,
    output wire[63:0] export_data,
    output wire export_last,
    input wire export_ready,
    output wire export_valid,
    input wire rst_n
);
    wire[63:0] sig_exporter_din_data;
    wire sig_exporter_din_last;
    wire sig_exporter_din_ready;
    wire sig_exporter_din_valid;
    wire[63:0] sig_exporter_dout_data;
    wire sig_exporter_dout_last;
    wire sig_exporter_dout_ready;
    wire sig_exporter_dout_valid;
    wire[31:0] sig_filter_cfg_ar_addr;
    wire[2:0] sig_filter_cfg_ar_prot;
    wire sig_filter_cfg_ar_ready;
    wire sig_filter_cfg_ar_valid;
    wire[31:0] sig_filter_cfg_aw_addr;
    wire[2:0] sig_filter_cfg_aw_prot;
    wire sig_filter_cfg_aw_ready;
    wire sig_filter_cfg_aw_valid;
    wire sig_filter_cfg_b_ready;
    wire[1:0] sig_filter_cfg_b_resp;
    wire sig_filter_cfg_b_valid;
    wire[63:0] sig_filter_cfg_r_data;
    wire sig_filter_cfg_r_ready;
    wire[1:0] sig_filter_cfg_r_resp;
    wire sig_filter_cfg_r_valid;
    wire[63:0] sig_filter_cfg_w_data;
    wire sig_filter_cfg_w_ready;
    wire[7:0] sig_filter_cfg_w_strb;
    wire sig_filter_cfg_w_valid;
    wire[63:0] sig_filter_din_data;
    wire sig_filter_din_last;
    wire sig_filter_din_ready;
    wire sig_filter_din_valid;
    wire[63:0] sig_filter_dout_data;
    wire sig_filter_dout_last;
    wire sig_filter_dout_ready;
    wire sig_filter_dout_valid;
    wire[63:0] sig_filter_headers_data;
    wire sig_filter_headers_last;
    wire sig_filter_headers_ready;
    wire sig_filter_headers_valid;
    wire[63:0] sig_filter_patternMatch_data;
    wire sig_filter_patternMatch_last;
    wire sig_filter_patternMatch_ready;
    wire sig_filter_patternMatch_valid;
    wire[63:0] sig_gen_dout_splitCopy_0_dataIn_data;
    wire sig_gen_dout_splitCopy_0_dataIn_last;
    wire sig_gen_dout_splitCopy_0_dataIn_ready;
    wire sig_gen_dout_splitCopy_0_dataIn_valid;
    wire[63:0] sig_gen_dout_splitCopy_0_dataOut_0_data;
    wire sig_gen_dout_splitCopy_0_dataOut_0_last;
    wire sig_gen_dout_splitCopy_0_dataOut_0_ready;
    wire sig_gen_dout_splitCopy_0_dataOut_0_valid;
    wire[63:0] sig_gen_dout_splitCopy_0_dataOut_1_data;
    wire sig_gen_dout_splitCopy_0_dataOut_1_last;
    wire sig_gen_dout_splitCopy_0_dataOut_1_ready;
    wire sig_gen_dout_splitCopy_0_dataOut_1_valid;
    wire[63:0] sig_hfe_din_data;
    wire sig_hfe_din_last;
    wire sig_hfe_din_ready;
    wire sig_hfe_din_valid;
    wire[63:0] sig_hfe_dout_data;
    wire sig_hfe_dout_last;
    wire sig_hfe_dout_ready;
    wire sig_hfe_dout_valid;
    wire[63:0] sig_hfe_headers_data;
    wire sig_hfe_headers_last;
    wire sig_hfe_headers_ready;
    wire sig_hfe_headers_valid;
    wire[63:0] sig_patternMatch_din_data;
    wire sig_patternMatch_din_last;
    wire sig_patternMatch_din_ready;
    wire sig_patternMatch_din_valid;
    wire[63:0] sig_patternMatch_match_data;
    wire sig_patternMatch_match_last;
    wire sig_patternMatch_match_ready;
    wire sig_patternMatch_match_valid;
    Exporter exporter_inst (
        .din_data(sig_exporter_din_data),
        .din_last(sig_exporter_din_last),
        .din_ready(sig_exporter_din_ready),
        .din_valid(sig_exporter_din_valid),
        .dout_data(sig_exporter_dout_data),
        .dout_last(sig_exporter_dout_last),
        .dout_ready(sig_exporter_dout_ready),
        .dout_valid(sig_exporter_dout_valid)
    );
    Filter filter_inst (
        .cfg_ar_addr(sig_filter_cfg_ar_addr),
        .cfg_ar_prot(sig_filter_cfg_ar_prot),
        .cfg_ar_ready(sig_filter_cfg_ar_ready),
        .cfg_ar_valid(sig_filter_cfg_ar_valid),
        .cfg_aw_addr(sig_filter_cfg_aw_addr),
        .cfg_aw_prot(sig_filter_cfg_aw_prot),
        .cfg_aw_ready(sig_filter_cfg_aw_ready),
        .cfg_aw_valid(sig_filter_cfg_aw_valid),
        .cfg_b_ready(sig_filter_cfg_b_ready),
        .cfg_b_resp(sig_filter_cfg_b_resp),
        .cfg_b_valid(sig_filter_cfg_b_valid),
        .cfg_r_data(sig_filter_cfg_r_data),
        .cfg_r_ready(sig_filter_cfg_r_ready),
        .cfg_r_resp(sig_filter_cfg_r_resp),
        .cfg_r_valid(sig_filter_cfg_r_valid),
        .cfg_w_data(sig_filter_cfg_w_data),
        .cfg_w_ready(sig_filter_cfg_w_ready),
        .cfg_w_strb(sig_filter_cfg_w_strb),
        .cfg_w_valid(sig_filter_cfg_w_valid),
        .din_data(sig_filter_din_data),
        .din_last(sig_filter_din_last),
        .din_ready(sig_filter_din_ready),
        .din_valid(sig_filter_din_valid),
        .dout_data(sig_filter_dout_data),
        .dout_last(sig_filter_dout_last),
        .dout_ready(sig_filter_dout_ready),
        .dout_valid(sig_filter_dout_valid),
        .headers_data(sig_filter_headers_data),
        .headers_last(sig_filter_headers_last),
        .headers_ready(sig_filter_headers_ready),
        .headers_valid(sig_filter_headers_valid),
        .patternMatch_data(sig_filter_patternMatch_data),
        .patternMatch_last(sig_filter_patternMatch_last),
        .patternMatch_ready(sig_filter_patternMatch_ready),
        .patternMatch_valid(sig_filter_patternMatch_valid)
    );
    AxiSSplitCopy #(
        .DATA_WIDTH(64),
        .DEST_WIDTH(0),
        .ID_WIDTH(0),
        .INTF_CLS("<class 'hwtLib.amba.axis.AxiStream'>"),
        .IS_BIGENDIAN(0),
        .OUTPUTS(2),
        .USER_WIDTH(0),
        .USE_KEEP(0),
        .USE_STRB(0)
    ) gen_dout_splitCopy_0_inst (
        .dataIn_data(sig_gen_dout_splitCopy_0_dataIn_data),
        .dataIn_last(sig_gen_dout_splitCopy_0_dataIn_last),
        .dataIn_ready(sig_gen_dout_splitCopy_0_dataIn_ready),
        .dataIn_valid(sig_gen_dout_splitCopy_0_dataIn_valid),
        .dataOut_0_data(sig_gen_dout_splitCopy_0_dataOut_0_data),
        .dataOut_0_last(sig_gen_dout_splitCopy_0_dataOut_0_last),
        .dataOut_0_ready(sig_gen_dout_splitCopy_0_dataOut_0_ready),
        .dataOut_0_valid(sig_gen_dout_splitCopy_0_dataOut_0_valid),
        .dataOut_1_data(sig_gen_dout_splitCopy_0_dataOut_1_data),
        .dataOut_1_last(sig_gen_dout_splitCopy_0_dataOut_1_last),
        .dataOut_1_ready(sig_gen_dout_splitCopy_0_dataOut_1_ready),
        .dataOut_1_valid(sig_gen_dout_splitCopy_0_dataOut_1_valid)
    );
    HeadFieldExtractor hfe_inst (
        .din_data(sig_hfe_din_data),
        .din_last(sig_hfe_din_last),
        .din_ready(sig_hfe_din_ready),
        .din_valid(sig_hfe_din_valid),
        .dout_data(sig_hfe_dout_data),
        .dout_last(sig_hfe_dout_last),
        .dout_ready(sig_hfe_dout_ready),
        .dout_valid(sig_hfe_dout_valid),
        .headers_data(sig_hfe_headers_data),
        .headers_last(sig_hfe_headers_last),
        .headers_ready(sig_hfe_headers_ready),
        .headers_valid(sig_hfe_headers_valid)
    );
    PatternMatch patternMatch_inst (
        .din_data(sig_patternMatch_din_data),
        .din_last(sig_patternMatch_din_last),
        .din_ready(sig_patternMatch_din_ready),
        .din_valid(sig_patternMatch_din_valid),
        .match_data(sig_patternMatch_match_data),
        .match_last(sig_patternMatch_match_last),
        .match_ready(sig_patternMatch_match_ready),
        .match_valid(sig_patternMatch_match_valid)
    );
    assign cfg_ar_ready = sig_filter_cfg_ar_ready;
    assign cfg_aw_ready = sig_filter_cfg_aw_ready;
    assign cfg_b_resp = sig_filter_cfg_b_resp;
    assign cfg_b_valid = sig_filter_cfg_b_valid;
    assign cfg_r_data = sig_filter_cfg_r_data;
    assign cfg_r_resp = sig_filter_cfg_r_resp;
    assign cfg_r_valid = sig_filter_cfg_r_valid;
    assign cfg_w_ready = sig_filter_cfg_w_ready;
    assign din_ready = sig_hfe_din_ready;
    assign export_data = sig_exporter_dout_data;
    assign export_last = sig_exporter_dout_last;
    assign export_valid = sig_exporter_dout_valid;
    assign sig_exporter_din_data = sig_filter_dout_data;
    assign sig_exporter_din_last = sig_filter_dout_last;
    assign sig_exporter_din_valid = sig_filter_dout_valid;
    assign sig_exporter_dout_ready = export_ready;
    assign sig_filter_cfg_ar_addr = cfg_ar_addr;
    assign sig_filter_cfg_ar_prot = cfg_ar_prot;
    assign sig_filter_cfg_ar_valid = cfg_ar_valid;
    assign sig_filter_cfg_aw_addr = cfg_aw_addr;
    assign sig_filter_cfg_aw_prot = cfg_aw_prot;
    assign sig_filter_cfg_aw_valid = cfg_aw_valid;
    assign sig_filter_cfg_b_ready = cfg_b_ready;
    assign sig_filter_cfg_r_ready = cfg_r_ready;
    assign sig_filter_cfg_w_data = cfg_w_data;
    assign sig_filter_cfg_w_strb = cfg_w_strb;
    assign sig_filter_cfg_w_valid = cfg_w_valid;
    assign sig_filter_din_data = sig_gen_dout_splitCopy_0_dataOut_1_data;
    assign sig_filter_din_last = sig_gen_dout_splitCopy_0_dataOut_1_last;
    assign sig_filter_din_valid = sig_gen_dout_splitCopy_0_dataOut_1_valid;
    assign sig_filter_dout_ready = sig_exporter_din_ready;
    assign sig_filter_headers_data = sig_hfe_headers_data;
    assign sig_filter_headers_last = sig_hfe_headers_last;
    assign sig_filter_headers_valid = sig_hfe_headers_valid;
    assign sig_filter_patternMatch_data = sig_patternMatch_match_data;
    assign sig_filter_patternMatch_last = sig_patternMatch_match_last;
    assign sig_filter_patternMatch_valid = sig_patternMatch_match_valid;
    assign sig_gen_dout_splitCopy_0_dataIn_data = sig_hfe_dout_data;
    assign sig_gen_dout_splitCopy_0_dataIn_last = sig_hfe_dout_last;
    assign sig_gen_dout_splitCopy_0_dataIn_valid = sig_hfe_dout_valid;
    assign sig_gen_dout_splitCopy_0_dataOut_0_ready = sig_patternMatch_din_ready;
    assign sig_gen_dout_splitCopy_0_dataOut_1_ready = sig_filter_din_ready;
    assign sig_hfe_din_data = din_data;
    assign sig_hfe_din_last = din_last;
    assign sig_hfe_din_valid = din_valid;
    assign sig_hfe_dout_ready = sig_gen_dout_splitCopy_0_dataIn_ready;
    assign sig_hfe_headers_ready = sig_filter_headers_ready;
    assign sig_patternMatch_din_data = sig_gen_dout_splitCopy_0_dataOut_0_data;
    assign sig_patternMatch_din_last = sig_gen_dout_splitCopy_0_dataOut_0_last;
    assign sig_patternMatch_din_valid = sig_gen_dout_splitCopy_0_dataOut_0_valid;
    assign sig_patternMatch_match_ready = sig_filter_patternMatch_ready;
    generate if (DATA_WIDTH != 64)
        $error("%m Generated only for this param value");
    endgenerate
endmodule