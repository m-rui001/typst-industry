#import "@preview/cetz:0.5.3": canvas, draw
#let response = canvas(length:1mm, {
  import draw: *
  let ink = rgb("#315e75")
  line((0,35),(0,0),(95,0))
  line((0,0),(70,28),stroke:.6pt+gray)
  let points = range(51).map(i => (1.4*i,28*calc.sqrt(i/50)))
  line(..points,stroke:1pt+ink)
  content((88,31),text(size:8pt,[平方根]))
  content((53,12),text(size:8pt,[线性]))
  content((83,-5),text(size:8pt,[归一化扰动]))
  content((8,39),text(size:8pt,[归一化分裂]))
})
