module
                .DIA            (dataIn[7:0]                ),
                .DIPA           (1'd0                       ),
                .ADDRA          ({2'b0, bufferIndexToMem}   ),
                .ENA            (1'b1                       ),
                .WEA            (fifoWEn                    ),
                .SSRA           (1'b0                       ),
                .CLKA           (fifoClk                    ),
                .DOA            (dataFromMem[7:0]           ),
               // .DOPA           (dataFromMem[8]              ),
// Port B, access from SpartanMC
                .DIB            (do_peri[7:0]               ),
                .DIPB           (do_peri[8]                 ),
                .ADDRB          ({1'b0, addr_peri[9:0]}     ),
                .ENB            (1'b1                       ),
                .WEB            (store_access & activ_dma0  ),
                .SSRB           (! activ_dma0               ),
                .CLKB           (mem_clk                    ),
                .DOB            (di_peri[7:0]               ),
                .DOPB           (di_peri[8]                 )
                );
endmodule