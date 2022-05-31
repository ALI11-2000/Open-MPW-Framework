\m4_TLV_version 1d: tl-x.org
\SV
   `include "sqrt32.v";
   
   m4_makerchip_module
\TLV
   $reset = *reset;
   $valid = ($count[1:0]==2'b11) ? 1 : 0;
   $count[1:0] = $reset ? 0 : >>1$count[1:0]+1;
   |calc
      @1
         $aa_sq[7:0] = $aa[3:0] * $aa[3:0];
         $bb_sq[7:0] = $bb[3:0] * $bb[3:0];
      @2
         $cc_sq[8:0] = $aa_sq + $bb_sq;
      @3 
         $cc[4:0] = sqrt($cc_sq);

   |calc
      @3
         \SV_plus
            always_comb begin
               if($valid==1)
                 \$display("sqrt(\%d^2+\%d^2)=\%d",$aa,$bb,$cc);
            end
\SV
   endmodule
