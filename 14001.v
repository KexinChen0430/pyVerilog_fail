module l2tlb_wp(
  /* verilator lint_off UNUSED */
	input	logic				clk
	,input	logic				reset
  // L2TLB listens the same L1 request (but no ack). Response sent to L2
	,input	logic			l1tol2tlb_req_valid
	,output	logic			l1tol2tlb_req_retry
	,input	L1_reqid_type		l1tol2tlb_req_l1id			// 5 bits
	,input	logic			l1tol2tlb_req_prefetch
	,input	TLB_hpaddr_type		l1tol2tlb_req_hpaddr			// 11 bits
	,output	logic			l2tlbtol2_fwd_valid
	,input	logic			l2tlbtol2_fwd_retry
	,output	L1_reqid_type		l2tlbtol2_fwd_l1id			// 5 bits
	,output	logic			l2tlbtol2_fwd_prefetch
	,output	SC_fault_type		l2tlbtol2_fwd_fault			// 3 bits
	,output	TLB_hpaddr_type		l2tlbtol2_fwd_hpaddr			// 11 bits
	,output	SC_paddr_type		l2tlbtol2_fwd_paddr			// 50 bits
  // l1TLB and L2TLB interface
	,output	logic			l2tlbtol1tlb_snoop_valid
	,input	logic			l2tlbtol1tlb_snoop_retry
	,output	TLB_reqid_type		l2tlbtol1tlb_snoop_rid			// 2 bits
	,output	TLB_hpaddr_type		l2tlbtol1tlb_snoop_hpaddr		// 11 bits
	,output	logic			l2tlbtol1tlb_ack_valid
	,input	logic			l2tlbtol1tlb_ack_retry
	,output	TLB_reqid_type		l2tlbtol1tlb_ack_rid			// 2 bits
	,output	TLB_hpaddr_type		l2tlbtol1tlb_ack_hpaddr			// 11 bits
	,output	SC_ppaddr_type		l2tlbtol1tlb_ack_ppaddr			// 3 bits
	,output	SC_dctlbe_type		l2tlbtol1tlb_ack_dctlbe			// 13 bits
	,input	logic			l1tlbtol2tlb_req_valid
	,output	logic			l1tlbtol2tlb_req_retry
	,input	TLB_reqid_type		l1tlbtol2tlb_req_rid			// 2 bits
	,input	logic			l1tlbtol2tlb_req_disp_req
	,input	logic			l1tlbtol2tlb_req_disp_A
	,input	logic			l1tlbtol2tlb_req_disp_D
	,input	TLB_hpaddr_type		l1tlbtol2tlb_req_disp_hpaddr		// 11 bits
	,input	SC_laddr_type		l1tlbtol2tlb_req_laddr			// 39 bits
	,input	SC_sptbr_type		l1tlbtol2tlb_req_sptbr			// 38 bits
	,input	logic			l1tlbtol2tlb_sack_valid
	,output	logic			l1tlbtol2tlb_sack_retry
	,input	TLB_reqid_type		l1tlbtol2tlb_sack_rid			// 2 bits
  // Directory interface (l2 has to arbitrate between L2 and L2TLB
  // messages based on nodeid. Even nodeid is L2, odd is L2TLB)
	,output	logic			l2todr_req_valid
	,input	logic			l2todr_req_retry
	,output	SC_nodeid_type		l2todr_req_nid				// 5 bits
	,output	L2_reqid_type		l2todr_req_l2id				// 6 bits
	,output	SC_cmd_type		l2todr_req_cmd				// 3 bits
	,output	SC_paddr_type		l2todr_req_paddr			// 50 bits
	,input	logic			drtol2_snack_valid
	,output	logic			drtol2_snack_retry
	,input	SC_nodeid_type		drtol2_snack_nid			// 5 bits
	,input	L2_reqid_type		drtol2_snack_l2id			// 6 bits
	,input	DR_reqid_type		drtol2_snack_drid			// 6 bits
	,input  DR_ndirs_type      	drtol2_snack_directory_id		// 2 bits
	,input	SC_snack_type		drtol2_snack_snack			// 5 bits
	,input	SC_line_type		drtol2_snack_line			// 512 bits
	,input  DR_hpaddr_base_type	drtol2_snack_hpaddr_base		// 17 bits
	,input  DR_hpaddr_hash_type	drtol2_snack_hpaddr_hash		// 8 bits
	,input	SC_paddr_type		drtol2_snack_paddr			// 50 bits
	,output	logic			l2todr_snoop_ack_valid
	,input	logic			l2todr_snoop_ack_retry
	,output	L2_reqid_type		l2todr_snoop_ack_l2id			// 6 bits
	,output DR_ndirs_type     	l2todr_snoop_ack_directory_id		// 2 bits
	,output	logic			l2todr_disp_valid
	,input	logic			l2todr_disp_retry
	,output	SC_nodeid_type		l2todr_disp_nid				// 5 bits
	,output	L2_reqid_type		l2todr_disp_l2id			// 6 bits
	,output	DR_reqid_type		l2todr_disp_drid			// 6 bits
	,output	SC_disp_mask_type	l2todr_disp_mask			// 64 bits
	,output	SC_dcmd_type		l2todr_disp_dcmd			// 3 bits
	,output	SC_line_type		l2todr_disp_line			// 512 bits
	,output	SC_paddr_type		l2todr_disp_paddr			// 50 bits
	,input	logic			drtol2_dack_valid
	,output	logic			drtol2_dack_retry
	,input	SC_nodeid_type		drtol2_dack_nid				// 5 bits
	,input	L2_reqid_type		drtol2_dack_l2id			// 6 bits
  /* verilator lint_on UNUSED */
);
	I_l1tol2tlb_req_type l1tol2tlb_req;
	assign l1tol2tlb_req.l1id = l1tol2tlb_req_l1id;
	assign l1tol2tlb_req.prefetch = l1tol2tlb_req_prefetch;
	assign l1tol2tlb_req.hpaddr = l1tol2tlb_req_hpaddr;
	I_l2tlbtol2_fwd_type l2tlbtol2_fwd;
	assign l2tlbtol2_fwd_l1id = l2tlbtol2_fwd.l1id;
	assign l2tlbtol2_fwd_prefetch = l2tlbtol2_fwd.prefetch;
	assign l2tlbtol2_fwd_fault = l2tlbtol2_fwd.fault;
	assign l2tlbtol2_fwd_hpaddr = l2tlbtol2_fwd.hpaddr;
	assign l2tlbtol2_fwd_paddr = l2tlbtol2_fwd.paddr;
	I_l2tlbtol1tlb_snoop_type l2tlbtol1tlb_snoop;
	assign l2tlbtol1tlb_snoop_rid = l2tlbtol1tlb_snoop.rid;
	assign l2tlbtol1tlb_snoop_hpaddr = l2tlbtol1tlb_snoop.hpaddr;
	I_l2tlbtol1tlb_ack_type l2tlbtol1tlb_ack;
	assign l2tlbtol1tlb_ack_rid = l2tlbtol1tlb_ack.rid;
	assign l2tlbtol1tlb_ack_hpaddr = l2tlbtol1tlb_ack.hpaddr;
	assign l2tlbtol1tlb_ack_ppaddr = l2tlbtol1tlb_ack.ppaddr;
	assign l2tlbtol1tlb_ack_dctlbe = l2tlbtol1tlb_ack.dctlbe;
	I_l1tlbtol2tlb_req_type l1tlbtol2tlb_req;
	assign l1tlbtol2tlb_req.rid = l1tlbtol2tlb_req_rid;
	assign l1tlbtol2tlb_req.disp_req = l1tlbtol2tlb_req_disp_req;
	assign l1tlbtol2tlb_req.disp_A = l1tlbtol2tlb_req_disp_A;
	assign l1tlbtol2tlb_req.disp_D = l1tlbtol2tlb_req_disp_D;
	assign l1tlbtol2tlb_req.disp_hpaddr = l1tlbtol2tlb_req_disp_hpaddr;
	assign l1tlbtol2tlb_req.laddr = l1tlbtol2tlb_req_laddr;
	assign l1tlbtol2tlb_req.sptbr = l1tlbtol2tlb_req_sptbr;
	I_l1tlbtol2tlb_sack_type l1tlbtol2tlb_sack;
	assign l1tlbtol2tlb_sack.rid = l1tlbtol2tlb_sack_rid;
	I_l2todr_req_type l2todr_req;
	assign l2todr_req_nid = l2todr_req.nid;
	assign l2todr_req_l2id = l2todr_req.l2id;
	assign l2todr_req_cmd = l2todr_req.cmd;
	assign l2todr_req_paddr = l2todr_req.paddr;
	I_drtol2_snack_type drtol2_snack;
	assign drtol2_snack.nid = drtol2_snack_nid;
	assign drtol2_snack.l2id = drtol2_snack_l2id;
	assign drtol2_snack.drid = drtol2_snack_drid;
	assign drtol2_snack.directory_id = drtol2_snack_directory_id;
	assign drtol2_snack.snack = drtol2_snack_snack;
	assign drtol2_snack.line = drtol2_snack_line;
	assign drtol2_snack.hpaddr_base	= drtol2_snack_hpaddr_base;
	assign drtol2_snack.hpaddr_hash	= drtol2_snack_hpaddr_hash;
	assign drtol2_snack.paddr = drtol2_snack_paddr;
	I_l2snoop_ack_type l2todr_snoop_ack;
	assign l2todr_snoop_ack_l2id = l2todr_snoop_ack.l2id;
	assign l2todr_snoop_ack_directory_id = l2todr_snoop_ack.directory_id;
	I_l2todr_disp_type l2todr_disp;
	assign l2todr_disp_nid = l2todr_disp.nid;
	assign l2todr_disp_l2id = l2todr_disp.l2id;
	assign l2todr_disp_drid = l2todr_disp.drid;
	assign l2todr_disp_mask = l2todr_disp.mask;
	assign l2todr_disp_dcmd = l2todr_disp.dcmd;
	assign l2todr_disp_line = l2todr_disp.line;
	assign l2todr_disp_paddr = l2todr_disp.paddr;
	I_drtol2_dack_type drtol2_dack;
	assign drtol2_dack.nid = drtol2_dack_nid;
	assign drtol2_dack.l2id = drtol2_dack_l2id;
l2tlb top(.*);
endmodule