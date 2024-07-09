module interconnect_0
(
   input logic clock,
   input logic resetn,
   // ICM m
   input logic m_arb_request [1],
   input logic m_arb_read [1],
   input logic m_arb_write [1],
   input logic [4:0] m_arb_burstcount [1],
   input logic [24:0] m_arb_address [1],
   input logic [255:0] m_arb_writedata [1],
   input logic [31:0] m_arb_byteenable [1],
   output logic m_arb_stall [1],
   output logic m_wrp_ack [1],
   output logic m_rrp_datavalid [1],
   output logic [255:0] m_rrp_data [1],
   // ICM mout
   output logic mout_arb_request,
   output logic mout_arb_read,
   output logic mout_arb_write,
   output logic [4:0] mout_arb_burstcount,
   output logic [24:0] mout_arb_address,
   output logic [255:0] mout_arb_writedata,
   output logic [31:0] mout_arb_byteenable,
   output logic mout_arb_id,
   input logic mout_arb_stall,
   input logic mout_wrp_ack,
   input logic mout_rrp_datavalid,
   input logic [255:0] mout_rrp_data
);
   genvar i;
   generate
      for( i = 0; i < 1; i = i + 1 )
      begin:m
         logic id;
         acl_ic_master_intf
         #(
            .DATA_W(256),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(32),
            .ID_W(1)
         ) m_intf();
         acl_arb_intf
         #(
            .DATA_W(256),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(32),
            .ID_W(1)
         ) arb_intf();
         acl_ic_wrp_intf
         #(
            .ID_W(1)
         ) wrp_intf();
         acl_ic_rrp_intf
         #(
            .DATA_W(256),
            .ID_W(1)
         ) rrp_intf();
         assign id = i;
         // INST m_endp of acl_ic_master_endpoint
         acl_ic_master_endpoint
         #(
            .DATA_W(256),
            .BURSTCOUNT_W(5),
            .ADDRESS_W(25),
            .BYTEENA_W(32),
            .ID_W(1),
            .TOTAL_NUM_MASTERS(1),
            .ID(i)
         )
         m_endp
         (
            .clock(clock),
            .resetn(resetn),
            .m_intf(m_intf),
            .arb_intf(arb_intf),
            .wrp_intf(wrp_intf),
            .rrp_intf(rrp_intf)
         );
         assign m_intf.arb.req.request = m_arb_request[i];
         assign m_intf.arb.req.read = m_arb_read[i];
         assign m_intf.arb.req.write = m_arb_write[i];
         assign m_intf.arb.req.burstcount = m_arb_burstcount[i];
         assign m_intf.arb.req.address = m_arb_address[i];
         assign m_intf.arb.req.writedata = m_arb_writedata[i];
         assign m_intf.arb.req.byteenable = m_arb_byteenable[i];
         assign m_arb_stall[i] = m_intf.arb.stall;
         assign m_wrp_ack[i] = m_intf.wrp.ack;
         assign m_rrp_datavalid[i] = m_intf.rrp.datavalid;
         assign m_rrp_data[i] = m_intf.rrp.data;
         assign m_intf.arb.req.id = id;
      end
   endgenerate
   generate
   begin:s
      acl_arb_intf
      #(
         .DATA_W(256),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(25),
         .BYTEENA_W(32),
         .ID_W(1)
      ) in_arb_intf();
      acl_arb_intf
      #(
         .DATA_W(256),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(25),
         .BYTEENA_W(32),
         .ID_W(1)
      ) out_arb_intf();
      acl_ic_wrp_intf
      #(
         .ID_W(1)
      ) wrp_intf();
      acl_ic_rrp_intf
      #(
         .DATA_W(256),
         .ID_W(1)
      ) rrp_intf();
      // INST s_endp of acl_ic_slave_endpoint
      acl_ic_slave_endpoint
      #(
         .DATA_W(256),
         .BURSTCOUNT_W(5),
         .ADDRESS_W(25),
         .BYTEENA_W(32),
         .ID_W(1),
         .NUM_MASTERS(1),
         .PIPELINE_RETURN_PATHS(1),
         .WRP_FIFO_DEPTH(64),
         .RRP_FIFO_DEPTH(64),
         .RRP_USE_LL_FIFO(1),
         .SLAVE_FIXED_LATENCY(0),
         .SEPARATE_READ_WRITE_STALLS(0)
      )
      s_endp
      (
         .clock(clock),
         .resetn(resetn),
         .m_intf(in_arb_intf),
         .s_intf(out_arb_intf),
         .s_readdatavalid(mout_rrp_datavalid),
         .s_readdata(mout_rrp_data),
         .s_writeack(mout_wrp_ack),
         .wrp_intf(wrp_intf),
         .rrp_intf(rrp_intf)
      );
   end
   endgenerate
   generate
   begin:wrp
      assign m[0].wrp_intf.ack = s.wrp_intf.ack;
      assign m[0].wrp_intf.id = s.wrp_intf.id;
   end
   endgenerate
   generate
   begin:rrp
   end
   endgenerate
   assign mout_arb_request = s.out_arb_intf.req.request;
   assign mout_arb_read = s.out_arb_intf.req.read;
   assign mout_arb_write = s.out_arb_intf.req.write;
   assign mout_arb_burstcount = s.out_arb_intf.req.burstcount;
   assign mout_arb_address = s.out_arb_intf.req.address;
   assign mout_arb_writedata = s.out_arb_intf.req.writedata;
   assign mout_arb_byteenable = s.out_arb_intf.req.byteenable;
   assign mout_arb_id = s.out_arb_intf.req.id;
   assign s.out_arb_intf.stall = mout_arb_stall;
   assign s.in_arb_intf.req = m[0].arb_intf.req;
   assign m[0].arb_intf.stall = s.in_arb_intf.stall;
endmodule