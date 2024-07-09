module uart_rx_logger #(parameter [0:0] P = 0 ) ( input wire i_clk, output reg o_line = 1'd1 );
integer signed    fh;
reg               feof;
integer signed    wchar;
initial
begin
        if ( P == 0 )
                fh = $fopen(`UART0_FILE_PATH_RX, "r");
        else
                fh = $fopen(`UART1_FILE_PATH_RX, "r");
        if ( fh == 0 )
        begin
                $display($time, " - %m :: Error: Failed to open UART input stream. Handle = %d", fh);
                $finish;
        end
        while ( 1 )
        begin
               wchar = $fgetc(fh);
               if ( wchar > 0 )
               begin
                       write_to_uart (wchar);
               end
               else
               begin
                       @(posedge i_clk);
               end
        end
end
task write_to_uart ( input integer signed wchar );
begin
        repeat(16) @(posedge i_clk) o_line <=     1'd0;
        repeat(16) @(posedge i_clk) o_line <= wchar[0];
        repeat(16) @(posedge i_clk) o_line <= wchar[1];
        repeat(16) @(posedge i_clk) o_line <= wchar[2];
        repeat(16) @(posedge i_clk) o_line <= wchar[3];
        repeat(16) @(posedge i_clk) o_line <= wchar[4];
        repeat(16) @(posedge i_clk) o_line <= wchar[5];
        repeat(16) @(posedge i_clk) o_line <= wchar[6];
        repeat(16) @(posedge i_clk) o_line <= wchar[7];
        // Wait 1K clocks between input bytes.
        repeat(1024) @(posedge i_clk) o_line <=     1'd1;
end
endtask
endmodule