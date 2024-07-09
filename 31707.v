module blk_mem_axi_regs_fwd_v8_1
  #(parameter C_DATA_WIDTH = 8
   )(
    input   ACLK,
    input   ARESET,
    input   S_VALID,
    output  S_READY,
    input   [C_DATA_WIDTH-1:0] S_PAYLOAD_DATA,
    output  M_VALID,
    input   M_READY,
    output  reg [C_DATA_WIDTH-1:0] M_PAYLOAD_DATA
    );
    reg  [C_DATA_WIDTH-1:0] STORAGE_DATA;
    wire S_READY_I;
    reg  M_VALID_I;
    reg  [1:0] ARESET_D;
      //assign local signal to its output signal
      assign S_READY = S_READY_I;
      assign M_VALID = M_VALID_I;
   always @(posedge ACLK) begin
	  ARESET_D <= {ARESET_D[0], ARESET};
	end
      //Save payload data whenever we have a transaction on the slave side
   always @(posedge ACLK or ARESET) begin
        if (ARESET == 1'b1) begin
  	    STORAGE_DATA <= 0;
	end else begin
	  if(S_VALID == 1'b1 && S_READY_I == 1'b1 ) begin
  	    STORAGE_DATA <= S_PAYLOAD_DATA;
  	  end
  	end
     end
   always @(posedge ACLK) begin
     M_PAYLOAD_DATA = STORAGE_DATA;
   end
      //M_Valid set to high when we have a completed transfer on slave side
      //Is removed on a M_READY except if we have a new transfer on the slave side
   always @(posedge ACLK or ARESET_D) begin
	if (ARESET_D != 2'b00) begin
  	    M_VALID_I <= 1'b0;
	end else begin
	  if (S_VALID == 1'b1) begin
	    //Always set M_VALID_I when slave side is valid
            M_VALID_I <= 1'b1;
	  end else if (M_READY == 1'b1 ) begin
	    //Clear (or keep) when no slave side is valid but master side is ready
	    M_VALID_I <= 1'b0;
	  end
	end
      end
      //Slave Ready is either when Master side drives M_READY or we have space in our storage data
      assign S_READY_I = (M_READY || (!M_VALID_I)) && !(|(ARESET_D));
  endmodule