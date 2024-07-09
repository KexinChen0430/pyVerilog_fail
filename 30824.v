module lpm_ram_io ( dio, inclock, outclock, we, memenab, outenab, address );
// PARAMETER DECLARATION
    parameter lpm_type = "lpm_ram_io";
    parameter lpm_width = 1;
    parameter lpm_widthad = 1;
    parameter lpm_numwords = 1<< lpm_widthad;
    parameter lpm_indata = "REGISTERED";
    parameter lpm_address_control = "REGISTERED";
    parameter lpm_outdata = "REGISTERED";
    parameter lpm_file = "UNUSED";
    parameter lpm_hint = "UNUSED";
    parameter use_eab = "ON";
    parameter intended_device_family = "UNUSED";
// INPUT PORT DECLARATION
    input  [lpm_widthad-1:0] address;
    input  inclock, outclock, we;
    input  memenab;
    input  outenab;
// INPUT/OUTPUT PORT DECLARATION
    inout  [lpm_width-1:0] dio;
// INTERNAL REGISTERS DECLARATION
    reg  [lpm_width-1:0] mem_data [lpm_numwords-1:0];
    reg  [lpm_width-1:0] tmp_io;
    reg  [lpm_width-1:0] tmp_q;
    reg  [lpm_width-1:0] pdio;
    reg  [lpm_widthad-1:0] paddress;
    reg  [lpm_widthad-1:0] paddress_tmp;
    reg  pwe;
`ifdef VERILATOR
    reg  [`LPM_MAX_NAME_SZ*8:1] ram_initf;
`else
    reg  [8*256:1] ram_initf;
`endif
// INTERNAL WIRE DECLARATION
    wire [lpm_width-1:0] read_data;
    wire i_inclock;
    wire i_outclock;
    wire i_memenab;
    wire i_outenab;
// LOCAL INTEGER DECLARATION
    integer i;
// INTERNAL TRI DECLARATION
    tri0 inclock;
    tri0 outclock;
    tri1 memenab;
    tri1 outenab;
// INTERNAL BUF DECLARATION
    buf (i_inclock, inclock);
    buf (i_outclock, outclock);
    buf (i_memenab, memenab);
    buf (i_outenab, outenab);
// FUNCTON DECLARATION
    function ValidAddress;
        input [lpm_widthad-1:0] paddress;
        begin
            ValidAddress = 1'b0;
            if (^paddress === {lpm_widthad{1'bx}})
            begin
                $display("%t:Error:  Invalid address.", $time);
                $display("Time: %0t  Instance: %m", $time);
                $finish;
            end
            else if (paddress >= lpm_numwords)
            begin
                $display("%t:Error:  Address out of bound on RAM.", $time);
                $display("Time: %0t  Instance: %m", $time);
                $finish;
            end
            else
                ValidAddress = 1'b1;
        end
    endfunction
// COMPONENT INSTANTIATIONS
    LPM_MEMORY_INITIALIZATION mem ();
// INITIAL CONSTRUCT BLOCK
    initial
    begin
        if (lpm_width <= 0)
        begin
            $display("Error!  LPM_WIDTH parameter must be greater than 0.");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        if (lpm_widthad <= 0)
        begin
            $display("Error!  LPM_WIDTHAD parameter must be greater than 0.");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        // check for number of words out of bound
        if ((lpm_numwords > (1 << lpm_widthad))
            ||(lpm_numwords <= (1 << (lpm_widthad-1))))
        begin
            $display("Error!  The ceiling of log2(LPM_NUMWORDS) must equal to LPM_WIDTHAD.");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        if ((lpm_indata != "REGISTERED") && (lpm_indata != "UNREGISTERED"))
        begin
            $display("Error!  LPM_INDATA must be \"REGISTERED\" or \"UNREGISTERED\".");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        if ((lpm_address_control != "REGISTERED") && (lpm_address_control != "UNREGISTERED"))
        begin
            $display("Error!  LPM_ADDRESS_CONTROL must be \"REGISTERED\" or \"UNREGISTERED\".");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        if ((lpm_outdata != "REGISTERED") && (lpm_outdata != "UNREGISTERED"))
        begin
            $display("Error!  LPM_OUTDATA must be \"REGISTERED\" or \"UNREGISTERED\".");
            $display("Time: %0t  Instance: %m", $time);
            $finish;
        end
        for (i = 0; i < lpm_numwords; i=i+1)
            mem_data[i] = {lpm_width{1'b0}};
        // Initialize input/output
        pwe = 1'b0;
        pdio = {lpm_width{1'b0}};
        paddress = {lpm_widthad{1'b0}};
        paddress_tmp = {lpm_widthad{1'b0}};
        tmp_io = {lpm_width{1'b0}};
        tmp_q = {lpm_width{1'b0}};
        // load data to the RAM
        if (lpm_file != "UNUSED")
        begin
            mem.convert_to_ver_file(lpm_file, lpm_width, ram_initf);
            $readmemh(ram_initf, mem_data);
        end
    end
// ALWAYS CONSTRUCT BLOCK
    always @(dio)
    begin
        if (lpm_indata == "UNREGISTERED")
            pdio <=  dio;
    end
    always @(address)
    begin
        if (lpm_address_control == "UNREGISTERED")
            paddress <=  address;
    end
    always @(we)
    begin
        if (lpm_address_control == "UNREGISTERED")
            pwe <=  we;
    end
    always @(posedge i_inclock)
    begin
        if (lpm_indata == "REGISTERED")
            pdio <=  dio;
        if (lpm_address_control == "REGISTERED")
        begin
            paddress <=  address;
            pwe <=  we;
        end
    end
    always @(pdio or paddress or pwe or i_memenab)
    begin
        if (ValidAddress(paddress))
        begin
            paddress_tmp <= paddress;
            if (lpm_address_control == "UNREGISTERED")
                if (pwe && i_memenab)
                    mem_data[paddress] <= pdio;
        end
        else
        begin
            if (lpm_outdata == "UNREGISTERED")
                tmp_q <= {lpm_width{1'bx}};
        end
    end
    always @(read_data)
    begin
        if (lpm_outdata == "UNREGISTERED")
            tmp_q <= read_data;
    end
    always @(negedge i_inclock or pdio)
    begin
        if (lpm_address_control == "REGISTERED")
            if ((use_eab == "ON") || (lpm_hint == "USE_EAB=ON"))
                if (pwe && i_memenab && (i_inclock == 1'b0))
                    mem_data[paddress] = pdio;
    end
    always @(posedge i_inclock)
    begin
        if (lpm_address_control == "REGISTERED")
            if ((use_eab == "OFF") && pwe && i_memenab)
                mem_data[paddress] <= pdio;
    end
    always @(posedge i_outclock)
    begin
        if (lpm_outdata == "REGISTERED")
            tmp_q <= mem_data[paddress];
    end
    always @(i_memenab or i_outenab or tmp_q)
    begin
        if (i_memenab && i_outenab)
            tmp_io = tmp_q;
        else if ((!i_memenab) || (i_memenab && (!i_outenab)))
            tmp_io = {lpm_width{1'bz}};
    end
// CONTINOUS ASSIGNMENT
    assign dio = tmp_io;
    assign read_data = mem_data[paddress_tmp];
endmodule