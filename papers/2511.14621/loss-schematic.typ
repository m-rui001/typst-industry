#import "@preview/cetz:0.4.2": canvas, draw

// Figure 1b is a schematic transmission trace, with no calibrated axis values.
#let loss-schematic(unit) = canvas(length: unit, {
  import draw: *
  let red = rgb("#e00016")
  let trace = 1.4 * unit
  let label(x, y, body, fill: black) = content(
    (x, y), text(size: 11 * unit, fill: fill, body),
  )
  rect((0, 0), (139, 197), stroke: none, fill: white)
  label(13, 182, [(b)])
  label(16, 150, [$|S_21|$])
  line((15, 25), (134, 25), mark: (end: ">"), stroke: unit + black)
  line((15, 25), (15, 138), mark: (end: ">"), stroke: unit + black)
  for (start, end, center, width, depth, color) in (
    (18, 76, 48, 3.1, 50, red),
    (80, 123, 102, 1.12, 70, black),
  ) {
    let pts = range(141).map(i => {
      let x = start + (end - start) * i / 140
      (x, 112 - depth / (1 + calc.pow((x - center) / width, 2)))
    })
    line(..pts, stroke: trace + color)
    line((center, 25), (center, 30), stroke: unit + black)
  }
  line((84, 84), (65, 84), mark: (end: ">"), stroke: unit + black)
  label(47, 126, [$Q_i$], fill: red)
  label(103, 126, [$Q_("open")$])
  label(48, 15, [$f_r$], fill: red)
  label(110, 15, [$f_("open")$])
  label(128, 35, [$f$])
})

#let resonator-figure = block(width: 80%, layout(size => {
  let unit = size.width / 300
  box(width: size.width, height: 379 * unit)[
    #place(top + left, image("source/Figures/Fig_1.pdf", width: size.width))
    #place(top + left, dx: 157 * unit, loss-schematic(unit))
  ]
}))
