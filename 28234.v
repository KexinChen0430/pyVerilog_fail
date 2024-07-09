module test_padder1;
    // Inputs
    reg [31:0] in;
    reg [1:0] byte_num;
    // Outputs
    wire [31:0] out;
    reg [31:0] wish;
    // Instantiate the Unit Under Test (UUT)
    padder1 uut (
        .in(in),
        .byte_num(byte_num),
        .out(out)
    );
    initial begin
        // Initialize Inputs
        in = 0;
        byte_num = 0;
        // Wait 100 ns for global reset to finish
        #100;
        // Add stimulus here
        in = 32'h90ABCDEF;
        byte_num = 0;
        wish = 32'h01000000;
        check;
        byte_num = 1;
        wish = 32'h90010000;
        check;
        byte_num = 2;
        wish = 32'h90AB0100;
        check;
        byte_num = 3;
        wish = 32'h90ABCD01;
        check;
        $display("Good!");
        $finish;
    end
    task check;
      begin
        #(`P);
        if (out !== wish)
          begin
            $display("E");
            $finish;
          end
      end
    endtask
endmodule