module i2c_cpx_cnt (/*AUTOARG*/
   // Outputs
   cpx_buf_full,
   // Inputs
   rst_l, clk, iob_cpx_req_next, cpx_iob_grant
   );
// Signal declarations
   // Global interface
   input         rst_l;
   input 	 clk;
   // Fast control interface
   input 	 iob_cpx_req_next;
   input 	 cpx_iob_grant;
   output 	 cpx_buf_full;
   // Internal signals
   wire 	 cpx_cnt_plus1_sel;
   wire 	 cpx_cnt_minus1_sel;
   wire [1:0] 	 cpx_cnt_plus1;
   wire [1:0] 	 cpx_cnt_minus1;
   wire [1:0] 	 cpx_cnt;
   reg [1:0] 	 cpx_cnt_next;
   wire 	 cpx_buf_full;
// Code starts here
   /************************************************************
   // Assertion: request cannot be asserted if count is 2
   //            grant cannot be asserted if count is 0
   assign 	 cpx_cnt_plus1_sel = iob_cpx_req_next & ~cpx_iob_grant;
   assign 	 cpx_cnt_minus1_sel = cpx_iob_grant &  ~iob_cpx_req_next;
   assign 	 cpx_cnt_plus1 = cpx_cnt + 2'b01;
   assign 	 cpx_cnt_minus1 = cpx_cnt - 2'b01;
   always @(/*AUTOSENSE*/cpx_cnt or cpx_cnt_minus1
	    or cpx_cnt_minus1_sel or cpx_cnt_plus1
	    or cpx_cnt_plus1_sel)
     case ({cpx_cnt_minus1_sel,cpx_cnt_plus1_sel}) // synopsys infer_mux
       2'b00:cpx_cnt_next = cpx_cnt;
       2'b01:cpx_cnt_next = cpx_cnt_plus1;
       2'b10:cpx_cnt_next = cpx_cnt_minus1;
       2'b11:cpx_cnt_next = cpx_cnt;               // this case should never happen
     endcase // case(cpx_cnt_plus1_sel,cpx_cnt_minus1_sel)
   dffrl_ns #(2) cpx_cnt_ff (.din(cpx_cnt_next),
	       	             .clk(clk),
			     .rst_l(rst_l),
		             .q(cpx_cnt));
   assign 	 cpx_buf_full = cpx_cnt[1];
endmodule