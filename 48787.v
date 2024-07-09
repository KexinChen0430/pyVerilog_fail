module system_0_clock_0 (
                          // inputs:
                           master_clk,
                           master_endofpacket,
                           master_readdata,
                           master_reset_n,
                           master_waitrequest,
                           slave_address,
                           slave_byteenable,
                           slave_clk,
                           slave_nativeaddress,
                           slave_read,
                           slave_reset_n,
                           slave_write,
                           slave_writedata,
                          // outputs:
                           master_address,
                           master_byteenable,
                           master_nativeaddress,
                           master_read,
                           master_write,
                           master_writedata,
                           slave_endofpacket,
                           slave_readdata,
                           slave_waitrequest
                        )
;
  output  [ 22: 0] master_address;
  output  [  1: 0] master_byteenable;
  output  [ 21: 0] master_nativeaddress;
  output           master_read;
  output           master_write;
  output  [ 15: 0] master_writedata;
  output           slave_endofpacket;
  output  [ 15: 0] slave_readdata;
  output           slave_waitrequest;
  input            master_clk;
  input            master_endofpacket;
  input   [ 15: 0] master_readdata;
  input            master_reset_n;
  input            master_waitrequest;
  input   [ 22: 0] slave_address;
  input   [  1: 0] slave_byteenable;
  input            slave_clk;
  input   [ 21: 0] slave_nativeaddress;
  input            slave_read;
  input            slave_reset_n;
  input            slave_write;
  input   [ 15: 0] slave_writedata;
  reg     [ 22: 0] master_address /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  reg     [  1: 0] master_byteenable /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  reg     [ 21: 0] master_nativeaddress /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  wire             master_read;
  wire             master_read_done;
  wire             master_read_done_sync;
  wire             master_read_done_token;
  wire             master_write;
  wire             master_write_done;
  wire             master_write_done_sync;
  wire             master_write_done_token;
  reg     [ 15: 0] master_writedata /* synthesis ALTERA_ATTRIBUTE = "PRESERVE_REGISTER=ON"  */;
  reg     [ 22: 0] slave_address_d1 /* synthesis ALTERA_ATTRIBUTE = "{-to \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  reg     [  1: 0] slave_byteenable_d1 /* synthesis ALTERA_ATTRIBUTE = "{-to \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  wire             slave_endofpacket;
  reg     [ 21: 0] slave_nativeaddress_d1 /* synthesis ALTERA_ATTRIBUTE = "{-to \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  wire             slave_read_request;
  wire             slave_read_request_sync;
  wire             slave_read_request_token;
  reg     [ 15: 0] slave_readdata /* synthesis ALTERA_ATTRIBUTE = "{-from \"*\"} CUT=ON"  */;
  reg     [ 15: 0] slave_readdata_p1;
  wire             slave_waitrequest;
  wire             slave_write_request;
  wire             slave_write_request_sync;
  wire             slave_write_request_token;
  reg     [ 15: 0] slave_writedata_d1 /* synthesis ALTERA_ATTRIBUTE = "{-to \"*\"} CUT=ON ; PRESERVE_REGISTER=ON"  */;
  //in, which is an e_avalon_slave
  //out, which is an e_avalon_master
  altera_std_synchronizer the_altera_std_synchronizer
    (
      .clk (slave_clk),
      .din (master_read_done),
      .dout (master_read_done_sync),
      .reset_n (slave_reset_n)
    );
  defparam the_altera_std_synchronizer.depth = 2;
  altera_std_synchronizer the_altera_std_synchronizer1
    (
      .clk (slave_clk),
      .din (master_write_done),
      .dout (master_write_done_sync),
      .reset_n (slave_reset_n)
    );
  defparam the_altera_std_synchronizer1.depth = 2;
  //read_done_edge_to_pulse, which is an e_instance
  system_0_clock_0_edge_to_pulse read_done_edge_to_pulse
    (
      .clock    (slave_clk),
      .data_in  (master_read_done_sync),
      .data_out (master_read_done_token),
      .reset_n  (slave_reset_n)
    );
  //write_done_edge_to_pulse, which is an e_instance
  system_0_clock_0_edge_to_pulse write_done_edge_to_pulse
    (
      .clock    (slave_clk),
      .data_in  (master_write_done_sync),
      .data_out (master_write_done_token),
      .reset_n  (slave_reset_n)
    );
  //slave_FSM, which is an e_instance
  system_0_clock_0_slave_FSM slave_FSM
    (
      .master_read_done_token  (master_read_done_token),
      .master_write_done_token (master_write_done_token),
      .slave_clk               (slave_clk),
      .slave_read              (slave_read),
      .slave_read_request      (slave_read_request),
      .slave_reset_n           (slave_reset_n),
      .slave_waitrequest       (slave_waitrequest),
      .slave_write             (slave_write),
      .slave_write_request     (slave_write_request)
    );
  altera_std_synchronizer the_altera_std_synchronizer2
    (
      .clk (master_clk),
      .din (slave_read_request),
      .dout (slave_read_request_sync),
      .reset_n (master_reset_n)
    );
  defparam the_altera_std_synchronizer2.depth = 2;
  altera_std_synchronizer the_altera_std_synchronizer3
    (
      .clk (master_clk),
      .din (slave_write_request),
      .dout (slave_write_request_sync),
      .reset_n (master_reset_n)
    );
  defparam the_altera_std_synchronizer3.depth = 2;
  //read_request_edge_to_pulse, which is an e_instance
  system_0_clock_0_edge_to_pulse read_request_edge_to_pulse
    (
      .clock    (master_clk),
      .data_in  (slave_read_request_sync),
      .data_out (slave_read_request_token),
      .reset_n  (master_reset_n)
    );
  //write_request_edge_to_pulse, which is an e_instance
  system_0_clock_0_edge_to_pulse write_request_edge_to_pulse
    (
      .clock    (master_clk),
      .data_in  (slave_write_request_sync),
      .data_out (slave_write_request_token),
      .reset_n  (master_reset_n)
    );
  //master_FSM, which is an e_instance
  system_0_clock_0_master_FSM master_FSM
    (
      .master_clk                (master_clk),
      .master_read               (master_read),
      .master_read_done          (master_read_done),
      .master_reset_n            (master_reset_n),
      .master_waitrequest        (master_waitrequest),
      .master_write              (master_write),
      .master_write_done         (master_write_done),
      .slave_read_request_token  (slave_read_request_token),
      .slave_write_request_token (slave_write_request_token)
    );
  //endofpacket_bit_pipe, which is an e_instance
  system_0_clock_0_bit_pipe endofpacket_bit_pipe
    (
      .clk1         (slave_clk),
      .clk2         (master_clk),
      .data_in      (master_endofpacket),
      .data_out     (slave_endofpacket),
      .reset_clk1_n (slave_reset_n),
      .reset_clk2_n (master_reset_n)
    );
  always @(posedge master_clk or negedge master_reset_n)
    begin
      if (master_reset_n == 0)
          slave_readdata_p1 <= 0;
      else if (master_read & ~master_waitrequest)
          slave_readdata_p1 <= master_readdata;
    end
  always @(posedge slave_clk or negedge slave_reset_n)
    begin
      if (slave_reset_n == 0)
          slave_readdata <= 0;
      else
        slave_readdata <= slave_readdata_p1;
    end
  always @(posedge slave_clk or negedge slave_reset_n)
    begin
      if (slave_reset_n == 0)
          slave_writedata_d1 <= 0;
      else
        slave_writedata_d1 <= slave_writedata;
    end
  always @(posedge master_clk or negedge master_reset_n)
    begin
      if (master_reset_n == 0)
          master_writedata <= 0;
      else
        master_writedata <= slave_writedata_d1;
    end
  always @(posedge slave_clk or negedge slave_reset_n)
    begin
      if (slave_reset_n == 0)
          slave_address_d1 <= 0;
      else
        slave_address_d1 <= slave_address;
    end
  always @(posedge master_clk or negedge master_reset_n)
    begin
      if (master_reset_n == 0)
          master_address <= 0;
      else
        master_address <= slave_address_d1;
    end
  always @(posedge slave_clk or negedge slave_reset_n)
    begin
      if (slave_reset_n == 0)
          slave_nativeaddress_d1 <= 0;
      else
        slave_nativeaddress_d1 <= slave_nativeaddress;
    end
  always @(posedge master_clk or negedge master_reset_n)
    begin
      if (master_reset_n == 0)
          master_nativeaddress <= 0;
      else
        master_nativeaddress <= slave_nativeaddress_d1;
    end
  always @(posedge slave_clk or negedge slave_reset_n)
    begin
      if (slave_reset_n == 0)
          slave_byteenable_d1 <= 0;
      else
        slave_byteenable_d1 <= slave_byteenable;
    end
  always @(posedge master_clk or negedge master_reset_n)
    begin
      if (master_reset_n == 0)
          master_byteenable <= 0;
      else
        master_byteenable <= slave_byteenable_d1;
    end
endmodule