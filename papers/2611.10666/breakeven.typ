#import "@preview/cetz:0.4.2": canvas, draw

#let breakeven() = canvas(length: 0.44cm, {
  let rotate-label = rotate
  import draw: *
  let fem = rgb("#e41a1c")
  let pinn = rgb("#1f77b4")
  let xy(n, hours) = (n / 320 * 10, hours / 11.5 * 6)
  let fem-time(n) = n * 122.53 / 3600
  let pinn-time(n) = (3 * 3600 + 40 * 60 + n * 0.0093) / 3600
  let cross = (3 * 3600 + 40 * 60) / (122.53 - 0.0093)
  rect((0, 0), (10, 6), stroke: 0.36pt)
  for n in range(0, 301, step: 50) {
    let (x, _) = xy(n, 0)
    line((x, 0), (x, -0.10), stroke: 0.36pt)
    content((x, -0.23), text(6pt, str(n)))
  }
  for hours in range(0, 11, step: 2) {
    let (_, y) = xy(0, hours)
    line((0, y), (-0.10, y), stroke: 0.36pt)
    content((-0.17, y), text(6pt, str(hours)), anchor: "east")
  }
  content((5, -0.57), text(7pt)[Number of designs])
  content((-0.68, 3), rotate-label(-90deg, text(7pt)[Cumulative time (h)]))
  line(xy(cross, 0), xy(cross, 11.5), stroke: (paint: gray, thickness: 0.42pt, dash: "dashed"))
  line(xy(0, fem-time(0)), xy(320, fem-time(320)), stroke: 0.85pt + fem)
  line(xy(0, pinn-time(0)), xy(320, pinn-time(320)), stroke: 0.85pt + pinn)
  rect((0.76, 4.78), (2.42, 5.55), fill: white, stroke: 0.38pt + luma(80%))
  for (y, paint, name) in ((5.36, fem, "FEM"), (4.98, pinn, "PINN")) {
    line((0.85, y), (1.38, y), stroke: 0.85pt + paint)
    content((1.54, y), text(6.3pt, name), anchor: "west")
  }
  content((7.26, 3.82), text(6.3pt, fill: fem)[122.53 s/design], anchor: "west")
  content((7.37, 2.15), text(6.3pt, fill: pinn)[9.3 ms/design], anchor: "west")
  line((4.93, 0.67), xy(cross, pinn-time(cross)), stroke: 0.45pt + gray, mark: (end: ">"))
  content((4.96, 0.64), text(6.3pt)[Breakeven: 108 designs], anchor: "west")
})
