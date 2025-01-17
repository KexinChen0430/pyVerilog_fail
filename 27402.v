module `AUTOTB_TOP;
task read_token;
    input integer fp;
    output reg [199 : 0] token;
    reg [7:0] c;
    reg intoken;
    reg done;
    begin
        token = "";
        intoken = 0;
        done = 0;
        while (!done) begin
            c = $fgetc(fp);
            if (c == 8'hff) begin   // EOF
                done = 1;
            end
            else if (c == " " || c == "\011" || c == "\012" || c == "\015") begin   // blank
                if (intoken) begin
                    done = 1;
                end
            end
            else begin              // valid character
                intoken = 1;
                token = (token << 8) | c;
            end
        end
    end
endtask
task post_check;
    input integer fp1;
    input integer fp2;
    reg [199 : 0] token1;
    reg [199 : 0] token2;
    reg [199 : 0] golden;
    reg [199 : 0] result;
    integer ret;
    begin
        read_token(fp1, token1);
        read_token(fp2, token2);
        if (token1 != "[[[runtime]]]" || token2 != "[[[runtime]]]") begin // Illegal format
            $display("ERROR: Simulation using HLS TB failed.");
            $finish;
        end
        read_token(fp1, token1);
        read_token(fp2, token2);
        while (token1 != "[[[/runtime]]]" && token2 != "[[[/runtime]]]") begin
            if (token1 != "[[transaction]]" || token2 != "[[transaction]]") begin
                $display("ERROR: Simulation using HLS TB failed.");
	              $finish;
            end
            read_token(fp1, token1);  // skip transaction number
            read_token(fp2, token2);  // skip transaction number
	          read_token(fp1, token1);
	          read_token(fp2, token2);
            while(token1 != "[[/transaction]]" && token2 != "[[/transaction]]") begin
                ret = $sscanf(token1, "0x%x", golden);
	              if (ret != 1) begin
	                  $display("Failed to parse token!");
                    $display("ERROR: Simulation using HLS TB failed.");
	                  $finish;
	              end
                ret = $sscanf(token2, "0x%x", result);
	              if (ret != 1) begin
	                  $display("Failed to parse token!");
                    $display("ERROR: Simulation using HLS TB failed.");
	                  $finish;
	              end
                if(golden != result) begin
	                  $display("%x (expected) vs. %x (actual) - mismatch", golden, result);
                    $display("ERROR: Simulation using HLS TB failed.");
	                  $finish;
                end
	              read_token(fp1, token1);
	              read_token(fp2, token2);
            end
	          read_token(fp1, token1);
	          read_token(fp2, token2);
        end
    end
endtask
reg AESL_clock;
reg rst;
reg start;
reg ce;
reg continue;
wire AESL_start;
wire AESL_reset;
wire AESL_ce;
wire AESL_ready;
wire AESL_idle;
wire AESL_continue;
wire AESL_done;
reg AESL_done_delay = 0;
reg AESL_done_delay2 = 0;
reg AESL_ready_delay = 0;
wire ready;
wire ready_wire;
reg [31 : 0] AESL_mLatCnterIn [0 : `AUTOTB_TRANSACTION_NUM + 1];
reg [31 : 0] AESL_mLatCnterIn_addr;
reg [31 : 0] AESL_mLatCnterOut [0 : `AUTOTB_TRANSACTION_NUM + 1];
reg [31 : 0] AESL_mLatCnterOut_addr ;
reg [31 : 0] AESL_clk_counter ;
wire  s_axi_AXI_CTRL_AWVALID;
wire  s_axi_AXI_CTRL_AWREADY;
wire [5 : 0] s_axi_AXI_CTRL_AWADDR;
wire  s_axi_AXI_CTRL_WVALID;
wire  s_axi_AXI_CTRL_WREADY;
wire [31 : 0] s_axi_AXI_CTRL_WDATA;
wire [3 : 0] s_axi_AXI_CTRL_WSTRB;
wire  s_axi_AXI_CTRL_ARVALID;
wire  s_axi_AXI_CTRL_ARREADY;
wire [5 : 0] s_axi_AXI_CTRL_ARADDR;
wire  s_axi_AXI_CTRL_RVALID;
wire  s_axi_AXI_CTRL_RREADY;
wire [31 : 0] s_axi_AXI_CTRL_RDATA;
wire [1 : 0] s_axi_AXI_CTRL_RRESP;
wire  s_axi_AXI_CTRL_BVALID;
wire  s_axi_AXI_CTRL_BREADY;
wire [1 : 0] s_axi_AXI_CTRL_BRESP;
wire ap_clk;
wire ap_rst_n;
wire  interrupt;
integer done_cnt = 0;
integer AESL_ready_cnt = 0;
integer ready_cnt = 0;
reg ready_initial;
reg ready_initial_n;
reg ready_last_n;
reg ready_delay_last_n;
reg done_delay_last_n;
reg interface_done = 0;
wire AXI_CTRL_read_data_finish;
wire AXI_CTRL_write_data_finish;
wire AESL_slave_start;
wire AESL_slave_write_start_in;
wire AESL_slave_write_start_finish;
reg AESL_slave_ready;
wire AESL_slave_output_done;
reg ready_rise = 0;
reg start_rise = 0;
reg slave_start_status = 0;
reg slave_done_status = 0;
`AUTOTB_DUT `AUTOTB_DUT_INST(
.s_axi_AXI_CTRL_AWVALID(s_axi_AXI_CTRL_AWVALID),
.s_axi_AXI_CTRL_AWREADY(s_axi_AXI_CTRL_AWREADY),
.s_axi_AXI_CTRL_AWADDR(s_axi_AXI_CTRL_AWADDR),
.s_axi_AXI_CTRL_WVALID(s_axi_AXI_CTRL_WVALID),
.s_axi_AXI_CTRL_WREADY(s_axi_AXI_CTRL_WREADY),
.s_axi_AXI_CTRL_WDATA(s_axi_AXI_CTRL_WDATA),
.s_axi_AXI_CTRL_WSTRB(s_axi_AXI_CTRL_WSTRB),
.s_axi_AXI_CTRL_ARVALID(s_axi_AXI_CTRL_ARVALID),
.s_axi_AXI_CTRL_ARREADY(s_axi_AXI_CTRL_ARREADY),
.s_axi_AXI_CTRL_ARADDR(s_axi_AXI_CTRL_ARADDR),
.s_axi_AXI_CTRL_RVALID(s_axi_AXI_CTRL_RVALID),
.s_axi_AXI_CTRL_RREADY(s_axi_AXI_CTRL_RREADY),
.s_axi_AXI_CTRL_RDATA(s_axi_AXI_CTRL_RDATA),
.s_axi_AXI_CTRL_RRESP(s_axi_AXI_CTRL_RRESP),
.s_axi_AXI_CTRL_BVALID(s_axi_AXI_CTRL_BVALID),
.s_axi_AXI_CTRL_BREADY(s_axi_AXI_CTRL_BREADY),
.s_axi_AXI_CTRL_BRESP(s_axi_AXI_CTRL_BRESP),
.ap_clk(ap_clk),
.ap_rst_n(ap_rst_n),
.interrupt(interrupt)
);
// Assignment for control signal
  assign ap_clk = AESL_clock;
  assign ap_rst_n = AESL_reset;
  assign ap_rst_n_n = ~AESL_reset;
  assign AESL_reset = rst;
  assign AESL_start = start;
  assign AESL_ce = ce;
  assign AESL_continue = continue;
  assign AESL_slave_write_start_in = slave_start_status  & AXI_CTRL_write_data_finish;
  assign AESL_slave_start = AESL_slave_write_start_finish;
  assign AESL_done = slave_done_status  & AXI_CTRL_read_data_finish;
always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
    begin
        slave_start_status <= 1;
    end
    else begin
        if (AESL_start == 1 ) begin
            start_rise = 1;
        end
        if (start_rise == 1 && AESL_done == 1 ) begin
            slave_start_status <= 1;
        end
        if (AESL_slave_write_start_in == 1) begin
            slave_start_status <= 0;
            start_rise = 0;
        end
    end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
    begin
        AESL_slave_ready <= 0;
        ready_rise = 0;
    end
    else begin
        if (AESL_ready == 1 ) begin
            ready_rise = 1;
        end
        if (ready_rise == 1 && AESL_done_delay == 1 ) begin
            AESL_slave_ready <= 1;
        end
        if (AESL_slave_ready == 1) begin
            AESL_slave_ready <= 0;
            ready_rise = 0;
        end
    end
end
always @ (posedge AESL_clock)
begin
    if (AESL_done == 1) begin
        slave_done_status <= 0;
    end
    else if (AESL_slave_output_done == 1 ) begin
        slave_done_status <= 1;
    end
end
AESL_axi_slave_AXI_CTRL AESL_AXI_SLAVE_AXI_CTRL(
    .clk   (AESL_clock),
    .reset (AESL_reset),
    .TRAN_s_axi_AXI_CTRL_AWADDR (s_axi_AXI_CTRL_AWADDR),
    .TRAN_s_axi_AXI_CTRL_AWVALID (s_axi_AXI_CTRL_AWVALID),
    .TRAN_s_axi_AXI_CTRL_AWREADY (s_axi_AXI_CTRL_AWREADY),
    .TRAN_s_axi_AXI_CTRL_WVALID (s_axi_AXI_CTRL_WVALID),
    .TRAN_s_axi_AXI_CTRL_WREADY (s_axi_AXI_CTRL_WREADY),
    .TRAN_s_axi_AXI_CTRL_WDATA (s_axi_AXI_CTRL_WDATA),
    .TRAN_s_axi_AXI_CTRL_WSTRB (s_axi_AXI_CTRL_WSTRB),
    .TRAN_s_axi_AXI_CTRL_ARADDR (s_axi_AXI_CTRL_ARADDR),
    .TRAN_s_axi_AXI_CTRL_ARVALID (s_axi_AXI_CTRL_ARVALID),
    .TRAN_s_axi_AXI_CTRL_ARREADY (s_axi_AXI_CTRL_ARREADY),
    .TRAN_s_axi_AXI_CTRL_RVALID (s_axi_AXI_CTRL_RVALID),
    .TRAN_s_axi_AXI_CTRL_RREADY (s_axi_AXI_CTRL_RREADY),
    .TRAN_s_axi_AXI_CTRL_RDATA (s_axi_AXI_CTRL_RDATA),
    .TRAN_s_axi_AXI_CTRL_RRESP (s_axi_AXI_CTRL_RRESP),
    .TRAN_s_axi_AXI_CTRL_BVALID (s_axi_AXI_CTRL_BVALID),
    .TRAN_s_axi_AXI_CTRL_BREADY (s_axi_AXI_CTRL_BREADY),
    .TRAN_s_axi_AXI_CTRL_BRESP (s_axi_AXI_CTRL_BRESP),
    .TRAN_AXI_CTRL_read_data_finish(AXI_CTRL_read_data_finish),
    .TRAN_AXI_CTRL_write_data_finish(AXI_CTRL_write_data_finish),
    .TRAN_AXI_CTRL_ready_out (AESL_ready),
    .TRAN_AXI_CTRL_ready_in (AESL_slave_ready),
    .TRAN_AXI_CTRL_done_out (AESL_slave_output_done),
    .TRAN_AXI_CTRL_idle_out (AESL_idle),
    .TRAN_AXI_CTRL_write_start_in     (AESL_slave_write_start_in),
    .TRAN_AXI_CTRL_write_start_finish (AESL_slave_write_start_finish),
    .TRAN_AXI_CTRL_transaction_done_in (AESL_done_delay),
    .TRAN_AXI_CTRL_interrupt  (interrupt),
    .TRAN_AXI_CTRL_start_in  (AESL_slave_start)
);
initial begin : generate_AESL_ready_cnt_proc
    AESL_ready_cnt = 0;
    wait(AESL_reset === 1);
    while(AESL_ready_cnt != `AUTOTB_TRANSACTION_NUM) begin
        while(AESL_ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        AESL_ready_cnt = AESL_ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end
initial begin : generate_ready_cnt_proc
    ready_cnt = 0;
    wait(AESL_reset === 1);
    while(ready_cnt != `AUTOTB_TRANSACTION_NUM) begin
        while(ready !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        ready_cnt = ready_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
end
initial begin : generate_done_cnt_proc
    integer fp1;
    integer fp2;
    done_cnt = 0;
    wait(AESL_reset === 1);
    while(done_cnt != `AUTOTB_TRANSACTION_NUM) begin
        while(AESL_done !== 1) begin
            @(posedge AESL_clock);
            # 0.4;
        end
        @(negedge AESL_clock);
        done_cnt = done_cnt + 1;
        @(posedge AESL_clock);
        # 0.4;
    end
    @(posedge AESL_clock);
    # 0.4;
        $display("Simulation Passed.");
    $finish;
end
initial fork
    AESL_clock = 0;
    forever #(`AUTOTB_CLOCK_PERIOD/2) AESL_clock = ~AESL_clock;
join
initial begin : initial_process
    integer rand;
    rst = 0;
    # 100;
	  repeat(3) @(posedge AESL_clock);
    rst = 1;
end
initial begin : start_process
  integer rand;
  start = 0;
  ce = 1;
    wait(AESL_reset === 1);
  @(posedge AESL_clock);
  start <= 1;
  while(done_cnt != `AUTOTB_TRANSACTION_NUM) begin
      @(posedge AESL_clock);
  end
  start <= 0;
end
always @(AESL_done)
begin
    if(done_cnt < `AUTOTB_TRANSACTION_NUM - 1)
        continue = AESL_done;
    else
        continue = 0;
end
initial begin : ready_initial_process
    ready_initial = 0;
    wait (AESL_start === 1);
    ready_initial = 1;
    @(posedge AESL_clock);
    ready_initial = 0;
end
initial begin : ready_last_n_process
  ready_last_n = 1;
  wait(ready_cnt == `AUTOTB_TRANSACTION_NUM)
  @(posedge AESL_clock);
  ready_last_n <= 0;
end
assign ready = (ready_initial | AESL_done_delay);
always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      ready_delay_last_n = 0;
  else
      ready_delay_last_n <= ready_last_n;
end
assign ready_wire = (ready_initial | AESL_done_delay);
initial begin : done_delay_last_n_process
  done_delay_last_n = 1;
  while(done_cnt != `AUTOTB_TRANSACTION_NUM)
      @(posedge AESL_clock);
  # 0.1;
  done_delay_last_n = 0;
end
always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
  begin
      AESL_done_delay <= 0;
      AESL_done_delay2 <= 0;
  end
  else begin
      AESL_done_delay <= AESL_done & done_delay_last_n;
      AESL_done_delay2 <= AESL_done_delay;
  end
end
always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
      interface_done = 0;
  else begin
      # 0.01;
      if(ready === 1 && ready_cnt > 0 && ready_cnt < `AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else if(AESL_done_delay === 1 && done_cnt == `AUTOTB_TRANSACTION_NUM)
          interface_done = 1;
      else
          interface_done = 0;
  end
end
// Write "[[[runtime]]]" and "[[[/runtime]]]" for output-only transactor
initial begin : write_output_transactor_c_runtime_process
    integer fp;
    fp = $fopen(`AUTOTB_TVOUT_c_out_wrapc, "w");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_c_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[runtime]]]");
    $fclose(fp);
    wait(done_cnt == `AUTOTB_TRANSACTION_NUM)
	  repeat(2) @(posedge AESL_clock);
    # 0.2;
    fp = $fopen(`AUTOTB_TVOUT_c_out_wrapc, "a");
    if(fp == 0) begin       // Failed to open file
        $display("Failed to open file \"%s\"!", `AUTOTB_TVOUT_c_out_wrapc);
        $display("ERROR: Simulation using HLS TB failed.");
        $finish;
    end
    $fdisplay(fp,"[[[/runtime]]]");
    $fclose(fp);
end
always @(posedge AESL_clock)
begin
    if(AESL_reset === 0)
    begin
        AESL_clk_counter <= 0;
    end
    else begin
        AESL_clk_counter = AESL_clk_counter + 1;
    end
end
always @ (posedge AESL_clock or negedge AESL_reset) begin
    if(AESL_reset === 0)
    begin
        AESL_mLatCnterOut_addr = 0;
        AESL_mLatCnterOut[AESL_mLatCnterOut_addr] = AESL_clk_counter + 1;
    end
    else if (AESL_done && AESL_mLatCnterOut_addr < `AUTOTB_TRANSACTION_NUM + 1) begin
        AESL_mLatCnterOut[AESL_mLatCnterOut_addr] = AESL_clk_counter;
        AESL_mLatCnterOut_addr = AESL_mLatCnterOut_addr + 1;
    end
end
always @ (posedge AESL_clock or negedge AESL_reset) begin
    if(AESL_reset === 0)
    begin
        AESL_mLatCnterIn_addr = 0;
    end
    else if (AESL_slave_write_start_finish && AESL_mLatCnterIn_addr < `AUTOTB_TRANSACTION_NUM + 1) begin
        AESL_mLatCnterIn[AESL_mLatCnterIn_addr] = AESL_clk_counter;
        AESL_mLatCnterIn_addr = AESL_mLatCnterIn_addr + 1;
    end
end
initial begin : performance_check
    integer transaction_counter;
    integer i;
    integer fp;
    integer latthistime;
    integer lattotal;
    integer latmax;
    integer latmin;
    integer thrthistime;
    integer thrtotal;
    integer thrmax;
    integer thrmin;
    integer lataver;
    integer thraver;
    reg [31 : 0] lat_array [0 : `AUTOTB_TRANSACTION_NUM];
    reg [31 : 0] thr_array [0 : `AUTOTB_TRANSACTION_NUM];
    i = 0;
    lattotal = 0;
    latmax = 0;
    latmin = 32'h 7fffffff;
    lataver = 0;
    thrtotal = 0;
    thrmax = 0;
    thrmin = 32'h 7fffffff;
    thraver = 0;
    @(negedge AESL_clock);
    @(posedge AESL_reset);
    while (done_cnt != `AUTOTB_TRANSACTION_NUM) begin
            @(posedge AESL_clock);
    end
    #0.001
        latmax  = 0;
        latmin  = 0;
        lataver = 0;
        thrmax  = 0;
        thrmin  = 0;
        thraver = 0;
	fp = $fopen(`AUTOTB_LAT_RESULT_FILE, "w");
	$fdisplay(fp, "$MAX_LATENCY = \"%0d\"", latmax);
	$fdisplay(fp, "$MIN_LATENCY = \"%0d\"", latmin);
	$fdisplay(fp, "$AVER_LATENCY = \"%0d\"", lataver);
	$fdisplay(fp, "$MAX_THROUGHPUT = \"%0d\"", latmax);
	$fdisplay(fp, "$MIN_THROUGHPUT = \"%0d\"", latmin);
	$fdisplay(fp, "$AVER_THROUGHPUT = \"%0d\"", lataver);
	$fclose(fp);
	  fp = $fopen(`AUTOTB_PER_RESULT_TRANS_FILE, "w");
    $fdisplay (fp,"%20s%16s%16s","","latency","interval");
    for (i = 0; i < AESL_mLatCnterOut_addr; i = i + 1) begin
        $fdisplay (fp,"transaction%8d:            0            0",i );
    end
	$fclose(fp);
end
endmodule