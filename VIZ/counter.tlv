\m4_TLV_version 1d: tl-x.org

\TLV gate(/_top, /_gate, _label, #_x, #_y, _not, _op, _url)
   /_gate
      $out = _not(/_top$in0 _op /_top$in1 _op /_top$in2 _op /_top$in3);
      \viz_js
         box: {width: 100, height: 60, strokeWidth: 0},
         init() {
            let ret = {}
            ret.heading = new fabric.Text("_label",{
               left: 47, top: 0,
               originX: "center",
               fontSize: 16, fontFamily: "Courier New",
            })
            ret.img = this.newImageFromURL(['"_url"'],{left: 10, top:20, width:80})
            IO = function (left, top) {
                return new fabric.Text("", {
                    left, top,
                    fontSize: 14, fontFamily: "Courier New",
                })
            }
            ret.in0 = IO(0,24)
            ret.in1 = IO(0,40)
            ret.in2 = IO(0,56)
            ret.in3 = IO(0,72)
            ret.out = IO(90, 32)
            return ret
         },
         render() {
            let objs = this.getObjects()
            objs.in0.set({text: '/_top$in0'.asBinaryStr()})
            objs.in1.set({text: '/_top$in1'.asBinaryStr()})
            objs.in2.set({text: '/_top$in2'.asBinaryStr()})
            objs.in3.set({text: '/_top$in3'.asBinaryStr()})
            objs.out.set({text: '$out'.asBinaryStr()})
            return []
         },
         where: {left: #_x * 120, top: #_y * 75}
\SV
   m4_makerchip_module
\TLV
   |example
      @0
         m4+gate(|example, /and, AND, 0, 0, , &&, ['file:/']['/home/ali112000/efabless/Open-MPW-Framework/VIZ/counter.svg'])
         $reset = *reset;
         
         // Two inputs, x1 and x2, used a counter to increment its value to obtain all input values
         $cnt[3:0] = $reset ? 0 : >>1$cnt + 1;
         $in3 = $cnt[3];
         $in2 = $cnt[2];
         $in1 = $cnt[1];
         $in0 = $cnt[0];
        
         
         // Assert these to end simulation (before Makerchip cycle limit).
         *passed = *cyc_cnt > 40;      // Simulation ends after 40 cycles
         *failed = 1'b0;
\SV
   endmodule