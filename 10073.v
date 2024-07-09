module
      else
         // display score, rule, or game over
         if (text_on[3] ||
               ((state_reg==newgame) && text_on[1]) || // rule
               ((state_reg==over) && text_on[0]))
            rgb_next = text_rgb;
         else if (graph_on)  // display graph
           rgb_next = graph_rgb;
         else if (text_on[2]) // display logo
           rgb_next = text_rgb;
           // logo should not cover the ball I assume
           // but, who cares
         else
           rgb_next = 3'b110; // yellow background
   // output
   assign rgb = rgb_reg;
endmodule