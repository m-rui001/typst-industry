#import "@preview/cetz:0.5.3": canvas, draw
#set text(font: "Microsoft YaHei", lang: "zh")
#let sidebands = canvas(length: 1mm, {
  import draw: *
  for (x, label, frequency) in ((24, [束缚表面波], [6.37 kHz]), (111, [可辐射的边带], [16.37 kHz])) {
    rect((x - 21, 0), (x + 21, 17), fill: rgb("#edf5f8"), stroke: none)
    content((x, 11), text(size: 9pt, label))
    content((x, 5), text(size: 9pt, weight: "bold", frequency))
  }
  line((49, 8.5), (85, 8.5), mark: (end: ">"))
  content((67, 13), text(size: 8pt, [调制 +10 kHz]))
})
#sidebands
