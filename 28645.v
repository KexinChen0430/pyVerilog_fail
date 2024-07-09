module stratixii_mac_mult_block (
                                 dataa,
                                 datab,
                                 signa,
                                 signb,
                                 bypass_multiplier,
                                 scanouta,
                                 scanoutb,
                                 dataout
                               );
//PARAMETER
parameter dataa_width   = 18;
parameter datab_width   = 18;
parameter dataout_width = dataa_width + datab_width;
parameter dynamic_mode = "no";
//INPUT PORTS
input [dataa_width-1:0] dataa;
input [datab_width-1:0] datab;
input                    signa;
input                    signb;
input                    bypass_multiplier;
//OUTPUT PORTS
output [dataa_width-1:0]       scanouta;
output [datab_width-1:0]       scanoutb;
output [dataout_width -1 :0]   dataout;
//INTERNAL SIGNALS
wire [dataout_width -1:0]       product;             //product of dataa and datab
wire [dataout_width -1:0]       abs_product;         //|product| of dataa and datab
wire [dataa_width-1:0]          abs_a;               //absolute value of dataa
wire [datab_width-1:0]          abs_b;               //absolute value of dadab
wire                            product_sign;        // product sign bit
wire                            dataa_sign;          //dataa sign bit
wire                            datab_sign;          //datab sign bit
wire [dataa_width-1:0] dataa_ipd;
wire [datab_width-1:0] datab_ipd;
wire    signa_ipd;
wire signb_ipd;
wire bypass_multiplier_ipd;
buf buf_dataa [dataa_width-1:0] (dataa_ipd,dataa);
buf buf_datab [datab_width-1:0] (datab_ipd,datab);
buf buf_signa    (signa_ipd,signa);
buf buf_signb (signb_ipd,signb);
buf buf_bypass_multiplier (bypass_multiplier_ipd,bypass_multiplier);
wire  [dataa_width-1:0] scanouta_opd;
wire [datab_width-1:0] scanoutb_opd;
wire [dataout_width -1 :0] dataout_opd;
buf buf_scanouta  [dataa_width-1:0] (scanouta,scanouta_opd);
buf buf_scanoutb [datab_width-1:0] (scanoutb,scanoutb_opd);
buf buf_dataout [dataout_width -1 :0] (dataout,dataout_opd);
//TIMING SPECIFICATION
specify
    (dataa *> dataout)              = (0, 0);
    (datab *> dataout)              = (0, 0);
    (bypass_multiplier *> dataout)  = (0, 0);
    (dataa => scanouta)             = (0, 0);
    (datab => scanoutb)             = (0, 0);
    (signa *> dataout)              = (0, 0);
    (signb *> dataout)              = (0, 0);
endspecify
//Output assignment
assign scanouta_opd     = dataa_ipd;
assign scanoutb_opd     = datab_ipd;
assign dataa_sign   = dataa_ipd[dataa_width-1] && signa_ipd;
assign datab_sign   = datab_ipd[datab_width-1] && signb_ipd;
assign product_sign = dataa_sign ^ datab_sign;
assign abs_a        = dataa_sign ? (~dataa_ipd + 1) : dataa_ipd;
assign abs_b        = datab_sign ? (~datab_ipd + 1) : datab_ipd;
assign abs_product  = abs_a * abs_b;
assign product      = product_sign ? (~abs_product + 1) : abs_product;
assign dataout_opd = ((dynamic_mode == "yes") && (bypass_multiplier_ipd)) ? {datab_ipd, dataa_ipd} : ((bypass_multiplier_ipd)  ? {dataa_ipd,datab_ipd} : product);
endmodule