#import "@preview/cetz:0.5.3": canvas, draw
#let architecture(labels: ([Coordinates], [Learnable Fourier features], [MLP], [Solution], [PDE + IC/BC loss], [Optimizer])) = canvas(length:1mm, {
  import draw: *
  let ink = rgb("#315e75")
  for (x,y,w,body) in (
    (0,24,23,labels.at(0)), (32,24,43,labels.at(1)),
    (84,24,20,labels.at(2)), (113,24,25,labels.at(3)),
    (104,0,34,labels.at(4)), (61,0,29,labels.at(5)),
  ) {
    rect((x,y),(x+w,y+12),radius:2,fill:rgb("#e8f1f5"),stroke:.6pt+ink)
    content((x+w/2,y+6),text(size:8pt,body))
  }
  for (a,b) in (((23,30),(32,30)),((75,30),(84,30)),((104,30),(113,30)),((125,24),(125,12)),((104,6),(90,6))) {
    line(a,b,stroke:.7pt+ink,mark:(end:"stealth"))
  }
  line((61,6),(53,6),(53,24),stroke:(paint:ink,thickness:.7pt,dash:"dashed"),mark:(end:"stealth"))
  line((76,12),(94,24),stroke:(paint:ink,thickness:.7pt,dash:"dashed"),mark:(end:"stealth"))
})
