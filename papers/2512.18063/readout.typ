#import "@preview/cetz:0.5.3": canvas, draw
#let readout = canvas(length: 1mm, {
  import draw: *
  let ink = rgb("#315e75")
  for (y, device, result) in (
    (20, [20 nm 纳米线], [1550 nm 内部探测效率饱和]),
    (0, [100 nm 纳米线＋串联电阻], [电脉冲半高全宽约 400 ps]),
  ) {
    rect((0,y),(60,y+14),radius:2,fill:rgb("#e8f1f5"),stroke:.6pt+ink)
    rect((73,y),(144,y+14),radius:2,fill:rgb("#e8f1f5"),stroke:.6pt+ink)
    content((30,y+7),text(size:9pt,device))
    content((108.5,y+7),text(size:9pt,result))
    line((60,y+7),(72,y+7),stroke:.7pt+ink,mark:(end:"stealth"))
  }
})
