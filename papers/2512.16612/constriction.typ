#import "@preview/cetz:0.5.3": canvas, draw

#let constriction(width) = canvas(length: width / 320, {
  import draw: *
  let ink = rgb("#265c73")
  let points = ((15, 22), (90, 22), (135, 39), (185, 39), (230, 22), (305, 22),
                (305, 78), (230, 78), (185, 61), (135, 61), (90, 78), (15, 78))
  line(..points, close: true, fill: rgb("#e6f1f4"), stroke: .65pt + ink)
  line((28, 50), (287, 50), stroke: .9pt + ink, mark: (end: "stealth"))
  content((160, 86), text(size: 9pt)[收窄处的局部电流密度增大])
  content((160, 12), text(size: 9pt)[沿波导传播的自旋波积累相位])
})
