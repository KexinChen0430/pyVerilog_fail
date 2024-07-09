module SHA1_core_tb(
    );
reg clk,rst;
reg i_hash_in_start;
reg [31:0]i_hash_in;
reg msg_in_start;
reg [31:0]msgIn;
reg [9:0]msgLenBits;
wire msgOutDone;
wire [511:0]msgOut;
wire [159:0]i_hash_out;
wire i_hash_out_done;
wire digest_done;
wire [159:0]digest;
wire f_hash_done;
wire [31:0]f_hash_out;
Initial_Hash_In I1(clk,rst,i_hash_in_start,i_hash_in,i_hash_out_done,i_hash_out);
Msg_In M1(clk,rst,msg_in_start,msgIn,msgOutDone,msgOut);
SHA1_core S1(clk,rst,i_hash_out_done,i_hash_out,msgOutDone,msgLenBits,msgOut,digest_done,digest);
SHA1_out O1(clk,rst,digest_done,digest,f_hash_done,f_hash_out);
initial begin
    clk = 0;
    #5 rst = 0;
    #10 rst = 1;
    #10 i_hash_in_start = 1;
        msg_in_start = 1;
        msgLenBits = 24;
        msgIn = 32'h61626300;
        i_hash_in = 32'h67452301;
        #10 msgIn = 0;
            i_hash_in = 32'hefcdab89;
        #10 msgIn = 0;
            i_hash_in = 32'h98badcfe;
        #10 msgIn = 0;
            i_hash_in = 32'h10325476;
        #10 msgIn = 0;
            i_hash_in = 32'hc3d2e1f0;
        #10 msgIn = 0;
        #10 msgIn = 0;
        #10 msgIn = 0;
        #10 msgIn = 0;
        #10 msgIn = 0;
        #10 msgIn = 0;
        #10 msgIn = 0;
        #10 msgIn = 0;
        #10 msgIn =0;
    #6000 $finish;
end
always begin
    #5 clk = ~clk;
end
endmodule