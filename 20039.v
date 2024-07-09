module VProc (Clk, Addr, WE, RD, DataOut, DataIn, WRAck, RDAck, Interrupt, Update, UpdateResponse, Node);
input         Clk;
input         RDAck;
input         WRAck;
input         UpdateResponse;
input   [3:0] Node;
input   [2:0] Interrupt;
input  [31:0] DataIn;
output [31:0] Addr, DataOut;
output        WE;
output        RD;
output        Update;
integer       VPDataOut;
integer       VPAddr;
integer       VPRW;
integer       VPTicks;
integer       TickVal;
reg    [31:0] DataOut;
integer       DataInSamp;
reg    [31:0] Addr;
integer       IntSamp;
integer       NodeI;
reg           WE;
reg           RD;
reg           RdAckSamp;
reg           WRAckSamp;
reg           Initialised;
reg           Update;
initial
begin
    TickVal      = 1;
    Initialised  = 0;
    WE           = 0;
    RD           = 0;
    Update       = 0;
    // Don't remove delay! Needed to allow Node to be assigned
    #0
    $vinit(Node);
    Initialised  = 1;
end
always @(posedge Clk)
begin
    // Cleanly sample the inputs and make them integers
    DataInSamp   = DataIn;
    RdAckSamp    = RDAck;
    WRAckSamp    = WRAck;
    IntSamp      = {1'b0, Interrupt};
    NodeI        = Node;
    if (Initialised == 1'b1)
    begin
        if (IntSamp > 0)
        begin
            $vsched(NodeI, IntSamp, DataInSamp, VPDataOut, VPAddr, VPRW, VPTicks);
            // If interrupt routine returns non-zero tick, then override
            // current tick value. Otherwise, leave at present value.
            if (VPTicks > 0)
            begin
                TickVal = VPTicks;
            end
        end
        // If tick, write or a read has completed...
        if ((RD === 1'b0 && WE === 1'b0 && TickVal === 0) ||
            (RD === 1'b1 && RdAckSamp === 1'b1)           ||
            (WE === 1'b1 && WRAckSamp === 1'b1))
        begin
            // Host process message scheduler called
            IntSamp = 0;
            $vsched(NodeI, IntSamp, DataInSamp, VPDataOut, VPAddr, VPRW, VPTicks);
            #`RegDel
            WE      = VPRW[`WEbit];
            RD      = VPRW[`RDbit];
            DataOut = VPDataOut;
            Addr    = VPAddr;
            Update  = ~Update;
            @(UpdateResponse);
            // Update current tick value with returned number (if not zero)
            if (VPTicks > 0)
            begin
                TickVal = VPTicks;
            end
            else if ( VPTicks < 0)
            begin
                while (VPTicks == `DeltaCycle)
                begin
                    // Resample delta input data
                    DataInSamp = DataIn;
                    IntSamp    = 0;
                    $vsched(NodeI, IntSamp, DataInSamp, VPDataOut, VPAddr, VPRW, VPTicks);
                    WE      = VPRW[`WEbit];
                    RD      = VPRW[`RDbit];
                    DataOut = VPDataOut;
                    Addr    = VPAddr;
                    Update  = ~Update;
                    if (VPTicks >= 0)
		    begin
                        TickVal = VPTicks;
                    end
                    @(UpdateResponse);
                end
            end
        end
        else
        begin
            // Count down to zero and stop
            TickVal  = (TickVal > 0) ? TickVal - 1 : 0;
        end
    end
end
endmodule