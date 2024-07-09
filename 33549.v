module pippo_if(
	clk, rst,
	iimx_adr_o, iimx_rqt_o, iimx_rty_i,
	iimx_ack_i, iimx_err_i, iimx_dat_i, iimx_adr_i,
	npc_branch, npc_except, npc_branch_valid, npc_except_valid,
	pc_freeze, if_stall, if_freeze, id_freeze, flushpipe,
	id_inst, id_cia, id_valid, id_snia,
	id_sig_ibuserr
);
input				clk;
input				rst;
// IMX I/F to fetch instructions (from cache/ocm/memory controller)
input	[31:0]		iimx_dat_i;
input				iimx_ack_i;
input				iimx_err_i;
input	[31:0]		iimx_adr_i;
input				iimx_rty_i;
output	[31:0]		iimx_adr_o;
output				iimx_rqt_o;
// inst. flow transfer
input   [29:0]      npc_branch;
input               npc_branch_valid;
input   [31:0]      npc_except;         // keep least two address bits to code ISR entrance easily.
input               npc_except_valid;
// pipeline control
input               pc_freeze;
input				if_freeze;
input				id_freeze;
input				flushpipe;
output				if_stall;
// pipeling register
output              id_valid;
output	[31:0]		id_inst;
output	[29:0]		id_cia;
output	[29:0]		id_snia;
// exception request
output				id_sig_ibuserr;
reg                 id_valid;
reg     [31:0]		id_inst;
reg     [29:0]		id_cia;
reg     [29:0]		id_snia;
reg                 id_sig_ibuserr;
reg     [31:0]      npc_value;
reg                 if_valid;
reg     [31:0]      if_inst;
reg     [29:0]      if_cia;
reg                 if_sig_ibuserr;
reg	    [31:0]		pc;
wire                if_rqt_valid;
wire    [32:0]      pcadd4;
wire                except_ibuserr;
// send fetch rqt to I-IMX
assign iimx_adr_o = pc;
assign iimx_rqt_o = if_rqt_valid;
// stall request, waiting for I-IMX response
assign if_stall = ~iimx_ack_i;
// PC Register logic
// NPC source
assign pcadd4={(pc[31:2]+31'd1), 2'b00};
assign fetch_lost = id_freeze & iimx_ack_i;
always @(npc_branch_valid or npc_except_valid or id_freeze or iimx_adr_i or
        fetch_lost or npc_branch or npc_except or pc or pcadd4) begin
	casex ({npc_branch_valid, npc_except_valid, id_freeze, fetch_lost})	// synopsys parallel_case
	    4'b0000: begin
	        npc_value = pcadd4[31:0];
	    end
		4'b0100: begin
			npc_value = npc_except;
		end
		4'b1000: begin
			npc_value = {npc_branch, 2'b00};
		end
		4'b0010: begin                   // if pipeline(if_freeze & id_freeze) is freezon, keep current pc
			npc_value = pc;
		end
		4'b0011: begin
		    npc_value = iimx_adr_i;     // fetch current fetched instruction again
        end
		default: begin
			npc_value = pc;
		end
    endcase
end
// PC update policy
//  1. after hard reset, keep RESET_VECTOR (pcadd4[32]) to avoid overflow
//  2. update pc when
//      a) flushpipe: flush pipeline, fetch with npc
//      b) !iimx_rty_i: current transaction is complete
//      c) fetch lost
always @(posedge clk or posedge rst) begin
    if (rst)
        pc <= #1 `pippo_RESET_VECTOR;
    else if (pcadd4[32] & !flushpipe)   // !flushpipe: keep normal when fetched first branch inst
        pc <= #1 `pippo_RESET_VECTOR;
    else if (flushpipe | (!iimx_rty_i) | fetch_lost)
        pc <= #1 npc_value;
end
// inst. fetch request logic: if_rqt_valid signal
//  1. when flushpipe assert(pc_freeze asserts), if_rqt_valid disassert
//  2. when pipeline freeze(id_freeze freeze), if_rqt_valid disassert to reduce memory access
//          NOT use if_freeze signal to exclude if_stall deadlock, or additional logic is needed for biu
//          deadloack: if_freeze assert at wait state, if you diassert this request, system stop forever.
//  3. hard-reset case: if_rqt_valid assert until RESET_VECTOR's ack(!iimx_rty_i) come, then keep disassertion.
//  At normal state, always send fetch request - if_rqt_valid keep assert, when address ack(!iimx_rty_i) assert
//     or disassert. including case that if_stall asserts, to avoid deadlock: no new fetch send out
//          deadlock: (if_stall raised -> if_freeze assert -> rqt_valid disassert forever)
// after hard reset, to avoid fetch reset vector many times,
//      "!flushpipe" logic is to reduce one cycle delay after reset vector's branch
reg rst_rqt_done;
always @(posedge clk or posedge rst) begin
    if (rst)
        rst_rqt_done <= #1 1'b0;
    else if (flushpipe)
        rst_rqt_done <= #1 1'b0;
    else if (pcadd4[32] & !iimx_rty_i)
        rst_rqt_done <= #1 1'b1;
end
// to check the timing of rqt_valid signal - rqt_valid must have budget for addr_ack logic, i.e.:
// at IMX address phase(cycle 1):
//      Master send out if_rqt_valid, slave check address and give back addr_ack;
//      Addr_ack(!iimx_rty_i) signal must satisfy the setup time, when inputting to master;
// [TBD] register out if_rqt_valid signal to improve timing, add a pipeline bubble under some case
//      note: keep pace with pc update
assign if_rqt_valid = !(pc_freeze | id_freeze | (pcadd4[32] & rst_rqt_done));
// IF/ID pipelining logic
always @(iimx_ack_i or if_freeze or id_freeze or flushpipe or
        if_valid or if_inst or if_cia or
        id_valid or id_inst or id_cia or
        iimx_dat_i or iimx_adr_i or
        except_ibuserr or id_sig_ibuserr) begin
	casex ({iimx_ack_i, if_freeze, id_freeze, flushpipe})	// synopsys parallel_case
		4'b1000: begin       // Normal pipelining. I-IMX returns valid value
            if_valid = 1'b1;
            if_inst = iimx_dat_i;
            if_cia = iimx_adr_i[31:2];
            if_sig_ibuserr = except_ibuserr;
		end
		4'bxxx1: begin       // flushpipe is asserted, insert NOP bubble
            if_valid = 1'b0;
            if_inst = `pippo_PWR_NOP;
            if_cia = id_cia;
            if_sig_ibuserr = 1'b0;
		end
		4'bx100: begin       // if_freeze is asserted, id_freeze is disasserted, insert NOP bubble
            if_valid = 1'b0;
            if_inst = `pippo_PWR_NOP;
            if_cia = id_cia;
            if_sig_ibuserr = 1'b0;
		end
		4'bx110: begin       // if_freeze/id_freeze is asserted, insert KCS bubble
            if_valid = id_valid;
            if_inst = id_inst;
            if_cia = id_cia;
            if_sig_ibuserr = id_sig_ibuserr;
		end
		default: begin      // [TBV]iimx_err_i is asserted
            if_valid = 1'b0;
            if_inst = `pippo_PWR_NOP;
            if_cia = id_cia;
            if_sig_ibuserr = except_ibuserr;
		end
    endcase
end
always @(posedge clk or posedge rst) begin
    if(rst) begin
        id_valid <= #1 1'b0;
        id_inst <= #1 `pippo_PWR_NOP;
        id_cia <= #1 30'd0;
        id_snia <= #1 30'd0;
        id_sig_ibuserr = 1'b0;
    end
    else begin
        id_valid <= #1 if_valid;
        id_inst <= #1 if_inst;
        id_cia <= #1 if_cia;
        id_snia <= #1 pcadd4[31:2];
        id_sig_ibuserr = if_sig_ibuserr;
        `ifdef pippo_VERBOSE
        // synopsys translate_off
            $display("%t: id_valid <= %h", $time, id_valid);
            $display("%t: id_inst <= %h", $time, id_inst);
            $display("%t: id_cia <= %h", $time, id_cia);
            $display("%t: id_snia <= %h", $time, id_snia);
        // synopsys translate_on
        `endif
    end
end
// except request from IF stage
assign except_ibuserr = iimx_err_i & iimx_ack_i;    // err valid only when ack assert
endmodule