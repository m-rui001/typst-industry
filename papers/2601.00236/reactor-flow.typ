#import "@preview/cetz:0.5.3": canvas, draw

#let reactor-flow(width) = canvas(length: width / 360, {
  import draw: *
  let gas = 1pt + rgb("#245fa8")
  let electrode = .85pt + rgb("#a53335")
  let label(at, body) = content(at, text(size: width * 9 / 360, body))
  let arrow(stroke, ..points) = line(..points, stroke: stroke, mark: (end: "stealth"))
  rect((82, 27), (220, 83), fill: rgb("#d5eff5"), stroke: .65pt)
  rect((72, 44), (230, 61), fill: white, stroke: .65pt)
  rect((91, 48), (209, 57), fill: luma(160), stroke: none)
  line((91, 59), (209, 59), stroke: 1pt + rgb("#9c48a3"))
  rect((272, 17), (350, 72), stroke: .65pt)
  rect((273, 18), (349, 53), fill: rgb("#e8d6f4"), stroke: none)
  arrow(gas, (25, 52), (72, 52))
  arrow(gas, (230, 52), (249, 52), (249, 89), (333, 89), (333, 25), (318, 25))
  for (x,y) in ((306,30),(316,33),(309,39),(319,42),(303,45)) {
    circle((x,y), radius: 1.4, stroke: .5pt + gas.paint)
  }
  line((174, 48), (174, 12), (220, 12), stroke: electrode)
  label((240,12), [AC pulses])
  label((38,65), [Oxygen])
  label((149,73), [Conducting water bath])
  label((145,36), [Glass tube and Al electrode])
  label((291,100), [Post-discharge gas])
  label((310,9), [Stirred dye solution])
})
