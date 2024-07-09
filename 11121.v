module arriaiigz_mac_multiplier (
                             dataa,
                             datab,
                             signa,
                             signb,
                             dataout
                            );
//PARAMETER
parameter dataa_width   = 18;
parameter datab_width   = 18;
parameter dataout_width = dataa_width + datab_width;
//INPUT PORTS
input [dataa_width-1:0] dataa;
input [datab_width-1:0] datab;
input                    signa;
input                    signb;
//OUTPUT PORTS
output [dataout_width -1 :0]   dataout;
//INTERNAL SIGNALS
wire [dataout_width -1:0]       product;             //product of dataa and datab
wire [dataout_width -1:0]       abs_product;         //|product| of dataa and datab
wire [dataa_width-1:0]          abs_a;               //absolute value of dataa
wire [datab_width-1:0]          abs_b;               //absolute value of dadab
wire                            product_sign;        // product sign bit
wire                            dataa_sign;          //dataa sign bit
wire                            datab_sign;          //datab sign bit
//TIMING SPECIFICATION
specify
    (dataa *> dataout)              = (0, 0);
    (datab *> dataout)              = (0, 0);
    (signa *> dataout)              = (0, 0);
    (signb *> dataout)              = (0, 0);
endspecify
//Outputassignment
assign dataa_sign   = dataa[dataa_width-1] && signa;
assign datab_sign   = datab[datab_width-1] && signb;
assign product_sign = dataa_sign ^ datab_sign;
assign abs_a        = dataa_sign ? (~dataa + 1'b1) : dataa;
assign abs_b        = datab_sign ? (~datab + 1'b1) : datab;
assign abs_product  = abs_a * abs_b;
assign product      = product_sign ? (~abs_product + 1) : abs_product;
assign dataout = product;
endmodule