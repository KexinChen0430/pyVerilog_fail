module ColorImageProcess_testbench;
	// Signal declaration
	reg Clock;
	reg Reset;
	reg[ `size_char - 1 : 0 ]R;
	reg[ `size_char - 1 : 0 ]G;
	reg[ `size_char - 1 : 0 ]B;
	wire[ `size_char - 1 : 0 ]R_out;
	wire[ `size_char - 1 : 0 ]G_out;
	wire[ `size_char - 1 : 0 ]B_out;
	integer i;
	integer InputFile;
	integer OutputFile;
	reg[ `size_char - 1 : 0 ]ImageDataBlock[ 0 : `SumPixel * 3 ];
	ColorImageProcess ColorImageProcess_test
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
			Clock = 0;
			// open data for input file
			InputFile = $fopen( "data/IM000565_RAW_20x15.BMP", "rb" );
			//InputFile = $fopen( "data/IM000565_RAW_320x240.BMP", "rb" );
			// open data for output file
			OutputFile = $fopen( "data/TEST.BMP", "wb" );
		end
		//$fread( BitMapHeader, InputFile, 0, `BitMapHeaderLength );
		for( i = 0; i < `BitMapHeaderLength; i = i + 1 )
		#2	$fwriteb( OutputFile, "%c", $fgetc( InputFile ) );
		for( i = 0; i < `SumPixel * 3; i = i + 1 )
		#2	ImageDataBlock[ i ] = $fgetc( InputFile );
		#2	Reset = 1;
	//	#2	Reset = 0;
		// Apply Stimulus in order to
		for( i = 0; i < `SumPixel * 3; i = i + 3 )
		begin
			#2
			begin
				Reset = 0;
				B = ImageDataBlock[ i + 0 ];
				G = ImageDataBlock[ i + 1 ];
				R = ImageDataBlock[ i + 2 ];
			end
		end
		for( i = 0; i < `SumPixel * 3; i = i + 3 )
		begin
			#2
			begin
				B = ImageDataBlock[ i + 0 ];
				G = ImageDataBlock[ i + 1 ];
				R = ImageDataBlock[ i + 2 ];
			end
			#4
			#2
			begin
				// display information on the screen
				//$display( "R = %X, G = %X, B = %X\t\tR = %X, G = %X, B = %X",
				//ImageDataBlock[ i + 2 ], ImageDataBlock[ i + 1 ], ImageDataBlock[ i + 0 ], R_out, G_out, B_out );
				$fwriteb( OutputFile, "%c", B_out );
				$fwriteb( OutputFile, "%c", G_out );
				$fwriteb( OutputFile, "%c", R_out );
			end
		end
		$fclose( InputFile );
		#100000	$stop;
		#100000	$finish;
	end
	always	#1 Clock = ~Clock;	//Toggle Clock
endmodule