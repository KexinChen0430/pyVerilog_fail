module  cycloneiiils_oscillator
    (
    oscena,
    clkout1,
    observableoutputport,
    clkout
    );
    parameter lpm_type = "cycloneiiils_oscillator";
    input oscena;
    output clkout1;
    output observableoutputport;
    output clkout;
// LOCAL_PARAMETERS_BEGIN
    parameter OSC_PW = 6250; // fixed 80HZ running clock
// LOCAL_PARAMETERS_END
    // INTERNAL wire
    reg int_osc; // internal oscillator
    specify
        (posedge oscena => (clkout +: 1'b1)) = (0, 0);
    endspecify
    initial
        int_osc = 1'b0;
    always @(int_osc or oscena)
    begin
        if (oscena == 1'b1)
            int_osc <= #OSC_PW ~int_osc;
    end
    and (clkout, int_osc, 1'b1);
endmodule