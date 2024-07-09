module mult_unit_test ();
reg clk, rstb;
reg [2:0] command;
reg [1:0] tcmd;
wire idle;
wire [26:0] tdata_0, tdata_1, tdata_2;
initial begin
    clk = 0;
    rstb = 0;
    command = 0;
    tcmd = 0;
    #5 rstb = 1;
    #8 command = 3'b100;
    #8 command = '0;
    #640 tcmd = 2'b01;
    command = 3'b010;
    #8 tcmd = '0;
    command = '0;
    #504 command = 3'b011;
    #8 command = '0;
    #504 command = 3'b011;
    #8 command = '0;
    #504 command = 3'b011;
    #8 command = '0;
    #504 command = 3'b101;
    #8 command = '0;
end
initial begin
    #686 for(int i=0; i<40; i++) begin
        $display("%x ", imu.multins.result_reg[i]);
    end
    $display("\n");
end
always @(clk) clk <= #4 ~clk;
table_control t ( .clk              (clk)
                , .ctrl_reset_n     (rstb)
                , .tdatai           ('0)
                , .twraddr          ('0)
                , .twren            ('0)
                , .tdata_0          (tdata_0)
                , .tdata_1          (tdata_1)
                , .tdata_2          (tdata_2)
                , .command          (tcmd)
                , .idle             (t_idle)
                );
mult_unit      #( .mult_addr        (0)
                , .e_words          (4)
                , .c_size           (1024)
                ) imu
                ( .clk              (clk)
                , .ctrl_reset_n     (rstb)
                , .unit_select      ('0)
                , .g_addr           ('0)
                , .g_data           ('0)
                , .g_rden           ('0)
                , .g_wren           ('0)
                , .g_q              ()
                , .e_wraddr         ('0)
                , .e_data           ('0)
                , .e_wren           ('0)
                , .command          (command)
                , .idle             (idle)
                , .tdata_0          (tdata_0)
                , .tdata_1          (tdata_1)
                , .tdata_2          (tdata_2)
                );
endmodule