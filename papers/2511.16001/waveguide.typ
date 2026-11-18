#import "@preview/cetz:0.4.2": canvas, draw

#let waveguide = canvas(length: 8mm, {
  import draw: *
  let edge = rgb("#61725e")
  let strip = rgb("#e4eacb")
  let purple = rgb("#7261b6")
  let ink = black + .55pt
  let axis = (end: ">")
  let p(t) = (0.65 + 7.05 * t, 4.05 - 3.78 * t)

  // The aperture lies in the ground plane, with slots along its length.
  line((0.39, 4.20), (1.06, 4.66), (8.46, 0.67), (7.78, 0.20),
    close: true, fill: strip, stroke: .6pt + edge)
  line((0.39, 4.20), (7.78, 0.20), stroke: 1pt + edge)
  for i in range(15) {
    let (x, y) = p((i + 1) / 17)
    line((x + .13, y + .46), (x + .25, y + .54),
      stroke: (if calc.rem(i, 3) == 0 { 1.3pt } else { .9pt }) + rgb("#b48f38"))
  }

  // An upright slice represents the target xz plane. Color is schematic.
  line((1.00, 6.31), (8.10, 2.45), (8.10, 0.79), (1.00, 4.66),
    close: true, fill: purple.transparentize(17%), stroke: none)
  for (i, tint) in (rgb("#6399d0"), rgb("#69bfc1"), rgb("#a3cc81"), rgb("#efd56b")).enumerate() {
    let d = i * 0.12
    line((2.35 + d, 3.89 - d * .30), (4.38, 4.24 - d),
      (5.53 - d, 2.17 + d * .16), (4.15, 2.95),
      close: true, fill: tint.transparentize(35%), stroke: none)
  }
  line((1.0, 5.18), (8.10, 1.32), stroke: .55pt + rgb("#d6b569"))
  line((1.0, 5.18), (8.10, 1.32),
    stroke: (paint: rgb("#524136"), thickness: .5pt, dash: "dotted"))

  for i in range(3) {
    let x = .43 + i * .12
    let y = 4.82 - i * .08
    line((x, y), (x + .09, y - .13), (x + .15, y - .04), (x + .23, y - .17),
      stroke: .75pt + rgb("#188ed0"))
  }
  content((.07, 5.44), text(7.3pt)[Input \ RF signal], anchor: "west")
  content((4.26, 5.02), text(7.3pt)[Electric field at a desired plane, \ $(x, y = y_"tar", z = 0)$], anchor: "west")
  line((5.25, 4.59), (4.44, 3.19), stroke: ink, mark: axis)
  content((1.03, 1.77), text(7.3pt)[Rectangular \ waveguide-fed \ metasurface], anchor: "west")
  line((2.02, 2.31), (2.48, 2.98), stroke: ink, mark: axis)
  content((4.54, .83), text(7.3pt)[Metamaterial \ elements])
  line((4.79, 1.23), (5.45, 2.22), stroke: ink, mark: axis)
  line((4.64, 1.23), (5.14, 2.49), stroke: ink, mark: axis)
  content((3.39, 3.53), text(7.3pt)[$abs(bold(E))$])

  let origin = (4.12, 2.88)
  line(origin, (4.67, 2.53), stroke: ink, mark: axis)
  line(origin, (3.54, 2.61), stroke: ink, mark: axis)
  line(origin, (4.12, 3.53), stroke: ink, mark: axis)
  content((4.73, 2.42), text(7pt)[$x$])
  content((3.44, 2.55), text(7pt)[$z$])
  content((4.12, 3.67), text(7pt)[$y$])
  content((8.22, 1.38), text(7pt)[$y = y_"tar"$], anchor: "west")
  content((8.22, .48), text(7pt)[$y = 0$], anchor: "west")
})
