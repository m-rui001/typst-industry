#import "@preview/cetz:0.5.3": canvas, draw
#set text(font: "Microsoft YaHei", lang: "zh")
#let comparison = canvas(length: 1mm, {
  import draw: *
  for (y, ratio, value) in ((12, 5, 0.13), (0, 40, 0.81)) {
    content((19, y + 3), [$q_s "/" q_l = #ratio$])
    rect((39, y), (39 + value * 82, y + 6), fill: rgb("#315e75"), stroke: none)
    content((47 + value * 82, y + 3), [#value])
  }
})
#comparison
