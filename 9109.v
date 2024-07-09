module rca110(i_clk, i_rst,
	      mm_adr, mm_we, mm_idat, mm_odat);
   input i_clk;
   input i_rst;
   output reg [11:0] mm_adr;
   output reg 	     mm_we;
   input [23:0]      mm_idat;
   output reg [23:0] mm_odat;
   // Instruction decode
   reg [23:0] 	     r_inst;
   wire [8:0] 	     w_inst_OP;
   wire [2:0] 	     w_inst_T;
   wire [10:0] 	     w_inst_Y;
   assign w_inst_OP = r_inst[23:15];
   assign w_inst_T  = r_inst[14:12];
   assign w_inst_Y  = r_inst[11:0];
   // Registers
   reg [23:0]  r_L;
   reg [23:0]  r_R;
   reg [11:0]  r_PC;
   reg [7:0]   r_JR;
   reg [7:0]   r_JS;
   reg [11:0]  r_XR [6:0];
   integer     i;
   wire 	     w_do_Y_offset;
   reg [11:0] 	     w_Y_wrap;
//   assign w_Y_wrap = (|w_inst_T & w_do_Y_offset) ?
//		     w_inst_Y - m_XR[w_inst_T-1] : w_inst_Y;
   assign w_do_Y_offset = (w_inst_OP == 9'o400) ? 1'b0 : 1'b1;
   wire [23:0] 	     w_store1_data;
   assign w_store1_data = (w_inst_OP == `RCA110_OP_STZ) ? 24'h00 :
			  (w_inst_OP == `RCA110_OP_STL) ? r_L :
			  (w_inst_OP == `RCA110_OP_STR) ? r_R : 24'h00;
   reg [2:0]   r_state;
   reg [2:0]   r_state_next;
   localparam SFETCH1 = 3'b000; // Fetch I
   localparam SFETCH2 = 3'b001; // Decode
   localparam SEXEC1  = 3'b010; // Execute single operations
   localparam SEXEC2  = 3'b011; // Memory Writeback
   // Index register update
   always @(posedge i_clk) begin
      if(i_rst) begin
	 for(i = 0; i < 7; i = i + 1)
	   r_XR[i] <= 0;
	 end
      else begin
	 if(mm_we && (mm_adr >= 12'o0001 && mm_adr <= 12'o0007)) begin
	    $display("r_XR[%d] <= %h", mm_adr, mm_odat);
	    r_XR[mm_adr[2:0] - 1] = mm_odat;
	 end
      end
   end
   always @(posedge i_clk) begin
      if(i_rst) begin
	 mm_adr  <= 0;
	 mm_we   <= 0;
	 mm_odat <= 0;
	 r_L  <= 0;
	 r_R  <= 0;
	 r_PC <= 64;
	 r_JR <= 0;
	 r_JS <= 0;
	 r_state <= SFETCH1;
	 r_state_next <= SFETCH1;
	 r_inst <= 0;
      end
      else begin
	 case(r_state)
	   SFETCH1:
	     begin
		mm_adr  <= r_PC;
		mm_we   <= 0;
		mm_odat <= 0;
		r_state <= SFETCH2;
		r_PC = r_PC+1;
	     end
	   SFETCH2:
	     begin
		r_inst <= mm_idat;
		r_state <= SEXEC1;
		if(|mm_idat[14:12])
		  w_Y_wrap <= mm_idat[11:0] - r_XR[mm_idat[14:12]-1];
		else
		  w_Y_wrap <= mm_idat[11:0];
	     end
	   SEXEC1:
	     begin
		r_state = SFETCH1;
		case(w_inst_OP)
		  // Load & Store
		  `RCA110_OP_STP:
		    begin
		       mm_adr <= w_Y_wrap;
		       mm_we <= 1'b1;
		       mm_odat[11:0] <= ~(r_PC-1);
		       mm_odat[23:12] <= 0;
		    end
		  `RCA110_OP_LDZ:
		    begin
		       r_L <= 0;
		    end
		  `RCA110_OP_LDL,
		  `RCA110_OP_LDR,
		  `RCA110_OP_LDB,
		  `RCA110_OP_ADD,
		  `RCA110_OP_LDA:
		    begin
		       mm_adr <= w_Y_wrap;
		       mm_we <= 0;
		       r_state = SEXEC2;
		       r_state_next = SEXEC2; // Used as flag
		    end
		  `RCA110_OP_STZ,
		  `RCA110_OP_STL,
		  `RCA110_OP_STR:
		    begin
		       mm_adr <= w_Y_wrap;
		       mm_odat <= w_store1_data;
		       mm_we <= 1;
		       r_state <= SFETCH1;
		    end
		  `RCA110_OP_STB:
		    begin
		       mm_adr <= w_Y_wrap;
		       mm_odat <= r_R;
		       mm_we <= 1;
		       r_state <= SEXEC2;
		    end
		  `RCA110_OP_STA:
		    // First fetch than save since it only affects bit 11:0
		    begin
		       mm_adr <= w_Y_wrap;
		       r_state <= SEXEC2;
		    end
		endcase // case (w_inst_OP)
	     end // case: SEXEC1
	   SEXEC2:
	     begin
		case(w_inst_OP)
		  `RCA110_OP_LDL:
		    begin
		       r_L <= mm_idat;
		    end
		  `RCA110_OP_LDR:
		    begin
		       r_R <= mm_idat;
		    end
		  `RCA110_OP_LDB:
		    begin
		       if(r_state_next == SEXEC2) begin
			  r_R <= mm_idat;
			  mm_adr <= w_Y_wrap+1;
			  r_state_next <= SFETCH1;
		       end
		       else begin
			  r_L <= mm_idat;
			  r_state <= SFETCH1;
		       end
		    end // case: `RCA110_OP_LDB
		  `RCA110_OP_LDA:
		    begin
		       r_L[11:0] <= mm_idat[11:0];
		       r_state <= SFETCH1;
		    end
		  `RCA110_OP_STB:
		    begin
		       mm_adr <= w_Y_wrap+1;
		       mm_odat <= r_L;
		       r_state <= SFETCH1;
		    end
		  `RCA110_OP_STA:
		    begin
		       mm_adr <= w_Y_wrap;
		       mm_odat[23:12] <= mm_idat[23:12];
		       mm_odat[11:0] <= r_L[11:0];
		       mm_we <= 1;
		    end
		  `RCA110_OP_ADD,
		  `RCA110_OP_ADR:
		    begin
		       r_L = r_L + mm_idat;
		       mm_odat <= r_L + mm_idat;
		       mm_we <= 1'b1;
		       mm_adr <= w_Y_wrap;
		    end
		endcase // case (w_inst_OP)
	     end
	 endcase // case (r_state)
      end
   end
endmodule