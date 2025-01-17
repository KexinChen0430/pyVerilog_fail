module net_2core2dr_wp(
  /* verilator lint_off UNUSED */
  /* verilator lint_off UNDRIVEN */
	input	logic				clk
	,input	logic				reset
  // c0 core L2I
	,input	logic				c0_l2itodr_req_valid
	,output	logic				c0_l2itodr_req_retry
	//  ,input  I_l2todr_req_type        c0_l2itodr_req
	,input	SC_nodeid_type		c0_l2itodr_req_nid
	,input	L2_reqid_type		c0_l2itodr_req_l2id
	,input	SC_cmd_type			c0_l2itodr_req_cmd
	,input	SC_paddr_type		c0_l2itodr_req_paddr
	,output	logic				c0_drtol2i_snack_valid
	,input	logic				c0_drtol2i_snack_retry
	//  ,output I_drtol2_snack_type      c0_drtol2i_snack
	,output	SC_nodeid_type		c0_drtol2i_snack_nid
	,output	L2_reqid_type		c0_drtol2i_snack_l2id
	,output	DR_reqid_type		c0_drtol2i_snack_drid
	,output	SC_snack_type		c0_drtol2i_snack_snack
	,output	SC_line_type		c0_drtol2i_snack_line
	,output	SC_paddr_type		c0_drtol2i_snack_paddr
	,input	logic				c0_l2itodr_snoop_ack_valid
	,output	logic				c0_l2itodr_snoop_ack_retry
	//  ,input  I_l2snoop_ack_type       c0_l2itodr_snoop_ack
	,input	L2_reqid_type		c0_l2itodr_snoop_ack_l2id
	,input	DR_ndirs_type		c0_l2itodr_snoop_ack_directory_id
	,input	logic				c0_l2itodr_disp_valid
	,output	logic				c0_l2itodr_disp_retry
	//  ,input  I_l2todr_disp_type       c0_l2itodr_disp
	,input	SC_nodeid_type		c0_l2itodr_disp_nid
	,input	L2_reqid_type		c0_l2itodr_disp_l2id
	,input	DR_reqid_type		c0_l2itodr_disp_drid
	,input	SC_disp_mask_type	c0_l2itodr_disp_mask
	,input	SC_dcmd_type		c0_l2itodr_disp_dcmd
	,input	SC_line_type		c0_l2itodr_disp_line
	,input	SC_paddr_type		c0_l2itodr_disp_paddr
	,output	logic				c0_drtol2i_dack_valid
	,input	logic				c0_drtol2i_dack_retry
	//  ,output I_drtol2_dack_type       c0_drtol2i_dack
	,output	SC_nodeid_type		c0_drtol2i_dack_nid
	,output	L2_reqid_type		c0_drtol2i_dack_l2id
	,input	logic				c0_l2itodr_pfreq_valid
	,output	logic				c0_l2itodr_pfreq_retry
	//  ,input  I_l2todr_pfreq_type      c0_l2itodr_pfreq
	,input	SC_nodeid_type		c0_l2itodr_pfreq_nid
	,input	SC_paddr_type		c0_l2itodr_pfreq_paddr
  // c0 core L2I TLB
	,input	logic				c0_l2ittodr_req_valid
	,output	logic				c0_l2ittodr_req_retry
	//  ,input  I_l2todr_req_type        c0_l2ittodr_req
	,input	SC_nodeid_type		c0_l2ittodr_req_nid
	,input	L2_reqid_type		c0_l2ittodr_req_l2id
	,input	SC_cmd_type			c0_l2ittodr_req_cmd
	,input	SC_paddr_type		c0_l2ittodr_req_paddr
	,output	logic				c0_drtol2it_snack_valid
	,input	logic				c0_drtol2it_snack_retry
	//  ,output I_drtol2_snack_type      c0_drtol2it_snack
	,output	SC_nodeid_type		c0_drtol2it_snack_nid
	,output	L2_reqid_type		c0_drtol2it_snack_l2id
	,output	DR_reqid_type		c0_drtol2it_snack_drid
	,output	SC_snack_type		c0_drtol2it_snack_snack
	,output	SC_line_type		c0_drtol2it_snack_line
	,output	SC_paddr_type		c0_drtol2it_snack_paddr
	,input	logic				c0_l2ittodr_snoop_ack_valid
	,output	logic				c0_l2ittodr_snoop_ack_retry
	//  ,input  I_l2snoop_ack_type       c0_l2ittodr_snoop_ack
	,input	L2_reqid_type		c0_l2ittodr_snoop_ack_l2id
	,input	DR_ndirs_type		c0_l2ittodr_snoop_ack_directory_id
	,input	logic				c0_l2ittodr_disp_valid
	,output	logic				c0_l2ittodr_disp_retry
	//  ,input  I_l2todr_disp_type       c0_l2ittodr_disp
	,input	SC_nodeid_type		c0_l2ittodr_disp_nid
	,input	L2_reqid_type		c0_l2ittodr_disp_l2id
	,input	DR_reqid_type		c0_l2ittodr_disp_drid
	,input	SC_disp_mask_type	c0_l2ittodr_disp_mask
	,input	SC_dcmd_type		c0_l2ittodr_disp_dcmd
	,input	SC_line_type		c0_l2ittodr_disp_line
	,input	SC_paddr_type		c0_l2ittodr_disp_paddr
	,output	logic				c0_drtol2it_dack_valid
	,input	logic				c0_drtol2it_dack_retry
	//  ,output I_drtol2_dack_type       c0_drtol2it_dack
	,output	SC_nodeid_type		c0_drtol2it_dack_nid
	,output	L2_reqid_type		c0_drtol2it_dack_l2id
  // c0 core L2D
	,input	logic				c0_l2d_0todr_req_valid
	,output	logic				c0_l2d_0todr_req_retry
	//  ,input  I_l2todr_req_type        c0_l2d_0todr_req
	,input	SC_nodeid_type		c0_l2d_0todr_req_nid
	,input	L2_reqid_type		c0_l2d_0todr_req_l2id
	,input	SC_cmd_type			c0_l2d_0todr_req_cmd
	,input	SC_paddr_type		c0_l2d_0todr_req_paddr
	,output	logic				c0_drtol2d_0_snack_valid
	,input	logic				c0_drtol2d_0_snack_retry
	//  ,output I_drtol2_snack_type      c0_drtol2d_0_snack
	,output	SC_nodeid_type		c0_drtol2d_0_snack_nid
	,output	L2_reqid_type		c0_drtol2d_0_snack_l2id
	,output	DR_reqid_type		c0_drtol2d_0_snack_drid
	,output	SC_snack_type		c0_drtol2d_0_snack_snack
	,output	SC_line_type		c0_drtol2d_0_snack_line
	,output	SC_paddr_type		c0_drtol2d_0_snack_paddr
	,input	logic				c0_l2d_0todr_snoop_ack_valid
	,output	logic				c0_l2d_0todr_snoop_ack_retry
	//  ,input  I_l2snoop_ack_type       c0_l2d_0todr_snoop_ack
	,input	L2_reqid_type		c0_l2d_0todr_snoop_ack_l2id
	,input	DR_ndirs_type		c0_l2d_0todr_snoop_ack_directory_id
	,input	logic				c0_l2d_0todr_disp_valid
	,output	logic				c0_l2d_0todr_disp_retry
	//  ,input  I_l2todr_disp_type       c0_l2d_0todr_disp
	,input	SC_nodeid_type		c0_l2d_0todr_disp_nid
	,input	L2_reqid_type		c0_l2d_0todr_disp_l2id
	,input	DR_reqid_type		c0_l2d_0todr_disp_drid
	,input	SC_disp_mask_type	c0_l2d_0todr_disp_mask
	,input	SC_dcmd_type		c0_l2d_0todr_disp_dcmd
	,input	SC_line_type		c0_l2d_0todr_disp_line
	,input	SC_paddr_type		c0_l2d_0todr_disp_paddr
	,output	logic				c0_drtol2d_0_dack_valid
	,input	logic				c0_drtol2d_0_dack_retry
	//  ,output I_drtol2_dack_type       c0_drtol2d_0_dack
	,output	SC_nodeid_type		c0_drtol2d_0_dack_nid
	,output	L2_reqid_type		c0_drtol2d_0_dack_l2id
	,input	logic				c0_l2d_0todr_pfreq_valid
	,output	logic				c0_l2d_0todr_pfreq_retry
	//  ,input  I_l2todr_pfreq_type      c0_l2d_0todr_pfreq
	,input	SC_nodeid_type		c0_l2d_0todr_pfreq_nid
	,input	SC_paddr_type		c0_l2d_0todr_pfreq_paddr
  // c0 core L2D TLB
	,input	logic				c0_l2dt_0todr_req_valid
	,output	logic				c0_l2dt_0todr_req_retry
	//  ,input  I_l2todr_req_type        c0_l2dt_0todr_req
	,input	SC_nodeid_type		c0_l2dt_0todr_req_nid
	,input	L2_reqid_type		c0_l2dt_0todr_req_l2id
	,input	SC_cmd_type			c0_l2dt_0todr_req_cmd
	,input	SC_paddr_type		c0_l2dt_0todr_req_paddr
	,output	logic				c0_drtol2dt_0_snack_valid
	,input	logic				c0_drtol2dt_0_snack_retry
	//  ,output I_drtol2_snack_type      c0_drtol2dt_0_snack
	,output	SC_nodeid_type		c0_drtol2dt_0_snack_nid
	,output	L2_reqid_type		c0_drtol2dt_0_snack_l2id
	,output	DR_reqid_type		c0_drtol2dt_0_snack_drid
	,output	SC_snack_type		c0_drtol2dt_0_snack_snack
	,output	SC_line_type		c0_drtol2dt_0_snack_line
	,output	SC_paddr_type		c0_drtol2dt_0_snack_paddr
	,input	logic				c0_l2dt_0todr_snoop_ack_valid
	,output	logic				c0_l2dt_0todr_snoop_ack_retry
	//  ,input  I_l2snoop_ack_type       c0_l2dt_0todr_snoop_ack
	,input	L2_reqid_type		c0_l2dt_0todr_snoop_ack_l2id
	,input	DR_ndirs_type		c0_l2dt_0todr_snoop_ack_directory_id
	,input	logic				c0_l2dt_0todr_disp_valid
	,output	logic				c0_l2dt_0todr_disp_retry
	//  ,input  I_l2todr_disp_type       c0_l2dt_0todr_disp
	,input	SC_nodeid_type		c0_l2dt_0todr_disp_nid
	,input	L2_reqid_type		c0_l2dt_0todr_disp_l2id
	,input	DR_reqid_type		c0_l2dt_0todr_disp_drid
	,input	SC_disp_mask_type	c0_l2dt_0todr_disp_mask
	,input	SC_dcmd_type		c0_l2dt_0todr_disp_dcmd
	,input	SC_line_type		c0_l2dt_0todr_disp_line
	,input	SC_paddr_type		c0_l2dt_0todr_disp_paddr
	,output	logic				c0_drtol2dt_0_dack_valid
	,input	logic				c0_drtol2dt_0_dack_retry
	//  ,output I_drtol2_dack_type       c0_drtol2dt_0_dack
	,output	SC_nodeid_type		c0_drtol2dt_0_dack_nid
	,output	L2_reqid_type		c0_drtol2dt_0_dack_l2id
  // c1 core L2I
	,input	logic				c1_l2itodr_req_valid
	,output	logic				c1_l2itodr_req_retry
	//  ,input  I_l2todr_req_type        c1_l2itodr_req
	,input	SC_nodeid_type		c1_l2itodr_req_nid
	,input	L2_reqid_type		c1_l2itodr_req_l2id
	,input	SC_cmd_type			c1_l2itodr_req_cmd
	,input	SC_paddr_type		c1_l2itodr_req_paddr
	,output	logic				c1_drtol2i_snack_valid
	,input	logic				c1_drtol2i_snack_retry
	//  ,output I_drtol2_snack_type      c1_drtol2i_snack
	,output	SC_nodeid_type		c1_drtol2i_snack_nid
	,output	L2_reqid_type		c1_drtol2i_snack_l2id
	,output	DR_reqid_type		c1_drtol2i_snack_drid
	,output	SC_snack_type		c1_drtol2i_snack_snack
	,output	SC_line_type		c1_drtol2i_snack_line
	,output	SC_paddr_type		c1_drtol2i_snack_paddr
	,input	logic				c1_l2itodr_snoop_ack_valid
	,output	logic				c1_l2itodr_snoop_ack_retry
	//  ,input  I_l2snoop_ack_type       c1_l2itodr_snoop_ack
	,input	L2_reqid_type		c1_l2itodr_snoop_ack_l2id
	,input	DR_ndirs_type		c1_l2itodr_snoop_ack_directory_id
	,input	logic				c1_l2itodr_disp_valid
	,output	logic				c1_l2itodr_disp_retry
	//  ,input  I_l2todr_disp_type       c1_l2itodr_disp
	,input	SC_nodeid_type		c1_l2itodr_disp_nid
	,input	L2_reqid_type		c1_l2itodr_disp_l2id
	,input	DR_reqid_type		c1_l2itodr_disp_drid
	,input	SC_disp_mask_type	c1_l2itodr_disp_mask
	,input	SC_dcmd_type		c1_l2itodr_disp_dcmd
	,input	SC_line_type		c1_l2itodr_disp_line
	,input	SC_paddr_type		c1_l2itodr_disp_paddr
	,output	logic				c1_drtol2i_dack_valid
	,input	logic				c1_drtol2i_dack_retry
	//  ,output I_drtol2_dack_type       c1_drtol2i_dack
	,output	SC_nodeid_type		c1_drtol2i_dack_nid
	,output	L2_reqid_type		c1_drtol2i_dack_l2id
	,input	logic				c1_l2itodr_pfreq_valid
	,output	logic				c1_l2itodr_pfreq_retry
	//  ,input  I_l2todr_pfreq_type      c1_l2itodr_pfreq
	,input	SC_nodeid_type		c1_l2itodr_pfreq_nid
	,input	SC_paddr_type		c1_l2itodr_pfreq_paddr
  // c1 core L2I TLB
	,input	logic				c1_l2ittodr_req_valid
	,output	logic				c1_l2ittodr_req_retry
	//  ,input  I_l2todr_req_type        c1_l2ittodr_req
	,input	SC_nodeid_type		c1_l2ittodr_req_nid
	,input	L2_reqid_type		c1_l2ittodr_req_l2id
	,input	SC_cmd_type			c1_l2ittodr_req_cmd
	,input	SC_paddr_type		c1_l2ittodr_req_paddr
	,output	logic				c1_drtol2it_snack_valid
	,input	logic				c1_drtol2it_snack_retry
	//  ,output I_drtol2_snack_type      c1_drtol2it_snack
	,output	SC_nodeid_type		c1_drtol2it_snack_nid
	,output	L2_reqid_type		c1_drtol2it_snack_l2id
	,output	DR_reqid_type		c1_drtol2it_snack_drid
	,output	SC_snack_type		c1_drtol2it_snack_snack
	,output	SC_line_type		c1_drtol2it_snack_line
	,output	SC_paddr_type		c1_drtol2it_snack_paddr
	,input	logic				c1_l2ittodr_snoop_ack_valid
	,output	logic				c1_l2ittodr_snoop_ack_retry
	//  ,input  I_l2snoop_ack_type       c1_l2ittodr_snoop_ack
	,input	L2_reqid_type		c1_l2ittodr_snoop_ack_l2id
	,input	DR_ndirs_type		c1_l2ittodr_snoop_ack_directory_id
	,input	logic				c1_l2ittodr_disp_valid
	,output	logic				c1_l2ittodr_disp_retry
	//  ,input  I_l2todr_disp_type       c1_l2ittodr_disp
	,input	SC_nodeid_type		c1_l2ittodr_disp_nid
	,input	L2_reqid_type		c1_l2ittodr_disp_l2id
	,input	DR_reqid_type		c1_l2ittodr_disp_drid
	,input	SC_disp_mask_type	c1_l2ittodr_disp_mask
	,input	SC_dcmd_type		c1_l2ittodr_disp_dcmd
	,input	SC_line_type		c1_l2ittodr_disp_line
	,input	SC_paddr_type		c1_l2ittodr_disp_paddr
	,output	logic				c1_drtol2it_dack_valid
	,input	logic				c1_drtol2it_dack_retry
	//  ,output I_drtol2_dack_type       c1_drtol2it_dack
	,output	SC_nodeid_type		c1_drtol2it_dack_nid
	,output	L2_reqid_type		c1_drtol2it_dack_l2id
  // c1 core L2D
	,input	logic				c1_l2d_0todr_req_valid
	,output	logic				c1_l2d_0todr_req_retry
	//  ,input  I_l2todr_req_type        c1_l2d_0todr_req
	,input	SC_nodeid_type		c1_l2d_0todr_req_nid
	,input	L2_reqid_type		c1_l2d_0todr_req_l2id
	,input	SC_cmd_type			c1_l2d_0todr_req_cmd
	,input	SC_paddr_type		c1_l2d_0todr_req_paddr
	,output	logic				c1_drtol2d_0_snack_valid
	,input	logic				c1_drtol2d_0_snack_retry
	//  ,output I_drtol2_snack_type      c1_drtol2d_0_snack
	,output	SC_nodeid_type		c1_drtol2d_0_snack_nid
	,output	L2_reqid_type		c1_drtol2d_0_snack_l2id
	,output	DR_reqid_type		c1_drtol2d_0_snack_drid
	,output	SC_snack_type		c1_drtol2d_0_snack_snack
	,output	SC_line_type		c1_drtol2d_0_snack_line
	,output	SC_paddr_type		c1_drtol2d_0_snack_paddr
	,input	logic				c1_l2d_0todr_snoop_ack_valid
	,output	logic				c1_l2d_0todr_snoop_ack_retry
	//  ,input  I_l2snoop_ack_type       c1_l2d_0todr_snoop_ack
	,input	L2_reqid_type		c1_l2d_0todr_snoop_ack_l2id
	,input	DR_ndirs_type		c1_l2d_0todr_snoop_ack_directory_id
	,input	logic				c1_l2d_0todr_disp_valid
	,output	logic				c1_l2d_0todr_disp_retry
	//  ,input  I_l2todr_disp_type       c1_l2d_0todr_disp
	,input	SC_nodeid_type		c1_l2d_0todr_disp_nid
	,input	L2_reqid_type		c1_l2d_0todr_disp_l2id
	,input	DR_reqid_type		c1_l2d_0todr_disp_drid
	,input	SC_disp_mask_type	c1_l2d_0todr_disp_mask
	,input	SC_dcmd_type		c1_l2d_0todr_disp_dcmd
	,input	SC_line_type		c1_l2d_0todr_disp_line
	,input	SC_paddr_type		c1_l2d_0todr_disp_paddr
	,output	logic				c1_drtol2d_0_dack_valid
	,input	logic				c1_drtol2d_0_dack_retry
	//  ,output I_drtol2_dack_type       c1_drtol2d_0_dack
	,output	SC_nodeid_type		c1_drtol2d_0_dack_nid
	,output	L2_reqid_type		c1_drtol2d_0_dack_l2id
	,input	logic				c1_l2d_0todr_pfreq_valid
	,output	logic				c1_l2d_0todr_pfreq_retry
	//  ,input  I_l2todr_pfreq_type      c1_l2d_0todr_pfreq
	,input	SC_nodeid_type		c1_l2d_0todr_pfreq_nid
	,input	SC_paddr_type		c1_l2d_0todr_pfreq_paddr
  // c1 core L2D TLB
	,input	logic				c1_l2dt_0todr_req_valid
	,output	logic				c1_l2dt_0todr_req_retry
	//  ,input  I_l2todr_req_type        c1_l2dt_0todr_req
	,input	SC_nodeid_type		c1_l2dt_0todr_req_nid
	,input	L2_reqid_type		c1_l2dt_0todr_req_l2id
	,input	SC_cmd_type			c1_l2dt_0todr_req_cmd
	,input	SC_paddr_type		c1_l2dt_0todr_req_paddr
	,output	logic				c1_drtol2dt_0_snack_valid
	,input	logic				c1_drtol2dt_0_snack_retry
	//  ,output I_drtol2_snack_type      c1_drtol2dt_0_snack
	,output	SC_nodeid_type		c1_drtol2dt_0_snack_nid
	,output	L2_reqid_type		c1_drtol2dt_0_snack_l2id
	,output	DR_reqid_type		c1_drtol2dt_0_snack_drid
	,output	SC_snack_type		c1_drtol2dt_0_snack_snack
	,output	SC_line_type		c1_drtol2dt_0_snack_line
	,output	SC_paddr_type		c1_drtol2dt_0_snack_paddr
	,input	logic				c1_l2dt_0todr_snoop_ack_valid
	,output	logic				c1_l2dt_0todr_snoop_ack_retry
	//  ,input  I_l2snoop_ack_type       c1_l2dt_0todr_snoop_ack
	,input	L2_reqid_type		c1_l2dt_0todr_snoop_ack_l2id
	,input	DR_ndirs_type		c1_l2dt_0todr_snoop_ack_directory_id
	,input	logic				c1_l2dt_0todr_disp_valid
	,output	logic				c1_l2dt_0todr_disp_retry
	//  ,input  I_l2todr_disp_type       c1_l2dt_0todr_disp
	,input	SC_nodeid_type		c1_l2dt_0todr_disp_nid
	,input	L2_reqid_type		c1_l2dt_0todr_disp_l2id
	,input	DR_reqid_type		c1_l2dt_0todr_disp_drid
	,input	SC_disp_mask_type	c1_l2dt_0todr_disp_mask
	,input	SC_dcmd_type		c1_l2dt_0todr_disp_dcmd
	,input	SC_line_type		c1_l2dt_0todr_disp_line
	,input	SC_paddr_type		c1_l2dt_0todr_disp_paddr
	,output	logic				c1_drtol2dt_0_dack_valid
	,input	logic				c1_drtol2dt_0_dack_retry
	//  ,output I_drtol2_dack_type       c1_drtol2dt_0_dack
	,output	SC_nodeid_type		c1_drtol2dt_0_dack_nid
	,output	L2_reqid_type		c1_drtol2dt_0_dack_l2id
   // directory 0
	,output	logic				l2todr0_req_valid
	,input	logic				l2todr0_req_retry
	//  ,output I_l2todr_req_type        l2todr0_req
	,output	SC_nodeid_type		l2todr0_req_nid
	,output	L2_reqid_type		l2todr0_req_l2id
	,output	SC_cmd_type			l2todr0_req_cmd
	,output	SC_paddr_type		l2todr0_req_paddr
	,input	logic				dr0tol2_snack_valid
	,output	logic				dr0tol2_snack_retry
	//  ,input  I_drtol2_snack_type      dr0tol2_snack
	,input	SC_nodeid_type		dr0tol2_snack_nid
	,input	L2_reqid_type		dr0tol2_snack_l2id
	,input	DR_reqid_type		dr0tol2_snack_drid
	,input	SC_snack_type		dr0tol2_snack_snack
	,input	SC_line_type		dr0tol2_snack_line
	,input	SC_paddr_type		dr0tol2_snack_paddr
	,output	logic				l2todr0_disp_valid
	,input	logic				l2todr0_disp_retry
	//  ,output I_l2todr_disp_type       l2todr0_disp
	,output	SC_nodeid_type		l2todr0_disp_nid
	,output	L2_reqid_type		l2todr0_disp_l2id
	,output	DR_reqid_type		l2todr0_disp_drid
	,output	SC_disp_mask_type	l2todr0_disp_mask
	,output	SC_dcmd_type		l2todr0_disp_dcmd
	,output	SC_line_type		l2todr0_disp_line
	,output	SC_paddr_type		l2todr0_disp_paddr
	,input	logic				dr0tol2_dack_valid
	,output	logic				dr0tol2_dack_retry
	//  ,input  I_drtol2_dack_type       dr0tol2_dack
	,input	SC_nodeid_type		dr0tol2_dack_nid
	,input	L2_reqid_type		dr0tol2_dack_l2id
	,output	logic				l2todr0_snoop_ack_valid
	,input	logic				l2todr0_snoop_ack_retry
	//  ,output I_drsnoop_ack_type       l2todr0_snoop_ack
	,output	DR_reqid_type		l2todr0_snoop_ack_drid
	,output	logic				l2todr0_pfreq_valid
	,input	logic				l2todr0_pfreq_retry
	//  ,output I_l2todr_pfreq_type      l2todr0_pfreq
	,output	SC_nodeid_type		l2todr0_pfreq_nid
	,output	SC_paddr_type		l2todr0_pfreq_paddr
   // directory 1
	,output	logic				l2todr1_req_valid
	,input	logic				l2todr1_req_retry
	//  ,output I_l2todr_req_type        l2todr1_req
	,output	SC_nodeid_type		l2todr1_req_nid
	,output	L2_reqid_type		l2todr1_req_l2id
	,output	SC_cmd_type			l2todr1_req_cmd
	,output	SC_paddr_type		l2todr1_req_paddr
	,input	logic				dr1tol2_snack_valid
	,output	logic				dr1tol2_snack_retry
	//  ,input  I_drtol2_snack_type      dr1tol2_snack
	,input	SC_nodeid_type		dr1tol2_snack_nid
	,input	L2_reqid_type		dr1tol2_snack_l2id
	,input	DR_reqid_type		dr1tol2_snack_drid
	,input	SC_snack_type		dr1tol2_snack_snack
	,input	SC_line_type		dr1tol2_snack_line
	,input	SC_paddr_type		dr1tol2_snack_paddr
	,output	logic				l2todr1_disp_valid
	,input	logic				l2todr1_disp_retry
	//  ,output I_l2todr_disp_type       l2todr1_disp
	,output	SC_nodeid_type		l2todr1_disp_nid
	,output	L2_reqid_type		l2todr1_disp_l2id
	,output	DR_reqid_type		l2todr1_disp_drid
	,output	SC_disp_mask_type	l2todr1_disp_mask
	,output	SC_dcmd_type		l2todr1_disp_dcmd
	,output	SC_line_type		l2todr1_disp_line
	,output	SC_paddr_type		l2todr1_disp_paddr
	,input	logic				dr1tol2_dack_valid
	,output	logic				dr1tol2_dack_retry
	//  ,input  I_drtol2_dack_type       dr1tol2_dack
	,input	SC_nodeid_type		dr1tol2_dack_nid
	,input	L2_reqid_type		dr1tol2_dack_l2id
	,output	logic				l2todr1_snoop_ack_valid
	,input	logic				l2todr1_snoop_ack_retry
	//  ,output I_drsnoop_ack_type       l2todr1_snoop_ack
	,output	DR_reqid_type		l2todr1_snoop_ack_drid
	,output	logic				l2todr1_pfreq_valid
	,input	logic				l2todr1_pfreq_retry
	//  ,output I_l2todr_pfreq_type      l2todr1_pfreq
	,output	SC_nodeid_type		l2todr1_pfreq_nid
	,output	SC_paddr_type		l2todr1_pfreq_paddr
  /* verilator lint_on UNUSED */
  /* verilator lint_on UNDRIVEN */
  );
 /* verilator lint_off UNUSED */
 /* verilator lint_off UNDRIVEN */
	I_l2todr_req_type c0_l2itodr_req;
	assign c0_l2itodr_req.nid = c0_l2itodr_req_nid;
	assign c0_l2itodr_req.l2id = c0_l2itodr_req_l2id;
	assign c0_l2itodr_req.cmd = c0_l2itodr_req_cmd;
	assign c0_l2itodr_req.paddr = c0_l2itodr_req_paddr;
	I_drtol2_snack_type c0_drtol2i_snack;
	assign c0_drtol2i_snack_nid = c0_drtol2i_snack.nid;
	assign c0_drtol2i_snack_l2id = c0_drtol2i_snack.l2id;
	assign c0_drtol2i_snack_drid = c0_drtol2i_snack.drid;
	assign c0_drtol2i_snack_snack = c0_drtol2i_snack.snack;
	assign c0_drtol2i_snack_line = c0_drtol2i_snack.line;
	assign c0_drtol2i_snack_paddr = c0_drtol2i_snack.paddr;
	I_l2snoop_ack_type c0_l2itodr_snoop_ack;
	assign c0_l2itodr_snoop_ack.l2id = c0_l2itodr_snoop_ack_l2id;
	assign c0_l2itodr_snoop_ack.directory_id = c0_l2itodr_snoop_ack_directory_id;
	I_l2todr_disp_type c0_l2itodr_disp;
	assign c0_l2itodr_disp.nid = c0_l2itodr_disp_nid;
	assign c0_l2itodr_disp.l2id = c0_l2itodr_disp_l2id;
	assign c0_l2itodr_disp.drid = c0_l2itodr_disp_drid;
	assign c0_l2itodr_disp.mask = c0_l2itodr_disp_mask;
	assign c0_l2itodr_disp.dcmd = c0_l2itodr_disp_dcmd;
	assign c0_l2itodr_disp.line = c0_l2itodr_disp_line;
	assign c0_l2itodr_disp.paddr = c0_l2itodr_disp_paddr;
	I_drtol2_dack_type c0_drtol2i_dack;
	assign c0_drtol2i_dack_nid = c0_drtol2i_dack.nid;
	assign c0_drtol2i_dack_l2id = c0_drtol2i_dack.l2id;
	I_l2todr_pfreq_type c0_l2itodr_pfreq;
	assign c0_l2itodr_pfreq.nid = c0_l2itodr_pfreq_nid;
	assign c0_l2itodr_pfreq.paddr = c0_l2itodr_pfreq_paddr;
	I_l2todr_req_type c0_l2ittodr_req;
	assign c0_l2ittodr_req.nid = c0_l2ittodr_req_nid;
	assign c0_l2ittodr_req.l2id = c0_l2ittodr_req_l2id;
	assign c0_l2ittodr_req.cmd = c0_l2ittodr_req_cmd;
	assign c0_l2ittodr_req.paddr = c0_l2ittodr_req_paddr;
	I_drtol2_snack_type c0_drtol2it_snack;
	assign c0_drtol2it_snack_nid = c0_drtol2it_snack.nid;
	assign c0_drtol2it_snack_l2id = c0_drtol2it_snack.l2id;
	assign c0_drtol2it_snack_drid = c0_drtol2it_snack.drid;
	assign c0_drtol2it_snack_snack = c0_drtol2it_snack.snack;
	assign c0_drtol2it_snack_line = c0_drtol2it_snack.line;
	assign c0_drtol2it_snack_paddr = c0_drtol2it_snack.paddr;
	I_l2snoop_ack_type c0_l2ittodr_snoop_ack;
	assign c0_l2ittodr_snoop_ack.l2id = c0_l2ittodr_snoop_ack_l2id;
	assign c0_l2ittodr_snoop_ack.directory_id = c0_l2ittodr_snoop_ack_directory_id;
	I_l2todr_disp_type c0_l2ittodr_disp;
	assign c0_l2ittodr_disp.nid = c0_l2ittodr_disp_nid;
	assign c0_l2ittodr_disp.l2id = c0_l2ittodr_disp_l2id;
	assign c0_l2ittodr_disp.drid = c0_l2ittodr_disp_drid;
	assign c0_l2ittodr_disp.mask = c0_l2ittodr_disp_mask;
	assign c0_l2ittodr_disp.dcmd = c0_l2ittodr_disp_dcmd;
	assign c0_l2ittodr_disp.line = c0_l2ittodr_disp_line;
	assign c0_l2ittodr_disp.paddr = c0_l2ittodr_disp_paddr;
	I_drtol2_dack_type c0_drtol2it_dack;
	assign c0_drtol2it_dack_nid = c0_drtol2it_dack.nid;
	assign c0_drtol2it_dack_l2id = c0_drtol2it_dack.l2id;
	I_l2todr_req_type c0_l2d_0todr_req;
	assign c0_l2d_0todr_req.nid = c0_l2d_0todr_req_nid;
	assign c0_l2d_0todr_req.l2id = c0_l2d_0todr_req_l2id;
	assign c0_l2d_0todr_req.cmd = c0_l2d_0todr_req_cmd;
	assign c0_l2d_0todr_req.paddr = c0_l2d_0todr_req_paddr;
	I_drtol2_snack_type c0_drtol2d_0_snack;
	assign c0_drtol2d_0_snack_nid = c0_drtol2d_0_snack.nid;
	assign c0_drtol2d_0_snack_l2id = c0_drtol2d_0_snack.l2id;
	assign c0_drtol2d_0_snack_drid = c0_drtol2d_0_snack.drid;
	assign c0_drtol2d_0_snack_snack = c0_drtol2d_0_snack.snack;
	assign c0_drtol2d_0_snack_line = c0_drtol2d_0_snack.line;
	assign c0_drtol2d_0_snack_paddr = c0_drtol2d_0_snack.paddr;
	I_l2snoop_ack_type c0_l2d_0todr_snoop_ack;
	assign c0_l2d_0todr_snoop_ack.l2id = c0_l2d_0todr_snoop_ack_l2id;
	assign c0_l2d_0todr_snoop_ack.directory_id = c0_l2d_0todr_snoop_ack_directory_id;
	I_l2todr_disp_type c0_l2d_0todr_disp;
	assign c0_l2d_0todr_disp.nid = c0_l2d_0todr_disp_nid;
	assign c0_l2d_0todr_disp.l2id = c0_l2d_0todr_disp_l2id;
	assign c0_l2d_0todr_disp.drid = c0_l2d_0todr_disp_drid;
	assign c0_l2d_0todr_disp.mask = c0_l2d_0todr_disp_mask;
	assign c0_l2d_0todr_disp.dcmd = c0_l2d_0todr_disp_dcmd;
	assign c0_l2d_0todr_disp.line = c0_l2d_0todr_disp_line;
	assign c0_l2d_0todr_disp.paddr = c0_l2d_0todr_disp_paddr;
	I_drtol2_dack_type c0_drtol2d_0_dack;
	assign c0_drtol2d_0_dack_nid = c0_drtol2d_0_dack.nid;
	assign c0_drtol2d_0_dack_l2id = c0_drtol2d_0_dack.l2id;
	I_l2todr_pfreq_type c0_l2d_0todr_pfreq;
	assign c0_l2d_0todr_pfreq.nid = c0_l2d_0todr_pfreq_nid;
	assign c0_l2d_0todr_pfreq.paddr = c0_l2d_0todr_pfreq_paddr;
	I_l2todr_req_type c0_l2dt_0todr_req;
	assign c0_l2dt_0todr_req.nid = c0_l2dt_0todr_req_nid;
	assign c0_l2dt_0todr_req.l2id = c0_l2dt_0todr_req_l2id;
	assign c0_l2dt_0todr_req.cmd = c0_l2dt_0todr_req_cmd;
	assign c0_l2dt_0todr_req.paddr = c0_l2dt_0todr_req_paddr;
	I_drtol2_snack_type c0_drtol2dt_0_snack;
	assign c0_drtol2dt_0_snack_nid = c0_drtol2dt_0_snack.nid;
	assign c0_drtol2dt_0_snack_l2id = c0_drtol2dt_0_snack.l2id;
	assign c0_drtol2dt_0_snack_drid = c0_drtol2dt_0_snack.drid;
	assign c0_drtol2dt_0_snack_snack = c0_drtol2dt_0_snack.snack;
	assign c0_drtol2dt_0_snack_line = c0_drtol2dt_0_snack.line;
	assign c0_drtol2dt_0_snack_paddr = c0_drtol2dt_0_snack.paddr;
	I_l2snoop_ack_type c0_l2dt_0todr_snoop_ack;
	assign c0_l2dt_0todr_snoop_ack.l2id = c0_l2dt_0todr_snoop_ack_l2id;
	assign c0_l2dt_0todr_snoop_ack.directory_id = c0_l2dt_0todr_snoop_ack_directory_id;
	I_l2todr_disp_type c0_l2dt_0todr_disp;
	assign c0_l2dt_0todr_disp.nid = c0_l2dt_0todr_disp_nid;
	assign c0_l2dt_0todr_disp.l2id = c0_l2dt_0todr_disp_l2id;
	assign c0_l2dt_0todr_disp.drid = c0_l2dt_0todr_disp_drid;
	assign c0_l2dt_0todr_disp.mask = c0_l2dt_0todr_disp_mask;
	assign c0_l2dt_0todr_disp.dcmd = c0_l2dt_0todr_disp_dcmd;
	assign c0_l2dt_0todr_disp.line = c0_l2dt_0todr_disp_line;
	assign c0_l2dt_0todr_disp.paddr = c0_l2dt_0todr_disp_paddr;
	I_drtol2_dack_type c0_drtol2dt_0_dack;
	assign c0_drtol2dt_0_dack_nid = c0_drtol2dt_0_dack.nid;
	assign c0_drtol2dt_0_dack_l2id = c0_drtol2dt_0_dack.l2id;
	I_l2todr_req_type c1_l2itodr_req;
	assign c1_l2itodr_req.nid = c1_l2itodr_req_nid;
	assign c1_l2itodr_req.l2id = c1_l2itodr_req_l2id;
	assign c1_l2itodr_req.cmd = c1_l2itodr_req_cmd;
	assign c1_l2itodr_req.paddr = c1_l2itodr_req_paddr;
	I_drtol2_snack_type c1_drtol2i_snack;
	assign c1_drtol2i_snack_nid = c1_drtol2i_snack.nid;
	assign c1_drtol2i_snack_l2id = c1_drtol2i_snack.l2id;
	assign c1_drtol2i_snack_drid = c1_drtol2i_snack.drid;
	assign c1_drtol2i_snack_snack = c1_drtol2i_snack.snack;
	assign c1_drtol2i_snack_line = c1_drtol2i_snack.line;
	assign c1_drtol2i_snack_paddr = c1_drtol2i_snack.paddr;
	I_l2snoop_ack_type c1_l2itodr_snoop_ack;
	assign c1_l2itodr_snoop_ack.l2id = c1_l2itodr_snoop_ack_l2id;
	assign c1_l2itodr_snoop_ack.directory_id = c1_l2itodr_snoop_ack_directory_id;
	I_l2todr_disp_type c1_l2itodr_disp;
	assign c1_l2itodr_disp.nid = c1_l2itodr_disp_nid;
	assign c1_l2itodr_disp.l2id = c1_l2itodr_disp_l2id;
	assign c1_l2itodr_disp.drid = c1_l2itodr_disp_drid;
	assign c1_l2itodr_disp.mask = c1_l2itodr_disp_mask;
	assign c1_l2itodr_disp.dcmd = c1_l2itodr_disp_dcmd;
	assign c1_l2itodr_disp.line = c1_l2itodr_disp_line;
	assign c1_l2itodr_disp.paddr = c1_l2itodr_disp_paddr;
	I_drtol2_dack_type c1_drtol2i_dack;
	assign c1_drtol2i_dack_nid = c1_drtol2i_dack.nid;
	assign c1_drtol2i_dack_l2id = c1_drtol2i_dack.l2id;
	I_l2todr_pfreq_type c1_l2itodr_pfreq;
	assign c1_l2itodr_pfreq.nid = c1_l2itodr_pfreq_nid;
	assign c1_l2itodr_pfreq.paddr = c1_l2itodr_pfreq_paddr;
	I_l2todr_req_type c1_l2ittodr_req;
	assign c1_l2ittodr_req.nid = c1_l2ittodr_req_nid;
	assign c1_l2ittodr_req.l2id = c1_l2ittodr_req_l2id;
	assign c1_l2ittodr_req.cmd = c1_l2ittodr_req_cmd;
	assign c1_l2ittodr_req.paddr = c1_l2ittodr_req_paddr;
	I_drtol2_snack_type c1_drtol2it_snack;
	assign c1_drtol2it_snack_nid = c1_drtol2it_snack.nid;
	assign c1_drtol2it_snack_l2id = c1_drtol2it_snack.l2id;
	assign c1_drtol2it_snack_drid = c1_drtol2it_snack.drid;
	assign c1_drtol2it_snack_snack = c1_drtol2it_snack.snack;
	assign c1_drtol2it_snack_line = c1_drtol2it_snack.line;
	assign c1_drtol2it_snack_paddr = c1_drtol2it_snack.paddr;
	I_l2snoop_ack_type c1_l2ittodr_snoop_ack;
	assign c1_l2ittodr_snoop_ack.l2id = c1_l2ittodr_snoop_ack_l2id;
	assign c1_l2ittodr_snoop_ack.directory_id = c1_l2ittodr_snoop_ack_directory_id;
	I_l2todr_disp_type c1_l2ittodr_disp;
	assign c1_l2ittodr_disp.nid = c1_l2ittodr_disp_nid;
	assign c1_l2ittodr_disp.l2id = c1_l2ittodr_disp_l2id;
	assign c1_l2ittodr_disp.drid = c1_l2ittodr_disp_drid;
	assign c1_l2ittodr_disp.mask = c1_l2ittodr_disp_mask;
	assign c1_l2ittodr_disp.dcmd = c1_l2ittodr_disp_dcmd;
	assign c1_l2ittodr_disp.line = c1_l2ittodr_disp_line;
	assign c1_l2ittodr_disp.paddr = c1_l2ittodr_disp_paddr;
	I_drtol2_dack_type c1_drtol2it_dack;
	assign c1_drtol2it_dack_nid = c1_drtol2it_dack.nid;
	assign c1_drtol2it_dack_l2id = c1_drtol2it_dack.l2id;
	I_l2todr_req_type c1_l2d_0todr_req;
	assign c1_l2d_0todr_req.nid = c1_l2d_0todr_req_nid;
	assign c1_l2d_0todr_req.l2id = c1_l2d_0todr_req_l2id;
	assign c1_l2d_0todr_req.cmd = c1_l2d_0todr_req_cmd;
	assign c1_l2d_0todr_req.paddr = c1_l2d_0todr_req_paddr;
	I_drtol2_snack_type c1_drtol2d_0_snack;
	assign c1_drtol2d_0_snack_nid = c1_drtol2d_0_snack.nid;
	assign c1_drtol2d_0_snack_l2id = c1_drtol2d_0_snack.l2id;
	assign c1_drtol2d_0_snack_drid = c1_drtol2d_0_snack.drid;
	assign c1_drtol2d_0_snack_snack = c1_drtol2d_0_snack.snack;
	assign c1_drtol2d_0_snack_line = c1_drtol2d_0_snack.line;
	assign c1_drtol2d_0_snack_paddr = c1_drtol2d_0_snack.paddr;
	I_l2snoop_ack_type c1_l2d_0todr_snoop_ack;
	assign c1_l2d_0todr_snoop_ack.l2id = c1_l2d_0todr_snoop_ack_l2id;
	assign c1_l2d_0todr_snoop_ack.directory_id = c1_l2d_0todr_snoop_ack_directory_id;
	I_l2todr_disp_type c1_l2d_0todr_disp;
	assign c1_l2d_0todr_disp.nid = c1_l2d_0todr_disp_nid;
	assign c1_l2d_0todr_disp.l2id = c1_l2d_0todr_disp_l2id;
	assign c1_l2d_0todr_disp.drid = c1_l2d_0todr_disp_drid;
	assign c1_l2d_0todr_disp.mask = c1_l2d_0todr_disp_mask;
	assign c1_l2d_0todr_disp.dcmd = c1_l2d_0todr_disp_dcmd;
	assign c1_l2d_0todr_disp.line = c1_l2d_0todr_disp_line;
	assign c1_l2d_0todr_disp.paddr = c1_l2d_0todr_disp_paddr;
	I_drtol2_dack_type c1_drtol2d_0_dack;
	assign c1_drtol2d_0_dack_nid = c1_drtol2d_0_dack.nid;
	assign c1_drtol2d_0_dack_l2id = c1_drtol2d_0_dack.l2id;
	I_l2todr_pfreq_type c1_l2d_0todr_pfreq;
	assign c1_l2d_0todr_pfreq.nid = c1_l2d_0todr_pfreq_nid;
	assign c1_l2d_0todr_pfreq.paddr = c1_l2d_0todr_pfreq_paddr;
	I_l2todr_req_type c1_l2dt_0todr_req;
	assign c1_l2dt_0todr_req.nid = c1_l2dt_0todr_req_nid;
	assign c1_l2dt_0todr_req.l2id = c1_l2dt_0todr_req_l2id;
	assign c1_l2dt_0todr_req.cmd = c1_l2dt_0todr_req_cmd;
	assign c1_l2dt_0todr_req.paddr = c1_l2dt_0todr_req_paddr;
	I_drtol2_snack_type c1_drtol2dt_0_snack;
	assign c1_drtol2dt_0_snack_nid = c1_drtol2dt_0_snack.nid;
	assign c1_drtol2dt_0_snack_l2id = c1_drtol2dt_0_snack.l2id;
	assign c1_drtol2dt_0_snack_drid = c1_drtol2dt_0_snack.drid;
	assign c1_drtol2dt_0_snack_snack = c1_drtol2dt_0_snack.snack;
	assign c1_drtol2dt_0_snack_line = c1_drtol2dt_0_snack.line;
	assign c1_drtol2dt_0_snack_paddr = c1_drtol2dt_0_snack.paddr;
	I_l2snoop_ack_type c1_l2dt_0todr_snoop_ack;
	assign c1_l2dt_0todr_snoop_ack.l2id = c1_l2dt_0todr_snoop_ack_l2id;
	assign c1_l2dt_0todr_snoop_ack.directory_id = c1_l2dt_0todr_snoop_ack_directory_id;
	I_l2todr_disp_type c1_l2dt_0todr_disp;
	assign c1_l2dt_0todr_disp.nid = c1_l2dt_0todr_disp_nid;
	assign c1_l2dt_0todr_disp.l2id = c1_l2dt_0todr_disp_l2id;
	assign c1_l2dt_0todr_disp.drid = c1_l2dt_0todr_disp_drid;
	assign c1_l2dt_0todr_disp.mask = c1_l2dt_0todr_disp_mask;
	assign c1_l2dt_0todr_disp.dcmd = c1_l2dt_0todr_disp_dcmd;
	assign c1_l2dt_0todr_disp.line = c1_l2dt_0todr_disp_line;
	assign c1_l2dt_0todr_disp.paddr = c1_l2dt_0todr_disp_paddr;
	I_drtol2_dack_type c1_drtol2dt_0_dack;
	assign c1_drtol2dt_0_dack_nid = c1_drtol2dt_0_dack.nid;
	assign c1_drtol2dt_0_dack_l2id = c1_drtol2dt_0_dack.l2id;
	I_l2todr_req_type l2todr0_req;
	assign l2todr0_req_nid = l2todr0_req.nid;
	assign l2todr0_req_l2id = l2todr0_req.l2id;
	assign l2todr0_req_cmd = l2todr0_req.cmd;
	assign l2todr0_req_paddr = l2todr0_req.paddr;
	I_drtol2_snack_type dr0tol2_snack;
	assign dr0tol2_snack.nid = dr0tol2_snack_nid;
	assign dr0tol2_snack.l2id = dr0tol2_snack_l2id;
	assign dr0tol2_snack.drid = dr0tol2_snack_drid;
	assign dr0tol2_snack.snack = dr0tol2_snack_snack;
	assign dr0tol2_snack.line = dr0tol2_snack_line;
	assign dr0tol2_snack.paddr = dr0tol2_snack_paddr;
	I_l2todr_disp_type l2todr0_disp;
	assign l2todr0_disp_nid = l2todr0_disp.nid;
	assign l2todr0_disp_l2id = l2todr0_disp.l2id;
	assign l2todr0_disp_drid = l2todr0_disp.drid;
	assign l2todr0_disp_mask = l2todr0_disp.mask;
	assign l2todr0_disp_dcmd = l2todr0_disp.dcmd;
	assign l2todr0_disp_line = l2todr0_disp.line;
	assign l2todr0_disp_paddr = l2todr0_disp.paddr;
	I_drtol2_dack_type dr0tol2_dack;
	assign dr0tol2_dack.nid = dr0tol2_dack_nid;
	assign dr0tol2_dack.l2id = dr0tol2_dack_l2id;
	I_drsnoop_ack_type l2todr0_snoop_ack;
	assign l2todr0_snoop_ack_drid = l2todr0_snoop_ack.drid;
	I_l2todr_pfreq_type l2todr0_pfreq;
	assign l2todr0_pfreq_nid = l2todr0_pfreq.nid;
	assign l2todr0_pfreq_paddr = l2todr0_pfreq.paddr;
	I_l2todr_req_type l2todr1_req;
	assign l2todr1_req_nid = l2todr1_req.nid;
	assign l2todr1_req_l2id = l2todr1_req.l2id;
	assign l2todr1_req_cmd = l2todr1_req.cmd;
	assign l2todr1_req_paddr = l2todr1_req.paddr;
	I_drtol2_snack_type dr1tol2_snack;
	assign dr1tol2_snack.nid = dr1tol2_snack_nid;
	assign dr1tol2_snack.l2id = dr1tol2_snack_l2id;
	assign dr1tol2_snack.drid = dr1tol2_snack_drid;
	assign dr1tol2_snack.snack = dr1tol2_snack_snack;
	assign dr1tol2_snack.line = dr1tol2_snack_line;
	assign dr1tol2_snack.paddr = dr1tol2_snack_paddr;
	I_l2todr_disp_type l2todr1_disp;
	assign l2todr1_disp_nid = l2todr1_disp.nid;
	assign l2todr1_disp_l2id = l2todr1_disp.l2id;
	assign l2todr1_disp_drid = l2todr1_disp.drid;
	assign l2todr1_disp_mask = l2todr1_disp.mask;
	assign l2todr1_disp_dcmd = l2todr1_disp.dcmd;
	assign l2todr1_disp_line = l2todr1_disp.line;
	assign l2todr1_disp_paddr = l2todr1_disp.paddr;
	I_drtol2_dack_type dr1tol2_dack;
	assign dr1tol2_dack.nid = dr1tol2_dack_nid;
	assign dr1tol2_dack.l2id = dr1tol2_dack_l2id;
	I_drsnoop_ack_type l2todr1_snoop_ack;
	assign l2todr1_snoop_ack_drid = l2todr1_snoop_ack.drid;
	I_l2todr_pfreq_type l2todr1_pfreq;
	assign l2todr1_pfreq_nid = l2todr1_pfreq.nid;
	assign l2todr1_pfreq_paddr = l2todr1_pfreq.paddr;
 /* verilator lint_off UNUSED */
  /* verilator lint_off UNDRIVEN */
net_2core2dr net_2core2dr_dut(.*);
endmodule