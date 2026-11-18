#import "@preview/cetz:0.5.3": canvas, draw
#let cascade = canvas(length:1mm, {
  import draw: *
  let ink = rgb("#315e75")
  for (x,label) in ((0,[稀疏观测]),(49,[自编码器恢复主结构]),(98,[条件扩散生成细节])) {
    rect((x,0),(43+x,14),radius:2,fill:rgb("#e8f1f5"),stroke:.6pt+ink)
    content((x+21.5,7),text(size:9pt,label))
  }
  for x in (43,92) {
    line((x,7),(x+5,7),stroke:.7pt+ink,mark:(end:"stealth"))
  }
  line((21.5,0),(21.5,-11),(119.5,-11),(119.5,0),stroke:.7pt+ink,mark:(end:"stealth"))
  content((70.5,-17),text(size:9pt,[采样时约束观测点误差]))
})
