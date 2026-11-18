#import "@preview/cetz:0.5.3": canvas, draw

#let gap = canvas(length: 1mm, {
  import draw: *
  for (y, value, label) in ((12, 100, [初始浮栅]), (0, 243, [写入与擦除之间])) {
    content((19, y + 3), text(size: 9pt, label))
    rect((39, y), (39 + value / 3.3, y + 6), fill: rgb("#315e75"), stroke: none)
    content((50 + value / 3.3, y + 3), text(size: 9pt, [#value pF]))
  }
})

#gap
