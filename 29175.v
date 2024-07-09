module txfifo #(
	parameter DATA_WIDTH=64,
        parameter LOCAL_FIFO_DEPTH=256
) (
	clock,
	aclr,
	data,
	rdreq,
	wrreq,
	almost_full,
	almost_empty,
	empty,
	full,
	q,
	usedw);
function integer log2;
      input integer number;
      begin
         log2=0;
         while(2**log2<number) begin
            log2=log2+1;
         end
      end
endfunction // log2
	localparam FIFO_ADDR_WIDTH=log2(LOCAL_FIFO_DEPTH);
	input	  clock;
	input	aclr;
	input	[DATA_WIDTH-1:0]  data;
	input	  rdreq;
	input	  wrreq;
	output	  almost_full;
	output	  almost_empty;
	output	  empty;
	output	  full;
	output	[DATA_WIDTH-1:0]  q;
	output	[FIFO_ADDR_WIDTH-1:0]  usedw;
	wire [FIFO_ADDR_WIDTH-1:0] sub_wire0;
	wire  sub_wire1;
	wire  sub_wire2;
	wire [DATA_WIDTH-1:0] sub_wire3;
	wire  sub_wire4;
	wire [FIFO_ADDR_WIDTH-1:0] usedw = sub_wire0[FIFO_ADDR_WIDTH-1:0];
	wire  empty = sub_wire1;
	wire  full = sub_wire2;
	wire [DATA_WIDTH-1:0] q = sub_wire3[DATA_WIDTH-1:0];
	wire  almost_full = sub_wire4;
	scfifo	scfifo_component (
				.clock (clock),
				.wrreq (wrreq),
				.data (data),
				.rdreq (rdreq),
				.usedw (sub_wire0),
				.empty (sub_wire1),
				.full (sub_wire2),
				.q (sub_wire3),
				.almost_full (sub_wire4),
				.aclr (aclr),
				.almost_empty (almost_empty),
				.sclr ());
	defparam
		scfifo_component.add_ram_output_register = "OFF",
		scfifo_component.almost_full_value = 3*LOCAL_FIFO_DEPTH/4,
		scfifo_component.almost_empty_value = 1*LOCAL_FIFO_DEPTH/4,
		scfifo_component.intended_device_family = "Stratix IV",
		scfifo_component.lpm_numwords = LOCAL_FIFO_DEPTH,
		scfifo_component.lpm_showahead = "OFF",
		scfifo_component.lpm_type = "scfifo",
		scfifo_component.lpm_width = DATA_WIDTH,
		scfifo_component.lpm_widthu = FIFO_ADDR_WIDTH,
		scfifo_component.overflow_checking = "ON",
		scfifo_component.underflow_checking = "ON",
		scfifo_component.use_eab = "ON";
endmodule