#import "@preview/cetz:0.5.3": canvas, draw
#let model = canvas(length:1mm, {
  import draw: *
  let ink = rgb("#315e75")
  for (x, label) in ((0,[各向异性表面]),(49,[匹配内外场]),(98,[求色散与阻抗])) {
    rect((x,0),(43+x,14),radius:2,fill:rgb("#e8f1f5"),stroke:.6pt+ink)
    content((x+21.5,7),text(size:9pt,label))
  }
  for x in (43,92) {
    line((x,7),(x+5,7),stroke:.7pt+ink,mark:(end:"stealth"))
  }
})
