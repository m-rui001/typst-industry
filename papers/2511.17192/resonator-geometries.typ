#import "@preview/cetz:0.4.2": canvas, draw

#let geometry-panels(scale) = canvas(length: scale, {
  import draw: *
  let ink = black + .45pt
  let purple = rgb("#7159ae")
  let pink = rgb("#b42a86")
  let magnet = luma(173)
  let arrow = (end: ">")
  rect((0, 0), (5.41, 2.04), fill: white, stroke: none)

  for (x, y, dy) in ((1.43, .66, .08), (4.11, 1.32, -.19)) {
    for i in range(3) {
      let width = .49 - i * .055
      let height = .31 - i * .037
      circle((x, y), radius: (width, height), stroke: (
        paint: purple.darken(25%), thickness: .35pt, dash: if i == 1 { "solid" } else { "dashed" },
      ))
    }
    circle((x - .065, y + dy + .11), radius: .14, stroke: pink + .75pt)
    line((x - .16, y + dy + .11), (x + .035, y + dy + .11),
      stroke: (paint: pink, thickness: .65pt, dash: "dashed"))
  }

  // Cantilever above its fixed magnet.
  line((.86, 1.95), (2.0, 1.95), stroke: ink)
  for i in range(6) {
    let x = .89 + .19 * i
    line((x, 1.95), (x + .08, 2.035), stroke: ink)
  }
  bezier((1.42, 1.95), (1.37, 1.04), (1.43, 1.63), (1.39, 1.32), stroke: .85pt)
  bezier((1.33, 1.56), (1.72, 1.57), (1.43, 1.48), (1.62, 1.48),
    stroke: ink, mark: (start: "<", end: ">"))
  content((1.56, 1.41), text(6.6pt)[$delta x$])
  rect((1.23, .08), (1.64, .48), fill: magnet, stroke: .65pt)

  // Magnet above the flexing membrane.
  rect((3.91, 1.54), (4.32, 1.95), fill: magnet, stroke: .65pt)
  bezier((3.24, .86), (4.99, .86), (3.70, 1.00), (4.53, 1.00), stroke: .8pt)
  for x in (3.24, 4.99) {
    line((x, .71), (x, 1.06), stroke: ink)
    for i in range(3) {
      let y = .75 + .13 * i
      let dx = if x < 4 { -.08 } else { .08 }
      line((x, y), (x + dx, y + .07), stroke: ink)
    }
  }
  line((4.58, .72), (4.58, 1.08), stroke: ink, mark: (start: "<", end: ">"))
  content((4.70, .83), text(6.6pt)[$delta z$])

  for (index, (x, y)) in ((1.70, 1.12), (4.83, 1.31)).enumerate() {
    line((x, y), (x, y + .25), stroke: ink, mark: arrow)
    line((x, y), (x + .25, y), stroke: ink, mark: arrow)
    content((x + .10, y + .28), text(5.8pt)[$B_0$])
    content((x + .30, y - .02), text(5.8pt)[$B_1$])
    let o = (.41 + index * 2.64, .24)
    let (a, b) = o
    line(o, (a + .22, b), stroke: ink, mark: arrow)
    line(o, (a, b + .24), stroke: ink, mark: arrow)
    content(o, text(6.5pt)[$⊗$])
    content((a + .27, b), text(5.7pt)[X])
    content((a + .05, b + .31), text(5.7pt)[Z])
    content((a - .11, b - .07), text(5.7pt)[Y])
  }
  content((.12, 1.91), text(7pt, weight: "bold")[(a)])
  content((2.84, 1.91), text(7pt, weight: "bold")[(b)])
})

#let geometries = layout(size => {
  let width = size.width
  box(width: width, height: width * 295.191 / 510.597)[
    #image("source/Figures/GeometriesBoxedIllusNew.pdf", width: width)
    #place(top + left, geometry-panels(width / 7.80))
  ]
})
