module ToneReproduction_testbench;
	reg[ `size_int - 1 : 0 ]L;
	reg[ `size_int - 1 : 0 ]IN_R;
	reg[ `size_int - 1 : 0 ]IN_G;
	reg[ `size_int - 1 : 0 ]IN_B;
	wire[ `size_int - 1 : 0 ]OUT_R;
	wire[ `size_int - 1 : 0 ]OUT_G;
	wire[ `size_int - 1 : 0 ]OUT_B;
	ToneReproduction ToneReproduction_test( L, IN_R, IN_G, IN_B, OUT_R, OUT_G, OUT_B );
	initial
	begin
		//L = 58 * 256 * 6.3496042078727978990068225570775 = 94279
		//IN_R = 128 * 256 = 32768
		//IN_G = 90 * 256 = 23040
		//IN_B = 78 * 256 = 19968
		#10
		begin
			L = 65019;
			IN_R = 32768;
			IN_G = 23040;
			IN_B = 19968;
		end
		#10     $display( "L = %d\tIN_R = %d\tIN_G = %d\tIN_B = %d", L, IN_R, IN_G, IN_B );
		#10     $display( "OUT_R = %d\tOUT_G = %d\tOUT_B = %d",OUT_R, OUT_G, OUT_B );
		#10     $stop;
		#10     $finish;
	end
endmodule