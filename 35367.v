module altsource_probe_top
#(
    parameter lpm_type = "altsource_probe",     // required by the coding standard
    parameter lpm_hint = "UNUSED",              // required by the coding standard
    parameter sld_auto_instance_index = "YES",  // Yes, if the instance index should be automatically assigned.
    parameter sld_instance_index = 0,           // unique identifier for the altsource_probe instance.
    parameter sld_node_info_parameter = 4746752 + sld_instance_index,   // The NODE ID to uniquely identify this node on the hub.  Type ID: 9 Version: 0 Inst: 0 MFG ID 110 -- ***NOTE*** this parameter cannot be called SLD_NODE_INFO or Quartus Standard will think it's an ISSP impl.
    parameter sld_ir_width = 4,
    parameter instance_id = "UNUSED",           // optional name for the instance.
    parameter probe_width = 1,                  // probe port width
    parameter source_width= 1,                  // source port width
    parameter source_initial_value = "0",       // initial source port value
    parameter enable_metastability = "NO"       // yes to add two register
)
(
    input [probe_width - 1 : 0] probe,       // probe inputs
    output [source_width - 1 : 0] source,    // source outputs
    input source_clk,                        // clock of the registers used to metastabilize the source output
    input tri1 source_ena                    // enable of the registers used to metastabilize the source output
);
    altsource_probe #(
        .lpm_type(lpm_type),
        .lpm_hint(lpm_hint),
        .sld_auto_instance_index(sld_auto_instance_index),
        .sld_instance_index(sld_instance_index),
        .SLD_NODE_INFO(sld_node_info_parameter),
        .sld_ir_width(sld_ir_width),
        .instance_id(instance_id),
        .probe_width(probe_width),
        .source_width(source_width),
        .source_initial_value(source_initial_value),
        .enable_metastability(enable_metastability)
    )issp_impl
    (
        .probe(probe),
        .source(source),
        .source_clk(source_clk),
        .source_ena(source_ena)
    );
endmodule