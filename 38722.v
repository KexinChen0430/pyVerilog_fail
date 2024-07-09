module test_unit();
reg t_var var_in, var_out;
reg result;
enum_ports dut(var_in, var_out, result);
initial begin
    #1;
    if(var_out !== var_presence) begin
        $display("FAILED 1");
        $finish();
    end
    var_in = var_1;
    #1;
    if(result !== 1'b0) begin
        $display("FAILED 2");
        $finish();
    end
    var_in = var_rst;
    #1
    if(result !== 1'b1) begin
        $display("FAILED 3");
        $finish();
    end
    $display("PASSED");
end
endmodule