\m4_TLV_version 1d: tl-x.org
\SV
   
   m4_define(['m4_design_repo'],['['https://raw.githubusercontent.com/ALI11-2000/Open-MPW-Framework/0a42b3795206ff296c6f2de3b36f65acd02a9220/']'])
   m4_define(['m4_adder_rtl'],['m4_design_repo['TL-Verilog/']'])

   m4_sv_get_url(m4_adder_rtl['adder.v'])
                                   
   module adder_sim(input logic clk);
      wire [2:0] a, b;
      wire [3:0] c;
      initial
   	begin
   	$display("Starting adder simulation");
   	end
      always_ff begin
         $display("%d+%d=%d",a,b,c);
      end
      adder dut(.a(a), .b(b), .c(c));
      
   endmodule
                              
   m4_makerchip_module
   adder_sim uut(.clk(clk));
\TLV
   *uut.a = $a[2:0];
   *uut.b = $b[2:0];
   $c[3:0] = *uut.c;
   *passed = *cyc_cnt > 500;
   *failed = 1'b0;
   $reset = *reset;
\SV
   endmodule