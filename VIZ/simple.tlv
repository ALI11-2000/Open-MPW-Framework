\m4_TLV_version 1d: tl-x.org
\SV
\TLV
   \viz_js
      template: {dot: ["Circle", {radius:2, fill: "Red"}]},
      render() {
         let heat = 50+this.sigVal("sensor.heat").asInt()
         let dot = this.getObjects().dot
         dot.set("fill", `#${heat.toString(16).padStart(2,"0")}0000`)
      }