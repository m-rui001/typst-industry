#import "@preview/cetz:0.5.3": canvas, draw
#let channels = canvas(length:1mm, {
  import draw: *
  let ink = rgb("#315e75")
  for (y,left,right) in ((18,[弯曲镶嵌晶体],[波长色散荧光谱]),(0,[硅 PIN 探测器],[能量色散谱和通量监测])) {
    rect((0,y),(55,y+14),radius:2,fill:rgb("#e8f1f5"),stroke:.6pt+ink)
    rect((68,y),(138,y+14),radius:2,fill:rgb("#e8f1f5"),stroke:.6pt+ink)
    content((27.5,y+7),text(size:9pt,left))
    content((103,y+7),text(size:9pt,right))
    line((55,y+7),(67,y+7),stroke:.7pt+ink,mark:(end:"stealth"))
  }
})
