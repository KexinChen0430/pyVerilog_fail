module
wire 	GENRST  		= CP[`CPX(`GENRST)];		// General reset signal
wire  WGX         = CP[`CPX(`WGX)];			// Write G (do not reset)
wire	WGN         = CP[`CPX(`WGN)];			// Write G (normal gates)
wire	W20      	= CP[`CPX(`W20)];			// Write into CYR
wire	W21       	= CP[`CPX(`W21)];			// Write into SR
wire	W22       	= CP[`CPX(`W22)];			// Write into CYL
wire	W23       	= CP[`CPX(`W23)];			// Write into SL
wire	SBWG        = CP[`CPX(`SBWG)];		// Write G from memory
wire MB_AW  		= !WGN | !WGX;				// Port A to G
wire MB_BW  		= !W21 | !W20;				// Port B to G
wire MB_CW  		= !W22 | !W23;				// Port C to G
wire MB_DW  		= !SBWG;						// Port D to G
wire MB_B16       = !(!(WRITE_BUS[ 0] & !W20) & !(WRITE_BUS[15] & W20));
wire MB_C16 		= !(!(WRITE_BUS[13] & !W22) & !(WRITE_BUS[15] & W22));
// Instantiate Register G Latch
reg	[ 15:0]	G_REG;			// G Register
wire [3:0] Sel = {MB_DW, MB_CW, MB_BW, MB_AW};
always @(posedge CLK2) begin
	if(!GENRST) G_REG <= 16'h0000;
	else begin
		case(Sel)
			4'b0001 : begin							// Selecting Port A, no shifting
				G_REG[15]    = WRITE_BUS[15];		// MSBit
				G_REG[14]    = 1'b1;					// Bit not used
				G_REG[13:0]  = WRITE_BUS[13:0];	// No Shifting
			end
			4'b0010 : begin							// Selecting Port B, shift
				G_REG[15]    = MB_B16;				// MSBit is B16
				G_REG[14]    = 1'b1;					// Bit not used
				G_REG[13] 	 = WRITE_BUS[15]; 	// Shifting top bit
				G_REG[12:0]  = WRITE_BUS[13:1];	// Shifting the rest of the bits
			end
			4'b0100 : begin							// Selecting Port C, rotate through LSB
				G_REG[15]    = MB_C16;				// MSBit
				G_REG[14]    = 1'b1;					// Bit not used
				G_REG[13:1]  = WRITE_BUS[12:0];	// Shifting rest of bits
				G_REG[0]		 = WRITE_BUS[15];		// Rotate into lower bit
			end
			4'b1000 : begin							// Selecting Port D, Memory mode
				G_REG[15]    = MEM_OUT[14];		// MSBit
				G_REG[14]    = 1'b1;					// Bit not used
				G_REG[13:0]  = MEM_OUT[13:0];		// No Shifting
			end
			default : ;	  // Do nothing
		endcase
	end
end
// PAR Module: Parity Generator Checker Section
wire	CLG 		= CP[`CPX(`CLG)];				// CP signal - Clear G
wire	GP 		= CP[`CPX(`GP) ];				// CP signal - Generate Parity
wire	RP2 		= CP[`CPX(`RP2)];				// CP signal - Read parity 2
wire	WP 		= CP[`CPX(`WP) ];				// CP signal - Write P
wire	WPX 		= CP[`CPX(`WPX)];				// CP signal - Write P (do not reset)
wire	WP2 		= CP[`CPX(`WP2)];				// CP signal - Write P2
wire	TP 		= CP[`CPX(`TP) ];				// CP signal - Test parity
wire	WE 		= CP[`CPX(`WE) ];				// CP signal - Write E-MEM from G
wire	RG 		= CP[`CPX(`RG) ];				// CP signal - Read G
wire	GTR_27 	= SELECT[`SLX(`GTR_27)];	// Get SELECT signal
// Register Storage
reg	[ 15:0]		P;			// Parity Register
reg	 				P2;		// P2 Register
reg	 				G15;		// G15 Register
reg	 				PALM;		// PALM Register
// Instantiate P Register
always @(posedge CLK2) begin
	if(!GENRST) 			P <= 16'h0000;
	else if(!WP | !WPX)  P <= {PR_D15, WRITE_BUS[15], WRITE_BUS[13:0]};
end
wire Par_bit = ^P[14:0];				// Generate ODD Parity (was PR_P_15)
wire Par_Alm = Par_bit ^ P[15];		// Generate the alarm (was PR_1_15)
// Instantiate G15 Register
wire	PR_WG15  	= !WGX | !SBWG | !GP | !RP2;  // Load on any of these
wire  PR_D0 		= !(P2 & !RP2) & !(Par_Alm & !GP) & !(MOUT16 & !SBWG) & !(Par_Alm & !WGX);
always @(posedge CLK2)
	if(!CLG) 			G15 <= 1'b0; 	// Clear G15 register
	else if(PR_WG15)	G15 <= PR_D0;	// Load  G15 register
wire PR_D15	= G15 & !RG;
wire PAR_16 = G15;			// no mux or gate needed due dedicated input port for ram
// Instantiate P2 Register
always @(posedge CLK2)
	if(!GENRST) 	P2 <= 1'b0; 	// Clear P2 register
	else if(!WP2)	P2 <=	Par_Alm;	// Load  P2 register
// Instantiate Register PALM Latch,
wire	PR_WPLM = !TP & !GTR_27 &  Par_Alm;
always @(posedge CLK2)
	if(!CLR_PARALM | !GENRST)  PALM <= 1'b0;
	else if(PR_WPLM)           PALM <= Par_Alm;
assign PARALM = PALM;
endmodule