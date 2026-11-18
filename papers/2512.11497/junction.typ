#import "@preview/cetz:0.5.3": canvas, draw
#let junction = canvas(length:1mm, {
  import draw: *
  let ink = rgb("#315e75")
  for (y,x,body) in ((16,50,[沟道中央]),(0,13,[靠近源极])) {
    line((0,y),(100,y),stroke:.8pt+gray)
    rect((-3,y - 3),(3,y+3),fill:gray,stroke:none)
    rect((97,y - 3),(103,y+3),fill:gray,stroke:none)
    circle((x,y),radius:1.8,fill:ink,stroke:none)
    line((x - 2,y),(4,y),stroke:.8pt+ink,mark:(end:"stealth"))
    content((120,y),text(size:9pt,body))
  }
})
