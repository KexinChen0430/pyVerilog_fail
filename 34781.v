module table_control_test ();
reg clk;
reg rstb;
wire [26:0] tdata_0, tdata_1, tdata_2;
reg [1:0] command;
initial begin
    clk = 0;
    rstb = 0;
    command = 0;
    #1 rstb = 1;
    #8 command = 2'b01;
    #8 command = 0;
    #400 command = 2'b01;
    #8 command = 0;
    #104 command = 2'b11;
    #8 command = 0;
    #16 command = 2'b10;
    #8 command = 0;
    #8 command = 2'b01;
    #8 command = 0;
end
always @(clk) begin
    clk <= #4 ~clk;
end
    table_control ictrl ( .clk          (clk)
                        , .ctrl_reset_n (rstb)
                        , .tdatai       ('0)
                        , .twraddr      ('0)
                        , .twren        ('0)
                        , .tdata_0      (tdata_0)
                        , .tdata_1      (tdata_1)
                        , .tdata_2      (tdata_2)
                        , .command      (command)
                        );
endmodule