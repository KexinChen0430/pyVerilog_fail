module stratixiigx_mac_out_internal (
                                      dataa,
                                      datab,
                                      datac,
                                      datad,
                                      mode0,
                                      mode1,
                                      roundab,
                                      saturateab,
                                      roundcd,
                                      saturatecd,
                                      multabsaturate,
                                      multcdsaturate,
                                      signa,
                                      signb,
                                      addnsub0,
                                      addnsub1,
                                      zeroacc,
                                      zeroacc1,
                                      feedback,
                                      dataout,
                                      accoverflow
                                   );
  //Parameter Declaration
parameter operation_mode = "output_only";
parameter dataa_width = 36;
parameter datab_width = 36;
parameter datac_width = 36;
parameter datad_width = 36;
//Input Ports
input [35:0] dataa;
input [35:0] datab;
input [35:0] datac;
input [35:0] datad;
input   mode0;
input   mode1;
input   roundab;
input   roundcd;
input   saturateab;
input   saturatecd;
input   multabsaturate;
input   multcdsaturate;
input   signa;
input   signb;
input   addnsub0;
input   addnsub1;
input   zeroacc;
input   zeroacc1;
input [143:0] feedback;
//Output Ports
output [143:0] dataout;
output   accoverflow;
//Internal Signal Declaration
wire [143:0]  dataout_tmp;
wire     accoverflow_tmp;
wire [5:0] sign_size;
//Define the signals for instantiating the input interface block(iib)
wire[51:0] iib_accuma;
wire[51:0] iib_accumc;
wire[71:0] iib_dataa;
wire[71:0] iib_datab;
wire[71:0] iib_datac;
wire[71:0] iib_datad;
wire iib_sata;
wire iib_satb;
wire iib_satc;
wire iib_satd;
wire iib_satab;
wire iib_satcd;
wire[71:0] iib_outa;
wire[71:0] iib_outb;
wire[71:0] iib_outc;
wire[71:0] iib_outd;
//Define the signals for the R add_sub_acc block(rb)
wire rb_signa;
wire rb_signb;
wire [71:0] rb_dataout;
wire rb_overflow;
//Define the signals for the round_saturate R block(rs_rb)
wire [7:0] rs_rb_dataout_size;
wire [71:0] rs_rb_dataout;
wire rs_rb_saturate_overflow;
//Define the signals for the S add_sub_acc block(sb)
wire [71:0] sb_dataout;
wire sb_overflow;
 //Define the signals for the round_saturate S block(rs_sb)
wire [7:0] rs_sb_dataout_size;
wire [71:0] rs_sb_dataout;
wire rs_sb_saturate_overflow;
//Define the signals for the t add_sub_acc block(tb)
wire tb_signa;
wire tb_signb;
wire [71:0] tb_dataout;
wire tb_overflow;
  //Define signals for instantiating the output interface block
wire [143:0] oib_dataout;
wire [35:0] oib_dataa;
wire [35:0] oib_datab;
wire [35:0] oib_datac;
wire [35:0] oib_datad;
//Define signals for instantiating the reorder output block
wire ro_addnsub;
wire [3:0] operation;
wire signab;
wire [35:0] dataa_ipd;
wire [35:0] datab_ipd;
wire [35:0] datac_ipd;
wire [35:0] datad_ipd;
wire  [143:0] feedback_ipd;
buf buf_dataa [35:0] (dataa_ipd,dataa);
buf buf_datab [35:0] (datab_ipd,datab);
buf buf_datac [35:0] (datac_ipd,datac);
buf buf_datad [35:0] (datad_ipd,datad);
buf buf_feedback  [143:0] (feedback_ipd,feedback);
wire  [143:0] dataout_opd;
wire accoverflow_opd;
buf buf_dataout  [143:0] (dataout,dataout_opd);
buf buf_accoverflow (accoverflow,accoverflow_opd);
 // TIMING SPECIFICATION
specify
    (dataa          *> dataout) = (0,0);
    (datab          *> dataout) = (0,0);
    (datac          *> dataout) = (0,0);
    (datad          *> dataout) = (0,0);
    (signa          *> dataout) = (0,0);
    (signb          *> dataout) = (0,0);
    (mode0          *> dataout) = (0,0);
    (mode1          *> dataout) = (0,0);
    (addnsub0       *> dataout) = (0,0);
    (addnsub1       *> dataout) = (0,0);
    (zeroacc        *> dataout) = (0,0);
    (zeroacc1       *> dataout) = (0,0);
    (multabsaturate *> dataout) = (0,0);
    (multcdsaturate *> dataout) = (0,0);
    (feedback       *> dataout) = (0,0);
    (dataa          *> accoverflow) = (0,0);
    (datab          *> accoverflow) = (0,0);
    (datac          *> accoverflow) = (0,0);
    (datad          *> accoverflow) = (0,0);
    (signa          *> accoverflow) = (0,0);
    (signb          *> accoverflow) = (0,0);
    (mode0          *> accoverflow) = (0,0);
    (mode1          *> accoverflow) = (0,0);
    (addnsub0       *> accoverflow) = (0,0);
    (addnsub1       *> accoverflow) = (0,0);
    (zeroacc        *> accoverflow) = (0,0);
    (zeroacc1       *> accoverflow) = (0,0);
    (feedback       *> accoverflow) = (0,0);
endspecify
//Decode the operation value depending on the operation mode
assign   operation = (operation_mode == "output_only") ? 4'b0000 :
                     (operation_mode == "one_level_adder") ? 4'b0001 :
                     (operation_mode == "two_level_adder") ? 4'b0010 :
                     (operation_mode == "accumulator") ? 4'b0100 :
                     (operation_mode == "36_bit_multiply") ? 4'b0111 :
                     ((operation_mode == "dynamic") && (mode0== 1'b0) && (mode1== 1'b0) &&(zeroacc == 1'b0) && (zeroacc1== 1'b0)) ? 4'b0000 :
                     ((operation_mode == "dynamic") &&(mode0 == 1'b1) && (mode1 == 1'b1)) ? 4'b1100 :
                     ((operation_mode == "dynamic") &&(mode0 == 1'b1) && (mode1 == 1'b0)) ? 4'b1101 :
                     ((operation_mode == "dynamic") &&(mode0 == 1'b0) && (mode1 == 1'b1)) ? 4'b1110 :
                     ((operation_mode == "dynamic") &&(mode0 == 1'b0) && (mode1 == 1'b0) && (zeroacc == 1'b1) && (zeroacc1 == 1'b1)) ? 4'b0111 : 4'b0000;
 //Assign the sign size depending on the mode of operation
     assign sign_size =((operation[2] == 1'b1) ? 18 :
                      (operation == 4'b0001) ||(operation == 4'b0010) ? 3 : 2);
   //Instantiate stratixiigx_Input_Interface
stratixiigx_mac_out_input_interface input_interface(
                                                  .accuma(iib_accuma),
                                                  .accumc(iib_accumc),
                                                  .dataa(iib_dataa),
                                                  .datab(iib_datab),
                                                  .datac(iib_datac),
                                                  .datad(iib_datad),
                                                  .sign(signab),
                                                  .multabsaturate(multabsaturate),
                                                  .multcdsaturate(multcdsaturate),
                                                  .zeroacc(zeroacc),
                                                  .zeroacc1(zeroacc1),
                                                  .operation(operation),
                                                  .outa(iib_outa),
                                                  .outb(iib_outb),
                                                  .outc(iib_outc),
                                                  .outd(iib_outd),
                                                  .sata(iib_sata),
                                                  .satb(iib_satb),
                                                  .satc(iib_satc),
                                                  .satd(iib_satd),
                                                  .satab(iib_satab),
                                                  .satcd(iib_satcd)
                                                 );
defparam input_interface.dataa_width = dataa_width;
defparam input_interface.datab_width = datab_width;
defparam input_interface.datac_width = datac_width;
defparam input_interface.datad_width = datad_width;
assign signab = signa || signb;
assign iib_accuma = (operation_mode == "dynamic") ? {feedback_ipd[52:37], feedback_ipd[35:0]} : feedback_ipd[51:0];
assign iib_accumc = (operation_mode == "dynamic") ? {feedback_ipd[124:109], feedback_ipd[107:72]} :feedback_ipd[123:72];
assign iib_dataa = {36'b0, dataa_ipd};
assign iib_datab = {36'b0, datab_ipd};
assign iib_datac = {36'b0, datac_ipd};
assign iib_datad = {36'b0, datad_ipd};
//Instantiate the Add_Sub_Acc Block R (upper half of operations)
stratixiigx_mac_out_add_sub_acc_unit block_r(
                                           .dataa(iib_outa),
                                           .datab(iib_outb),
                                           .datac(iib_outc),
                                           .datad(iib_outd),
                                           .signa(rb_signa),
                                           .signb(rb_signb),
                                           .operation(operation),
                                           .addnsub(addnsub0),
                                           .dataout(rb_dataout),
                                           .overflow(rb_overflow)
                                          );
defparam     block_r.dataa_width = dataa_width;
defparam     block_r.datab_width = datab_width;
defparam     block_r.datac_width = datac_width;
defparam     block_r.datad_width = datad_width;
defparam   block_r.block_type  = "R";
assign   rb_signa =(operation_mode == "36_bit_multiply") ? signa :
                   ((operation_mode == "dynamic") &&(mode0 == 1'b0) && (mode1 == 1'b0) && (zeroacc == 1'b1) && (zeroacc1 == 1'b1)) ? signa : signab;
assign   rb_signb =(operation_mode == "36_bit_multiply") ? signb :
                   ((operation_mode == "dynamic") &&(mode0 == 1'b0) && (mode1 == 1'b0) && (zeroacc == 1'b1) && (zeroacc1 == 1'b1)) ? signb : signab;
   //Instantiate the Add_Sub_Acc Block S (sb--lower half of operations)
stratixiigx_mac_out_add_sub_acc_unit block_s(
                                           .dataa(iib_outa),
                                           .datab(iib_outb),
                                           .datac(iib_outc),
                                           .datad(iib_outd),
                                           .signa(signab),
                                           .signb(signab),
                                           .operation(operation),
                                           .addnsub(addnsub1),
                                           .dataout(sb_dataout),
                                           .overflow(sb_overflow)
                                         );
defparam     block_s.dataa_width = dataa_width;
defparam     block_s.datab_width = datab_width;
defparam     block_s.datac_width = datac_width;
defparam     block_s.datad_width = datad_width;
defparam   block_s.block_type  = "S";
  //Instantiate Round_Saturate block for the R block
 stratixiigx_mac_rs_block mac_rs_rb(
                                  .operation(operation),
                                  .round(roundab),
                                  .saturate(saturateab),
                                  .addnsub(addnsub0),
                                  .signa(signab),
                                  .signb(signab),
                                  .signsize(sign_size),
                                  .roundsize(8'hf),
                                  .dataoutsize(rs_rb_dataout_size),
                                  .dataa(iib_outa),
                                  .datab(iib_outb),
                                  .datain(rb_dataout),
                                  .dataout(rs_rb_dataout)
                                );
defparam mac_rs_rb.block_type    = "R";
defparam mac_rs_rb.dataa_width   = dataa_width;
defparam mac_rs_rb.datab_width   = datab_width;
assign   rs_rb_dataout_size = ((operation[2] == 1'b1) ? (datab_width + 16) :
                (operation == 4'b0001) ? (dataa_width + 1) :
                (operation == 4'b0010) ? (dataa_width + 1) : 36);
//Instantiate Round_Saturate block for the S block
stratixiigx_mac_rs_block mac_rs_sb(
                                 .operation(operation),
                                 .round(roundcd),
                                 .saturate(saturatecd),
                                 .addnsub(addnsub1),
                                 .signa(signab),
                                 .signb(signab),
                                 .signsize(sign_size),
                                 .roundsize(8'hf),
                                 .dataoutsize(rs_sb_dataout_size),
                                 .dataa(iib_outc),
                                 .datab(iib_outd),
                                 .datain(sb_dataout),
                                 .dataout(rs_sb_dataout)
                                );
defparam mac_rs_sb.block_type    = "S";
defparam mac_rs_sb.dataa_width   = datac_width;
defparam mac_rs_sb.datab_width   = datad_width;
assign   rs_sb_dataout_size = ((operation[2] == 1'b1) ? (datad_width + 16) :
                (operation == 4'b0001) ? (datac_width + 1) :
                (operation == 4'b0010) ? (datac_width + 1) : 36);
   //Instantiate the second level adder T(tb--t block)
stratixiigx_mac_out_add_sub_acc_unit block_t(
                                            .dataa(rs_rb_dataout),
                                            .datab(rs_sb_dataout),
                                            .datac(iib_outc),
                                            .datad(iib_outd),
                                            .signa(tb_signa),
                                            .signb(tb_signb),
                                            .operation(operation),
                                            .addnsub(1'b1),
                                            .dataout(tb_dataout),
                                            .overflow(tb_overflow)
                                           );
defparam     block_t.dataa_width = dataa_width;
defparam     block_t.datab_width = datab_width;
defparam     block_t.datac_width = datac_width;
defparam     block_t.datad_width = datad_width;
defparam   block_t.block_type  = "T";
assign   tb_signa = signab || ~addnsub0;
assign   tb_signb = signab || ~addnsub1;
   //Instantiate the oputput interface block
stratixiigx_mac_out_output_interface output_interface(
                                                    .dataa(oib_dataa),
                                                    .datab(oib_datab),
                                                    .datac(oib_datac),
                                                    .datad(oib_datad),
                                                    .datar(rs_rb_dataout),
                                                    .datas(rs_sb_dataout),
                                                    .datat(tb_dataout),
                                                    .data_36_mult(rb_dataout),
                                                    .sata(iib_sata),
                                                    .satb(iib_satb),
                                                    .satc(iib_satc),
                                                    .satd(iib_satd),
                                                    .satab(iib_satab),
                                                    .satcd(iib_satcd),
                                                    .satr(rs_rb_dataout[2]),
                                                    .sats(rs_sb_dataout[2]),
                                                    .multabsaturate(multabsaturate),
                                                    .multcdsaturate(multcdsaturate),
                                                    .saturate0(saturateab),
                                                    .saturate1(saturatecd),
                                                    .overflowr(rb_overflow),
                                                    .overflows(sb_overflow),
                                                    .operation(operation),
                                                    .dataout(oib_dataout),
                                                    .accoverflow(accoverflow_tmp)
                                                   );
assign oib_dataa = dataa_ipd;
assign oib_datab = datab_ipd;
assign oib_datac = datac_ipd;
assign oib_datad = datad_ipd;
   //Instantiate the reorder block
stratixiigx_reorder_output reorder_unit(
                                      .datain(oib_dataout),
                                      .addnsub(ro_addnsub),
                                      .operation(operation),
                                      .dataout(dataout_tmp)
                                     );
defparam  reorder_unit.operation_mode = operation_mode;
assign ro_addnsub = addnsub0 && addnsub1;
assign accoverflow_opd = accoverflow_tmp;
assign dataout_opd = dataout_tmp;
endmodule