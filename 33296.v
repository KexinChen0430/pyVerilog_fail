module main(
    // USART
    UART_CTS, // input "clear to send" <- from host
    UART_RTS, // output "request to send" -> to host
    UART_TXD, // output -> to host
    UART_RXD, // input -> from host
	SYS_RESET_N, // input
	//OSC
	CLK_MASTER, // the main clock source
	CLK_SLOW, // not used
	// SCHMITT-TRIGGERS
	ST_1_OUT, // not used
	ST_2_OUT, // not used
	// DIGITAL AND ANALOG CLUSTER
	DCL_OUT, // not used
	ACL_OUT, // not used
	// SCANPORTS
    SP_1_TDO_FPGA,
	SP_1_TMS_FPGA,
    SP_1_TCK_FPGA,
    SP_1_TRST_FPGA,
    SP_1_TDI_FPGA,
	SP_1_FAIL_FPGA,
    SP_2_TDO_FPGA,
    SP_2_TMS_FPGA,
    SP_2_TCK_FPGA,
    SP_2_TRST_FPGA,
    SP_2_TDI_FPGA,
    SP_2_FAIL_FPGA,
    // DEBUG
    DEBUG,
	// 0 - green led, low active
	// 1 - yellow led, low active
	// 2 - blue led, low active
    // PUSH BUTTONS AND STATUS LEDS
    CTRL_IN_START_N, // synthesis attribute PULLUP of CTRL_IN_START_N isTRUE;
    CTRL_IN_STOP_N,  // synthesis attribute PULLUP of CTRL_IN_STOP_N isTRUE;
    CTRL_OUT_PASS, // green pass led
	CTRL_OUT_FAIL, // red fail led
	// I2C
	I2C_SDA, // synthesis attribute PULLUP of I2C_SDA isTRUE;
	I2C_SCL, // synthesis attribute PULLUP of I2C_SCL isTRUE;
	// pull-up resistors mounted externally
    // MEMORY (RAM AND FLASH EEPROM)
    MEM_A, // address bus
    MEM_D, // data bus
    RAM_OUT_CS_1_N,
	RAM_OUT_CS_2_N,
    RAM_IN_CS_N,
	ROM_CS_N,
    MEM_OE_N,
    MEM_WE_N
    );
    `include "parameters_global.v"
    //`include "parameters_ram.v"
    // USART
    input UART_CTS; // input "clear to send" <- from host
    output UART_RTS; // output "request to send" -> to host
    output UART_TXD; // output -> to host
    input UART_RXD; // input -> from host
    input SYS_RESET_N;
    // OSC
    input CLK_MASTER;
	input CLK_SLOW;
	// SCHMITT-TRIGGERS
	input ST_1_OUT;
	input ST_2_OUT;
	// DIGITAL AND ANALOG CLUSTER
	input DCL_OUT;
	input ACL_OUT;
    // SCANPORTS
    output SP_1_TDO_FPGA;
	output SP_1_TMS_FPGA;
    output SP_1_TCK_FPGA;
    output SP_1_TRST_FPGA;
    input  SP_1_TDI_FPGA;
	output SP_1_FAIL_FPGA; // sends to input RAM // not used currently
    output SP_2_TDO_FPGA;
    output SP_2_TMS_FPGA;
    output SP_2_TCK_FPGA;
    output SP_2_TRST_FPGA;
    input  SP_2_TDI_FPGA;
    output SP_2_FAIL_FPGA; // sends to input RAM // not used currently
	// DEBUG
	output reg [`debug_width-1:0] DEBUG;
	// PUSH BUTTONS AND STATUS LEDS
	input  CTRL_IN_START_N; // synthesis attribute PULLUP of CTRL_IN_START_N isTRUE;
	input  CTRL_IN_STOP_N;  // synthesis attribute PULLUP of CTRL_IN_STOP_N isTRUE;
	output reg CTRL_OUT_PASS;
	output reg CTRL_OUT_FAIL;
	// I2C
	inout I2C_SDA; // synthesis attribute PULLUP of I2C_SDA isTRUE;
	inout I2C_SCL; // synthesis attribute PULLUP of I2C_SCL isTRUE;
    // RAM AND FLASH EEPROM
    output [`ram_addr_width-1:0] MEM_A; // synthesis attribute PULLUP of MEM_A isTRUE;
    inout [`ram_data_width-1:0] MEM_D;  // synthesis attribute PULLUP of MEM_D isTRUE;
    output RAM_OUT_CS_1_N;
	output RAM_OUT_CS_2_N;
	assign RAM_OUT_CS_2_N = 1'b1; // output RAM #2 currently not used
    output RAM_IN_CS_N;
	//assign RAM_IN_CS_N = 1'b1; // input RAM currently not used
	output ROM_CS_N; // ROM currently not used
	assign ROM_CS_N = 1'b1;
    output MEM_OE_N;
    output MEM_WE_N;
	wire [111:0] rf_gpo;
	wire [335:0] rf_gpi;
    wire [`uart_data_width-1:0] uart_debug;
    usart usart1 (
        .reset_n (SYS_RESET_N),
        .clk (CLK_MASTER),
        .rs232_cts (UART_CTS), // input
        .rs232_rts (UART_RTS), // output
        .rs232_txd (UART_TXD), // output
        .rs232_rxd (UART_RXD), // input
		.general_purpose_out (rf_gpo[111:0]),
            //   [7:0] 80h -> data channel write access
			//	[31:8] 83-81h -> ram address
			// [39:32] 84h -> command channel
			// [47:40] 8Bh -> data path //defaults to ri->ram
			// [55:48] 8Ch -> frequency //CS: not used any more
			// [63:56] 89h -> test start/stop (55/AA) // obsolete
			// [71:64] A7h -> breakpoint / step id lowbyte
			// [79:72] A8h -> breakpoint / step id highbyte
			// [87:80] A9h -> breakpoint / bit position lowbyte
			// [95:88] AAh -> breakpoint / bit position lowbyte + 1
			// [103:96] ABh -> breakpoint / bit position lowbyte + 2
			// [111:104] ACh -> breakpoint / bit position highbyte
		.general_purpose_in (rf_gpi[335:0]),
            //  [7:0] 80h -> data channel read access
            // [31:8] 87-85h -> for debug: RAM address generated by executor
			// [39:32] 88h -> failed scanpaths (bit set when failed)
			// [47:40] 89h -> executor state
			// [55:48] 8Ah -> tap states
			// [87:56] 8F-8Ch -> bits processed chain 1
			// [119:88]	93-90 -> sxr_length_chain_1
			// [135:120] 95-94 -> step id
			// [143:136] 96 -> shifter_state_1
			// [175:144] 9A-97 -> bits processed chain 2
			// [207:176] 9E-9B -> sxr_length_chain_2
			// [215:208] 9F -> shifter_state_2
			// [231:216] A1-A0 -> firmware version
			// [239:232] A2 -> data_path/mmu_state
			// [247:240] A4 -> command readback
			// [255:248] A5 -> low level command processor state
			// [263:256] A6 -> i2c master state
			// [271:264] A7h -> breakpoint / step id lowbyte
			// [279:272] A8h -> breakpoint / step id highbyte
			// [287:280 A9h -> breakpoint / bit position lowbyte
			// [295:288] AAh -> breakpoint / bit position lowbyte + 1
			// [303:296] ABh -> breakpoint / bit position lowbyte + 2
			// [311:304] ACh -> breakpoint / bit position highbyte
            // [319:312] ADh -> scanport_bits port 1
            // [327:320] AEh -> scanport_bits port 2
			// [335:328] AFh -> debugging
		.data_write_strobe (ram_data_write_strobe),
            // L on write access to 80h (data channel)
        .debug (uart_debug)
    );
    wire uut_pwr_fail;
    conditioner co1 (
        .clk (CLK_MASTER),
        .reset_n (SYS_RESET_N),
        //.input_async
        .output_edge (uut_pwr_fail), // H for one clock period when edge detected
        .edge_detect (edge_falling) // input, set to edge_detect falling edge
        );
	prescaler prescaler (
		.clk (CLK_MASTER), // input // 50 Mhz / period 20ns
		.out_25 (clk_slow), // output // 1Hz
		.out_24 (clk_medium), // output // 2Hz
		.out_23 (clk_fast), // output // 4Hz
		//.out_21(clk_debouncers), // output // 16hz / period 62.8ms
        .reset_n (SYS_RESET_N)
		);
    // hard coded firmware word
	assign rf_gpi[231:216] = firmware_version; // rf read address A1-A0h
	// command driven by rf
	wire [`command_width-1:0] command;
	assign command = rf_gpo[39:32]; // command // 84h
// ROUTING
	// routing configuration driven by rf
	wire [`path_width-1:0] data_path;
	assign data_path = rf_gpo[43:40]; // rf write address 8Bh (low nibble of data only)
    // SOURCES IN RF:
	// ram address and data driven by rf
	wire [`ram_addr_width_max-1:0] rf_ram_addr_out;
	//assign rf_ram_addr_out = {5'b00000,rf_gpo[26:8]}; // rf write address 83-81h
    //assign rf_ram_addr_out = {`ram_addr_width_max-`ram_addr_width'b0, rf_gpo[31-(`ram_addr_width_max-`ram_addr_width):8]}; // rf write address 83-81h
    assign rf_ram_addr_out = rf_gpo[31:8]; // rf write address 83-81h
	wire [`ram_data_width-1:0] rf_ram_data_out;
	assign rf_ram_data_out = rf_gpo[7:0]; // rf write address 80h
	// breakpoint
	wire [`step_id_width-1:0] rf_breakpoint_sxr_id = rf_gpo[79:64];
	wire [`chain_length_width-1:0] rf_breakpoint_bit_position = rf_gpo[111:80];
    // DESTINATIONS IN RF:
    // ram address and data read by rf
	wire [`ram_addr_width_max-1:0] rf_ram_addr_in;
    assign rf_ram_addr_in[(`ram_addr_width_max-1):`ram_addr_width] = `ram_addr_width_excess'b0; // rf read address 87-85h
    //assign rf_ram_addr_in = rf_ram_addr_out; // experimental to bypass mmu
    assign rf_gpi[31:8] = rf_ram_addr_in;  // rf read address 87-85h
    wire [`ram_data_width-1:0] rf_ram_data_in;
	assign rf_gpi[7:0] = rf_ram_data_in;      // rf read address 80h
	// breakpoint feedback (for status query)
	assign rf_gpi[279:264] = rf_breakpoint_sxr_id;
    assign rf_gpi[311:280] = rf_breakpoint_bit_position;
    // SOURCES IN EX
    // ram address and data driven by ex
	wire [`ram_addr_width-1:0] ex_ram_addr_out;
	wire [`ram_data_width-1:0] ex_ram_data_out;
    // DESTINATIONS IN EX
    // ram address and data readn by ex
	wire [`ram_addr_width-1:0] ex_ram_addr_in;
	wire [`ram_data_width-1:0] ex_ram_data_in;
    wire request_clear_mem;
    command_decoder cd (
        .clk (CLK_MASTER),
        .reset_n (SYS_RESET_N),
        .command (command), // input driven by rf
        .request_clear_mem (request_clear_mem), // output, drives to mmu
        //.request_clear_mem_ack(request_clear_mem_ack), // input, from mmu
        .go_step_tck (go_step_tck), // output, drives to ex
        .go_step_sxr (go_step_sxr), // output, drives to ex
        .test_halt (test_halt),  // output, drives to ex
        .test_abort (test_abort_cd),  // output, drives to ex
        //.test_abort_ack(test_abort_ack), // input, from executor
        .go_step_test (go_step_test)  // output, drives to ex
        //.go_step_test_ack(go_step_test_ack) // input, from executor
        );
    wire mem_clear;
    wire [`mmu_state_width-1:0] mmu_state;
    router_mmu router_mmu (
        .reset_n (SYS_RESET_N),
        //.dummy_out(DEBUG[0]),
        .clk (CLK_MASTER),
        // input, driven by rf to specifiy data path
        .path (data_path),
        // input, driven by rf to specifiy command
        .request_clear_mem (request_clear_mem),
        //.request_clear_mem_ack(request_clear_mem_ack), // output, to cmd decoder
        .mem_clear (mem_clear), // output, high when ram cleared
        // handshake between mmu and executor
        .data_request_from_ex (data_request_from_ex), // input, indicates that ex requests data
        .data_ready_to_ex (data_ready_to_ex), // output
        //.data_acknowledge_from_ex(data_acknowledge_from_ex), // input
        .mmu_state (mmu_state), // output
        // inputs that read from rf and/or ex
        .addr_from_rf (rf_ram_addr_out[`ram_addr_width-1:0]),
        .data_from_rf (rf_ram_data_out),
        .data_from_rf_write_strobe (ram_data_write_strobe), // L on write access to 80h (data channel)
        .addr_from_ex (ex_ram_addr_out),
        //.data_in_ex(ex_ram_data_out), // not used
        // outputs that drive to rf and/or ex
        .addr_to_rf (rf_ram_addr_in[`ram_addr_width-1:0]),
        .data_to_rf (rf_ram_data_in),
        .addr_to_ex (ex_ram_addr_in), // start address for executor
        .data_to_ex (ex_ram_data_in),
        // ram data is bidir (inout)
        .ram_data (MEM_D),
        // ram addr is driven by mmu
        .ram_addr (MEM_A),
        .ram_cs_in_n (RAM_IN_CS_N),
        .ram_cs_out_n (RAM_OUT_CS_1_N),
        .ram_we_n (MEM_WE_N),
        .ram_oe_n (MEM_OE_N),
        .test_abort(test_abort_mmu) // output
        );
	debouncer db_start_button ( // CS: syncronizer
		.out (panel_start_debounced),
		.in (~CTRL_IN_START_N),
		.clk (CLK_MASTER),
		.reset_n (SYS_RESET_N)
	);
	debouncer db_stop_button ( // CS: syncronizer
		.out (panel_stop_debounced),
		.in (~CTRL_IN_STOP_N),
		.clk (CLK_MASTER),
		.reset_n (SYS_RESET_N)
	);
    wire [`chain_length_width-1:0] bits_processed_chain_1;
    wire [`chain_length_width-1:0] sxr_length_chain_1;
    wire [`chain_length_width-1:0] bits_processed_chain_2;
    wire [`chain_length_width-1:0] sxr_length_chain_2;
    wire [`step_id_width-1:0] step_id;
    wire [`byte_width-1:0] shifter_state_1;
    wire [`byte_width-1:0] shifter_state_2;
    wire [`timer_scan_state_width-1:0] scan_clock_timer_state_1; // CS: route to rf
    wire [`timer_scan_state_width-1:0] scan_clock_timer_state_2; // CS: route to rf
    //CS: wire [`ram_data_width-1:0] tck_frequency; // may be used to override frequency compiled in vector file
    wire [`executor_state_width-1:0] executor_state;
    wire [`tap_state_width-1:0] tap_state_1;
    wire [`tap_state_width-1:0] tap_state_2;
    //wire [`tdi_diagnosis_tap_1_2_width-1:0] tdi_diagnosis_tap_1_2;
    wire [`byte_width-1:0] lcp_state;
    wire [`byte_width-1:0] i2c_master_state;
    wire [`scanpath_count_max:1] ex_sp_trst;
    wire [`scanpath_count_max:1] ex_sp_tms;
    wire [`scanpath_count_max:1] ex_sp_tck;
    wire [`scanpath_count_max:1] ex_sp_tdo;
    wire [`scanpath_count_max:1] ex_sp_tdi;
    wire [`scanpath_count_max:1] ex_sp_exp;
    wire [`scanpath_count_max:1] ex_sp_mask;
    wire [`scanpath_count_max:1] ex_sp_fail;
    assign SP_1_TRST_FPGA   = ex_sp_trst[1];
    assign SP_1_TMS_FPGA    = ex_sp_tms[1];
    assign SP_1_TCK_FPGA    = ex_sp_tck[1];
    assign SP_1_TDO_FPGA	= ex_sp_tdo[1];
	assign ex_sp_tdi[1] 	= SP_1_TDI_FPGA;
    //assign tap_1_exp    = ex_sp_exp[1];
    //assign tap_1_mask   = ex_sp_mask[1];
    assign SP_1_FAIL_FPGA   = ex_sp_fail[1];
    assign SP_2_TRST_FPGA   = ex_sp_trst[2];
    assign SP_2_TMS_FPGA    = ex_sp_tms[2];
    assign SP_2_TCK_FPGA    = ex_sp_tck[2];
    assign SP_2_TDO_FPGA	= ex_sp_tdo[2];
	assign ex_sp_tdi[2]		= SP_2_TDI_FPGA;
    //assign tap_2_exp    = ex_sp_exp[2];
    //assign tap_2_mask   = ex_sp_mask[2];
    assign SP_2_FAIL_FPGA   = ex_sp_fail[2];
    executor ex (
        .reset_n (SYS_RESET_N),
        .clk(CLK_MASTER),
        .ex_state(executor_state), // output, read by rf
        .go_step_tck(go_step_tck), // input, driven by command decoder
        .go_step_sxr(go_step_sxr), // input, driven by command decoder
        .test_halt(test_halt), // input, driven by command decoder
        .test_abort(test_abort_cd | panel_stop_debounced | uut_pwr_fail | test_abort_mmu), // input,
        //driven by command decoder, stop button or uut power fail (via conditioner co1)
        //.test_abort_ack(test_abort_ack), // output, to command decoder
        .go_step_test(go_step_test), // input, driven by command decoder
		.breakpoint_sxr_id(rf_breakpoint_sxr_id), // input, driven by rf
		.breakpoint_bit_position(rf_breakpoint_bit_position), // input, driven by rf
        .start_from_panel(panel_start_debounced), // input
        //.stop_from_panel(panel_stop_debounced), // input
        .bits_processed_chain_1 (bits_processed_chain_1), // output
        .sxr_length_chain_1 (sxr_length_chain_1), // output
        .bits_processed_chain_2 (bits_processed_chain_2), // output
        .sxr_length_chain_2 (sxr_length_chain_2), // output
        .step_id (step_id), // output
        .tap_state_1 (tap_state_1), // output
        .tap_state_2 (tap_state_2), // output
        //.tck_frequency(tck_frequency), // input // CS: may be used to override frequency compiled in vector file
        .ram_addr_to_mmu (ex_ram_addr_out), // output
        .ram_data_from_mmu (ex_ram_data_in), // input
        .data_ready_from_mmu (data_ready_to_ex),        // input
        //.data_acknowledge_to_mmu(data_acknowledge_from_ex), // output
        .data_request_to_mmu (data_request_from_ex), // output
        .start_addr_in (ex_ram_addr_in), // input, test start address driven by mmu
        .sda (I2C_SDA), // bidir
        .scl (I2C_SCL), // bidir
        //.emergency_pwr_off_n // output
        //.uut_pwr_fail_from_pwr_ctrl // input
        //.reset_timer_n // output
        .sp_trst (ex_sp_trst), // output
        .sp_tms (ex_sp_tms), // output
        .sp_tck (ex_sp_tck), // output
        .sp_tdo (ex_sp_tdo), // output
        .sp_tdi (ex_sp_tdi), // input
        .sp_exp (ex_sp_exp), // output
        .sp_mask (ex_sp_mask), // output
        .sp_fail (ex_sp_fail), // output
        .lcp_state (lcp_state), // output
        .i2c_master_state (i2c_master_state), // output
        .shifter_state_1 (shifter_state_1), // output
        .shifter_state_2 (shifter_state_2),  // output
        .scan_clock_timer_state_1 (scan_clock_timer_state_1), // output
        .scan_clock_timer_state_2 (scan_clock_timer_state_2) // output
        );
    assign rf_gpi  [87:56] = bits_processed_chain_1; // 8F-8C
    assign rf_gpi [119:88] = sxr_length_chain_1; // 93-90
    assign rf_gpi [175:144] = bits_processed_chain_2; // 9A-97
    assign rf_gpi [207:176] = sxr_length_chain_2; 	// 9E-9B
    assign rf_gpi [135:120] = step_id;	// 95-94
	assign rf_gpi [143:136] = shifter_state_1; // 96
	assign rf_gpi [215:208] = shifter_state_2; // 9F
    // scanport bits TDI  EXP  MASK FAIL TRST TDO  TMS  TCK (required for tck step mode debugging)
    assign rf_gpi[319:312] = { ex_sp_tdi[1], ex_sp_exp[1], ex_sp_mask[1], ex_sp_fail[1], ex_sp_trst[1], ex_sp_tdo[1], ex_sp_tms[1], ex_sp_tck[1] };
    assign rf_gpi[327:320] = { ex_sp_tdi[2], ex_sp_exp[2], ex_sp_mask[2], ex_sp_fail[2], ex_sp_trst[2], ex_sp_tdo[2], ex_sp_tms[2], ex_sp_tck[2] };
	assign rf_gpi  [47:40] = executor_state;  //read from 89h
    // cpu monitors this byte on bus monitor digits 3/2 (middle)
	assign rf_gpi  [55:48] = {tap_state_2, tap_state_1}; // read from 8A
	assign rf_gpi [239:232] = {data_path[`path_width-1:0],mmu_state[`mmu_state_width-1:0]}; // read from A2h (high nibble holds path, low nibble holds mmu_state)
	// cpu monitors this byte on bus monitor digits 5/4 (on the left)
	assign rf_gpi [247:240] = command; // A4
    assign rf_gpi [39:32]	= ex_sp_fail; //88
    assign rf_gpi [255:248] = lcp_state;
    assign rf_gpi [263:256] = i2c_master_state;
    assign rf_gpi [335:328] = uart_debug;
	// DEBUG
//	reg error_executor, error_lcp, error_i2c;
//	reg path_ex_reads_ram;
//	assign DEBUG[0] = ~mem_clear; // blue LED on when mem clear
	always @* //posedge CLK_MASTER or negedge SYS_RESET_N)
         begin
            if (mem_clear)
                DEBUG[2] <= #`DEL 0; // debug blue LED on when RAM cleared
            else
                DEBUG[2] <= #`DEL 1;
            casex ({SYS_RESET_N, data_path, executor_state, lcp_state, i2c_master_state}) // synthesis parallel_case
                // GENERAL LED INIT
                    {1'b0, `path_width'hx, `executor_state_width'hx, `byte_width'hx, `byte_width'hx}:
                        begin
                            DEBUG[1]    <= #`DEL 1'b1; // yellow LED off
                            DEBUG[0]    <= #`DEL 1'b1; // green debug led off
                            CTRL_OUT_FAIL  <= #`DEL 1'b0;
                            CTRL_OUT_PASS  <= #`DEL 1'b0;
                        end
                // RED DEBUG LED
                // RED PANEL LED
                    {1'b1, `path_width'hx, EX_STATE_IDLE, `byte_width'hx, `byte_width'hx},
                    {1'b1, `path_width'hx, EX_STATE_TEST_FAIL_3, `byte_width'hx, `byte_width'hx}:
                        begin
                            DEBUG[0]    <= #`DEL 1'b1; // green debug led off
                            DEBUG[1]    <= #`DEL 1'b1; // yellow debug led off
                            CTRL_OUT_FAIL  <= #`DEL clk_slow; // slow flashing
                        end
                    {1'b1, `path_width'hx, EX_STATE_SET_START_ADR, `byte_width'hx, `byte_width'hx}:
                        begin
                            DEBUG[0]    <= #`DEL 1'b1; // green debug led off
                            DEBUG[1]    <= #`DEL 1'b0; // yellow LED on when test running
                            CTRL_OUT_FAIL  <= #`DEL 1'b0; // off
                            CTRL_OUT_PASS  <= #`DEL 1'b0; // off
                        end
                    {1'b1, `path_width'hx, EX_STATE_ERROR_COMPILER_2, `byte_width'hx, `byte_width'hx} ,
                    {1'b1, `path_width'hx, EX_STATE_ERROR_FRMT_2, `byte_width'hx, `byte_width'hx},
                    {1'b1, `path_width'hx, EX_STATE_ERROR_ACT_SCNPT_2, `byte_width'hx, `byte_width'hx},
                   // {1'b1, `path_width'hx, EX_STATE_ERROR_SXR_TYPE_2, `byte_width'hx, `byte_width'hx},
                    {1'b1, `path_width'hx, EX_STATE_ERROR_RD_SXR_SP_ID_2, `byte_width'hx, `byte_width'hx},
                    {1'b1, `path_width'hx, EX_STATE_TEST_ABORT_4, `byte_width'hx, `byte_width'hx}:
                        begin
                            DEBUG[0]    <= #`DEL ~clk_slow; // green slow flashing
                            DEBUG[1]    <= #`DEL 1'b1; // yellow debug led off
                            CTRL_OUT_FAIL  <= #`DEL clk_slow; // slow flashing
                        end
                    {1'b1, `path_width'hx, `executor_state_width'hx, LCP_STATE_ERROR_CMD, `byte_width'hx}:
                        begin
                            DEBUG[0]    <= #`DEL ~clk_medium; // green medium flashing
                            CTRL_OUT_FAIL  <= #`DEL clk_medium; // medium flashing
                        end
                    {1'b1, `path_width'hx, `executor_state_width'hx, LCP_STATE_ERROR_ARG1, `byte_width'hx}:
                        begin
                            DEBUG[0]    <= #`DEL ~clk_medium; // green medium flashing
                            CTRL_OUT_FAIL  <= #`DEL clk_medium; // medium flashing
                        end
                    {1'b1, `path_width'hx, `executor_state_width'hx, LCP_STATE_ERROR_ARG2, `byte_width'hx}:
                        begin
                            DEBUG[0]    <= #`DEL ~clk_medium; // green medium flashing
                            CTRL_OUT_FAIL  <= #`DEL clk_medium; // medium flashing
                        end
                    {1'b1, `path_width'hx, `executor_state_width'hx, `byte_width'hx, I2C_MASTER_STATE_ERROR}:
                        begin
                            DEBUG[0]    <= #`DEL ~clk_fast; // green fast flashing
                            CTRL_OUT_FAIL  <= #`DEL clk_fast; // fast flashing
                        end
                    {1'b1, `path_width'hx, EX_STATE_END_OF_TEST, `byte_width'hx, `byte_width'hx}:
                        begin
                            DEBUG[0]    <= #`DEL 1'b1; // green debug led off
                            DEBUG[1]    <= #`DEL 1'b1; // yellow debug led off
                            CTRL_OUT_FAIL  <= #`DEL 1'b0; // off
                            CTRL_OUT_PASS  <= #`DEL 1'b1; // on
                        end
                    default:
                        begin
                            DEBUG[0]    <= #`DEL 1'b1;
                            CTRL_OUT_FAIL  <= #`DEL 1'b0;
                            CTRL_OUT_PASS  <= #`DEL 1'b0;
                        end
                endcase
        end
endmodule