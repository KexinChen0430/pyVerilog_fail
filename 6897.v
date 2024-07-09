module
    /********** Xilinx FPGA Block RAM : two ports RAM **********/
    symmetric_mem_core x_s3e_dpram (
        /********** port A : IF stage **********/
        .clockA         (clk),             //clock
        .addressA       (if_spm_addr),     //address
        .input_dataA    (if_spm_wr_data),  //
        .write_enableA  (wea),             //
        .output_dataA   (if_spm_rd_data),  //
        /********** port B : MEM Stage **********/
        .clockB         (clk),             //
        .addressB       (mem_spm_addr),    //
        .input_dataB    (mem_spm_wr_data), //
        .write_enableB  (web),             //
        .output_dataB   (mem_spm_rd_data)  //read data
    );
endmodule