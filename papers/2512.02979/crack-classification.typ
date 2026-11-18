#import "@preview/cetz:0.5.3": canvas, draw
#let classification = canvas(length: 1mm, {
  import draw: *
  let ink = rgb("#315e75")
  for (y, description, interpretation) in (
    (20, [仅涉及一条晶界], [主要用于评估裂纹萌生]),
    (0, [跨越多条晶界], [用于比较裂纹扩展路径]),
  ) {
    rect((0,y),(58,y+14),radius:2,fill:rgb("#e8f1f5"),stroke:.6pt+ink)
    rect((72,y),(140,y+14),radius:2,fill:rgb("#e8f1f5"),stroke:.6pt+ink)
    content((29,y+7),text(size:9pt,description))
    content((106,y+7),text(size:9pt,interpretation))
    line((58,y+7),(71,y+7),stroke:.7pt+ink,mark:(end:"stealth"))
  }
})
