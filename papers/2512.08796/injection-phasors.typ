#import "@preview/cetz:0.4.2": canvas, draw

#let phasors(scale) = canvas(length: scale, {
  import draw: *
  let green = rgb("#198321")
  let blue = rgb("#1829db")
  let origin = (.06, 1.25)
  let free = (1.94, 1.25)
  let result = (2.91, 2.55)
  let projected = (2.91, 1.25)
  rect((0, 0), (3.47, 3.25), fill: white, stroke: none)
  content((.47, 3.11), text(6.5pt)[(b)])
  line(origin, free, stroke: .6pt + green, mark: (end: ">"))
  line(free, projected, result, stroke: .5pt + blue)
  line(free, result, stroke: (paint: blue, thickness: .6pt, dash: "dashed"), mark: (end: ">"))
  line(origin, result, stroke: (paint: black, thickness: .55pt, dash: "dotted"), mark: (end: ">"))
  content((1.22, 1.14), text(6.5pt, fill: green)[$A_o$])
  content((2.56, 1.13), text(6.2pt, fill: blue)[$A_d cos theta$])
  content((2.92, 1.80), text(6.2pt, fill: blue)[$A_d sin theta$], anchor: "west")
  content((2.49, 1.84), text(6.5pt, fill: blue)[$A_d$])
  content((1.43, 1.99), text(6.5pt)[$A_r$])
  content((.38, 1.35), text(6.5pt)[$phi$])
  content((2.10, 1.35), text(6.5pt)[$theta$])
  content((1.71, .88), text(6.5pt)[At point X, $A_r e^(-i phi) = A_o + A_d e^(i theta)$])
})

#let injection-figure = layout(size => {
  let width = size.width
  let scale = width / 8
  box(width: width, height: width * 1819 / 4255)[
    #image("source/fig2_v1.png", width: width)
    #place(top + left, dx: 4.58 * scale, dy: .18 * scale, phasors(scale))
  ]
})
