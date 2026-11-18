#import "@preview/cetz:0.5.3": canvas, draw
#let coupling = canvas(length: 1mm, {
  import draw: *
  let ink = rgb("#315e75")
  for (x, body) in ((0,[频带内的噪声]), (48,[拍频及其边带]), (96,[解调相位误差])) {
    rect((x,0),(x+39,14),radius:2,fill:rgb("#e8f1f5"),stroke:.6pt+ink)
    content((x+19.5,7),text(size:9pt,body))
  }
  for x in (39,87) {
    line((x,7),(x+8,7),stroke:.7pt+ink,mark:(end:"stealth"))
  }
})
