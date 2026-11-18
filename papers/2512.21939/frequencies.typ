#import "@preview/cetz:0.5.3": canvas, draw
#set text(font: "Microsoft YaHei", lang: "zh")
#let frequencies = canvas(length: 1mm, {
  import draw: *
  for (x, label, value) in ((25, [成对运动的慢调制], [约 4 MHz]), (86, [单体半径的快振荡], [约 3.2 GHz])) {
    rect((x - 24, 0), (x + 24, 18), fill: rgb("#edf5f8"), stroke: none)
    content((x, 12), text(size: 9pt, label))
    content((x, 5), text(size: 10pt, weight: "bold", value))
  }
})
#frequencies
