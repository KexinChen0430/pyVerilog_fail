module sparc_exu_rndrob(/*AUTOARG*/
   // Outputs
   grant_vec,
   // Inputs
   clk, reset, se, req_vec, advance
   );
   input     clk, reset, se;
   input  [3:0] req_vec;
   input 	advance;
   output [3:0] grant_vec;
   wire [3:0] 	pv,
		next_pv,
		park_vec;
   assign  next_pv =  advance ? grant_vec : park_vec;
   dffr_s #4  park_reg(.din  (next_pv[3:0]),
		    .clk  (clk),
		    .q    (pv[3:0]),
		    .rst  (reset),
		    .se   (se), .si(), .so());
   assign  park_vec = pv;
   // if noone requests, don't advance, otherwise we'll go back to 0
   // and will not be fair to other requestors
   assign grant_vec[0] =  park_vec[3] & req_vec[0] |
		  park_vec[2] & ~req_vec[3] & req_vec[0] |
		  park_vec[1] & ~req_vec[2] & ~req_vec[3] & req_vec[0] |
	          ~req_vec[1] & ~req_vec[2] & ~req_vec[3];
   assign grant_vec[1] = park_vec[0] & req_vec[1] |
		  park_vec[3] & ~req_vec[0] & req_vec[1] |
		  park_vec[2] & ~req_vec[3] & ~req_vec[0] & req_vec[1] |
	          req_vec[1] & ~req_vec[2] & ~req_vec[3] & ~req_vec[0];
   assign grant_vec[2] = park_vec[1] & req_vec[2] |
		  park_vec[0] & ~req_vec[1] & req_vec[2] |
		  park_vec[3] & ~req_vec[0] & ~req_vec[1] & req_vec[2] |
		  req_vec[2] & ~req_vec[3] & ~req_vec[0] & ~req_vec[1];
   assign grant_vec[3] = park_vec[2] & req_vec[3] |
		  park_vec[1] & ~req_vec[2] & req_vec[3] |
		  park_vec[0] & ~req_vec[1] & ~req_vec[2] & req_vec[3] |
		  req_vec[3] & ~req_vec[0] & ~req_vec[1] & ~req_vec[2];
endmodule