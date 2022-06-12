\m4_TLV_version 1d: tl-x.org
\SV
	m4_makerchip_module
\TLV
   /yy[3:0]
      \viz_js
         where: {layout: "vertical"}
      /xx[3:0]
         $alive = $rand_in;
         \viz_js
            where: {layout: "horizontal"},
            renderFill() {
               return '$alive'.asBool() ? "blue" : "gray";
            }
\SV
   endmodule