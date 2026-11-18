#import "@preview/cetz:0.5.3": canvas, draw
#set text(font: ("Microsoft YaHei", "Libertinus Serif"), lang: "zh")
#let timing = canvas(length: 1mm, {
  import draw: *
  line((35, 0), (116, 0), stroke: .5pt)
  for (value, x) in ((55, 35), (60, 55), (65, 75), (70, 95), (75, 115)) {
    line((x, 0), (x, -1.5), stroke: .5pt)
    content((x, -4.5), text(size: 8pt, [#value]))
  }
  content((75, -10), text(size: 8pt, [时间分辨率（ps）]))
  for (y, label, value, error) in (
    (25, [直流 · 未辐照], 62.7, 1.6),
    (19, [直流 · 10¹⁴], 62.4, 1.0),
    (13, [直流 · 10¹⁵], 68.6, 1.0),
    (7, [交流 · 18 V], 67.2, 3.6),
  ) {
    let x = 35 + (value - 55) * 4
    content((15, y), text(size: 8pt, label))
    line((x - error * 4, y), (x + error * 4, y), stroke: rgb("#315e75"))
    circle((x, y), radius: 1, fill: rgb("#315e75"), stroke: none)
  }
})
#timing
