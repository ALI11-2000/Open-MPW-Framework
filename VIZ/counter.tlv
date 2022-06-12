\m4_TLV_version 1d: tl-x.org

\TLV gate(/_top, /_module, _label, _url)
   /_module
      \viz_js
         box: {width: 300, height: 300, strokeWidth: 0},
         init() {
            let ret = {}
            ret.heading = new fabric.Text("_label",{
               left: 47, top: 0,
               originX: "center",
               fontSize: 16, fontFamily: "Courier New",
            })
            ret.img = this.newImageFromURL(['"_url"'],{left: 10, top:20, width:300})
            IO = function (left, top) {
                return new fabric.Text("", {
                    left, top,
                    fontSize: 14, fontFamily: "Courier New",
                })
            }
            ret.cnt = IO(-25,72)
            ret.inc = IO(50,115)
            ret.cnt_nxt = IO(100, 65)
            return ret
         },
         render() {
            let objs = this.getObjects()
            objs.cnt.set({text: '/_top>>1$cnt'.asInt().toString(16).padStart(2, " ")})
            objs.cnt_nxt.set({text: '/_top$cnt'.asInt().toString(16).padStart(2, " ")})
            objs.inc.set({text: '/_top$inc'.asInt().toString(16).padStart(2, " ")})
            return []
         },
         where: {left: 120, top: 75}
\SV
   m4_makerchip_module
\TLV
   |example
      @0
         m4+gate(|example, /count, counter, ['https:/']['/raw.githubusercontent.com/ALI11-2000/Open-MPW-Framework/2cfeff63af211eca9fa3b3b92e771af33e4ad457/VIZ/counter.svg'])
         $reset = *reset;
         
         
         $cnt[3:0] = $reset ? 0 : >>1$cnt + $inc;
         $inc = 1'b1;
        
         
         // Assert these to end simulation (before Makerchip cycle limit).
         *passed = *cyc_cnt > 40;      // Simulation ends after 40 cycles
         *failed = 1'b0;
\SV
   endmodule