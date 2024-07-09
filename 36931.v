module duv (
  input duv_clk_ip,
  input duv_rst_ip
); // duv
   parameter instances = 255;
   genvar i;
   generate
     for (i=1; i<=255; i=i+1) begin : arr
       arr #(.LENGTH(i)) arr(.clk(duv_clk_ip));
     end
   endgenerate
   reg single_bit `EXM_VLTOR_PUBLIC_RW;
   reg [31:0] mem [0:1023] `EXM_VLTOR_PUBLIC_RW;
   reg [31:0] mem_array [0:15] [0:3] [0:3] `EXM_VLTOR_PUBLIC_RW;
   `ifdef IVERILOG
   // seems icarus optimizes the signals away if they're not used
   wire dummy = single_bit || mem[0][0] || mem_array[0][0][0][0];
   `endif
   reg test_message `EXM_VLTOR_PUBLIC_RW = 0;
   always @(posedge duv_clk_ip)
     if (test_message)
       begin
         `EXM_NOTE("test_message %d", test_message);
         `EXM_NOTE("octal %08o", 255);
         `EXM_NOTE("hex %012x %h", 32'hee_55_aa_ff, 32'hff_aa_55_ee);
         `EXM_NOTE("float %f", 6.9);
         `EXM_NOTE("float %2.3f : %m, %1.2e", 6.9, 2.099);
         `EXM_NOTE("%b %m %h %m %%many", 64, 16'haa);
         test_message = 0;
       end
endmodule