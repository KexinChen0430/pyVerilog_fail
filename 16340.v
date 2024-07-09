module t;
    import config_pkg::*;
    localparam config_struct MY_CONFIG = static_config(1);
    struct_submodule #(.MY_CONFIG(MY_CONFIG)) a_submodule_I ();
endmodule