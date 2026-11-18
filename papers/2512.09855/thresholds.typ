#import "@preview/cetz:0.5.3": canvas, draw
#set text(font: "Microsoft YaHei", lang: "zh")

#let thresholds = canvas(length: 1mm, {
  import draw: *
  for (y, label, value) in ((12, [首次起振], 78.8), (0, [级联起振], 314)) {
    content((15, y + 3), text(size: 9pt, label))
    rect((29, y), (29 + value / 4, y + 6), fill: rgb("#315e75"), stroke: none)
    content((41 + value / 4, y + 3), text(size: 9pt, [#value mW]))
  }
})

#thresholds
