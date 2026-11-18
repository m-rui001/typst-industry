#import "@preview/cetz:0.5.3": canvas, draw
#set text(font: "Microsoft YaHei", lang: "zh")

#let sensitivity = canvas(length: 1mm, {
  import draw: *
  let main = rgb("#6bb3cf")
  let total = rgb("#245777")
  for (y, label, first, combined) in (
    (25, [冲头倾角], 0.798, 0.978),
    (7, [额外压入量], 0.023, 0.204),
  ) {
    content((13, y), text(size: 9pt, label))
    for (offset, value, color) in ((1, first, main), (-5, combined, total)) {
      rect((28, y + offset), (28 + 83 * value, y + offset + 4), fill: color, stroke: none)
      content((38 + 83 * value, y + offset + 2), text(size: 8pt, [#value]))
    }
  }
  rect((28, 35), (34, 38), fill: main, stroke: none)
  content((46, 36.5), text(size: 8pt, [一阶指数]))
  rect((64, 35), (70, 38), fill: total, stroke: none)
  content((82, 36.5), text(size: 8pt, [总阶指数]))
})

#sensitivity
