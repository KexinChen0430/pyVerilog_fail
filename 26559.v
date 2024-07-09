module
    @(posedge clk) rst = 1'b1;
    @(posedge clk) rst = 1'b1;
    @(posedge clk) rst = 1'b0;
    @(posedge clk) rst = 1'b0;
    // Gather data
    realMagnitude = 2.0**(IN_WIDTH-1)-1;
    for (i=0; i<TEST_ANGLES; i=i+1) begin
        realAngle = $dist_uniform(seed, 0, (1<<ANGLE_WIDTH)-1) * 2.0 * M_PI / (1<<ANGLE_WIDTH);
        realX = realMagnitude * $cos(realAngle);
        realY = realMagnitude * $sin(realAngle);
        x = $rtoi(realX+0.5);
        y = $rtoi(realY+0.5);
        @(posedge clk) inStrobe = 1'b1;
        @(posedge clk) inStrobe = 1'b0;
        wait(outStrobe);
        if (SCALE_MAGNITUDE) begin
            magSamples[i] = $itor(magnitude) - realMagnitude;
        end
        else begin
            magSamples[i] = $itor(magnitude) - realMagnitude / MAG_SCALAR;
        end
        angSamples[i] = $itor(angle)     - (realAngle*2.0**(ANGLE_WIDTH-1)/M_PI);
        magnitudeErrAvg = magnitudeErrAvg + magSamples[i];
        angleErrAvg     = angleErrAvg     + angSamples[i];
        wait(~outStrobe);
    end
    // Calculate mean & standard deviation
    angleErrAvg = angleErrAvg / TEST_ANGLES;
    magnitudeErrAvg = magnitudeErrAvg / TEST_ANGLES;
    for (i=0; i<TEST_ANGLES; i=i+1) begin
        angleErrStdDev = angleErrStdDev + (angSamples[i] - angleErrAvg)**(2.0);
        magnitudeErrStdDev = magnitudeErrStdDev + (magSamples[i] - magnitudeErrAvg)**(2.0);
    end
    angleErrStdDev = $sqrt(angleErrStdDev / (TEST_ANGLES-1));
    magnitudeErrStdDev = $sqrt(magnitudeErrStdDev / (TEST_ANGLES-1));
    $display("Number of angle bits: %d", ANGLE_WIDTH);
    $display("Number of input bits: %d", IN_WIDTH);
    $display("Magnitude Average Error: %f", magnitudeErrAvg);
    $display("Magnitude Standard Deviation of Error: %f", magnitudeErrStdDev);
    $display("Angle Average Error: %f", angleErrAvg);
    $display("Angle Standard Deviation of Error: %f", angleErrStdDev);
    if (abs(magnitudeErrAvg) > MAX_MAGNITUDE_ERR_AVG) begin
        pass = 0;
        $display("FAIL: Magnitude average error is too high");
    end
    if (magnitudeErrStdDev > MAX_MAGNITUDE_ERR_STD_DEV) begin
        pass = 0;
        $display("FAIL: Magnitude standard deviation is too high");
    end
    if (abs(angleErrAvg) > MAX_ANGLE_ERR_AVG) begin
        pass = 0;
        $display("FAIL: angle average error is too high");
    end
    if (angleErrStdDev > MAX_ANGLE_ERR_STD_DEV) begin
        pass = 0;
        $display("FAIL: angle standard deviation is too high");
    end
    if (pass) begin
        $display("PASS");
    end
    $stop;
end
// UUT
CordicRectToPolar #(
    .IN_WIDTH       (IN_WIDTH       ), ///< Input coordinate pair width
    .ANGLE_WIDTH    (ANGLE_WIDTH    ), ///< Output angle register width
    .SCALE_MAGNITUDE(SCALE_MAGNITUDE), ///< Set to 1 to scale magnitude to true value
    .MULT_WIDTH     (MULT_WIDTH     )  ///< Number of bits to use for magnitude scaling word, if SCALE_MAGNITUDE is 1
)
uut (
    .clk(clk),             ///< System clock
    .rst(rst),             ///< Reset, active high and synchronous
    .inStrobe(inStrobe),   ///< Input data strobe
    .x(x),                 ///< [IN_WIDTH-1:0] X coordinate
    .y(y),                 ///< [IN_WIDTH-1:0] Y coordinate
    .angle(angle),         ///< [ANGLE_WIDTH-1:0] Angle
    .magnitude(magnitude), ///< [IN_WIDTH:0] Magnitude
    .outStrobe(outStrobe)  ///< Output data strobe
);
endmodule