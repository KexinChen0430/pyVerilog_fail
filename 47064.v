module stratixiigx_mac_register (
                               datain,
                               clk,
                               aclr,
                               ena,
                               bypass_register,
                               dataout
                              );
//PARAMETER
parameter data_width = 18;
//INPUT PORTS
input[data_width -1 :0]  datain;
input                     clk;
input                     aclr;
input                     ena;
input                     bypass_register;
//OUTPUT PORTS
output [data_width -1 :0] dataout;
//INTERNAL SIGNALS
wire   [data_width -1:0] dataout_tmp;
reg      [data_width -1:0] dataout_reg;   //registered data
reg                            viol_notifier;
reg prev_clk_val;
wire    [data_width -1 :0] datain_ipd;
wire clk_ipd;
wire aclr_ipd;
wire ena_ipd;
buf buf_datain    [data_width -1 :0] (datain_ipd,datain);
buf buf_clk (clk_ipd,clk);
buf buf_aclr (aclr_ipd,aclr);
buf buf_ena (ena_ipd,ena);
wire    [data_width -1 :0] dataout_opd;
buf buf_dataout    [data_width -1 :0] (dataout,dataout_opd);
//TIMING SPECIFICATION
specify
    specparam TSU           = 0;          // Set up time
    specparam TH            = 0;          // Hold time
    specparam TCO           = 0;          // Clock to Output time
    specparam TCLR          = 0;          // Clear time
    specparam TCLR_MIN_PW   = 0;          // Minimum pulse width of clear
    specparam TPRE          = 0;             // Preset time
    specparam TPRE_MIN_PW   = 0;          // Minimum pulse width of preset
    specparam TCLK_MIN_PW   = 0;          // Minimum pulse width of clock
    specparam TCE_MIN_PW    = 0;          // Minimum pulse width of clock enable
    specparam TCLKL         = 0;             // Minimum clock low time
    specparam TCLKH         = 0;          // Minimum clock high time
    $setup  (datain, posedge clk, 0, viol_notifier);
    $hold   (posedge clk, datain, 0, viol_notifier);
    $setup  (ena, posedge clk, 0, viol_notifier );
    $hold   (posedge clk, ena, 0, viol_notifier );
    (posedge aclr => (dataout  +: 'b0))          = (0,0);
    (posedge clk  => (dataout  +: dataout_tmp))  = (0,0);
endspecify
initial
begin
    dataout_reg = 0;
end
//Register the datain
always @(clk_ipd or posedge aclr_ipd)
    begin
        if (aclr_ipd == 1'b1)
            dataout_reg <= 0;
        else if (prev_clk_val == 1'b0 && clk_ipd == 1'b1)
	begin
		if (ena_ipd == 1'b1)
			dataout_reg <= datain_ipd;
		else
			dataout_reg <= dataout_reg;
	end
	prev_clk_val = clk_ipd;
    end
//assign the dataout depending on the bypass_register value
assign dataout_opd = bypass_register ? datain_ipd :dataout_reg ;
endmodule