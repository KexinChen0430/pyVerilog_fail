module simple_test ();
  reg [3:0] a_in;
  reg [3:0] b_in;
  reg [3:0] s_in;
  reg M_in,Ci_inverse_in;
  wire [3:0] Y_out;
  wire P_out,Q_out,Co_inverse_out,AequalsB_out;
  ALU alu(a_in,b_in,s_in,M_in,Ci_inverse_in,P_out,Q_out,Co_inverse_out,Y_out,AequalsB_out);
  integer i,j,k,l,m;
  initial begin
    a_in = 4'b0110;
    b_in = 4'b1011;
    s_in = 4'b0000;
    M_in = 1'b0;
    Ci_inverse_in = 1'b0;
  end
  initial begin
    for (i=0;i<2;i=i+1)
      begin
        for(j=0;j<2;j=j+1)
          begin
            for(k=0;k<16;k=k+1)
              begin
                #100 a_in = 4'b0110;
                b_in = 4'b1011;
                s_in = k;
                M_in = j;
                Ci_inverse_in = i;
                #10 $display($time,,"a_in=%b,b_in=%b,s_in=%b,M_in=%b,Ci_inverse_in=%b    Y_out=%b,P_out=%b,Q_out=%b,Co_inverse_out=%b,AequalsB_out=%b",a_in,b_in,s_in,M_in,Ci_inverse_in,Y_out,P_out,Q_out,Co_inverse_out,AequalsB_out);
              end
          end
      end
  end
endmodule