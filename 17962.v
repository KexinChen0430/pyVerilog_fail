module uart_tx_dumper #(parameter [0:0] P = 0 ) ( input wire i_clk, input wire i_line );
localparam UART_WAIT_FOR_START = 0;
localparam UART_RX             = 1;
localparam UART_STOP_BIT       = 2;
integer                 uart_state   = UART_WAIT_FOR_START;
reg                     uart_sof     = 1'd0;
reg                     uart_eof     = 1'd0;
integer                 uart_ctr     = 0;
integer                 uart_bit_ctr = 1'dx;
reg [7:0]               uart_sr      = 0;
reg [7:0]               UART_SR      = 0;
reg                     UART_SR_DAV  = 0;
wire                    uart;
integer    signed       fh;
assign uart = i_line;
always @ ( posedge i_clk )
begin
        UART_SR_DAV = 1'd0;
        uart_sof = 1'd0;
        uart_eof = 1'd0;
        case ( uart_state )
                UART_WAIT_FOR_START:
                begin
                        if ( !uart )
                        begin
                                uart_ctr = uart_ctr + 1;
                                uart_sof = 1'd1;
                        end
                        if ( !uart && uart_ctr == 16  )
                        begin
                                uart_sof     = 1'd0;
                                uart_state   = UART_RX;
                                uart_ctr     = 0;
                                uart_bit_ctr = 0;
                        end
                end
                UART_RX:
                begin
                        uart_ctr++;
                        if ( uart_ctr == 2 )
                                uart_sr = uart_sr >> 1 | uart << 7;
                        if ( uart_ctr == 16 )
                        begin
                                uart_bit_ctr++;
                                uart_ctr = 0;
                                if ( uart_bit_ctr == 8 )
                                begin
                                        uart_state  = UART_STOP_BIT;
                                        UART_SR     = uart_sr;
                                        UART_SR_DAV = 1'd1;
                                        uart_ctr    = 0;
                                        uart_bit_ctr = 0;
                                end
                        end
                end
                UART_STOP_BIT:
                begin
                        uart_ctr++;
                        if ( uart && uart_ctr == 16 ) // Stop bit.
                        begin
                                uart_state      = UART_WAIT_FOR_START;
                                uart_bit_ctr    = 0;
                                uart_ctr        = 0;
                        end
                end
        endcase
end
initial
begin
        if ( P == 0 )
                fh = $fopen(`UART0_FILE_PATH_TX, "w");
        else
                fh = $fopen(`UART1_FILE_PATH_TX, "w");
        if ( fh == -1 )
        begin
                $display($time, " - %m :: Error: Failed to open UART output log.");
                $finish;
        end
end
always @ (negedge i_clk)
begin
        if ( UART_SR_DAV )
        begin
                $display("UART Wrote %c", UART_SR);
                $fwrite(fh, "%c", UART_SR);
                $fflush(fh);
        end
end
endmodule