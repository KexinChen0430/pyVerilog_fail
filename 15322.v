module transparent_buffer #(
  parameter N = `intN
)(
  input wire clk,
  input wire nrst,
  `input(stream, N, 0),
  `output(stream, N, 0)
);
    reg [N-1:0] data;
    reg         data_valid;
    assign in0_ready = !data_valid | out0_ready;
    assign out0_valid = data_valid | in0_valid;
    assign out0 = !data_valid ? in0 : data; // transparent when ready & valid
    always @(posedge clk) begin
        if(!nrst) begin // reset
            `reset(data_valid);
        end
        else begin
            if(!in0_valid && out0_ready) begin // drain
                `reset(data_valid);
            end
            else if(in0_valid && !out0_ready) begin // fill
                data <= in0;
                if(!out0_ready) `set(data_valid);
            end
        end
    end
endmodule