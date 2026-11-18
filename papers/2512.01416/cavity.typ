#import "@preview/cetz:0.5.3": canvas, draw
#let mechanism = canvas(length:1mm, {
  import draw: *
  let ink = rgb("#315e75")
  for (y, mode, result) in (
    (18,[手性腔：高 Q 与三维螺旋波前],[共振增强差分吸收]),
    (0,[非手性腔：高 Q 而无三维螺旋波前],[未观察到同类增强]),
  ) {
    rect((0,y),(85,y+13),radius:2,fill:rgb("#e8f1f5"),stroke:.6pt+ink)
    content((42.5,y+6.5),text(size:8pt,mode))
    line((85,y+6.5),(96,y+6.5),stroke:.7pt+ink,mark:(end:"stealth"))
    content((119,y+6.5),text(size:8pt,result))
  }
})
