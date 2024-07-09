module testbench;
  wire [7:0] Q;
  reg [3:0] a,b;
  IMUL im(a,b,Q);
    initial begin
    	$dumpfile("imul.vcd");
	    $dumpvars;
        a = 4'hF;
        b = 4'h2;
        #20;
        a = 4'hA;
        b = 4'h5;
        #20;
        a = 4'hB;
        b = 4'hC;
	    #20 $finish;
	end
endmodule