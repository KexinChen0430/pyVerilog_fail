module ReadWrite_testbench;
	// Signal declaration
	reg Clock;
	reg Reset;
	reg[ `size_char - 1 : 0 ]R;
	reg[ `size_char - 1 : 0 ]G;
	reg[ `size_char - 1 : 0 ]B;
	wire[ `size_char - 1 : 0 ]R_out;
	wire[ `size_char - 1 : 0 ]G_out;
	wire[ `size_char - 1 : 0 ]B_out;
	reg[ `size_char - 1 : 0 ]RBlock[ 0 : `SumPixel - 1 ];
	reg[ `size_char - 1 : 0 ]GBlock[ 0 : `SumPixel - 1 ];
	reg[ `size_char - 1 : 0 ]BBlock[ 0 : `SumPixel - 1 ];
	integer i;
	integer RFile;
	integer GFile;
	integer BFile;
	ReadWrite ReadWrite_test
	(
		Clock,
		Reset,
		R,
		G,
		B,
		R_out,
		G_out,
		B_out
	);
	initial
	begin
		#2
		begin
			// open test data file
			$readmemh( "data/IM000565_RAW_20x15R.dat", RBlock );
			$readmemh( "data/IM000565_RAW_20x15G.dat", GBlock );
			$readmemh( "data/IM000565_RAW_20x15B.dat", BBlock );
		end
		#2	Reset = 1'b1;
		// Apply Stimulus
		for( i = 0; i < `SumPixel; i = i + 1 )
		begin
			#2
			begin
				// initialization, start to read data into buffer
				Reset = 1'b0;
				R = RBlock[ i ];
				G = GBlock[ i ];
				B = BBlock[ i ];
			end
		end
		#2
		begin
			RFile = $fopen( "data/R.dat" );
			GFile = $fopen( "data/G.dat" );
			BFile = $fopen( "data/B.dat" );
		end
		for( i = 0; i < `SumPixel; i = i + 1 )
		begin
			#2
			begin
				// display information on the screen
				//$display( "R = %d, G = %d, B = %d\t\tR = %d, G = %d, B = %d",
				//	RBlock[ i ], GBlock[ i ], BBlock[ i ], R_out, G_out, B_out );
				if( i % 16 == 0 )
				begin
					$fwrite( RFile, "\n" );
					$fwrite( GFile, "\n" );
					$fwrite( BFile, "\n" );
				end
				$fwrite( RFile, "%X ", R_out );
				$fwrite( GFile, "%X ", G_out );
				$fwrite( BFile, "%X ", B_out );
			end
		end
		$fclose( RFile );
		$fclose( GFile );
		$fclose( BFile );
		#100000	$stop;
		#100000	$finish;
	end
	initial	Clock = 0;
	always	#1 Clock = ~Clock;	//Toggle Clock
endmodule