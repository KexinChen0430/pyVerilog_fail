module t2;
   import p::*;
   import p2::plustwo;
   import p2::package2_type_t;
   package_type_t vp;
   package2_type_t vp2;
   initial begin
      if (plusone(1) !== 2) $stop;
      if (plustwo(1) !== 3) $stop;
      if (p::pi !== 123 && p::pi !== 124) $stop;  // may race with other initial, so either value
   end
endmodule