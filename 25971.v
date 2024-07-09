module control
    reg enable   = 1;
    reg debug    = 1;
    reg throttle = 0;
    reg [31:0] throttlewidth = 10;
    reg [31:0] throttlewait  = 5;
    // container for read data
    reg [datawidth-1:0] read_data_t  = 0;
    reg [datawidth-1:0] write_data_t = 0;
    reg [addrwidth-1:0] read_addr_t  = 0;
    reg [addrwidth-1:0] write_addr_t = 0;
    reg [1:0] bresp_t = 0;
    reg [1:0] rresp_t = 0;
    // variables for flow control
    integer throttle_data_cnt;
    integer throttle_wait_cnt;
    integer pending_wr_tx = 0;
    integer pending_rd_tx = 0;
    //transaction events
    event mst_write_req_evt;
    event mst_write_done_evt;
    event mst_read_req_evt;
    event mst_read_done_evt;
    event slv_write_rdy_evt;
    event slv_write_ack_evt;
    event slv_write_resp_evt;
    event slv_read_rdy_evt;
    event slv_read_resp_evt;
    //clock events
    event aclk_rise;
    event aclk_fall;
    event aresetn_rise;
    event aresetn_fall;
    always @(posedge aclk) if(aclken)    -> aclk_rise;
    always @(negedge aclk) if(aclken)    -> aclk_fall;
    always @(posedge aresetn) -> aresetn_rise;
    always @(negedge aresetn) -> aresetn_fall;
    always @(aclk_rise) if(awready && awvalid) -> slv_write_rdy_evt;
    always @(aclk_rise) if(wready  && wvalid)  -> slv_write_ack_evt;
    always @(aclk_rise) if(bready  && bvalid)  -> slv_write_resp_evt;
    always @(aclk_rise) if(arready && arvalid) -> slv_read_rdy_evt;
    always @(aclk_rise) if(rready  && rvalid)  -> slv_read_resp_evt;
    always @(mst_write_req_evt)
    begin
	if(drive_edge == "fall") @aclk_fall;
	pending_wr_tx = 1;
	awaddr_d0  = write_addr_t;
	awvalid_d0 = 1;
        wdata_d0   = write_data_t;
	wvalid_d0  = 1;
    end
    always @(slv_write_rdy_evt)
    begin
	if(drive_edge == "fall") @aclk_fall;
	awaddr_d0  = 0;
        awvalid_d0 = 0;
    end
    always @(slv_write_ack_evt)
    begin
	if(drive_edge == "fall") @aclk_fall;
	wdata_d0   = 0;
	wvalid_d0  = 0;
	bready_d0  = 1;
    end
    always @(slv_write_resp_evt)
    begin
	if(drive_edge == "fall") @aclk_fall;
        bresp_t = bresp;
	//IF NEEDED.
	//DO ERROR CHECKING HERE FOR RESPONSE
        -> mst_write_done_evt;
        pending_wr_tx = 0;
    end
    always @(mst_read_req_evt)
    begin
	if(drive_edge == "fall") @aclk_fall;
	pending_rd_tx = 1;
	araddr  = read_addr_t;
	arvalid_d0 = 1;
    end
    always @(slv_read_rdy_evt)
    begin
	if(drive_edge == "fall") @aclk_fall;
	araddr  = 0;
        arvalid_d0 = 0;
	rready_d0  = 1;
    end
    always @(slv_read_resp_evt)
    begin
	if(drive_edge == "fall") @aclk_fall;
	read_data_t = rdata;
        rresp_t = rresp;
	//IF NEEDED.
	//DO ERROR CHECKING HERE FOR RESPONSE
        -> mst_read_done_evt;
        pending_rd_tx = 0;
    end
    initial
    begin
        on;
	throttle_data_cnt = throttlewidth;
	throttle_wait_cnt = throttlewait;
	if((drive_edge != "rise")&&(drive_edge != "fall"))
	begin
	    $display("@%10t : [%s] \"%s\" is not a valid drive_edge parameter value ...", $time, module_id, drive_edge);
	    $finish;
	end
    end
  //=============//
  // USER TASKS  //
  //=============//
    task init_ports;
    begin
	//output port initialization
        awvalid_d0  = 0;
	awaddr_d0   = 0;
	awprot_d0   = 3'b010;
	wvalid_d0   = 0;
	wdata_d0    = 0;
	wstrb_d0    = 4'b1111;
	bready_d0   = 1;
	arvalid_d0  = 0;
	araddr   = 0;
	arprot_d0   = 3'b010;
	rready_d0   = 1;
    end
    endtask
    task init_vars;
    begin
       read_data_t  = 0;
       read_addr_t  = 0;
       write_data_t = 0;
       write_addr_t = 0;
       pending_wr_tx     = 0;
       pending_rd_tx     = 0;
       throttle_data_cnt = 0;
       throttle_wait_cnt = 0;
    end
    endtask
    task on;
    begin
        enable = 1;
	init_ports;
        init_vars;
	$display("@%10t : [%s] Enabled.", $time, module_id);
    end
    endtask
    task off;
    begin
	enable = 0;
	init_ports;
	$display("@%10t : [%s] Disabled.", $time, module_id);
    end
    endtask
    task debug_on;
    begin
	debug = 1;
    end
    endtask
    task debug_off;
    begin
        debug = 0;
    end
    endtask
    task throttle_on;
    begin
	if(debug)
	begin
             $display("@%10t : [%s] Data Throttle Turned ON", $time, module_id);
	end
	throttle = 1;
	throttle_data_cnt = throttlewidth;
	throttle_wait_cnt = throttlewait;
    end
    endtask
    task throttle_off;
    begin
	if(debug)
	begin
             $display("@%10t : [%s] Data Throttle Turned OFF", $time, module_id);
	end
	throttle = 0;
    end
    endtask
    task set_throttle_valid;
    input [31:0] width;
    begin
	if(debug)
	begin
	    $display("@%10t : [%s] Data Throttle Width set to %d", $time, module_id, width);
	end
	throttlewidth  = width;
	throttle_data_cnt = width;
    end
    endtask
    task set_throttle_wait;
    input [31:0] width;
    begin
	if(debug)
	begin
	    $display("@%10t : [%s] Data Throttle Wait  set to %d", $time, module_id, width);
	end
	throttlewait  = width;
	throttle_wait_cnt = width;
    end
    endtask
    //=================================//
    // TASK TO ISSUE WRITE TRANSACTION //
    //=================================//
    task wr;
    input [addrwidth-1:0] useraddr;
    input [datawidth-1:0] userdata;
    begin
	if(enable)
	begin
	    if(debug)  $display("@%10t : [%s] Write Start [ADDR = %8x , DATA = %8x]", $time, module_id, useraddr, userdata);
	    wait(pending_wr_tx == 0);
	    write_addr_t = useraddr;
	    write_data_t = userdata;
	    @(aclk_rise);
	    -> mst_write_req_evt;
	    @(mst_write_done_evt);
	    if(debug)  $display("@%10t : [%s] Write Done  [ADDR = %8x , DATA = %8x]", $time, module_id, useraddr, userdata);
	end
        else
	begin
            if(debug) $display("@%10t : [%s] Module disabled. Write Transaction NOT done. ", $time, module_id);
	end
    end
    endtask
    task wr_get_resp;
    input  [addrwidth-1:0] useraddr;
    input [datawidth-1:0] userdata;
    output [1:0] userrsp;
    begin
        wr(useraddr, userdata);
	userrsp = bresp_t;
    end
    endtask
    //=================================//
    // TASK TO ISSUE READ TRANSACTION  //
    //=================================//
    task rd;
    input  [addrwidth-1:0] useraddr;
    output [datawidth-1:0] userdata;
    begin
	if(enable)
	begin
	    if(debug)  $display("@%10t : [%s] Read Start [ADDR = %8x]", $time, module_id, useraddr);
	    wait(pending_rd_tx == 0);
	    read_addr_t = useraddr;
	    @(aclk_rise);
	    -> mst_read_req_evt;
	    @(mst_read_done_evt);
            userdata = read_data_t;
	    if(debug)  $display("@%10t : [%s] Read Done  [ADDR = %8x, DATA = %8x]", $time, module_id, useraddr, userdata);
        end
        else
	begin
            if(debug) $display("@%10t : [%s] Module disabled. Read Transaction NOT done. ", $time, module_id);
	end
    end
    endtask
    task rd_get_resp;
    input  [addrwidth-1:0] useraddr;
    output [datawidth-1:0] userdata;
    output [1:0] userrsp;
    begin
        rd(useraddr, userdata);
	userrsp = rresp_t;
    end
    endtask
  //=================//
  // RESET DETECTION //
  //=================//
    always @(aresetn_fall)
    begin
      //aresetn assertion//
      if(debug == 1)
      begin
	  $display("@%10t : [%s] RESET asserted...", $time, module_id);
      end
      off;
          -> mst_read_done_evt;
          -> mst_write_done_evt;
	  pending_rd_tx = 0;
	  pending_wr_tx = 0;
      @aresetn_rise;
      if(debug == 1)
      begin
	  $display("@%10t : [%s] RESET deasserted...", $time, module_id);
      end
      on;
    end
  endmodule