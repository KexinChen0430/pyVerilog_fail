module test_registros;
    wire clk;
    reg reset, ir_ri0_enb, ir_ri1_enb, ir_ri2_enb;
    wire [7:0] ow_ri0_out_data, ow_ri1_out_data, ow_ri2_out_data;
    reg [7:0] ir_ri0_in_data, ir_ri0_address, ir_ri1_in_data, ir_ri1_address, ir_ri2_in_data, ir_ri2_address;
    clock c(clk);
    REG_INTERFACE reg_interface(ow_ri0_out_data, ow_ri1_out_data, ow_ri2_out_data, ir_ri0_address, ir_ri1_address, ir_ri2_address, ir_ri0_in_data, ir_ri1_in_data, ir_ri2_in_data, ir_ri0_enb, ir_ri1_enb, ir_ri2_enb, reset, clk);
    initial
        begin
            $dumpfile("test_registros.vcd");
            $dumpvars;
            reset=1;
            #`PERIODO reset=0;
            ir_ri0_enb=0;
            ir_ri1_enb=0;
            ir_ri2_enb=1;
            ir_ri0_address=8'h00;
            ir_ri1_address=8'h6F;
            ir_ri2_address=8'h00;
            ir_ri0_in_data=8'h00;
            ir_ri1_in_data=8'h3F;
            ir_ri2_in_data=8'h00;
            while(ir_ri0_in_data< 8'h06)
            begin
                ir_ri0_address=0;
                ir_ri1_address=8'h30;
                while(ir_ri0_address<8'h20)
                begin
                    #`PERIODO ir_ri0_address=ir_ri0_address+1;
                    ir_ri1_address=ir_ri1_address-1;
                end
                #`PERIODO ir_ri0_in_data=ir_ri0_in_data+1;
                ir_ri1_in_data=ir_ri1_in_data-1;
            end
            reset=1;
            #`PERIODO $finish;
        end
endmodule