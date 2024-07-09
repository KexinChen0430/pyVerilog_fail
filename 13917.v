module that handles communication with ADXL362
   simple_spi_top_modified spi(/*AUTOINST*/
                               // Outputs
                               .spsr            (spsr[7:0]),
                               .inta_o          (inta_o),
                               .rfdout          (rfdout[7:0]),
                               .sck_o           (sck_o),
                               .mosi_o          (mosi_o),
                               // Inputs
                               .clk_i           (clk_i),
                               .nrst            (nrst),
                               .spcr            (spcr[7:0]),
                               .sper            (sper[7:0]),
                               .wfwe            (wfwe),
                               .rfre            (rfre),
                               .wr_spsr         (wr_spsr),
                               .clear_spif      (clear_spif),
                               .clear_wcol      (clear_wcol),
                               .wfdin           (wfdin[7:0]),
                               .miso_i          (miso_i));
endmodule