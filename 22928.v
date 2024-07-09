module fpga_interconnect(datain, dataout);
    input  datain;
    output dataout;
    // Behavioral model
    assign dataout = datain;
    // Timing paths. The values are dummy and are intended to be replaced by
    // ones from a SDF file during simulation.
    specify
        (datain => dataout) = 0;
    endspecify
endmodule