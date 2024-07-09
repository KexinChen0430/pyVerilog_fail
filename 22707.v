module hardcopyiii_otp (
    otpclken,
    otpclk,
    otpshiftnld,
    otpdout
);
//PARAMETER
parameter data_width = 128;
parameter lpm_file = "init_file.hex";
parameter lpm_type = "hardcopyiii_otp";
parameter lpm_hint = "true";
parameter init_data = 128'h0;
//Input Ports Declaration
input otpclken;
input otpclk;
input otpshiftnld;
//Output Ports Declaration
output otpdout;
//Internal Signals
reg otpdout_tmp;
reg viol_notifier;
reg first_use;
integer prev_loc;
integer current_loc;
wire reset;
specify
    $setup  (otpshiftnld, negedge otpclk &&& reset, 0, viol_notifier);
    $hold   (negedge otpclk &&& reset, otpshiftnld, 0, viol_notifier);
    (otpshiftnld *> otpdout) = (0,0);
endspecify
initial
begin
    prev_loc = -1;
    current_loc = 0;
    otpdout_tmp = 1'b0;
    first_use = 1'b1;
end
assign otpdout = otpdout_tmp;
always @(prev_loc)
begin
    current_loc = prev_loc + 1;
end
always @(posedge otpclk)
begin
    // operation only if clock enable is high
    if(otpclken == 1'b1)
    begin
        // shift data
        if (otpshiftnld == 1'b1 && first_use == 1'b0)
        begin
            // shifting out '0' if otp_clken and otp_shiftnld is high beyond 128 clock cycles
            if (prev_loc == 127)
            begin
                otpdout_tmp <= 1'b0;
            end
            // shifting out the data bit by bit
            else
            begin
                otpdout_tmp <= init_data[current_loc];
                prev_loc <= current_loc;
            end
        end
        // load data
        else if (otpshiftnld == 1'b0)
        begin
            otpdout_tmp <= init_data[0];
            first_use <= 1'b0;
            prev_loc <= 0;
        end
    end
end
endmodule