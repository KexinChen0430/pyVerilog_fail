module t
  (
   input logic 				clk,
   input logic 				daten,
   input logic [8:0] 			datval,
   output logic signed [3:0][3:0][35:0] datao
   );
   logic signed [3:0][3:0][3:0][8:0] 	datat;
   genvar 				i;
   generate
      for (i=0; i<4; i++)begin
	 testio dut(.clk(clk), .arr3d_in(datat[i]), .arr2d_out(datao[i]));
      end
   endgenerate
   genvar j;
   generate
      for (i=0; i<4; i++) begin
	 for (j=0; j<4; j++) begin
	    always_comb datat[i][j][0] = daten ? 9'h0 : datval;
	    always_comb datat[i][j][1] = daten ? 9'h1 : datval;
	    always_comb datat[i][j][2] = daten ? 9'h2 : datval;
	    always_comb datat[i][j][3] = daten ? 9'h3 : datval;
	 end
      end
   endgenerate
endmodule