#import "@preview/cetz:0.5.3": canvas, draw
#let phase = canvas(length:1mm, {
  import draw: *
  let ink = rgb("#315e75")
  for (y,value,label) in ((0,12,[去离子水]),(12,47.4,[乙腈]),(24,88.7,[异丙醇])) {
    content((10,y+3),text(size:9pt,label))
    rect((24,y),(24+value,y+6),fill:ink,stroke:none)
    content((33+value,y+3),text(size:9pt,[#value%]))
  }
})
