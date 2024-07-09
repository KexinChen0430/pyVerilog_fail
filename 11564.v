module outputs)
   // End of automatics
// Code start here
   cluster_header cluster_header (/*AUTOINST*/
				  // Outputs
				  .dbginit_l(dbginit_l),
				  .cluster_grst_l(cluster_grst_l),
				  .rclk	(rclk),
				  .so	(so),
				  // Inputs
				  .gclk	(gclk),
				  .cluster_cken(cluster_cken),
				  .arst_l(arst_l),
				  .grst_l(grst_l),
				  .adbginit_l(adbginit_l),
				  .gdbginit_l(gdbginit_l),
				  .si	(si),
				  .se	(se));
endmodule