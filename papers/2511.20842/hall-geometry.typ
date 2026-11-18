#import "@preview/cetz:0.4.2": canvas, draw

#let hall-geometry() = canvas(length: .15mm, {
  import draw: *
  let pt(x, y) = (x, 355 - y)
  let ink = .55pt + black
  let blue = .85pt + rgb("#2869b6")
  let red-wire = .85pt + rgb("#ef3026")
  let path(points, stroke: ink, fill: none, close: false) = {
    line(..points.map(((x, y)) => pt(x, y)), stroke: stroke, fill: fill, close: close)
  }
  let arrow(x, y, xx, yy, stroke: ink, both: false) = line(
    pt(x, y), pt(xx, yy), stroke: stroke,
    mark: (start: if both { ">" } else { none }, end: ">"),
  )
  let lbl(x, y, body) = content(pt(x, y), text(size: 8.5pt, body))
  let meter(x, y, w, h, body) = {
    rect(pt(x, y), pt(x + w, y + h), fill: white, stroke: ink)
    lbl(x + w / 2, y + h / 2, body)
  }

  path(((125, 275), (60, 339), (271, 339), (565, 42), (369, 36), (327, 80)), stroke: blue)
  arrow(326, 284, 365, 243, stroke: blue)
  arrow(478, 129, 524, 85, stroke: blue)
  path(((46, 267), (179, 267), (367, 80), (367, 89), (179, 275), (46, 275)), fill: luma(118), close: true, stroke: none)
  path(((46, 267), (234, 80), (367, 80), (179, 267)), fill: luma(153), close: true, stroke: .75pt + luma(106))
  path(((126, 188), (81, 188), (81, 40), (298, 40), (298, 192), (262, 191)), stroke: red-wire)
  meter(158, 22, 62, 59, $V_H$)
  lbl(147, 50, [$-$])
  lbl(233, 50, [$+$])
  meter(394, 149, 66, 62, $V_x$)
  arrow(51, 161, 51, 74)
  arrow(47, 285, 177, 294, both: true)
  arrow(208, 295, 399, 93, both: true)
  arrow(38, 261, 30, 293, both: true)
  for (x, y, body) in ((55, 51, $B_z$), (94, 324, $W$), (321, 204, $L$), (17, 275, $t$), (328, 322, $I_x$)) {
    lbl(x, y, body)
  }
  let axes = .5pt + rgb("#4d6cb5")
  arrow(508, 285, 498, 217, stroke: axes)
  arrow(508, 285, 578, 277, stroke: axes)
  arrow(508, 285, 469, 322, stroke: axes)
  lbl(521, 205, $z$)
  lbl(597, 279, $y$)
  lbl(456, 325, $x$)
})
