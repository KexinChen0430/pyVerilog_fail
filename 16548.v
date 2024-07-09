module header
	// Internal signals
	// Generated Signal List
	// End of Generated Signal List
	// %COMPILER_OPTS%
	// Generated Signal Assignments
             /* ------------------------------------------------------------
              Generator information:
              used package Micronas::Reg is version 1.88
              this package RegViews.pm is version 1.93
              use with RTL libraries (this release or higher):
              ip_ocp/0002/ip_ocp_016_21Jan2009
              ip_sync/0001/ip_sync_006_23jan2008
            ------------------------------------------------------------ */
    // pre-address decoder (per clock-domain)
    reg pre_dec;
    reg pre_dec_err;
    assign pre_dec_o = pre_dec;
    assign pre_dec_err_o = pre_dec_err;
    always @(addr_i) begin
        pre_dec     = 0;
        pre_dec_err = 0;
        case (addr_i[5:2])
            // clock-domain #0 --> clk_a
            'h0, 'h8, 'ha: pre_dec = 0;
            // clock-domain #1 --> clk_f20
            'h1, 'h2, 'h3, 'h4, 'h5, 'h6, 'h7: pre_dec = 1;
            default: begin
                pre_dec     = 0;
                pre_dec_err = 1;
            end
        endcase
    end
	// Generated Instances and Port Mappings
endmodule