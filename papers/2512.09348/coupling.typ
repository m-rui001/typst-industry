#import "@preview/cetz:0.5.3": canvas, draw
#let coupling = canvas(length:1mm, {
  import draw: *
  let ink = rgb("#315e75")
  for (x,label) in ((0,[微波慢波波导]),(49,[YIG 薄膜磁振子]),(98,[基底声学模式])) {
    rect((x,0),(43+x,14),radius:2,fill:rgb("#e8f1f5"),stroke:.6pt+ink)
    content((x+21.5,7),text(size:9pt,label))
  }
  for x in (43,92) {
    line((x,7),(x+5,7),stroke:.7pt+ink,mark:(start:"stealth",end:"stealth"))
  }
})
