module lru_counter
#(parameter DATA_WIDTH = 32)
(
    input clk,
    input rst,
    input en,
    input hit,
    input [`BTB_LINE_SIZE-1:0] hit_line,
    output [`BTB_LINE_SIZE-1:0] lru_line
);
    wire [`BTB_LINE_SIZE-1:0] access_line;
    wire rst0, rst1, rst2, rst3, rst4, rst5, rst6, rst7;
    wire [`BTB_LINE_SIZE-1:0] cnt0, cnt1, cnt2, cnt3, cnt4, cnt5, cnt6, cnt7;
    assign access_line = hit ? hit_line : lru_line;
    assign rst0 = (access_line == 3'd0);
    assign rst1 = (access_line == 3'd1);
    assign rst2 = (access_line == 3'd2);
    assign rst3 = (access_line == 3'd3);
    assign rst4 = (access_line == 3'd4);
    assign rst5 = (access_line == 3'd5);
    assign rst6 = (access_line == 3'd6);
    assign rst7 = (access_line == 3'd7);
    latch_counter #(
        .DATA_WIDTH(`BTB_LINE_SIZE),
        .MAX(`BTB_LINE_NUM-1)
    ) counter0 (
        .clk(clk),
        .rst(rst || rst0),
        .en(en),
        .count(cnt0)
    );
    latch_counter # (
        .DATA_WIDTH(`BTB_LINE_SIZE),
        .MAX(`BTB_LINE_NUM-1)
    ) counter1 (
        .clk(clk),
        .rst(rst || rst1),
        .en(en),
        .count(cnt1)
    );
    latch_counter #(
        .DATA_WIDTH(`BTB_LINE_SIZE),
        .MAX(`BTB_LINE_NUM-1)
    ) counter2 (
        .clk(clk),
        .rst(rst || rst2),
        .en(en),
        .count(cnt2)
    );
    latch_counter #(
        .DATA_WIDTH(`BTB_LINE_SIZE),
        .MAX(`BTB_LINE_NUM-1)
    ) counter3 (
        .clk(clk),
        .rst(rst || rst3),
        .en(en),
        .count(cnt3)
    );
    latch_counter #(
        .DATA_WIDTH(`BTB_LINE_SIZE),
        .MAX(`BTB_LINE_NUM-1)
    ) counter4 (
        .clk(clk),
        .rst(rst || rst4),
        .en(en),
        .count(cnt4)
    );
    latch_counter #(
        .DATA_WIDTH(`BTB_LINE_SIZE),
        .MAX(`BTB_LINE_NUM-1)
    ) counter5 (
        .clk(clk),
        .rst(rst || rst5),
        .en(en),
        .count(cnt5)
    );
    latch_counter #(
        .DATA_WIDTH(`BTB_LINE_SIZE),
        .MAX(`BTB_LINE_NUM-1)
    ) counter6 (
        .clk(clk),
        .rst(rst || rst6),
        .en(en),
        .count(cnt6)
    );
    latch_counter #(
        .DATA_WIDTH(`BTB_LINE_SIZE),
        .MAX(`BTB_LINE_NUM-1)
    ) counter7 (
        .clk(clk),
        .rst(rst || rst7),
        .en(en),
        .count(cnt7)
    );
    max_comparator max_comparator (
        .cnt0(cnt0),
        .cnt1(cnt1),
        .cnt2(cnt2),
        .cnt3(cnt3),
        .cnt4(cnt4),
        .cnt5(cnt5),
        .cnt6(cnt6),
        .cnt7(cnt7),
        .lru_line(lru_line)
    );
endmodule