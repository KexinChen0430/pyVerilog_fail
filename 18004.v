module avalon_fast_model
  (
	local_address,
	local_write_req,
	local_read_req,
	local_wdata,
	local_be,
	local_size,
	global_reset_n,
	pll_ref_clk,
	soft_reset_n,
	local_ready,
	local_rdata,
	local_rdata_valid,
        local_burstbegin,
	reset_request_n,
	mem_odt,
	mem_cs_n,
	mem_cke,
	mem_addr,
	mem_ba,
	mem_ras_n,
	mem_cas_n,
	mem_we_n,
	mem_dm,
	local_refresh_ack,
	local_wdata_req,
	local_init_done,
	reset_phy_clk_n,
   mem_reset_n,
   dll_reference_clk,
   dqs_delay_ctrl_export,
	phy_clk,
	aux_full_rate_clk,
	aux_half_rate_clk,
	mem_clk,
	mem_clk_n,
	mem_dq,
	mem_dqs,
	mem_dqsn);
	input		pll_ref_clk;
	input		global_reset_n;
	input	[23:0]	local_address;
	input		local_write_req;
        input           local_burstbegin;
	input		local_read_req;
	input	[127:0]	local_wdata;
	input	[15:0]	local_be;
	input	[4:0]	local_size;
	input		soft_reset_n;
	output		local_ready;
	output	[127:0]	local_rdata;
	output		local_rdata_valid;
	output		reset_request_n;
	output		local_refresh_ack;
	output		local_wdata_req;
	output		local_init_done;
        //Unused in this model
	output		phy_clk;
	output		aux_full_rate_clk;
	output		aux_half_rate_clk;
	output		reset_phy_clk_n;
	output		mem_reset_n;
	output		dll_reference_clk;
	output	[5:0]	dqs_delay_ctrl_export;
	output	[0:0]	mem_odt;
	output	[0:0]	mem_cs_n;
	output	[0:0]	mem_cke;
	output	[12:0]	mem_addr;
	output	[2:0]	mem_ba;
	output		mem_ras_n;
	output		mem_cas_n;
	output		mem_we_n;
	output	[3:0]	mem_dm;
	inout	     	mem_clk;
	inout	     	mem_clk_n;
	inout	[31:0]	mem_dq;
	inout	[3:0]	mem_dqs;
	inout	[3:0]	mem_dqsn;
	`define B0  [7:0]
	`define B1  [15:8]
	`define B2  [23:16]
	`define B3  [31:24]
	`define B4  [39:32]
	`define B5  [47:40]
	`define B6  [55:48]
	`define B7  [63:56]
	`define B8  [71:64]
	`define B9  [79:72]
	`define B10 [87:80]
	`define B11 [95:88]
	`define B12 [103:96]
	`define B13 [111:104]
	`define B14 [119:112]
	`define B15 [127:120]
  // Wires.
  logic         clk;
  assign        clk   =   pll_ref_clk;
  logic		phy_clk;
  assign        phy_clk = aux_half_rate_clk;
  logic         reset_phy_clk_n;
//assign        reset_phy_clk_n = 1'b1;
  logic		aux_full_rate_clk;
  assign        aux_full_rate_clk = clk;
  wire [0:0]		mem_clk;
  assign        mem_clk = clk;
  wire [0:0]		mem_clk_n;
  assign        mem_clk_n = !clk;
  logic         reset;
  assign        reset = !global_reset_n;
  // Registers.
//logic [31:13] pxa_to_dsp1_ipc_map;
  logic		aux_half_rate_clk;
  logic		local_ready;
  logic	[127:0]	local_rdata;
  logic		local_rdata_valid;
  logic		reset_request_n;
  logic		local_refresh_ack;
  logic		local_wdata_req;
  logic         local_wdata_req_q1;
  logic		local_init_done;
  logic [15:0]	local_be_q0;
  logic [15:0]	local_be_q1;
  logic [127:0]	local_wdata_q0;
  logic [127:0]	local_wdata_q1;
  logic         local_burstbegin_q0;
  logic         local_burstbegin_q1;
  logic	[127:0]	local_rdata_d;
  logic	[127:0]	buf_data;
  logic		local_rdata_valid_d;
  logic	[23:0]	local_address_q0;
  logic	[23:0]	local_address_q1;
  logic	[5:0]	local_size_q0;
  logic	[5:0]	local_size_q1;
  logic		local_read_req_q0;
  logic [23:0]  addr, current_addr;
//logic [127:0] mem[MEM_SIZE];
  // Memory Banks
  `ifdef FAST_MEM_FULL
    // logic [127:0] mem[0:MEM_SIZE];
    logic [7:0] mem[0 : (1<<full_mem_bits)-1];
  `else
      logic [127:0] mem[0 : (1<<part_mem_bits)-1];
      reg   [127:                0] mem_array  [0 : (1<<part_mem_bits)-1];
      reg   [full_mem_bits - 1 : 0] addr_array [0 : (1<<part_mem_bits)-1];
      reg   [part_mem_bits     : 0] mem_used;
      reg   [part_mem_bits     : 0] memory_index;
      initial mem_used = 0;
  `endif
  //Pipeline to delay rd data
  logic [127:0] pipe_rdat[READ_PIPE];
  logic         pipe_rval[READ_PIPE];
  integer       pipe_i;
  integer       byte_en;
  logic [  4:0] reset_counter;
  logic     [31:0]   pop_dat;
  logic              pop_dat_vld ;
  logic              afull;
  //66.5MHz
  //parameter HALF_PERIOD = 7.519ns;  //66.5MHx
  parameter HALF_PERIOD = 2.501ns;
  always begin
    #HALF_PERIOD aux_half_rate_clk = 0;
    #HALF_PERIOD aux_half_rate_clk = 1;
  end
  //Drive reset_phy_clk_n for 8 clks after reset
  always @(posedge clk) begin
    if (reset) begin
      reset_phy_clk_n   <= 0;
      reset_counter     <= 0;
    end
    else begin
      if (reset_counter<8)
        reset_counter   <= reset_counter + 1;
      reset_phy_clk_n <= reset_counter[3];
    end
  end
  always @(posedge phy_clk) begin
    if (reset) begin
      for (pipe_i=0; pipe_i<READ_PIPE; pipe_i++) begin
        pipe_rdat[pipe_i]    <= 128'b0;
        pipe_rval[pipe_i]    <= 1'b0;
      end
    end
    else begin
      for (pipe_i=0; pipe_i<READ_PIPE-1; pipe_i++) begin
        pipe_rdat[pipe_i]    <= pipe_rdat[pipe_i+1]    ;
        pipe_rval[pipe_i]    <= pipe_rval[pipe_i+1]    ;
      end
        pipe_rdat[READ_DELAY]<= local_rdata_d      ;
        pipe_rval[READ_DELAY]<= local_rdata_valid_d;
    end
  end
  always @(posedge phy_clk) begin
    if (reset) begin
      local_ready            <= 1'b0              ;
      local_init_done        <= 1'b0              ;
      local_refresh_ack      <= 1'b0              ;
    end
    else begin
    //local_ready            <= (local_burstbegin && local_read_req)? 1'b0 : 1'b1;
      local_ready            <= ~afull;
      local_init_done        <= 1'b1              ;
      local_refresh_ack      <= 1'b0              ;
      local_address_q1       <= local_address_q0  ;
      local_address_q0       <= local_address     ;
      local_size_q1          <= local_size_q0  ;
      local_size_q0          <= {1'b0, local_size}     ;
      local_read_req_q0      <= local_read_req    ;
      local_rdata            <= pipe_rdat[  0   ] ;
      local_rdata_valid      <= pipe_rval[  0   ] ;
      local_wdata_req_q1     <= local_wdata_req;
      local_wdata_req        <= local_write_req   ;
      local_be_q1            <= local_be_q0;
      local_be_q0            <= local_be;
      local_wdata_q1         <= local_wdata_q0;
      local_wdata_q0         <= local_wdata;
      local_burstbegin_q1    <= local_burstbegin_q0;
      local_burstbegin_q0    <= local_burstbegin   ;
    end
  end
  assign addr = (local_burstbegin_q1?local_address_q1:local_address_q1+ADDR_INCR);
  // Write First Data.
  always @(posedge phy_clk) begin
    if (local_wdata_req_q1 && local_burstbegin_q1) begin
      current_addr <= addr + 1;
      `INFO("%t: DDR_CTRL wr: addr %0h \t data %0h mask %0h", $time,       addr      , local_wdata_q1, local_be_q1);
      write_mem(addr, local_be_q1, local_wdata_q1);
    end
    // Write any remaining data.
    else if (local_wdata_req_q1) begin
      current_addr <= current_addr + 1;
      `INFO("%t: DDR_CTRL wr: addr %0h \t data %0h mask %0h", $time,       current_addr      , local_wdata_q1, local_be_q1);
      write_mem(current_addr, local_be_q1, local_wdata_q1);
    end
  end
  // always_comb begin, Aldec has a problem with this.
  always @* begin
    local_rdata_valid_d = pop_dat_vld;
    if (pop_dat_vld) begin
      read_mem(pop_dat, local_rdata_d);
          `INFO("%t: DDR_CTRL rd: addr %0h \t data %0h", $time, pop_dat , local_rdata_d);
    end
  end
    // Write Memory
    task write_mem;
        input [full_mem_bits - 1 : 0] addr;
        input     [15            : 0] be;
        input     [127           : 0] data;
        reg       [part_mem_bits : 0] i;
        begin
	 @(negedge phy_clk) begin
            if(be[15]) mem[{addr, 4'd15}] = data`B15;
            if(be[14]) mem[{addr, 4'd14}] = data`B14;
            if(be[13]) mem[{addr, 4'd13}] = data`B13;
            if(be[12]) mem[{addr, 4'd12}] = data`B12;
            if(be[11]) mem[{addr, 4'd11}] = data`B11;
            if(be[10]) mem[{addr, 4'd10}] = data`B10;
            if(be[9])  mem[{addr, 4'd9 }] = data`B9;
            if(be[8])  mem[{addr, 4'd8 }] = data`B8;
            if(be[7])  mem[{addr, 4'd7 }] = data`B7;
            if(be[6])  mem[{addr, 4'd6 }] = data`B6;
            if(be[5])  mem[{addr, 4'd5 }] = data`B5;
            if(be[4])  mem[{addr, 4'd4 }] = data`B4;
            if(be[3])  mem[{addr, 4'd3 }] = data`B3;
            if(be[2])  mem[{addr, 4'd2 }] = data`B2;
            if(be[1])  mem[{addr, 4'd1 }] = data`B1;
            if(be[0])  mem[{addr, 4'd0 }] = data`B0;
    end
        end
    endtask
    // Read Memory
    task read_mem;
        input [full_mem_bits - 1 : 0] addr;
        output    [127           : 0] data;
        reg       [part_mem_bits : 0] i;
        begin
`ifdef FAST_MEM_FULL
            data`B15 = mem[{addr, 4'd15}];
            data`B14 = mem[{addr, 4'd14}];
            data`B13 = mem[{addr, 4'd13}];
            data`B12 = mem[{addr, 4'd12}];
            data`B11 = mem[{addr, 4'd11}];
            data`B10 = mem[{addr, 4'd10}];
            data`B9  = mem[{addr, 4'd9 }];
            data`B8  = mem[{addr, 4'd8 }];
            data`B7  = mem[{addr, 4'd7 }];
            data`B6  = mem[{addr, 4'd6 }];
            data`B5  = mem[{addr, 4'd5 }];
            data`B4  = mem[{addr, 4'd4 }];
            data`B3  = mem[{addr, 4'd3 }];
            data`B2  = mem[{addr, 4'd2 }];
            data`B1  = mem[{addr, 4'd1 }];
            data`B0  = mem[{addr, 4'd0 }];
`else
            begin : loop
                for (i = 0; i < mem_used; i = i + 1) begin
                    if (addr_array[i] === addr) begin
                        disable loop;
                    end
                end
            end
            if (i <= mem_used) begin
                data = mem_array[i];
            end else begin
                data = 'bx;
            end
`endif
        end
    endtask
   sync_fifo  u_sync_fifo(
    .push        (local_read_req_q0 && local_burstbegin_q0),
    .burst       (local_burstbegin_q0),
    .burst_count (local_size_q0),
    .push_dat    (local_address_q0),
    .pop         (1'b1),
    .pop_dat     (pop_dat),
    .pop_dat_vld (pop_dat_vld),
    .full        (),
    .afull       (afull),
    .empty       (),
    .clk         (phy_clk),
    .reset       (reset)
   );
endmodule