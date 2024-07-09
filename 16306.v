module outputs)
   wire [master_aw-1:0]        eq_adr_o;               // From equations of wb_dsp_equations_top.v
   wire [1:0]           eq_bte_o;               // From equations of wb_dsp_equations_top.v
   wire [2:0]           eq_cti_o;               // From equations of wb_dsp_equations_top.v
   wire                 eq_cyc_o;               // From equations of wb_dsp_equations_top.v
   wire [master_dw-1:0]        eq_dat_o;               // From equations of wb_dsp_equations_top.v
   wire [3:0]           eq_sel_o;               // From equations of wb_dsp_equations_top.v
   wire                 eq_stb_o;               // From equations of wb_dsp_equations_top.v
   wire                 eq_we_o;                // From equations of wb_dsp_equations_top.v
   // End of automatics
   /*AUTOREG*/
   // Single bus master interface the Algorithm State Machine and all equations will use
   // for access data in SRAM
   wb_master_interface bus_master(
                                  // Outputs
                                  .wb_adr_o         (wb_master_adr_o[master_aw-1:0]),
                                  .wb_dat_o         (wb_master_dat_o[master_dw-1:0]),
                                  .wb_sel_o         (wb_master_sel_o[3:0]),
                                  .wb_we_o          (wb_master_we_o),
                                  .wb_cyc_o         (wb_master_cyc_o),
                                  .wb_stb_o         (wb_master_stb_o),
                                  .wb_cti_o         (wb_master_cti_o[2:0]),
                                  .wb_bte_o         (wb_master_bte_o[1:0]),
                                  .data_rd          (master_data_rd[master_dw-1:0]),
                                  .active           (active),
                                  // Inputs
                                  .wb_clk           (wb_clk),
                                  .wb_rst           (wb_rst),
                                  .wb_dat_i         (sm_dat_i[master_dw-1:0]),
                                  .wb_ack_i         (wb_master_ack_i),
                                  .wb_err_i         (wb_master_err_i),
                                  .wb_rty_i         (wb_master_rty_i),
                                  .start            (sm_start),
                                  .address          (sm_address[master_aw-1:0]),
                                  .selection        (sm_selection[3:0]),
                                  .write            (sm_write),
                                  .data_wr          (sm_data_wr[master_dw-1:0]));
   wb_dsp_slave_registers #(.aw(slave_aw), .dw(slave_dw))
   slave_registers
     (
      // Outputs
      .interrupt             (interrupt),
      .wb_dat_o              (wb_slave_dat_o[slave_dw-1:0]),
      .wb_ack_o              (wb_slave_ack_o),
      .wb_err_o              (wb_slave_err_o),
      .wb_rty_o              (wb_slave_rty_o),
      .equation0_address_reg (equation0_address_reg[slave_dw-1:0]),
      .equation1_address_reg (equation1_address_reg[slave_dw-1:0]),
      .equation2_address_reg (equation2_address_reg[slave_dw-1:0]),
      .equation3_address_reg (equation3_address_reg[slave_dw-1:0]),
      .control_reg           (control_reg[slave_dw-1:0]),
      // Inputs
      .status_reg              (status_reg),
      .wb_clk                           (wb_clk),
      .wb_rst                           (wb_rst),
      .wb_adr_i                         (wb_slave_adr_i[slave_aw-1:0]),
      .wb_dat_i                         (wb_slave_dat_i[slave_dw-1:0]),
      .wb_sel_i                         (wb_slave_sel_i[3:0]),
      .wb_we_i                          (wb_slave_we_i),
      .wb_cyc_i                         (wb_slave_cyc_i),
      .wb_stb_i                         (wb_slave_stb_i),
      .wb_cti_i                         (wb_slave_cti_i[2:0]),
      .wb_bte_i                         (wb_slave_bte_i[1:0])
      );
   wire                 alg_start;
   wire [master_aw-1:0] alg_address;
   wire [3:0]           alg_selection;
   wire                 alg_write;
   wire [master_dw-1:0] alg_data_wr;
   wb_dsp_algorithm_sm #(.aw(master_aw), .dw(master_dw))
   algorithm(
             // Outputs
             .alg_start                 (alg_start),
             .alg_address               (alg_address[master_aw-1:0]),
             .alg_selection             (alg_selection[3:0]),
             .alg_write                 (alg_write),
             .alg_data_wr               (alg_data_wr[master_dw-1:0]),
             .status_reg                (status_reg[master_dw-1:0]),
             .equation_enable           (equation_enable[7:0]),
             .base_address              (base_address[master_aw-1:0]),
             // Inputs
             .wb_clk                    (wb_clk),
             .wb_rst                    (wb_rst),
             .alg_data_rd               (master_data_rd[master_dw-1:0]),
             .begin_equation            (begin_equation[3:0]),
             .equation0_address_reg     (equation0_address_reg[master_dw-1:0]),
             .equation1_address_reg     (equation1_address_reg[master_dw-1:0]),
             .equation2_address_reg     (equation2_address_reg[master_dw-1:0]),
             .equation3_address_reg     (equation3_address_reg[master_dw-1:0]),
             .control_reg               (control_reg[master_dw-1:0]),
             .equation_done             (equation_done),
             .active                    (active));
   wb_dsp_equations_top #(.aw(master_aw), .dw(master_dw))
   equations(
             // Outputs
             .eq_adr_o                  (eq_adr_o[master_aw-1:0]),
             .eq_dat_o                  (eq_dat_o[master_dw-1:0]),
             .eq_sel_o                  (eq_sel_o[3:0]),
             .eq_we_o                   (eq_we_o),
             .eq_cyc_o                  (eq_cyc_o),
             .eq_stb_o                  (eq_stb_o),
             .eq_cti_o                  (eq_cti_o[2:0]),
             .eq_bte_o                  (eq_bte_o[1:0]),
             .equation_done             (equation_done),
             // Inputs
             .wb_clk                    (wb_clk),
             .wb_rst                    (wb_rst),
             .wb_dat_i                  (master_data_rd[master_dw-1:0]),
             .wb_ack_i                  (wb_ack_i),
             .wb_err_i                  (wb_err_i),
             .wb_rty_i                  (wb_rty_i),
             .base_address              (base_address[master_aw-1:0]),
             .equation_enable           (equation_enable[7:0]));
   /****************************************************************************
    Put all the equation output busses together.  This is why they are required
    to drive 0's on all signal when not active!
   assign sm_address = alg_address | eq_adr_o;
   assign sm_dat_i = alg_data_wr | eq_dat_o;
   assign sm_selection = alg_selection | eq_sel_o;
   assign sm_write = alg_write | eq_we_o;
endmodule