module outputs)
   // End of automatics
   cluster_header I0 (/*AUTOINST*/
                      // Outputs
                      .dbginit_l           (dbginit_l),
                      .cluster_grst_l      (cluster_grst_l),
                      .rclk                (rclk),
                      .so                  (so),
                      // Inputs
                      .gclk                (gclk),
                      .cluster_cken        (cluster_cken),
                      .arst_l              (arst_l),
                      .grst_l              (grst_l),
                      .adbginit_l          (adbginit_l),
                      .gdbginit_l          (gdbginit_l),
                      .si                  (si),
                      .se                  (se));
//output          so ;
//output          dbginit_l ;
//output          cluster_grst_l ;
//output          rclk ;
//input           si ;
//input           se ;
//input           adbginit_l ;
//input           gdbginit_l ;
//input           arst_l ;
//input           grst_l ;
//input           cluster_cken ;
//input           gclk ;
endmodule