module cycloneii_mac_out
   (
    dataa,
    clk,
    aclr,
    ena,
    dataout,
    devclrn,
    devpor
    );
    parameter dataa_width   = 1;
    parameter output_clock  = "none";
    parameter lpm_hint      = "true";
    parameter lpm_type      = "cycloneii_mac_out";
// SIMULATION_ONLY_PARAMETERS_BEGIN
    parameter dataout_width = dataa_width;
// SIMULATION_ONLY_PARAMETERS_END
    input [dataa_width-1:0] dataa;
    input clk;
    input aclr;
    input ena;
    input 	devclrn;
    input 	devpor;
    output [dataout_width-1:0] dataout;
    tri1 devclrn;
    tri1 devpor;
    wire [dataa_width-1:0] dataa_ipd; // internal dataa
    wire clk_ipd; // internal clk
    wire aclr_ipd; // internal aclr
    wire ena_ipd; // internal ena
    // internal variable
    wire [dataout_width-1:0] dataout_tmp;
    reg [dataa_width-1:0] idataout_reg; // optional register for dataout output
    wire use_reg; // equivalent to dataout_clock parameter
    wire enable;
    wire no_aclr;
    // Input buffers
    buf (clk_ipd, clk);
    buf (aclr_ipd, aclr);
    buf (ena_ipd, ena);
    buf dataa_buf [dataa_width-1:0] (dataa_ipd, dataa);
    // optional registering parameter
    assign use_reg = (output_clock != "none") ? 1 : 0;
    assign enable = (!aclr) && (ena) && use_reg;
    assign no_aclr = (!aclr) && use_reg;
    specify
        if (use_reg)
            (posedge clk => (dataout +: dataout_tmp)) = 0;
            (posedge aclr => (dataout +: 1'b0)) = 0;
        ifnone
            (dataa *> dataout) = (0, 0);
        $setuphold (posedge clk &&& enable, dataa, 0, 0);
        $setuphold (posedge clk &&& no_aclr, ena, 0, 0);
    endspecify
    initial
    begin
       // initial values for optional register
       idataout_reg = 0;
    end
    // Optional input registers for dataa,b and signa,b
    always @ (posedge clk_ipd or posedge aclr_ipd or negedge devclrn or negedge devpor)
    begin
       if (devclrn == 0 || devpor == 0 || aclr_ipd == 1)
       begin
          idataout_reg <= 0;
       end
       else if (ena_ipd == 1)
       begin
          idataout_reg <= dataa_ipd;
       end
    end
    // mux input sources from direct inputs or optional registers
    assign dataout_tmp = use_reg == 1 ? idataout_reg : dataa_ipd;
    // accelerate outputs
    buf dataout_buf [dataout_width-1:0] (dataout, dataout_tmp);
endmodule