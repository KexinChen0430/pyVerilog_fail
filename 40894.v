module Core(
    input clk, reset,
    output reg[31:0] adr_o, // address
    input     [31:0] dat_i, // data in
    output    [31:0] dat_o, // data out
    output           wen_o, // write enable
    output    [ 3:0] sel_o, // select
    output           stb_o, // strobe
    input            ack_i, // acknowledge
    input            err_i, // error
    input            rty_i, // retry
    output           cyc_o, // cycle
    inout halt
);
    localparam[3:0] s0=0, s1=1, s2=2, s3=3, s4=4, s5=5, s6=6, s7=7;
    wire deref_rhs, branching, storing, loading, edone;
    wire[3:0] idxX, idxY, idxZ, op;
    wire signed[31:0] valX, valY, valZ, valI, valA, valB, valC, rhs;
    wire[1:0] kind;
    reg[31:0] insn, _data;
    reg signed[31:0] _irhs, nextP;
    reg[3:0] state;
    wire signed[31:0] nextI = branching ? nextZ : nextP;
    wire signed[31:0] nextZ = deref_rhs ? _data : _irhs;
    wire       [31:0] _adrD = deref_rhs ? _irhs : valZ;
    wire   memory = loading | storing;
    wire   i_strb = state == s5;
    wire   d_strb = state == s3 &&  memory;
    wire   upZ    = state == s4 && !storing;
    assign sel_o  = 4'hf;
    assign stb_o  = d_strb | i_strb;
    assign wen_o  = d_strb & storing;
    assign dat_o  = deref_rhs ? valZ : _irhs;
    assign cyc_o  = stb_o;
    assign halt   = err_i | rty_i;
    always @(posedge clk)
        if (reset) begin
            state <= s5;
            adr_o <= `RESETVECTOR;
        end else case (state)
            s0: begin state <= !halt  ? s1 : s0;                        end
            s1: begin state <= edone  ? s2 : s1; _irhs <= rhs;          end
            s2: begin state <= memory ? s3 : s4; adr_o <= _adrD;        end
            s3: begin state <= ack_i  ? s4 : s3; _data <= dat_i;        end
            s4: begin state <=          s5     ; adr_o <= nextI;        end
            s5: begin state <= ack_i  ? s6 : s5; nextP <= adr_o + 1;    end
            s6: begin state <=          s0     ; insn  <= dat_i;        end
            s7: begin state <= s5;                                      end
        endcase
    Decode decode(.insn, .op, .idxZ, .idxX, .idxY, .valI, .deref_rhs,
                  .kind, .branching, .loading, .storing);
    Shuf shuf(.kind, .valX, .valA, .valY, .valB, .valI, .valC);
    Exec exec(.clk, .en ( state == s0 ), .done ( edone ),
              .op,  .valA, .valB, .valC, .valZ ( rhs   ));
    Reg regs(.clk, .nextP, .idxX, .idxY, .idxZ,
             .upZ, .nextZ, .valX, .valY, .valZ);
endmodule