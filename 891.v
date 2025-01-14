module dmix_t;
// ins
reg rst;
reg clk;
parameter TCLK = 40;
initial clk = 0;
always #(TCLK/2) clk = ~clk;
reg signal;
reg sck;
parameter TCLK_SCK = 80;
reg mosi;
reg ss;
parameter TclkSPDIF = 40; // 24.576MHz == 192Khz * 32 bit * 2 (biphase)
nkmdhpa uut(
    .rst(rst),
    .clk245760_pad(clk),
    .spdif_i(signal),
    .csr_sck(sck),
    .csr_mosi(mosi),
    .csr_ss(ss));
task recv_rawbit;
    input b;
    begin
        signal = b;
        #(TclkSPDIF);//*6);
    end
endtask
task recv_B;
    begin
        if(signal) begin
            recv_rawbit(0);
            recv_rawbit(0);
            recv_rawbit(0);
            recv_rawbit(1);
            recv_rawbit(0);
            recv_rawbit(1);
            recv_rawbit(1);
            recv_rawbit(1);
        end else begin
            recv_rawbit(1);
            recv_rawbit(1);
            recv_rawbit(1);
            recv_rawbit(0);
            recv_rawbit(1);
            recv_rawbit(0);
            recv_rawbit(0);
            recv_rawbit(0);
        end
    end
endtask
task recv_M;
    begin
        if(signal) begin
            recv_rawbit(0);
            recv_rawbit(0);
            recv_rawbit(0);
            recv_rawbit(1);
            recv_rawbit(1);
            recv_rawbit(1);
            recv_rawbit(0);
            recv_rawbit(1);
        end else begin
            recv_rawbit(1);
            recv_rawbit(1);
            recv_rawbit(1);
            recv_rawbit(0);
            recv_rawbit(0);
            recv_rawbit(0);
            recv_rawbit(1);
            recv_rawbit(0);
        end
    end
endtask
task recv_W;
    begin
        if(signal) begin
            recv_rawbit(0);
            recv_rawbit(0);
            recv_rawbit(0);
            recv_rawbit(1);
            recv_rawbit(1);
            recv_rawbit(0);
            recv_rawbit(1);
            recv_rawbit(1);
        end else begin
            recv_rawbit(1);
            recv_rawbit(1);
            recv_rawbit(1);
            recv_rawbit(0);
            recv_rawbit(0);
            recv_rawbit(1);
            recv_rawbit(0);
            recv_rawbit(0);
        end
    end
endtask
task recv_bmcbit;
    input b;
    begin
        if(signal) begin
            if(b) begin
                recv_rawbit(0);
                recv_rawbit(1);
            end else begin
                recv_rawbit(0);
                recv_rawbit(0);
            end
        end else begin
            if(b) begin
                recv_rawbit(1);
                recv_rawbit(0);
            end else begin
                recv_rawbit(1);
                recv_rawbit(1);
            end
        end
    end
endtask
task recv_bmcbyte;
    input [7:0] byte;
    begin
        recv_bmcbit(byte[0]);
        recv_bmcbit(byte[1]);
        recv_bmcbit(byte[2]);
        recv_bmcbit(byte[3]);
        recv_bmcbit(byte[4]);
        recv_bmcbit(byte[5]);
        recv_bmcbit(byte[6]);
        recv_bmcbit(byte[7]);
    end
endtask
task recv_bmcctl;
    begin
        recv_bmcbit(1);
        recv_bmcbit(1);
        recv_bmcbit(1);
        recv_bmcbit(1);
    end
endtask
task recv_subframe;
    input [23:0] data;
    begin
        recv_bmcbyte(data[7:0]);
        recv_bmcbyte(data[15:8]);
        recv_bmcbyte(data[23:16]);
        recv_bmcctl();
    end
endtask
task spi_cycle;
    input [7:0] data;
    begin
        #(TCLK_SCK/2);
        ss = 0;
        #(TCLK_SCK/2);
        mosi = data[7];
        sck = 0; #(TCLK_SCK/2);
        sck = 1; #(TCLK_SCK/2);
        mosi = data[6];
        sck = 0; #(TCLK_SCK/2);
        sck = 1; #(TCLK_SCK/2);
        mosi = data[5];
        sck = 0; #(TCLK_SCK/2);
        sck = 1; #(TCLK_SCK/2);
        mosi = data[4];
        sck = 0; #(TCLK_SCK/2);
        sck = 1; #(TCLK_SCK/2);
        mosi = data[3];
        sck = 0; #(TCLK_SCK/2);
        sck = 1; #(TCLK_SCK/2);
        mosi = data[2];
        sck = 0; #(TCLK_SCK/2);
        sck = 1; #(TCLK_SCK/2);
        mosi = data[1];
        sck = 0; #(TCLK_SCK/2);
        sck = 1; #(TCLK_SCK/2);
        mosi = data[0];
        sck = 0; #(TCLK_SCK/2);
        sck = 1; #(TCLK_SCK/2);
        #(TCLK_SCK/2);
        ss = 1;
        #(TCLK_SCK/2);
    end
endtask
`define USE_CAPTURE
`define PROGCMD_LEN 112
reg [7:0] progcmd [(`PROGCMD_LEN-1):0];
initial $readmemh("progcmd.memh", progcmd);
reg replay_capture;
initial replay_capture = 1'b0;
integer i;
reg [22:0] counter;
initial begin
	$dumpfile("nkmdhpa_t.lxt");
	$dumpvars(0, uut);
	rst = 1'b0;
    signal = 0;
    counter = 0;
    mosi = 1'b0;
    ss = 1'b1;
	#(100);
	rst = 1'b1;
	#(200);
	rst = 1'b0;
	#(1500);
    for (i = 0; i < `PROGCMD_LEN; i = i + 1) begin
        spi_cycle(progcmd[i]);
    end
    #(100);
    $display("--- NKMD dbgin");
    #(TCLK*3);
    spi_cycle({4'b1_11_0, 4'h6});
    spi_cycle(8'h00); // offset
    spi_cycle(8'h01);
    spi_cycle(8'h02);
    spi_cycle(8'h03);
    spi_cycle(8'h04);
    spi_cycle(8'h05);
    spi_cycle(8'h06);
    spi_cycle(8'h07);
    spi_cycle(8'h08);
    spi_cycle(8'h09);
    spi_cycle(8'h0a);
    spi_cycle(8'h0b);
    spi_cycle(8'h0c);
    spi_cycle(8'h0d);
    spi_cycle(8'h0e);
    spi_cycle(8'h0f);
    spi_cycle(8'h10);
    #(TCLK*3);
    $display("--- NKMD rst => 0");
    #(TCLK*3);
    spi_cycle({4'b1_01_0, 4'h4});
    spi_cycle(8'h00); // offset
    spi_cycle(8'h00); // data
    #(TCLK*3);
    replay_capture = 1'b1;
    #(30000);
    $finish(2);
end
`ifndef USE_CAPTURE
always begin
    recv_B();
    recv_subframe(counter);
    counter = counter + 1;
    recv_W();
    recv_subframe(counter);
    counter = counter + 1;
    repeat(63) begin
        recv_M();
        recv_subframe(counter);
        counter = counter + 1;
        recv_W();
        recv_subframe(counter);
        counter = counter + 1;
    end
    $finish(2);
    recv_B();
    recv_subframe(counter);
    counter = counter + 1;
    recv_W();
    recv_subframe(counter);
    counter = counter + 1;
    repeat(63) begin
        recv_M();
        recv_subframe(counter);
        counter = counter + 1;
        recv_W();
        recv_subframe(counter);
        counter = counter + 1;
    end
    if (counter > 512)
        $finish(2);
end
`else
reg [31:0] capture [262143:0];
integer capture_iter;
initial $readmemh("spdif_capture3", capture);
initial capture_iter = 0;
always begin
    if (replay_capture) begin
        signal = capture[capture_iter][2];
        capture_iter = capture_iter + 1;
        if (capture_iter > 262143)
            $finish(2);
    end
    #(5);
end
`endif
endmodule