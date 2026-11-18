#import "@preview/cetz:0.5.3": canvas, draw
#set text(font: "Microsoft YaHei", lang: "zh")

#let budget = canvas(length: 1mm, {
  import draw: *
  for (x, label, value) in (
    (22, [色心到闲频光], [85.3%]),
    (70, [闲频光到光纤], [21%]),
    (118, [色心到光纤], [约 18%]),
  ) {
    rect((x - 19, 0), (x + 19, 17), fill: rgb("#edf5f8"), stroke: none, radius: 2)
    content((x, 11), text(size: 9pt, label))
    content((x, 5), text(size: 9pt, weight: "bold", value))
  }
  content((46, 8.5), [$times$])
  content((94, 8.5), [$=$])
})

#budget
