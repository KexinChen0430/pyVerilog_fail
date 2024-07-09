module arriaiigz_mac_register (
                           datain,
                           clk,
                           aclr,
                           sload,
                           bypass_register,
                           dataout
                          );
//PARAMETER
parameter data_width = 18;
//INPUT PORTS
input[data_width -1 :0]  datain;
input                     clk;
input                     aclr;
input                     sload;
input                    bypass_register;
//OUTPUT PORTS
output [data_width -1 :0] dataout;
//INTERNAL SIGNALS
reg     [data_width -1:0] dataout_tmp;
reg     viol_notifier;
reg prev_clk_val;
//TIMING SPECIFICATION
specify
    specparam TSU           = 0;          // Set up time
    specparam TH            = 0;          // Hold time
    specparam TCO           = 0;          // Clock to Output time
    specparam TCLR          = 0;          // Clear time
    specparam TCLR_MIN_PW   = 0;          // Minimum pulse width of clear
    specparam TPRE          = 0;          // Preset time
    specparam TPRE_MIN_PW   = 0;          // Minimum pulse width of preset
    specparam TCLK_MIN_PW   = 0;          // Minimum pulse width of clock
    specparam TCE_MIN_PW    = 0;          // Minimum pulse width of clock enable
    specparam TCLKL         = 0;          // Minimum clock low time
    specparam TCLKH         = 0;           // Minimum clock high time
    $setup  (datain, posedge clk, 0, viol_notifier);
    $hold   (posedge clk, datain, 0, viol_notifier);
    $setup  (sload, posedge clk, 0, viol_notifier );
    $hold   (posedge clk, sload, 0, viol_notifier );
    (posedge aclr => (dataout  +: 'b0))          = (0,0);
    (posedge clk  => (dataout  +: dataout_tmp))  = (0,0);
endspecify
initial
    begin
      dataout_tmp = 0;
      prev_clk_val = 1'b0;
    end
always @(clk or posedge aclr or bypass_register or datain)
begin
    if(bypass_register == 1'b1)
        dataout_tmp <= datain;
    else
        begin
            if  (aclr == 1'b1)
                dataout_tmp <= 0;
            else if (prev_clk_val == 1'b0 && clk == 1'b1)
                begin
                    if(sload == 1'b1)
                        dataout_tmp <= datain;
                    else
                        dataout_tmp <= dataout_tmp;
                end
        end
    prev_clk_val = clk;
end
assign dataout = dataout_tmp;
endmodule