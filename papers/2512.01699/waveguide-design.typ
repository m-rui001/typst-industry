#import "@preview/cetz:0.5.3": canvas, draw
#let design = canvas(length:1mm, {
  import draw: *
  let ink = rgb("#315e75")
  for (x, label) in ((0,[给定传播路径]),(49,[反应–扩散生成斑点]),(98,[提取介质柱阵列])) {
    rect((x,0),(x+43,14),radius:2,fill:rgb("#e8f1f5"),stroke:.6pt+ink)
    content((x+21.5,7),text(size:9pt,label))
  }
  for x in (43,92) {
    line((x,7),(x+5,7),stroke:.7pt+ink,mark:(end:"stealth"))
  }
})
