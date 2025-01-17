module for xilinx hardware simulations
// ======================================
`ifdef XILINX_FPGA
    `define GLBL
    glbl glbl();
`endif
// ======================================
// Clock and Reset
// ======================================
// 200 MHz clock
initial
    begin
    clk_200mhz = 1'd0;
    // Time unit is pico-seconds
    forever #2500 clk_200mhz = ~clk_200mhz;
    end
`ifdef XILINX_VIRTEX6_FPGA
// 400 MHz clock
initial
    begin
    clk_533mhz = 1'd0;
    // Time unit is pico-seconds
    forever #938 clk_533mhz = ~clk_533mhz;
    end
`endif
// 25 MHz clock
initial
    begin
    clk_25mhz = 1'd0;
    forever #20000 clk_25mhz = ~clk_25mhz;
    end
initial
    begin
    sysrst = 1'd1;
    #40000
    sysrst = 1'd0;
    end
// ======================================
// Counter of system clock ticks
// ======================================
always @ ( posedge `U_SYSTEM.sys_clk )
    clk_count <= clk_count + 1'd1;
// ======================================
// Initialize Boot Memory
// ======================================
    initial
        begin
`ifndef XILINX_FPGA
        $display("Load boot memory from %s", `BOOT_MEM_FILE);
        boot_mem_line_count   = 0;
        boot_mem_file         = $fopen(`BOOT_MEM_FILE,    "r");
        if (boot_mem_file == 0)
            begin
            `TB_ERROR_MESSAGE
            $display("ERROR: Can't open input file %s", `BOOT_MEM_FILE);
            end
        if (boot_mem_file != 0)
            begin
            fgets_return = 1;
            while (fgets_return != 0)
                begin
                fgets_return        = $fgets(line, boot_mem_file);
                boot_mem_line_count = boot_mem_line_count + 1;
                aligned_line        = align_line(line);
                // if the line does not start with a comment
                if (aligned_line[120*8-1:118*8] != 16'h2f2f)
                    begin
                    // check that line doesnt start with a '@' or a blank
                    if (aligned_line[120*8-1:119*8] != 8'h40 && aligned_line[120*8-1:119*8] != 8'h00)
                        begin
                        $display("Format ERROR in input file %s, line %1d. Line must start with a @, not %08x",
                                 `BOOT_MEM_FILE, boot_mem_line_count, aligned_line[118*8-1:117*8]);
                        `TB_ERROR_MESSAGE
                        end
                    if (aligned_line[120*8-1:119*8] != 8'h00)
                        begin
                        boot_mem_file_address  =   hex_chars_to_32bits (aligned_line[119*8-1:111*8]);
                        boot_mem_file_data     =   hex_chars_to_32bits (aligned_line[110*8-1:102*8]);
                        `ifdef AMBER_A25_CORE
                            boot_mem_file_data_128 = `U_BOOT_MEM.u_mem.mem[boot_mem_file_address[BOOT_MSB:4]];
                            `U_BOOT_MEM.u_mem.mem[boot_mem_file_address[BOOT_MSB:4]] =
                                    insert_32_into_128 ( boot_mem_file_address[3:2],
                                                         boot_mem_file_data_128,
                                                         boot_mem_file_data );
                        `else
                            `U_BOOT_MEM.u_mem.mem[boot_mem_file_address[BOOT_MSB:2]] = boot_mem_file_data;
                        `endif
                        `ifdef AMBER_LOAD_MEM_DEBUG
                            $display ("Load Boot Mem: PAddr: 0x%08x, Data 0x%08x",
                                        boot_mem_file_address, boot_mem_file_data);
                        `endif
                        end
                    end
                end
            $display("Read in %1d lines", boot_mem_line_count);
            end
`endif
        // Grab the test name from memory
        timeout   = `AMBER_TIMEOUT   ;
        $display("log file %s, timeout %0d, test name %0s ", `AMBER_LOG_FILE, timeout, `AMBER_TEST_NAME );
        log_file = $fopen(`AMBER_LOG_FILE, "a");
        end
// ======================================
// Initialize Main Memory
// ======================================
`ifdef AMBER_LOAD_MAIN_MEM
    initial
        begin
        $display("Load main memory from %s", `MAIN_MEM_FILE);
        `ifdef XILINX_FPGA
        // Wait for DDR3 initialization to complete
        $display("Wait for DDR3 initialization to complete before loading main memory");
        #70000000
        $display("Done waiting at %d ticks", `U_TB.clk_count);
        `endif
        main_mem_file   = $fopen(`MAIN_MEM_FILE, "r");
        // Read RAM File
        main_mem_line_count   = 0;
        if (main_mem_file == 0)
            begin
            $display("ERROR: Can't open input file %s", `MAIN_MEM_FILE);
            `TB_ERROR_MESSAGE
            end
        if (main_mem_file != 0)
            begin
            fgets_return = 1;
            while (fgets_return != 0)
                begin
                fgets_return        = $fgets(line, main_mem_file);
                main_mem_line_count = main_mem_line_count + 1;
                aligned_line        = align_line(line);
                // if the line does not start with a comment
                if (aligned_line[120*8-1:118*8] != 16'h2f2f)
                    begin
                    // check that line doesnt start with a '@' or a blank
                    if (aligned_line[120*8-1:119*8] != 8'h40 && aligned_line[120*8-1:119*8] != 8'h00)
                        begin
                        $display("Format ERROR in input file %s, line %1d. Line must start with a @, not %08x",
                                 `MAIN_MEM_FILE, main_mem_line_count, aligned_line[118*8-1:117*8]);
                        `TB_ERROR_MESSAGE
                        end
                    if (aligned_line[120*8-1:119*8] != 8'h00)
                        begin
                        main_mem_file_address =   hex_chars_to_32bits (aligned_line[119*8-1:111*8]);
                        main_mem_file_data    =   hex_chars_to_32bits (aligned_line[110*8-1:102*8]);
                        `ifdef XILINX_FPGA
                            mm_ddr3_addr = {main_mem_file_address[13:11], main_mem_file_address[26:14], main_mem_file_address[10:4]};
                            main_mem_file_data_128 = tb.u_ddr3_model.memory [mm_ddr3_addr];
                            tb.u_ddr3_model.memory [mm_ddr3_addr] =
                                    insert_32_into_128 ( main_mem_file_address[3:2],
                                                         main_mem_file_data_128,
                                                         main_mem_file_data );
                            `ifdef AMBER_LOAD_MEM_DEBUG
                                main_mem_file_data_128 = tb.u_ddr3_model.memory [mm_ddr3_addr];
                                $display ("Load DDR3: PAddr: 0x%08x, DDR3 Addr 0x%08h, Data 0x%032x",
                                          main_mem_file_address, mm_ddr3_addr, main_mem_file_data_128);
                            `endif
                        `else
                            // Fast simulation model of main memory
                            // U_RAM - Can either point to simple or Xilinx DDR3 model.
                            // Set in hierarchy_defines.v
                            main_mem_file_data_128 = `U_RAM [main_mem_file_address[31:4]];
                            `U_RAM [main_mem_file_address[31:4]] =
                                insert_32_into_128 ( main_mem_file_address[3:2],
                                                     main_mem_file_data_128,
                                                     main_mem_file_data );
                            //`U_ECC_MEM [main_mem_file_address[31:4]] = 0;
                            ecc_mem_file_ecc_32 = `U_ECC_MEM [main_mem_file_address[31:4]];
                            `U_ECC_MEM [main_mem_file_address[31:4]] =
                                insert_8_into_32 (main_mem_file_address[3:2],
                                                  ecc_mem_file_ecc_32,
                                                  ecc40_32(main_mem_file_data));
                            `ifdef AMBER_LOAD_MEM_DEBUG
                                if( `U_RAM[main_mem_file_address[31:4]][127] !== 1'bx ) begin
                                  $display ("Load RAM: PAddr: 0x%08x, Data 0x%08x",
                                           main_mem_file_address, `U_RAM [main_mem_file_address[31:4]]);
                                  $display ("Load ECC: PAddr: 0x%08x, Data 0x%08x",
                                           main_mem_file_address[31:4], `U_ECC_MEM [main_mem_file_address[31:4]]);
                                end
                            `endif
                        `endif
                        end
                    end
                end
            $display("Read in %1d lines", main_mem_line_count);
            end
        end
`endif
dumpvcd u_dumpvcd();
// ======================================
// Terminate Test
// ======================================
`ifdef AMBER_A25_CORE
    `include "a25_localparams.v"
    `include "a25_functions.v"
`else
    `include "a23_localparams.v"
    `include "a23_functions.v"
`endif
reg             testfail;
wire            test_status_set;
wire [31:0]     test_status_reg;
/* Add system status */
wire            system_status_set;
initial
    begin
    testfail  = 1'd0;
    end
assign test_status_set = `U_TEST_MODULE.test_status_set;
assign test_status_reg = `U_TEST_MODULE.test_status_reg;
assign system_status_set = `U_ARBITER.status_set;
always @*
        begin
        if ( system_status_set || test_status_set || testfail )
            begin
            if ( test_status_reg == 32'd17 && !testfail )
                begin
                display_registers;
                $display("++++++++++++++++++++");
                $write("Passed %s %0d ticks\n", `AMBER_TEST_NAME, `U_TB.clk_count);
                $display("++++++++++++++++++++");
                $fwrite(`U_TB.log_file,"Passed %s %0d ticks\n", `AMBER_TEST_NAME, `U_TB.clk_count);
                $finish;
                end
            else
                begin
                display_registers;
                if ( testfail )
                    begin
                    $display("++++++++++++++++++++");
                    $write("Failed %s\n", `AMBER_TEST_NAME);
                    $display("++++++++++++++++++++");
                    $fwrite(`U_TB.log_file,"Failed %s\n", `AMBER_TEST_NAME);
                    $finish;
                    end
                else
                  if( system_status_set )
                    begin
                    $display("++++++++++++++++++++");
                    $write("Failed %s - EDC has detected a memory error\n", `AMBER_TEST_NAME);
                    $display("++++++++++++++++++++");
                    $fwrite(`U_TB.log_file,"Failed %s - EDC has detected a memory error\n", `AMBER_TEST_NAME);
                    $finish;
                    end
                  else
                    begin
                    $display("++++++++++++++++++++");
                    if (test_status_reg >= 32'h8000)
                        $write("Failed %s - with error 0x%08x\n", `AMBER_TEST_NAME, test_status_reg);
                    else
                        $write("Failed %s - with error on line %1d\n", `AMBER_TEST_NAME, test_status_reg);
                    $display("++++++++++++++++++++");
                    if (test_status_reg >= 32'h8000)
                        $fwrite(`U_TB.log_file,"Failed %s - with error 0x%08h\n", `AMBER_TEST_NAME, test_status_reg);
                    else
                        $fwrite(`U_TB.log_file,"Failed %s - with error on line %1d\n", `AMBER_TEST_NAME, test_status_reg);
                    $finish;
                    end
                end
            end
        end
// ======================================
// Timeout
// ======================================
always @ ( posedge `U_SYSTEM.sys_clk )
    if ( timeout != 0 )
        if (`U_TB.clk_count >= timeout)
            begin
            `TB_ERROR_MESSAGE
            $display("Timeout Error. Edit $AMBER_BASE/hw/tests/timeouts.txt to change the timeout");
            end
// ======================================
// Tasks
// ======================================
task display_registers;
begin
    $display("");
    $display("----------------------------------------------------------------------------");
    $display("Amber Core");
    case (`U_EXECUTE.status_bits_mode)
        FIRQ:    $display("         User       > FIRQ         IRQ          SVC");
        IRQ:     $display("         User         FIRQ       > IRQ          SVC");
        SVC:     $display("         User         FIRQ         IRQ        > SVC");
        default: $display("       > User         FIRQ         IRQ          SVC");
    endcase
    $display("r0       0x%08x", `U_REGISTER_BANK.r0);
    $display("r1       0x%08x", `U_REGISTER_BANK.r1);
    $display("r2       0x%08x", `U_REGISTER_BANK.r2);
    $display("r3       0x%08x", `U_REGISTER_BANK.r3);
    $display("r4       0x%08x", `U_REGISTER_BANK.r4);
    $display("r5       0x%08x", `U_REGISTER_BANK.r5);
    $display("r6       0x%08x", `U_REGISTER_BANK.r6);
    $display("r7       0x%08x", `U_REGISTER_BANK.r7);
    $display("r8       0x%08x   0x%08x ", `U_REGISTER_BANK.r8,  `U_REGISTER_BANK.r8_firq);
    $display("r9       0x%08x   0x%08x ", `U_REGISTER_BANK.r9,  `U_REGISTER_BANK.r9_firq);
    $display("r10      0x%08x   0x%08x ", `U_REGISTER_BANK.r10, `U_REGISTER_BANK.r10_firq);
    $display("r11      0x%08x   0x%08x ", `U_REGISTER_BANK.r11, `U_REGISTER_BANK.r11_firq);
    $display("r12      0x%08x   0x%08x ", `U_REGISTER_BANK.r12, `U_REGISTER_BANK.r12_firq);
    $display("r13      0x%08x   0x%08x   0x%08x   0x%08x",
                                               `U_REGISTER_BANK.r13,
                                               `U_REGISTER_BANK.r13_firq,
                                               `U_REGISTER_BANK.r13_irq,
                                               `U_REGISTER_BANK.r13_svc);
    $display("r14 (lr) 0x%08x   0x%08x   0x%08x   0x%08x",
                                               `U_REGISTER_BANK.r14,
                                               `U_REGISTER_BANK.r14_firq,
                                               `U_REGISTER_BANK.r14_irq,
                                               `U_REGISTER_BANK.r14_svc);
    $display("r15 (pc) 0x%08x", {6'd0,`U_REGISTER_BANK.r15,2'd0});
    $display("");
    $display("Status Bits: N=%d, Z=%d, C=%d, V=%d, IRQ Mask %d, FIRQ Mask %d, Mode = %s",
       `U_EXECUTE.status_bits_flags[3],
       `U_EXECUTE.status_bits_flags[2],
       `U_EXECUTE.status_bits_flags[1],
       `U_EXECUTE.status_bits_flags[0],
       `U_EXECUTE.status_bits_irq_mask,
       `U_EXECUTE.status_bits_firq_mask,
       mode_name (`U_EXECUTE.status_bits_mode) );
    $display("----------------------------------------------------------------------------");
    $display("");
end
endtask
// ======================================
// Functions
// ======================================
function [127:0] insert_32_into_128;
input [1:0]   pos;
input [127:0] word128;
input [31:0]  word32;
begin
     case (pos)
         2'd0: insert_32_into_128 = {word128[127:32], word32};
         2'd1: insert_32_into_128 = {word128[127:64], word32, word128[31:0]};
         2'd2: insert_32_into_128 = {word128[127:96], word32, word128[63:0]};
         2'd3: insert_32_into_128 = {word32, word128[95:0]};
     endcase
end
endfunction
function [31:0] insert_8_into_32;
input [1:0]  pos;
input [31:0] word32;
input [7:0]  word8;
begin
     case (pos)
         2'd0: insert_8_into_32 = {word32[31:8], word8};
         2'd1: insert_8_into_32 = {word32[31:16], word8, word32[7:0]};
         2'd2: insert_8_into_32 = {word32[31:24], word8, word32[15:0]};
         2'd3: insert_8_into_32 = {word8, word32[23:0]};
     endcase
end
endfunction
function [7:0] ecc40_32;
  input [31:0] data;
begin
    ecc40_32[7] = ^ (data & 32'b10101010_10101010_11000000_11000000);
    ecc40_32[6] = ^ (data & 32'b01010101_01010101_00110000_00110000);
    ecc40_32[5] = ^ (data & 32'b11111111_00000000_00001100_00001100);
    ecc40_32[4] = ^ (data & 32'b00000000_11111111_00000011_00000011);
    ecc40_32[3] = ^ (data & 32'b11000000_11000000_11111111_00000000);
    ecc40_32[2] = ^ (data & 32'b00110000_00110000_00000000_11111111);
    ecc40_32[1] = ^ (data & 32'b00001100_00001100_10101010_10101010);
    ecc40_32[0] = ^ (data & 32'b00000011_00000011_01010101_01010101);
end
endfunction
endmodule