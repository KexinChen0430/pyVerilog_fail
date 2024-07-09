module nkmd_cpu_regfile(
    input wire clk,
    input wire rst,
    input wire dcd_decn_i,
    input wire [`DCD_REGSEL_W-1:0] dcd_rssel_i,
    input wire [`DCD_REGSEL_W-1:0] dcd_rtsel_i,
    input wire [`DCD_REGSEL_W-1:0] dcd_rdsel_i,
    output wire [31:0] mem_rsval_o,
    output wire [31:0] mem_rtval_o,
    output wire [31:0] mem_rdval_o,
    input wire [`DCD_REGSEL_W-1:0] wb_sel_i,
    input wire [31:0] wb_val_i,
    output wire seq_regn_is_zero_o);
reg [31:0] a_ff;
reg [31:0] b_ff;
reg [31:0] c_ff;
reg [31:0] d_ff;
reg [31:0] e_ff;
reg [31:0] f_ff;
reg [31:0] g_ff;
reg [31:0] h_ff;
reg [31:0] i_ff;
reg [31:0] j_ff;
reg [31:0] sl_ff;
reg [31:0] sh_ff;
reg [31:0] n_ff;
function [31:0] nkmd_cpu_regfile_sel(
    input [`DCD_REGSEL_W-1:0] sel,
    input [31:0] a,
    input [31:0] b,
    input [31:0] c,
    input [31:0] d,
    input [31:0] e,
    input [31:0] f,
    input [31:0] g,
    input [31:0] h,
    input [31:0] i,
    input [31:0] j,
    input [31:0] sl,
    input [31:0] sh,
    input [31:0] n);
begin
    case (sel)
    4'h0: nkmd_cpu_regfile_sel = 0;
    4'h1: nkmd_cpu_regfile_sel = a;
    4'h2: nkmd_cpu_regfile_sel = b;
    4'h3: nkmd_cpu_regfile_sel = c;
    4'h4: nkmd_cpu_regfile_sel = d;
    4'h5: nkmd_cpu_regfile_sel = e;
    4'h6: nkmd_cpu_regfile_sel = f;
    4'h7: nkmd_cpu_regfile_sel = g;
    4'h8: nkmd_cpu_regfile_sel = h;
    4'h9: nkmd_cpu_regfile_sel = i;
    4'ha: nkmd_cpu_regfile_sel = j;
    4'hb: nkmd_cpu_regfile_sel = 32'hXXXX; // ra: ret addr
    4'hc: nkmd_cpu_regfile_sel = sl;
    4'hd: nkmd_cpu_regfile_sel = sh;
    4'he: nkmd_cpu_regfile_sel = n;
    4'hf: nkmd_cpu_regfile_sel = 32'hXXXX; // pc: program counter
    endcase
end
endfunction
assign mem_rsval_o = nkmd_cpu_regfile_sel(dcd_rssel_i,
        a_ff, b_ff, c_ff, d_ff, e_ff, f_ff, g_ff, h_ff, i_ff, j_ff, sl_ff, sh_ff, n_ff);
assign mem_rtval_o = nkmd_cpu_regfile_sel(dcd_rtsel_i,
        a_ff, b_ff, c_ff, d_ff, e_ff, f_ff, g_ff, h_ff, i_ff, j_ff, sl_ff, sh_ff, n_ff);
assign mem_rdval_o = nkmd_cpu_regfile_sel(dcd_rdsel_i,
        a_ff, b_ff, c_ff, d_ff, e_ff, f_ff, g_ff, h_ff, i_ff, j_ff, sl_ff, sh_ff, n_ff);
always @(posedge clk) begin
    if (rst) begin
        a_ff <= 32'd0;
        b_ff <= 32'd0;
        c_ff <= 32'd0;
        d_ff <= 32'd0;
        e_ff <= 32'd0;
        f_ff <= 32'd0;
        g_ff <= 32'd0;
        h_ff <= 32'd0;
        i_ff <= 32'd0;
        j_ff <= 32'd0;
        sl_ff <= 32'd0;
        sh_ff <= 32'd0;
        n_ff <= 32'd0;
    end else begin
        case (wb_sel_i)
        4'h0: /* NOP */;
        4'h1: a_ff <= wb_val_i;
        4'h2: b_ff <= wb_val_i;
        4'h3: c_ff <= wb_val_i;
        4'h4: d_ff <= wb_val_i;
        4'h5: e_ff <= wb_val_i;
        4'h6: f_ff <= wb_val_i;
        4'h7: g_ff <= wb_val_i;
        4'h8: h_ff <= wb_val_i;
        4'h9: i_ff <= wb_val_i;
        4'ha: j_ff <= wb_val_i;
        4'hb: /* NOP */; // ra: ret addr
        4'hc: sl_ff <= wb_val_i;
        4'hd: sh_ff <= wb_val_i;
        4'he: /* NOP */; // handled below
        4'hf: /* NOP */; // pc: program counter
        endcase
        if (wb_sel_i == 4'he)
            n_ff <= wb_val_i;
        else if (dcd_decn_i == 1'b1)
            n_ff <= n_ff - 1;
    end
end
reg regn_is_zero_ff;
always @(posedge clk) begin
    if (rst) begin
        regn_is_zero_ff <= 1'b1;
    end else begin
        if (wb_sel_i == 4'he)
            regn_is_zero_ff <= (wb_val_i == 32'b0);
        else if (dcd_decn_i == 1'b1)
            regn_is_zero_ff <= (n_ff - 1 == 0);
        else
            regn_is_zero_ff <= (n_ff == 0);
    end
end
assign seq_regn_is_zero_o = regn_is_zero_ff;
`ifdef SIMULATION
task dump;
begin
    $display("-- reg dump ------------------------------------------------------------------");
    $display("a %h b %h c %h d %h e %h f %h g %h", a_ff, b_ff, c_ff, d_ff, e_ff, f_ff, g_ff);
    $display("h %h i %h j %h sh:l %h:%h n %h", h_ff, i_ff, j_ff, sh_ff, sl_ff, n_ff);
end
endtask
`endif
endmodule