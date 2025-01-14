module CY7C1380_PLSCD (ZZ, Mode, ADDR, GW_N, BWE_N, BWd_N, BWc_N, BWb_N, BWa_N, CE1_N, CE2, CE3_N, ADSP_N, ADSC_N, ADV_N, OE_N, DQ, CLK);
    parameter                       addr_bits =     19;         //  	19 bits
    parameter                       data_bits =     36;         //  	36 bits
    parameter                       mem_sizes = 524288;         // 	512K
    inout     [(data_bits - 1) : 0] DQ;                         // Data IO
    input     [(addr_bits - 1) : 0] ADDR;                       // ADDRess
    input                           Mode;                       // Burst Mode
    input                           ADV_N;                      // Synchronous ADDRess Advance
    input                           CLK;                        // Clock
    input                           ADSC_N;                     // Synchronous ADDRess Status Controller
    input                           ADSP_N;                     // Synchronous ADDRess Status Processor
    input                           BWa_N;                      // Synchronous Byte Write Enables
    input                           BWb_N;                      // Synchronous Byte Write Enables
    input                           BWc_N;                      // Synchronous Byte Write Enables
    input                           BWd_N;                      // Synchronous Byte Write Enables
    input                           BWE_N;                      // Byte Write Enable
    input                           GW_N;                       // Global Write
    input                           CE1_N;                       // Synchronous Chip Enable
    input                           CE2;                        // Synchronous Chip Enable
    input                           CE3_N;                      // Synchronous Chip Enable
    input                           OE_N;                       // Output Enable
    input                           ZZ;                         // Snooze Mode
    reg [((data_bits / 4) - 1) : 0] bank0 [0 : mem_sizes];      // Memory Bank 0
    reg [((data_bits / 4) - 1) : 0] bank1 [0 : mem_sizes];      // Memory Bank 1
    reg [((data_bits / 4) - 1) : 0] bank2 [0 : mem_sizes];      // Memory Bank 2
    reg [((data_bits / 4) - 1) : 0] bank3 [0 : mem_sizes];      // Memory Bank 3
    reg       [(data_bits - 1) : 0] din;                        // Data In
    reg       [(data_bits - 1) : 0] dout;                       // Data Out
    reg       [(addr_bits - 1) : 0] addr_reg_in;                // ADDRess Register In
    reg       [(addr_bits - 1) : 0] addr_reg_read;                // ADDRess Register for Read
    reg       [(addr_bits - 1) : 0] addr_reg_write;               // ADDRess Register for Write
    reg                     [1 : 0] bcount;                     // 2-bit Burst Counter
    reg                     [1 : 0] first_addr;                     // 2-bit Burst Counter
    reg                             ce_reg;
    reg                             Read_reg;
    reg                             Read_reg_o;
    reg                             WrN_reg;
    reg                             ADSP_N_o;
    reg                             pipe_reg;
    reg                             bwa_reg;
    reg                             bwb_reg;
    reg                             bwc_reg;
    reg                             bwd_reg;
    reg                             Sys_clk;
    reg                             test;
    reg                             pcsr_write;
    reg                             ctlr_write;
    reg                             latch_addr_current;
    reg                             latch_addr_old;
    wire                            ce      = (~CE1_N & CE2 & ~CE3_N);
    wire                            Write_n   = ~(((~BWa_N | ~BWb_N | ~BWc_N | ~BWd_N) & ~BWE_N) | ~GW_N ) ;
    wire                            Read   = (((BWa_N & BWb_N & BWc_N & BWd_N) & ~BWE_N) | (GW_N & BWE_N) | (~ADSP_N & ce)) ;
    wire                            bwa_n   = ~(~Write_n & (~GW_N | (~BWE_N & ~BWa_N )));
    wire                            bwb_n   = ~(~Write_n & (~GW_N | (~BWE_N & ~BWb_N )));
    wire                            bwc_n   = ~(~Write_n & (~GW_N | (~BWE_N & ~BWc_N )));
    wire                            bwd_n   = ~(~Write_n & (~GW_N | (~BWE_N & ~BWd_N )));
    wire                            latch_addr     = (~ADSC_N | (~ADSP_N & ~CE1_N));
    wire       #`tOEHZ 			OeN_HZ     = OE_N ? 1 : 0;
    wire       #`tOEV 			OeN_DataValid     = ~OE_N ? 0 : 1;
    wire       OeN_efct     = 		~OE_N ? OeN_DataValid : OeN_HZ;
    wire       #`tCHZ 			WR_HZ     = WrN_reg ? 1 : 0;
    wire       #`tCLZ 			WR_LZ     = ~WrN_reg ? 0 : 1;
    wire       WR_efct     = 		~WrN_reg ? WR_LZ : WR_HZ;
    wire       #`tCHZ			CE_HZ     = (~ce_reg | ~pipe_reg) ? 0 : 1 ;
    wire       #`tCLZ			CE_LZ     = pipe_reg ? 1 : 0 ;
    wire       Pipe_efct     = 		(ce_reg & pipe_reg) ? CE_LZ : CE_HZ ;
    wire       #`tCHZ			RD_HZ     = ~Read_reg_o ? 0 : 1 ;
    wire       #`tCLZ			RD_LZ     = Read_reg_o ? 1 : 0 ;
    wire       RD_efct     = 		Read_reg_o ? CE_LZ : CE_HZ ;
	//Test
	int i;
	initial
	 #0 begin
	 	for(i = 0; i < 640*480/2; i = i + 1)begin
	 		if(i < (640*480)/4)begin
				{bank3[i], bank2[i], bank1[i], bank0[i]} = func_data(i*2);//t_test({2{5'hFF, 6'h00, 5'h00}});
			end
			else begin
				{bank3[i], bank2[i], bank1[i], bank0[i]} = func_data(i*2);//t_test({2{5'h0, 6'h00, 5'hFF}});
			end
		end
	end
	function [35:0] func_data;
		input [15:0] data;
		reg [15:0] r_data0;
		reg [15:0] r_data1;
		begin
			r_data0 = data;
			r_data1 = data + 1;
			func_data = {1'b0, r_data1[15:8], 1'b0, r_data1[7:0], 1'b0, r_data0[15:8], 1'b0, r_data0[7:0]};
		end
	endfunction
	function [35:0] t_test;
		input [31:0] data;
		begin
			t_test = {1'b0, data[31:24], 1'b0, data[23:16], 1'b0, data[15:8], 1'b0, data[7:0]};
		end
	endfunction
    // Initialize
    initial begin
        ce_reg = 1'b0;
        pipe_reg = 1'b0;
        Sys_clk = 1'b0;
        $timeformat (-9, 1, " ns", 10);                         // Format time unit
    end
    // System Clock Decode
    always begin
        @ (posedge CLK) begin
            Sys_clk = ~ZZ;
        end
        @ (negedge CLK) begin
            Sys_clk = 1'b0;
        end
    end
    always @ (posedge Sys_clk) begin
	// Read Register
        if (~Write_n) Read_reg_o = 1'b0;
        else Read_reg_o = Read_reg;
        if (~Write_n) Read_reg = 1'b0;
	else Read_reg = Read;
        if (Read_reg == 1'b1) begin
		pcsr_write     = 1'b0;
		ctlr_write     = 1'b0;
	end
	// Write Register
       	if (Read_reg_o == 1'b1)	WrN_reg = 1'b1;
       	else WrN_reg = Write_n;
	latch_addr_old = latch_addr_current;
	latch_addr_current = latch_addr;
        if (latch_addr_old == 1'b1 & ~Write_n & ADSP_N_o == 1'b0)
			pcsr_write     = 1'b1; //Ctlr Write = 0; Pcsr Write = 1;
        else if (latch_addr_current == 1'b1 & ~Write_n  & ADSP_N & ~ADSC_N)
			ctlr_write     = 1'b1; //Ctlr Write = 0; Pcsr Write = 1;
        // ADDRess Register
        if (latch_addr)
		begin
			addr_reg_in = ADDR;
        		bcount = ADDR [1 : 0];
        		first_addr = ADDR [1 : 0];
		end
        // ADSP_N Previous-Cycle Register
        ADSP_N_o <= ADSP_N;
        // Binary Counter and Logic
		if (~Mode & ~ADV_N & ~latch_addr) 	// Linear Burst
        		bcount = (bcount + 1);         	// Advance Counter
		else if (Mode & ~ADV_N & ~latch_addr) 	// Interleaved Burst
		begin
			if (first_addr % 2 == 0)
        			bcount = (bcount + 1);         // Increment Counter
			else if (first_addr % 2 == 1)
        			bcount = (bcount - 1);         // Decrement Counter
		end
        // Read ADDRess
        addr_reg_read = addr_reg_write;
        // Write ADDRess
        addr_reg_write = {addr_reg_in [(addr_bits - 1) : 2], bcount[1], bcount[0]};
        // Byte Write Register
        bwa_reg = ~bwa_n;
        bwb_reg = ~bwb_n;
        bwc_reg = ~bwc_n;
        bwd_reg = ~bwd_n;
        // Enable Register
        pipe_reg = ce_reg;
        // Enable Register
        if (latch_addr) ce_reg = ce;
        // Input Register
        if (ce_reg & (~bwa_n | ~bwb_n | ~bwc_n | ~bwd_n) & (pcsr_write | ctlr_write)) begin
            din = DQ;
        end
        // Byte Write Driver
        if (ce_reg & bwa_reg) begin
            bank0 [addr_reg_write] = din [ 8 :  0];
        end
        if (ce_reg & bwb_reg) begin
            bank1 [addr_reg_write] = din [17 :  9];
        end
        if (ce_reg & bwc_reg) begin
            bank2 [addr_reg_write] = din [26 : 18];
        end
        if (ce_reg & bwd_reg) begin
            bank3 [addr_reg_write] = din [35 : 27];
        end
        // Output Registers
        if (~Write_n | pipe_reg == 1'b0)
            dout [ 35 :  0] <= #`tCHZ 36'bZ;
        else if (Read_reg_o == 1'b1) begin
            dout [ 8 :  0] <= #`tCO bank0 [addr_reg_read];
            dout [17 :  9] <= #`tCO bank1 [addr_reg_read];
            dout [26 : 18] <= #`tCO bank2 [addr_reg_read];
            dout [35 : 27] <= #`tCO bank3 [addr_reg_read];
        end
    end
    // Output Buffers
    assign DQ =  (~OE_N & ~ZZ & Pipe_efct & RD_efct & WR_efct) ? dout : 36'bz;
    // Timing Check
    specify
        $width      (negedge CLK, `tCL);
        $width      (posedge CLK, `tCH);
        $period     (negedge CLK, `tCYC);
        $period     (posedge CLK, `tCYC);
        $setuphold  (posedge CLK, ADSP_N, `tADS, `tADH);
        $setuphold  (posedge CLK, ADSC_N, `tADS, `tADH);
        $setuphold  (posedge CLK, ADDR,   `tAS,   `tAH);
        $setuphold  (posedge CLK, BWa_N,  `tWES,   `tWEH);
        $setuphold  (posedge CLK, BWb_N,  `tWES,   `tWEH);
        $setuphold  (posedge CLK, BWc_N,  `tWES,   `tWEH);
        $setuphold  (posedge CLK, BWd_N,  `tWES,   `tWEH);
        $setuphold  (posedge CLK, BWE_N,  `tWES,   `tWEH);
        $setuphold  (posedge CLK, GW_N,   `tWES,   `tWEH);
        $setuphold  (posedge CLK, CE1_N,   `tCES,  `tCEH);
        $setuphold  (posedge CLK, CE2,    `tCES,  `tCEH);
        $setuphold  (posedge CLK, CE3_N,  `tCES,  `tCEH);
        $setuphold  (posedge CLK, ADV_N,  `tADVS,  `tADVH);
    endspecify
endmodule