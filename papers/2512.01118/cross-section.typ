#import "@preview/cetz:0.4.2": canvas, draw

#let radial-inset(width) = canvas(length: width / 286, {
  import draw: *
  let center = (70, 82)
  let corners(radius) = range(8).map(i => {
    let a = (22.5 + 45 * i) * 1deg
    (center.at(0) + radius * calc.cos(a), center.at(1) + radius * calc.sin(a))
  })
  let arrow = line.with(stroke: .6pt + rgb("#e34e37"), mark: (end: "stealth", fill: rgb("#e34e37")))
  let note(p, body) = content(p, text(size: width * .078, body))
  rect((0, 0), (286, 156), stroke: none)
  line(..corners(71), close: true, stroke: .65pt + rgb("#847d67"))
  line(..corners(66), close: true, stroke: .35pt + rgb("#b5ab94"))
  arrow(center, corners(71).at(2))
  arrow(center, (4, 82))
  note((94, 117), $R_("max")$)
  note((53, 61), $R_("min")$)
  note((205, 27), text(fill: rgb("#234f91"))[$delta approx frac(R_("max") - R_("min"), 2)$])
})
