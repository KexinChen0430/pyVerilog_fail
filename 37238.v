module ctu_revision (/*AUTOARG*/
// Outputs
jtag_id, mask_major_id, mask_minor_id
);
output [3:0] jtag_id;
output [3:0] mask_major_id;
output [3:0] mask_minor_id;
assign mask_major_id  = `MASK_MAJOR;
ctu_jtag_id #`JTAGID jtag_id_cell(jtag_id);
ctu_mask_id #`MASK_MINOR mask_minor_id_cell(mask_minor_id);
endmodule