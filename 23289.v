module i2c_cpu( input         CLK,
				input		  CLK_I2C,
                input         RESET,
                input         WE,
                input  [31:0] DATA_IN,
                output [31:0] DATA_OUT,
                inout         SDA,
                inout         SCL );
wire ready, active;
reg  [8:0] datain;
wire [8:0] dataout;
reg [1:0] state = 0, nextstate;
reg req_start, req_stop, req_io;
wire req_en = (state == 2'd1);
always@(*)
  case(state)
  2'd0: if(WE)     nextstate = 2'd1;
        else       nextstate = 2'd0;
  2'd1: if(!ready) nextstate = 2'd2;
        else       nextstate = 2'd1;
  2'd2: if(ready)  nextstate = 2'd0;
        else       nextstate = 2'd2;
  default:         nextstate = 2'd0;
  endcase
always@ (posedge CLK)
  if(RESET) state <= 2'd0;
  else
    begin
    state <= nextstate;
    if(WE)
      begin
      datain <= { DATA_IN[7:0], DATA_IN[8] };
      req_start <= DATA_IN[18];
      req_io    <= DATA_IN[17];
      req_stop  <= DATA_IN[16];
      end
    end
assign DATA_OUT = { state != 2'd0,
                    active,
                    21'd0,
                    dataout[0],
                    dataout[8:1] };
/*
reg CLK_I2C = 0;
reg [6:0] clk_div = 0;
always@ (posedge CLK)
	begin
	if(clk_div == 16)
		begin
		clk_div <= 6'd0;
		CLK_I2C <= ~CLK_I2C;
		end
	else clk_div <= clk_div + 6'd1;
	end
*/
i2c i2c_module( .CLK           ( CLK_I2C            ),
                .RESET         ( RESET              ),
                .DATA_IN       ( datain             ),
                .DATA_OUT      ( dataout            ),
                .REQUEST_IO    ( req_io    & req_en ),
                .REQUEST_START ( req_start & req_en ),
                .REQUEST_STOP  ( req_stop  & req_en ),
                .READY         ( ready              ),
                .ACTIVE        ( active             ),
                .SDA           ( SDA                ),
                .SCL           ( SCL                ) );
endmodule