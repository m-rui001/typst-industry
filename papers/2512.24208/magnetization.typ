#import "@preview/cetz:0.5.3": canvas, draw
#set text(font: "Microsoft YaHei", lang: "zh")
#let magnetization = canvas(length: 1mm, {
  import draw: *
  for (y, dose, value) in ((30, 0, 1375), (20, 5, 1202), (10, 13, 1244), (0, 24, 1158)) {
    content((14, y + 2.5), text(size: 9pt, [#dose at.%]))
    rect((28, y), (28 + value / 17, y + 5), fill: rgb("#315e75"), stroke: none)
    content((42 + value / 17, y + 2.5), text(size: 8pt, [#value]))
  }
  content((72, -7), text(size: 9pt, [饱和磁化强度（emu/cm³）]))
})
#magnetization
