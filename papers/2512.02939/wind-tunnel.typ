#import "@preview/cetz:0.4.2": canvas, draw

#let wind-tunnel-panel(scale) = canvas(length: scale, {
  import draw: *
  let edge = rgb("#536877")
  let water = rgb("#ffdf81")
  let blue = rgb("#007ab3")
  let thin-line = 0.45pt + edge

  rect((0, 0), (4.74, 2.80), fill: white, stroke: none)
  // Side and top faces of the transparent wind tunnel.
  line((0.83, 0.15), (4.31, 0.15), (4.31, 1.60), (0.83, 1.60),
    close: true, fill: luma(246), stroke: thin-line)
  line((0.35, 2.08), (3.83, 2.08), (4.31, 1.60), (0.83, 1.60),
    close: true, fill: luma(250), stroke: thin-line)
  line((0.35, 0.63), (0.35, 2.08), (0.83, 1.60), (0.83, 0.15),
    close: true, fill: luma(244), stroke: thin-line)
  for i in range(6) {
    let offset = i * 0.072
    line((0.39 + offset, 0.62 - offset), (0.39 + offset, 2.01 - offset),
      stroke: 0.5pt + luma(105 + i * 14))
  }
  // Slurry vessel and the exposed wick on its float.
  line((2.85, 0.59), (3.21, 0.21), (4.16, 0.21), (4.16, 0.73),
    (3.79, 1.12), (2.85, 1.12), close: true, fill: water, stroke: none)
  line((2.85, 1.12), (3.21, 0.73), (4.16, 0.73), (3.79, 1.12),
    close: true, fill: rgb("#fff0b5"), stroke: none)
  line((2.85, 0.59), (3.21, 0.21), (3.21, 0.73), (2.85, 1.12),
    close: true, fill: rgb("#dfc775"), stroke: none)
  line((3.07, 1.06), (3.22, 1.18), (3.95, 0.86), (3.79, 0.74),
    close: true, fill: luma(203), stroke: thin-line)
  line((3.33, 1.19), (3.33, 1.62), (3.72, 1.25), (3.72, 0.82),
    close: true, fill: luma(184), stroke: thin-line)
  for x in (3.40, 3.54, 3.68) {
    line((x, 1.66), (x - 0.07, 1.82), (x + 0.015, 1.93),
      stroke: (paint: rgb("#b7c9d2"), thickness: 0.65pt, dash: "dotted"),
      mark: (end: ">"))
  }
  for (y, end) in ((1.37, 2.17), (1.12, 2.55), (0.88, 2.17)) {
    line((1.60, y), (end, y), stroke: 2pt + blue, mark: (end: ">"))
  }
  content((1.25, 1.19), align(center, text(10pt)[Wind \ flows]))
  line((0.81, 0.39), (0.97, 0.39), stroke: 0.45pt)
  content((1.03, 0.39), text(10pt)[Fairings], anchor: "west")

  line((0.35, 2.18), (3.43, 2.18), stroke: 0.45pt, mark: (start: "<", end: ">"))
  content((1.88, 2.33), text(9pt)[80 cm])
  line((4.40, 0.15), (4.40, 1.60), stroke: 0.45pt, mark: (start: "<", end: ">"))
  content((4.60, 0.87), align(center, text(9pt)[20 \ cm]))
  content((0.17, 2.33), text(10pt, weight: "bold")[A])
})

// Replace panel A in place, retaining the measured composite's other panels.
#let wind-tunnel-figure = layout(size => {
  let width = size.width
  box(width: width, height: width * 1133.88 / 1686.6)[
    #image("source/Figures/Figure1.pdf", width: width)
    #place(top + left, wind-tunnel-panel(width / 7.5))
  ]
})
