module) is True Date? like after jump true data?
	//SPR
	reg b_sysreg_set_spr_valid;
	reg [31:0] b_sysreg_set_spr;
	always@(posedge iCLOCK or negedge inRESET)begin
		if(!inRESET)begin
			b_sysreg_set_spr_valid <= 1'b0;
			b_sysreg_set_spr <= 32'h0;
		end
		else if(iRESET_SYNC)begin
			b_sysreg_set_spr_valid <= 1'b0;
			b_sysreg_set_spr <= 32'h0;
		end
		else begin
			b_sysreg_set_spr_valid <= irq_call_spr_valid || irq_return_spr_valid;
			b_sysreg_set_spr <= (irq_call_spr_valid)? irq_call_spr : irq_return_spr;
		end
	end
	assign oEVENT_SETREG_SPR_SET = b_sysreg_set_spr_valid;
	assign oEVENT_SETREG_SPR = b_sysreg_set_spr;
	//FI0R
	reg b_sysreg_set_fi0r_valid;
	reg [31:0] b_sysreg_set_fi0r;
	always@(posedge iCLOCK or negedge inRESET)begin
		if(!inRESET)begin
			b_sysreg_set_fi0r_valid <= 1'b0;
			b_sysreg_set_fi0r <= 32'h0;
		end
		else if(b_state == L_PARAM_IDLE || iRESET_SYNC)begin
			b_sysreg_set_fi0r_valid <= 1'b0;
			b_sysreg_set_fi0r <= 32'h0;
		end
		else begin
			if(alu_jump_irq_call_start_condition || irq_call_start_condition)begin
				b_sysreg_set_fi0r_valid <= 1'b1;
				b_sysreg_set_fi0r <= iEXCEPT_IRQ_FI0R;
			end
		end
	end
	assign oEVENT_SETREG_FI0R_SET = b_sysreg_set_fi0r_valid;
	assign oEVENT_SETREG_FI0R = b_sysreg_set_fi0r;
	//FI1R
	reg b_sysreg_set_fi1r_valid;
	reg [31:0] b_sysreg_set_fi1r;
	always@(posedge iCLOCK or negedge inRESET)begin
		if(!inRESET)begin
			b_sysreg_set_fi1r_valid <= 1'b0;
			b_sysreg_set_fi1r <= 32'h0;
		end
		else if(b_state == L_PARAM_IDLE || iRESET_SYNC)begin
			b_sysreg_set_fi1r_valid <= 1'b0;
			b_sysreg_set_fi1r <= 32'h0;
		end
		else begin
			if(alu_jump_irq_call_start_condition || irq_call_start_condition)begin
				b_sysreg_set_fi1r_valid <= 1'b1;
				b_sysreg_set_fi1r <= iEXCEPT_IRQ_FI1R;
			end
		end
	end
	assign oEVENT_SETREG_FI1R_SET = b_sysreg_set_fi1r_valid;
	assign oEVENT_SETREG_FI1R = b_sysreg_set_fi1r;
	/****************************************************************************************************
	Assign
	assign oEVENT_CACHE_ERASE = 1'b0;
	assign oEVENT_TLB_ERASE = 1'b0;
	/****************************************************************************************************
	Pipeline Control - Timing
	reg b_event_hold			/* synthesis syn_maxfan = 250 */;		//Altera QuartusII Synthesis Option : Max fanout
	reg b_event_start			/* synthesis syn_maxfan = 250 */;		//Altera QuartusII Synthesis Option : Max fanout
	reg b_event_irq_front2back	/* synthesis syn_maxfan = 250 */;		//Altera QuartusII Synthesis Option : Max fanout
	reg b_event_irq_back2front	/* synthesis syn_maxfan = 250 */;		//Altera QuartusII Synthesis Option : Max fanout
	reg b_event_end				/* synthesis syn_maxfan = 250 */;		//Altera QuartusII Synthesis Option : Max fanout
	assign oEVENT_HOLD = b_event_hold;
	assign oEVENT_START = b_event_start;
	assign oEVENT_IRQ_FRONT2BACK = b_event_irq_front2back;
	assign oEVENT_IRQ_BACK2FRONT = b_event_irq_back2front;
	assign oEVENT_END = b_event_end;
	always@(posedge iCLOCK or negedge inRESET)begin
		if(!inRESET)begin
			b_event_hold <= 1'b0;
		end
		else if(iRESET_SYNC)begin
			b_event_hold <= 1'b0;
		end
		else begin
			case(b_state)
				L_PARAM_IDLE:
					begin
						b_event_hold <= (state != L_PARAM_IDLE);
					end
				default:
					begin
						b_event_hold <= b_event_hold;
					end
			endcase
		end
	end
	always@(posedge iCLOCK or negedge inRESET)begin
		if(!inRESET)begin
			b_event_start <= 1'b0;
		end
		else if(iRESET_SYNC)begin
			b_event_start <= 1'b0;
		end
		else begin
			if(b_state == L_PARAM_IDLE)begin
				b_event_start = (state != L_PARAM_IDLE);
			end
			else begin
				b_event_start <= 1'b0;
			end
		end
	end
	always@(posedge iCLOCK or negedge inRESET)begin
		if(!inRESET)begin
			b_event_irq_front2back <= 1'b0;
		end
		else if(iRESET_SYNC)begin
			b_event_irq_front2back <= 1'b0;
		end
		else begin
			case(b_state)
				L_PARAM_IDLE:
					begin
						//Interrupt
						if(irq_call_start_condition || alu_jump_irq_call_start_condition)begin
							b_event_irq_front2back <= 1'b1;
						end
						else begin
							b_event_irq_front2back <= 1'b0;
						end
					end
				default:
					begin
						b_event_irq_front2back <= 1'b0;
					end
			endcase
		end
	end
	always@(posedge iCLOCK or negedge inRESET)begin
		if(!inRESET)begin
			b_event_irq_back2front <= 1'b0;
		end
		else if(iRESET_SYNC)begin
			b_event_irq_back2front <= 1'b0;
		end
		else begin
			case(b_state)
				L_PARAM_IDLE:
					begin
						//Interrupt Return Instruction
						if(irq_return_start_condition)begin
							b_event_irq_back2front <= 1'b1;
						end
						else begin
							b_event_irq_back2front <= 1'b0;
						end
					end
				default:
					begin
						b_event_irq_back2front <= 1'b0;
					end
			endcase
		end
	end
	always@(posedge iCLOCK or negedge inRESET)begin
		if(!inRESET)begin
			b_event_end <= 1'b0;
		end
		else if(iRESET_SYNC)begin
			b_event_end <= 1'b0;
		end
		else begin
			b_event_end <= alu_jump_irq_call_finish_condition || alu_jump_finish_condition || irq_call_finish_condition || irq_return_finish_condition || idt_set_finish_condition || reload_finish_condition;
		end
	end
endmodule