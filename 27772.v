module outputs)
   testcase_pkg::enum_t sub_enum;               // From testcase_sub1 of testcase_sub1.v
   logic [testcase_pkg::SIZE-1:0] sub_in; // From testcase_sub1 of testcase_sub1.v
   logic [testcase_pkg::SIZE-1:0] sub_out;      // From testcase_sub2 of testcase_sub2.v
   // End of automatics
   assign top_out  = sub_out;
   testcase_sub1 testcase_sub1 (.*,
                                // Outputs
                                .sub_enum       (sub_enum),      // Implicit .*
                                .sub_in         (sub_in[testcase_pkg::SIZE-1:0]), // Implicit .*
                                // Inputs
                                .top_enum       (top_enum));     // Implicit .*
   testcase_sub2 testcase_sub2 (.*,
                                // Outputs
                                .sub_out                (sub_out[testcase_pkg::SIZE-1:0]), // Implicit .*
                                // Inputs
                                .sub_enum       (sub_enum),      // Implicit .*
                                .sub_in         (sub_in[testcase_pkg::SIZE-1:0])); // Implicit .*
endmodule