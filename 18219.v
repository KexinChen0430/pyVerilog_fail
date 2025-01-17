module zap_cache_fsm   #(
        parameter CACHE_SIZE    = 1024,  // Bytes.
        parameter CACHE_LINE    = 8
)
//  Port List
(
/* Clock and reset */
input   wire                      i_clk,
input   wire                      i_reset,
/* From/to processor */
input   wire    [31:0]            i_address,
input   wire                      i_rd,
input   wire                      i_wr,
input   wire    [31:0]            i_din,
input   wire    [3:0]             i_ben, /* Valid only for writes. */
output  reg     [31:0]            o_dat,
output  reg                       o_ack,
output  reg                       o_err,
output  reg     [7:0]             o_fsr,
output  reg     [31:0]            o_far,
output  reg                       o_err2,
/* From/To CP15 unit */
input   wire                      i_cache_en,
input   wire                      i_cache_inv,
input   wire                      i_cache_clean,
output  reg                       o_cache_inv_done,
output  reg                       o_cache_clean_done,
/* From/to cache. */
input   wire    [CACHE_LINE*8-1:0]i_cache_line,
input   wire                       i_cache_tag_dirty,
input   wire  [`CACHE_TAG_WDT-1:0] i_cache_tag, // Tag
input   wire                       i_cache_tag_valid,
output  reg   [`CACHE_TAG_WDT-1:0] o_cache_tag,
output  reg                        o_cache_tag_dirty,
output  reg                        o_cache_tag_wr_en,
output  reg     [CACHE_LINE*8-1:0]o_cache_line,
output  reg     [CACHE_LINE-1:0]  o_cache_line_ben,    /* Write + Byte enable */
output  reg                       o_cache_clean_req,
input   wire                      i_cache_clean_done,
output  reg                       o_cache_inv_req,
input   wire                      i_cache_inv_done,
output reg [31:0]                 o_address,
/* From/to TLB unit */
input   wire    [31:0]            i_phy_addr,
input   wire    [7:0]             i_fsr,
input   wire    [31:0]            i_far,
input   wire                      i_fault,
input   wire                      i_cacheable,
input   wire                      i_busy,
/* Memory access ports, both NXT and FF. Usually you'll be connecting NXT ports */
output  reg             o_wb_cyc_ff, o_wb_cyc_nxt,
output  reg             o_wb_stb_ff, o_wb_stb_nxt,
output  reg     [31:0]  o_wb_adr_ff, o_wb_adr_nxt,
output  reg     [31:0]  o_wb_dat_ff, o_wb_dat_nxt,
output  reg     [3:0]   o_wb_sel_ff, o_wb_sel_nxt,
output  reg             o_wb_wen_ff, o_wb_wen_nxt,
output  reg     [2:0]   o_wb_cti_ff, o_wb_cti_nxt,/* Cycle Type Indicator - 010, 111 */
input   wire            i_wb_ack,
input   wire    [31:0]  i_wb_dat
);
// Includes and Localparams
`include "zap_localparams.vh"
`include "zap_defines.vh"
`include "zap_functions.vh"
/* States */
localparam IDLE                 = 0; /* Resting state. */
localparam UNCACHEABLE          = 1; /* Uncacheable access. */
localparam CLEAN_SINGLE         = 2; /* Ultimately cleans up cache line. Parent state */
localparam FETCH_SINGLE         = 3; /* Ultimately validates cache line. Parent state */
localparam INVALIDATE           = 4; /* Cache invalidate parent state */
localparam CLEAN                = 5; /* Cache clean parent state */
localparam NUMBER_OF_STATES     = 6;
// Signal aliases
wire cache_cmp   = (i_cache_tag[`CACHE_TAG__TAG] == i_address[`VA__CACHE_TAG]);
wire cache_dirty = i_cache_tag_dirty;
// Variables
reg [$clog2(NUMBER_OF_STATES)-1:0]      state_ff, state_nxt;
reg [31:0]                              buf_ff [(CACHE_LINE/4)-1:0];
reg [31:0]                              buf_nxt[(CACHE_LINE/4)-1:0];
reg                                     cache_clean_req_nxt,
                                        cache_clean_req_ff;
reg                                     cache_inv_req_nxt,
                                        cache_inv_req_ff;
reg [$clog2(CACHE_LINE/4):0]            adr_ctr_ff, adr_ctr_nxt; // Needs to take on 0,1,2,3, ... CACHE_LINE/4
reg                                     rhit, whit;              // For debug only.
integer                                 i;
/* From/to processor */
reg    [31:0]                           address;
reg                                     rd;
reg                                     wr;
reg    [31:0]                           din;
reg    [3:0]                            ben; /* Valid only for writes. */
reg    [CACHE_LINE*8-1:0]               cache_line;
reg                                     cache_tag_dirty;
reg  [`CACHE_TAG_WDT-1:0]               cache_tag; // Tag
reg                                     cache_tag_valid;
reg    [31:0]                           phy_addr;
// Logic
/* Tie flops to the output */
always @* o_cache_clean_req = cache_clean_req_ff; // Tie req flop to output.
always @* o_cache_inv_req   = cache_inv_req_ff;   // Tie inv flop to output.
/* Buffers */
always @ ( posedge i_clk ) if ( state_ff == IDLE ) address         <= i_address ;
always @ ( posedge i_clk ) if ( state_ff == IDLE ) rd              <= i_rd;
always @ ( posedge i_clk ) if ( state_ff == IDLE ) wr              <= i_wr;
always @ ( posedge i_clk ) if ( state_ff == IDLE ) din             <= i_din;
always @ ( posedge i_clk ) if ( state_ff == IDLE ) ben             <= i_ben            ;
always @ ( posedge i_clk ) if ( state_ff == IDLE ) cache_line      <= i_cache_line;
always @ ( posedge i_clk ) if ( state_ff == IDLE ) cache_tag_dirty <= i_cache_tag_dirty;
always @ ( posedge i_clk ) if ( state_ff == IDLE ) cache_tag       <= i_cache_tag;
always @ ( posedge i_clk ) if ( state_ff == IDLE ) cache_tag_valid <= i_cache_tag_valid;
always @ ( posedge i_clk ) if ( state_ff == IDLE ) phy_addr        <= i_phy_addr;
/* Sequential Block */
always @ (posedge i_clk)
begin
        if ( i_reset )
        begin
                o_wb_cyc_ff             <= 0;
                o_wb_stb_ff             <= 0;
                o_wb_wen_ff             <= 0;
                o_wb_sel_ff             <= 0;
                o_wb_dat_ff             <= 0;
                o_wb_cti_ff             <= CTI_CLASSIC;
                o_wb_adr_ff             <= 0;
                cache_clean_req_ff      <= 0;
                cache_inv_req_ff        <= 0;
                adr_ctr_ff              <= 0;
                state_ff                <= IDLE;
        end
        else
        begin
                o_wb_cyc_ff             <= o_wb_cyc_nxt;
                o_wb_stb_ff             <= o_wb_stb_nxt;
                o_wb_wen_ff             <= o_wb_wen_nxt;
                o_wb_sel_ff             <= o_wb_sel_nxt;
                o_wb_dat_ff             <= o_wb_dat_nxt;
                o_wb_cti_ff             <= o_wb_cti_nxt;
                o_wb_adr_ff             <= o_wb_adr_nxt;
                cache_clean_req_ff      <= cache_clean_req_nxt;
                cache_inv_req_ff        <= cache_inv_req_nxt;
                adr_ctr_ff              <= adr_ctr_nxt;
                state_ff                <= state_nxt;
        end
end
always @ ( posedge i_clk )
begin
        for(i=0;i<CACHE_LINE/4;i=i+1)
                buf_ff[i] <= buf_nxt[i];
end
/* Combo block */
always @*
begin:blk1
       reg [$clog2(CACHE_LINE)-1:0] a;
        /* Default values */
        a                       = 0;
        state_nxt               = state_ff;
        adr_ctr_nxt             = adr_ctr_ff;
        o_wb_cyc_nxt            = o_wb_cyc_ff;
        o_wb_stb_nxt            = o_wb_stb_ff;
        o_wb_adr_nxt            = o_wb_adr_ff;
        o_wb_dat_nxt            = o_wb_dat_ff;
        o_wb_cti_nxt            = o_wb_cti_ff;
        o_wb_wen_nxt            = o_wb_wen_ff;
        o_wb_sel_nxt            = o_wb_sel_ff;
        cache_clean_req_nxt     = cache_clean_req_ff;
        cache_inv_req_nxt       = cache_clean_req_ff;
        o_fsr                   = 0;
        o_far                   = 0;
        o_cache_tag             = 0;
        o_cache_inv_done        = 0;
        o_cache_clean_done      = 0;
        o_cache_tag_dirty       = 0;
        o_cache_tag_wr_en       = 0;
        o_cache_line            = 0;
        o_cache_line_ben        = 0;
        o_dat                   = 0;
        o_ack                   = 0;
        o_err                   = 0;
        o_err2                  = 0;
        o_address               = address;
        for(i=0;i<CACHE_LINE/4;i=i+1)
                buf_nxt[i] = buf_ff[i];
        rhit                     = 0;
        whit                     = 0;
        case(state_ff)
        IDLE:
        begin
                kill_access;
                if ( i_cache_inv )
                begin
                        o_ack     = 1'd0;
                        state_nxt = INVALIDATE;
                end
                else if ( i_cache_clean )
                begin
                        o_ack     = 1'd0;
                        state_nxt = CLEAN;
                end
                else if ( !i_rd && !i_wr )
                begin
                        o_ack = 1'd1;
                end
                else if ( i_fault )
                begin
                        /* MMU access fault. */
                        o_err = 1'd1;
                        o_ack = 1'd1;
                        o_fsr = i_fsr;
                        o_far = i_far;
                end
                else if ( i_busy )
                begin
                        /* Wait it out */
                        o_err2 = 1'd1;
                        o_ack  = 1'd1;
                end
                else if ( i_rd || i_wr )
                begin
                        if ( i_cacheable && i_cache_en )
                        begin
                                case ({cache_cmp,i_cache_tag_valid})
                                2'b11: /* Cache Hit */
                                begin
                                        if ( i_rd ) /* Read request. */
                                        begin
                                                /*
                                                 */
                                                o_dat   = adapt_cache_data(i_address, i_cache_line);
                                                rhit    = 1'd1;
                                                o_ack   = 1'd1;
                                        end
                                        else if ( i_wr ) /* Write request */
                                        begin
                                                o_ack        = 1'd1;
                                                whit         = 1'd1;
                                                /*
                                                 */
                                                o_cache_line =
                                                {(CACHE_LINE/4){i_din}};
                                                o_cache_line_ben  = ben_comp ( i_address, i_ben );
                                                /* Write to tag and also write out physical address. */
                                                o_cache_tag_wr_en               = 1'd1;
                                                o_cache_tag[`CACHE_TAG__TAG]    = i_address[`VA__CACHE_TAG];
                                                o_cache_tag_dirty               = 1'd1;
                                                o_cache_tag[`CACHE_TAG__PA]     = i_phy_addr >> $clog2(CACHE_LINE);
                                                o_address                       = i_address;
                                        end
                                end
                                2'b01: /* Unrelated tag, possibly dirty. */
                                begin
                                        /* CPU should retry */
                                        o_ack  = 1'd1;
                                        o_err2 = 1'd1;
                                        if ( cache_dirty )
                                        begin
                                                /* Set up counter */
                                                adr_ctr_nxt = 0;
                                                /* Clean a single cache line */
                                                state_nxt = CLEAN_SINGLE;
                                        end
                                        else if ( i_rd | i_wr )
                                        begin
                                                /* Set up counter */
                                                adr_ctr_nxt = 0;
                                                /* Fetch a single cache line */
                                                state_nxt = FETCH_SINGLE;
                                        end
                                end
                                default: /* Need to generate a new tag. */
                                begin
                                                /* CPU should wait. */
                                                o_ack  = 1'd1;
                                                o_err2 = 1'd1;
                                                /* Set up counter */
                                                adr_ctr_nxt = 0;
                                                /* Fetch a single cache line */
                                                state_nxt = FETCH_SINGLE;
                                end
                                endcase
                        end
                        else /* Decidedly non cacheable. */
                        begin
                                state_nxt       = UNCACHEABLE;
                                o_ack           = 1'd0; /* Wait...*/
                                o_wb_stb_nxt    = 1'd1;
                                o_wb_cyc_nxt    = 1'd1;
                                o_wb_adr_nxt    = i_phy_addr;
                                o_wb_dat_nxt    = i_din;
                                o_wb_wen_nxt    = i_wr;
                                o_wb_sel_nxt    = i_ben;
                                o_wb_cti_nxt    = CTI_CLASSIC;
                        end
                end
        end
        UNCACHEABLE: /* Uncacheable reads and writes definitely go through this. */
        begin
                if ( i_wb_ack )
                begin
                        o_dat           = i_wb_dat;
                        o_ack           = 1'd1;
                        state_nxt       = IDLE;
                        kill_access;
                end
        end
        CLEAN_SINGLE: /* Clean single cache line */
        begin
                o_ack  = 1'd1;
                o_err2 = i_rd || i_wr ? 1'd1 : 1'd0;
                /* Generate address */
                adr_ctr_nxt = adr_ctr_ff + (o_wb_stb_ff && i_wb_ack);
                if ( adr_ctr_nxt <= ((CACHE_LINE/4) - 1) )
                begin
                        /* Sync up with memory. Use PA in cache tag itself. */
                        wb_prpr_write( clean_single_d (cache_line, adr_ctr_nxt),
                                      {cache_tag[`CACHE_TAG__PA], {CACHE_LINE{1'd0}}} + (adr_ctr_nxt * (32/8)),
                                      adr_ctr_nxt != ((CACHE_LINE/4) - 1) ? CTI_BURST : CTI_EOB, 4'b1111);
                end
                else
                begin
                        /* Move to wait state */
                        kill_access;
                        state_nxt = IDLE;
                        /* Update tag. Remove dirty bit. */
                        o_cache_tag_wr_en                      = 1'd1; // Implicitly sets valid (redundant).
                        o_cache_tag[`CACHE_TAG__TAG]           = cache_tag[`VA__CACHE_TAG]; // Preserve.
                        o_cache_tag_dirty                      = 1'd0;
                        o_cache_tag[`CACHE_TAG__PA]            = cache_tag[`CACHE_TAG__PA]; // Preserve.
                end
        end
        FETCH_SINGLE: /* Fetch a single cache line */
        begin
                o_ack  = 1'd1;
                o_err2 = i_rd || i_wr ? 1'd1 : 1'd0;
                /* Generate address */
                adr_ctr_nxt = adr_ctr_ff + (o_wb_stb_ff && i_wb_ack);
                /* Write to buffer */
                buf_nxt[adr_ctr_ff] = i_wb_ack ? i_wb_dat : buf_ff[adr_ctr_ff];
                /* Manipulate buffer as needed */
                if ( wr )
                begin
                        a = address >> 2;
                        buf_nxt[a][7:0]   = ben[0] ? din[7:0]   : buf_nxt[a][7:0];
                        buf_nxt[a][15:8]  = ben[1] ? din[15:8]  : buf_nxt[a][15:8];
                        buf_nxt[a][23:16] = ben[2] ? din[23:16] : buf_nxt[a][23:16];
                        buf_nxt[a][31:24] = ben[3] ? din[31:24] : buf_nxt[a][31:24];
                end
                if ( adr_ctr_nxt <= (CACHE_LINE/4) - 1 )
                begin
                        /* Fetch line from memory */
                        wb_prpr_read(
                                     {phy_addr[31:$clog2(CACHE_LINE)], {$clog2(CACHE_LINE){1'd0}}} + (adr_ctr_nxt * (32/8)),
                                     (adr_ctr_nxt != CACHE_LINE/4 - 1) ? CTI_BURST : CTI_EOB);
                end
                else
                begin:blk12
                        integer i;
                        /* Update cache with previous buffers. Here _nxt refers to _ff except for the last one. */
                        o_cache_line = 0;
                        for(i=0;i<CACHE_LINE/4;i=i+1)
                                o_cache_line = o_cache_line | (buf_nxt[i][31:0] << (32 * i));
                        o_cache_line_ben  = {CACHE_LINE{1'd1}};
                        /* Update tag. Remove dirty and set valid */
                        o_cache_tag_wr_en                       = 1'd1; // Implicitly sets valid.
                        o_cache_tag[`CACHE_TAG__TAG]            = address[`VA__CACHE_TAG];
                        o_cache_tag[`CACHE_TAG__PA]             = phy_addr >> $clog2(CACHE_LINE);
                        o_cache_tag_dirty                       = !wr ? 1'd0 : 1'd1; // BUG FIX.
                        /* Move to idle state */
                        kill_access;
                        state_nxt = IDLE;
                end
        end
        INVALIDATE: /* Invalidate the cache - Almost Single Cycle */
        begin
                cache_inv_req_nxt = 1'd1;
                cache_clean_req_nxt = 1'd0;
                if ( i_cache_inv_done )
                begin
                        cache_inv_req_nxt    = 1'd0;
                        state_nxt            = IDLE;
                        o_cache_inv_done     = 1'd1;
                end
        end
        CLEAN:  /* Force cache to clean itself */
        begin
                cache_clean_req_nxt = 1'd1;
                cache_inv_req_nxt   = 1'd0;
                if ( i_cache_clean_done )
                begin
                        cache_clean_req_nxt  = 1'd0;
                        state_nxt            = IDLE;
                        o_cache_clean_done   = 1'd1;
                end
        end
        endcase
end
// Tasks and functions.
function [31:0] adapt_cache_data (
        input [$clog2(CACHE_LINE)-1:0] shift,
        input [CACHE_LINE*8-1:0]       data
);
reg [31:0] shamt;
begin
        shamt            = (shift >> 2) * 32;
        adapt_cache_data = data >> shamt;
end
endfunction
function [CACHE_LINE-1:0] ben_comp (
        input [$clog2(CACHE_LINE)-1:0] shift,
        input [3:0] bv
);
reg [31:0] shamt;
begin
        shamt    = (shift >> 2) * 4;
        ben_comp = bv << shamt;
end
endfunction
function [31:0] clean_single_d (
        input [CACHE_LINE*8-1:0] cl,
        input [31:0]             sh
);
reg [31:0] shamt;
begin
        shamt          = sh * 32;
        clean_single_d = cl >> shamt; // Select specific 32-bit.
end
endfunction
/* Function to generate Wishbone read signals. */
task  wb_prpr_read;
input [31:0] i_address;
input [2:0]  i_cti;
begin
        o_wb_cyc_nxt = 1'd1;
        o_wb_stb_nxt = 1'd1;
        o_wb_wen_nxt = 1'd0;
        o_wb_sel_nxt = 4'b1111;
        o_wb_adr_nxt = i_address;
        o_wb_cti_nxt = i_cti;
        o_wb_dat_nxt = 0;
end
endtask
/* Function to generate Wishbone write signals */
task  wb_prpr_write;
input   [31:0]  i_data;
input   [31:0]  i_address;
input   [2:0]   i_cti;
input   [3:0]   i_ben;
begin
        o_wb_cyc_nxt = 1'd1;
        o_wb_stb_nxt = 1'd1;
        o_wb_wen_nxt = 1'd1;
        o_wb_sel_nxt = i_ben;
        o_wb_adr_nxt = i_address;
        o_wb_cti_nxt = i_cti;
        o_wb_dat_nxt = i_data;
end
endtask
/* Disables Wishbone */
task  kill_access;
begin
        o_wb_cyc_nxt = 0;
        o_wb_stb_nxt = 0;
        o_wb_wen_nxt = 0;
        o_wb_adr_nxt = 0;
        o_wb_dat_nxt = 0;
        o_wb_sel_nxt = 0;
        o_wb_cti_nxt = CTI_CLASSIC;
end
endtask
endmodule